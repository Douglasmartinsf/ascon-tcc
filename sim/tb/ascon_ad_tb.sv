`timescale 1ns/1ps
module ascon_ad_tb;
  import ascon_pack::*;
  logic clock_s = 0, resetb_s = 0, enable_s = 1, init_s = 0;
  logic [127:0] key_s = 0, nonce_s = 0, data_s = 0;
  logic valid_s = 0, associate_s = 1, last_s = 0;
  logic [4:0] bytes_s = 16;
  logic init_ready_s, ready_s, busy_s, init_done_s, block_done_s, end_ad_s;
  type_state state_s;
  int cases_s = 0, transfers_s = 0, permutations_s = 0, rounds_s = 0;

  always #5 clock_s = ~clock_s;
  ascon_aead128_controller dut (
    .clock_i(clock_s), .resetb_i(resetb_s), .enable_i(enable_s), .init_i(init_s),
    .key_i(key_s), .nonce_i(nonce_s), .data_i(data_s), .data_valid_i(valid_s),
    .associate_data_i(associate_s), .data_bytes_i(bytes_s), .data_last_i(last_s),
    .finalisation_i(1'b0), .finalisation_ready_o(), .tag_o(), .end_tag_o(),
    .init_ready_o(init_ready_s), .data_ready_o(ready_s), .busy_o(busy_s),
    .end_initialisation_o(init_done_s), .block_done_o(block_done_s),
    .end_associate_o(end_ad_s), .state_o(state_s),
    .cipher_o(), .cipher_bytes_o(), .cipher_valid_o(), .end_cipher_o()
  );

  task automatic tick;
    @(posedge clock_s); #1;
  endtask

  task automatic read_state(input int fd, output type_state value);
    if ($fscanf(fd, "%h %h %h %h %h\n", value[0], value[1], value[2], value[3], value[4]) != 5)
      $fatal(1, "Malformed AD state");
  endtask

  task automatic check_state(input type_state actual, expected, input string label);
    if (actual !== expected)
      $fatal(1, "%s case=%0d transfer=%0d: received=%080h expected=%080h",
             label, cases_s, transfers_s, actual, expected);
  endtask

  task automatic check_busy;
    if (busy_s !== 1 || init_ready_s !== 0 || ready_s !== 0 ||
        init_done_s !== 0 || block_done_s !== 0 || end_ad_s !== 0)
      $fatal(1, "AD busy/status mismatch phase=%0d busy=%b init_ready=%b ready=%b init_done=%b block_done=%b end_ad=%b",
             dut.phase_s, busy_s, init_ready_s, ready_s, init_done_s, block_done_s, end_ad_s);
  endtask

  task automatic pause_busy;
    type_state held, permuted;
    held = state_s;
    permuted = dut.datapath.permuted_s;
    @(negedge clock_s); enable_s = 0;
    repeat (3) begin
      tick(); check_busy();
      check_state(state_s, held, "paused AD state");
      check_state(dut.datapath.permuted_s, permuted, "paused p[8]");
    end
  endtask

  task automatic reset_and_check;
    @(negedge clock_s); #2; resetb_s = 0; #1;
    check_state(state_s, '0, "asynchronous abort");
    check_state(dut.initial_s, '0, "initializer cleared");
    check_state(dut.datapath.permuted_s, '0, "permutation cleared");
    if (ready_s !== 0 || init_ready_s !== 0 || busy_s !== 0 ||
        init_done_s !== 0 || block_done_s !== 0 || end_ad_s !== 0 ||
        dut.ad_seen_s !== 0 || dut.last_s !== 0 || dut.extra_padding_s !== 0 ||
        dut.data_s !== 0) $fatal(1, "Reset did not clear AD controls");
    @(negedge clock_s);
    resetb_s = 1; enable_s = 1; init_s = 0; valid_s = 1;
    associate_s = 1; bytes_s = 16; last_s = 0;
    repeat (20) begin
      tick();
      check_state(state_s, '0, "no stale result after AD abort");
      if (ready_s !== 0 || init_ready_s !== 1 || busy_s !== 0 ||
          init_done_s !== 0 || block_done_s !== 0 || end_ad_s !== 0)
        $fatal(1, "Data before init or stale AD completion");
    end
    @(negedge clock_s); valid_s = 0;
  endtask

  task automatic initialize(input logic [127:0] key_value, nonce_value,
                            input type_state expected, input bit paused);
    type_state held;
    held = state_s;
    @(negedge clock_s);
    enable_s = 1; init_s = 1; valid_s = 1; associate_s = 1; bytes_s = 16; last_s = 0;
    key_s = key_value; nonce_s = nonce_value;
    #1;
    if (init_ready_s !== 1 || ready_s !== 0) $fatal(1, "Init priority");
    tick(); check_busy();
    @(negedge clock_s);
    key_s = ~key_value; nonce_s = ~nonce_value;
    if (paused) enable_s = 0;
    repeat (paused ? 18 : 14) begin
      tick(); check_busy();
      check_state(state_s, held, "init holds AD output until load");
    end
    @(negedge clock_s); enable_s = 1; init_s = 0; valid_s = 0;
    tick();
    check_state(state_s, expected, "init vs upstream trace");
    if (init_done_s !== 1 || block_done_s !== 0 || end_ad_s !== 0 ||
        ready_s !== 1 || init_ready_s !== 1 || busy_s !== 0)
      $fatal(1, "AD initialization completion");
  endtask

  task automatic reject_descriptor(input int bytes_value, input bit last_value, associate_value);
    type_state held;
    held = state_s;
    @(negedge clock_s);
    enable_s = 1; init_s = 0; valid_s = 1; data_s = '1;
    bytes_s = 5'(bytes_value); last_s = last_value; associate_s = associate_value;
    #1;
    if (ready_s !== 0) $fatal(1, "Invalid AD descriptor ready: %0d %b %b", bytes_value, last_value, associate_value);
    repeat (2) begin
      tick();
      check_state(state_s, held, "rejected descriptor holds state");
      if (busy_s !== 0 || ready_s !== 0 || init_done_s !== 0 ||
          block_done_s !== 0 || end_ad_s !== 0) $fatal(1, "Rejected AD descriptor changed control");
    end
  endtask

  task automatic accept_transfer(input logic [127:0] value, input int bytes_value,
                                 input bit last_value, paused);
    type_state held;
    held = state_s;
    if (paused) begin
      @(negedge clock_s);
      enable_s = 0; valid_s = 1; init_s = 0; associate_s = 1;
      data_s = value; bytes_s = 5'(bytes_value); last_s = last_value;
      repeat (2) begin
        tick();
        if (ready_s !== 0 || busy_s !== 0 || block_done_s !== 0 || end_ad_s !== 0)
          $fatal(1, "Paused AD transfer accepted");
        check_state(state_s, held, "valid waiting during pause");
      end
    end
    @(negedge clock_s);
    enable_s = 1; valid_s = 1; init_s = 0; associate_s = 1;
    data_s = value; bytes_s = 5'(bytes_value); last_s = last_value;
    #1;
    if (ready_s !== 1) $fatal(1, "Valid AD descriptor not ready");
    tick(); check_busy();
    check_state(state_s, held, "capture does not absorb early");
  endtask

  task automatic run_operation(input int fd, input bit paused, report_completion, pause_retirement);
    type_state expected[0:8];
    for (int r = 0; r < 9; r++) read_state(fd, expected[r]);
    if (paused) pause_busy();
    @(negedge clock_s);
    // Every external field changes after capture; busy requests are ignored.
    enable_s = 1; valid_s = 1; init_s = 1; associate_s = 0;
    bytes_s = 31; last_s = !last_s; data_s = ~data_s;
    tick(); check_busy();
    check_state(state_s, expected[0], "AD absorption/padding vs C");
    if (paused) pause_busy();
    @(negedge clock_s); enable_s = 1;
    tick(); check_busy();
    check_state(dut.datapath.permuted_s, expected[0], "captured p[8] input");
    for (int r = 0; r < 8; r++) begin
      if (paused && (r == 0 || r == 4 || r == 7)) pause_busy();
      @(negedge clock_s); enable_s = 1;
      tick(); check_busy();
      check_state(dut.datapath.permuted_s, expected[r+1], "AD round vs C");
      check_state(state_s, expected[0], "AD output before writeback");
      if (dut.datapath.permutation.round_s !== 4'(r == 7 ? 15 : 9+r))
        $fatal(1, "AD p[8] round index");
      rounds_s++;
    end
    if (paused) pause_busy();
    @(negedge clock_s); enable_s = 1;
    tick(); check_busy();
    check_state(state_s, expected[8], "AD p[8] writeback vs C");
    @(negedge clock_s); enable_s = !pause_retirement; init_s = 0; valid_s = 0;
    tick();
    check_state(state_s, expected[8], "AD retirement state");
    if (report_completion) begin
      if (block_done_s !== 1 || end_ad_s !== 0 || busy_s !== 0 || init_done_s !== 0)
        $fatal(1, "Non-final AD block completion");
    end else check_busy();
    permutations_s++;
  endtask

  task automatic check_ad_resets(input logic [127:0] key_value, nonce_value,
                                 input type_state initialized);
    for (int phase = 0; phase < 10; phase++) begin
      initialize(key_value, nonce_value, initialized, 0);
      accept_transfer('1, phase == 0 ? 0 : phase == 6 || phase == 7 || phase == 9 ? 16 : 1, 1, 0);
      if (phase >= 2) begin
        @(negedge clock_s); valid_s = 0;
        repeat (phase == 2 ? 1 : phase == 3 ? 2 : phase == 4 ? 6 :
                phase == 5 ? 10 : phase == 6 ? 12 : phase == 7 ? 18 :
                phase == 8 ? 12 : 24) tick();
      end
      if (phase == 0 || phase == 5 || phase == 8 || phase == 9) pause_busy();
      reset_and_check();
    end
  endtask

  task automatic check_vectors;
    int fd, total, id, length, transfer_count, operation_count, bytes_value, last_value;
    int case_operations;
    logic [127:0] key_value, nonce_value, block_value;
    type_state initialized, separated, held;
    bit paused;
    string trailing;
    fd = $fopen("ad.txt", "r");
    if (!fd || $fscanf(fd, "%d\n", total) != 1 || total != 469) $fatal(1, "Invalid AD corpus");
    for (int sample = 0; sample < total; sample++) begin
      if ($fscanf(fd, "%d %d %d %d\n", id, length, transfer_count, operation_count) != 4 ||
          id != sample || length < 0 || length > 256 ||
          transfer_count != (length == 0 ? 1 : (length+15)/16) ||
          operation_count != (length == 0 ? 0 : length/16+1)) $fatal(1, "Invalid AD header");
      if ($fscanf(fd, "%h %h\n", key_value, nonce_value) != 2) $fatal(1, "Missing key/nonce");
      read_state(fd, initialized);
      if (sample == 0) check_ad_resets(key_value, nonce_value, initialized);
      initialize(key_value, nonce_value, initialized, sample % 19 == 0);
      if (sample == 0) begin
        reject_descriptor(16, 0, 0);
        for (int bytes_value = 0; bytes_value < 16; bytes_value++) reject_descriptor(bytes_value, 0, 1);
        for (int bytes_value = 17; bytes_value < 32; bytes_value++) begin
          reject_descriptor(bytes_value, 0, 1);
          reject_descriptor(bytes_value, 1, 1);
        end
      end
      paused = sample % 13 == 0;
      case_operations = 0;
      for (int transfer = 0; transfer < transfer_count; transfer++) begin
        if ($fscanf(fd, "%d %d %h\n", bytes_value, last_value, block_value) != 3 ||
            bytes_value != (length == 0 ? 0 : length - 16*transfer >= 16 ? 16 : length - 16*transfer) ||
            last_value != (transfer == transfer_count-1)) $fatal(1, "Invalid AD transfer");
        accept_transfer(block_value, bytes_value, last_value != 0, paused);
        for (int op = 0; op < (length == 0 ? 0 : last_value && bytes_value == 16 ? 2 : 1); op++) begin
          run_operation(fd, paused, !last_value, sample % 17 == 0);
          case_operations++;
        end
        if (last_value) begin
          read_state(fd, separated);
          if (paused) pause_busy();
          held = state_s;
          @(negedge clock_s); enable_s = 1; valid_s = 1; init_s = 0;
          tick();
          check_state(state_s, separated, "domain separation vs C");
          held[4] ^= 64'h8000000000000000;
          check_state(state_s, held, "domain separation toggles only word 4 bit 63");
          if (end_ad_s !== 1 || block_done_s !== 1 || init_done_s !== 0 ||
              busy_s !== 0 || ready_s !== 0 || init_ready_s !== 1)
            $fatal(1, "AD phase completion");
          // Held valid after completion must not reapply padding/domain bit.
          reject_descriptor(1, 1, 1);
          reject_descriptor(17, 1, 0);
          @(negedge clock_s); enable_s = 0;
          repeat (2) begin
            tick();
            check_state(state_s, separated, "completed AD retained during pause");
            if (end_ad_s !== 0 || block_done_s !== 0 || ready_s !== 0 || busy_s !== 0)
              $fatal(1, "Repeated AD completion during pause");
          end
        end else if (sample == 17 && transfer == 0) begin
          reject_descriptor(0, 1, 1);
          reject_descriptor(1, 0, 1);
        end
        transfers_s++;
      end
      if (case_operations != operation_count) $fatal(1, "Wrong AD operation count");
      cases_s++;
    end
    if ($fscanf(fd, "%s", trailing) != -1) $fatal(1, "Extra AD records");
    $fclose(fd);
    reset_and_check();
  endtask

  initial begin
    repeat (2) @(negedge clock_s);
    reset_and_check();
    check_vectors();
    $display("[AD] CASES: %0d", cases_s);
    $display("[AD] TRANSFERS: %0d", transfers_s);
    $display("[AD] PERMUTATIONS: %0d", permutations_s);
    $display("[AD] ROUND_CHECKS: %0d", rounds_s);
    $display("[AD] PASS");
    $finish;
  end

  initial begin
    #10000000;
    $fatal(1, "AD watchdog timeout");
  end
endmodule : ascon_ad_tb
