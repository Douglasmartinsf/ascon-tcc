`timescale 1ns/1ps
module ascon_pt_tb;
  import ascon_pack::*;
  logic clock_s = 0, resetb_s = 0, enable_s = 1, init_s = 0;
  logic [127:0] key_s = 0, nonce_s = 0, data_s = 0, cipher_s;
  logic valid_s = 0, associate_s = 1, last_s = 0;
  logic [4:0] bytes_s = 16, cipher_bytes_s;
  logic init_ready_s, ready_s, busy_s, init_done_s, block_done_s, end_ad_s, end_pt_s, cipher_valid_s;
  type_state state_s;
  logic cipher_expected_s = 0, recording_s = 0;
  logic [127:0] expected_cipher_s;
  int expected_bytes_s, actual_fd_s;
  int cases_s = 0, ad_transfers_s = 0, pt_transfers_s = 0, rounds_s = 0, cipher_blocks_s = 0;

  always #5 clock_s = ~clock_s;
  ascon_aead128_controller dut (
    .clock_i(clock_s), .resetb_i(resetb_s), .enable_i(enable_s), .init_i(init_s),
    .key_i(key_s), .nonce_i(nonce_s), .data_i(data_s), .data_valid_i(valid_s),
    .associate_data_i(associate_s), .data_bytes_i(bytes_s), .data_last_i(last_s),
    .init_ready_o(init_ready_s), .data_ready_o(ready_s), .busy_o(busy_s),
    .end_initialisation_o(init_done_s), .block_done_o(block_done_s),
    .end_associate_o(end_ad_s), .end_cipher_o(end_pt_s), .state_o(state_s),
    .cipher_o(cipher_s), .cipher_bytes_o(cipher_bytes_s), .cipher_valid_o(cipher_valid_s)
  );

  // Independently watch every clock, including idle, reset and disabled cycles.
  always @(posedge clock_s) begin
    #1;
    if (cipher_valid_s) begin
      if (!cipher_expected_s || cipher_s !== expected_cipher_s || cipher_bytes_s !== 5'(expected_bytes_s))
        $fatal(1, "Unexpected/incorrect ciphertext case=%0d bytes=%0d got=%032h expected=%032h",
               cases_s, cipher_bytes_s, cipher_s, expected_cipher_s);
      cipher_expected_s = 0;
      if (recording_s) begin
        for (int b = 0; b < expected_bytes_s; b++) $fwrite(actual_fd_s, "%02h", cipher_s[8*b +: 8]);
        cipher_blocks_s++;
      end
    end
  end

  task automatic tick;
    @(posedge clock_s); #2;
  endtask

  task automatic read_state(input int fd, output type_state value);
    if ($fscanf(fd, "%h %h %h %h %h\n", value[0], value[1], value[2], value[3], value[4]) != 5)
      $fatal(1, "Malformed AD/PT trace");
  endtask

  task automatic check_state(input type_state actual, expected, input string label);
    if (actual !== expected)
      $fatal(1, "%s case=%0d: received=%080h expected=%080h", label, cases_s, actual, expected);
  endtask

  task automatic check_busy(input bit allow_cipher = 0);
    if (busy_s !== 1 || init_ready_s !== 0 || ready_s !== 0 || init_done_s !== 0 ||
        block_done_s !== 0 || end_ad_s !== 0 || end_pt_s !== 0 ||
        (!allow_cipher && cipher_valid_s !== 0))
      $fatal(1, "AD/PT busy mismatch phase=%0d", dut.phase_s);
  endtask

  task automatic pause_busy;
    type_state held, permuted;
    held = state_s; permuted = dut.datapath.permuted_s;
    @(negedge clock_s); enable_s = 0;
    repeat (3) begin
      tick(); check_busy();
      check_state(state_s, held, "paused state");
      check_state(dut.datapath.permuted_s, permuted, "paused permutation");
    end
  endtask

  task automatic reject_descriptor(input int bytes_value, input bit last_value, ad_value);
    type_state held;
    held = state_s;
    @(negedge clock_s);
    enable_s = 1; init_s = 0; valid_s = 1; associate_s = ad_value;
    bytes_s = 5'(bytes_value); last_s = last_value; data_s = '1;
    #1;
    if (ready_s !== 0) $fatal(1, "Invalid phase/descriptor accepted");
    repeat (2) begin
      tick();
      check_state(state_s, held, "rejected descriptor holds state");
      if (busy_s !== 0 || ready_s !== 0 || cipher_valid_s !== 0 || init_done_s !== 0 ||
          block_done_s !== 0 || end_ad_s !== 0 || end_pt_s !== 0)
        $fatal(1, "Rejected transfer changed controls");
    end
  endtask

  task automatic reset_and_check;
    @(negedge clock_s); #2; resetb_s = 0; cipher_expected_s = 0; #1;
    check_state(state_s, '0, "reset state");
    check_state(dut.datapath.permuted_s, '0, "reset permutation");
    if (cipher_s !== 0 || cipher_bytes_s !== 0 || cipher_valid_s !== 0 ||
        end_pt_s !== 0 || end_ad_s !== 0 || block_done_s !== 0 || init_done_s !== 0 ||
        ready_s !== 0 || init_ready_s !== 0 || busy_s !== 0 || dut.pt_s !== 0 ||
        dut.pt_seen_s !== 0 || dut.bytes_s !== 0 || dut.extra_padding_s !== 0)
      $fatal(1, "Reset did not clear PT controls/outputs");
    @(negedge clock_s);
    resetb_s = 1; enable_s = 1; init_s = 0; valid_s = 1;
    associate_s = 0; bytes_s = 16; last_s = 0;
    repeat (20) begin
      tick();
      check_state(state_s, '0, "no stale result after PT abort");
      if (cipher_valid_s !== 0 || end_pt_s !== 0 || end_ad_s !== 0 || block_done_s !== 0 ||
          init_done_s !== 0 || ready_s !== 0 || init_ready_s !== 1 || busy_s !== 0)
        $fatal(1, "Stale PT completion or data accepted before init");
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
    @(negedge clock_s); key_s = ~key_value; nonce_s = ~nonce_value;
    if (paused) enable_s = 0;
    repeat (paused ? 18 : 14) begin
      tick(); check_busy(); check_state(state_s, held, "init retains old state");
    end
    @(negedge clock_s); enable_s = 1; init_s = 0; valid_s = 0;
    tick();
    check_state(state_s, expected, "initialized state vs C");
    if (init_done_s !== 1 || block_done_s !== 0 || end_ad_s !== 0 || end_pt_s !== 0 ||
        cipher_valid_s !== 0 || busy_s !== 0 || ready_s !== 1) $fatal(1, "Init completion");
  endtask

  task automatic accept_transfer(input logic [127:0] value, input int bytes_value,
                                 input bit last_value, ad_value, paused);
    type_state held;
    held = state_s;
    if (paused) begin
      @(negedge clock_s);
      enable_s = 0; init_s = 0; valid_s = 1; associate_s = ad_value;
      bytes_s = 5'(bytes_value); last_s = last_value; data_s = value;
      repeat (2) begin
        tick(); check_state(state_s, held, "paused valid waits");
        if (ready_s !== 0 || busy_s !== 0 || cipher_valid_s !== 0 || block_done_s !== 0 ||
            end_ad_s !== 0 || end_pt_s !== 0) $fatal(1, "Disabled transfer accepted");
      end
    end
    @(negedge clock_s);
    enable_s = 1; init_s = 0; valid_s = 1; associate_s = ad_value;
    bytes_s = 5'(bytes_value); last_s = last_value; data_s = value;
    #1;
    if (ready_s !== 1) $fatal(1, "Legal AD/PT descriptor blocked");
    tick(); check_busy(); check_state(state_s, held, "acceptance captures before absorption");
  endtask

  task automatic poison_inputs;
    enable_s = 1; valid_s = 1; init_s = 1; associate_s = !associate_s;
    data_s = ~data_s; bytes_s = 31; last_s = !last_s;
    key_s = '1; nonce_s = '1;
  endtask

  task automatic run_full_operation(input int fd, input bit pt_value, paused, report_completion, pause_retirement);
    type_state expected[0:8];
    for (int r = 0; r < 9; r++) read_state(fd, expected[r]);
    if (paused) pause_busy();
    @(negedge clock_s); poison_inputs();
    tick(); check_busy(pt_value);
    check_state(state_s, expected[0], "AD/PT absorption vs C");
    if (pt_value && (cipher_valid_s !== 1 || cipher_expected_s)) $fatal(1, "Full PT ciphertext missing");
    if (paused) pause_busy();
    @(negedge clock_s); enable_s = 1;
    tick(); check_busy();
    check_state(dut.datapath.permuted_s, expected[0], "p[8] launch");
    for (int r = 0; r < 8; r++) begin
      if (paused && (r == 0 || r == 4 || r == 7)) pause_busy();
      @(negedge clock_s); enable_s = 1;
      tick(); check_busy();
      check_state(dut.datapath.permuted_s, expected[r+1], "AD/PT round vs C");
      check_state(state_s, expected[0], "hold until writeback");
      if (dut.datapath.permutation.round_s !== 4'(r == 7 ? 15 : 9+r)) $fatal(1, "p[8] round index");
      rounds_s++;
    end
    if (paused) pause_busy();
    @(negedge clock_s); enable_s = 1;
    tick(); check_busy(); check_state(state_s, expected[8], "p[8] writeback vs C");
    @(negedge clock_s); enable_s = !pause_retirement; init_s = 0; valid_s = 0;
    tick(); check_state(state_s, expected[8], "retirement retains state");
    if (report_completion) begin
      if (block_done_s !== 1 || busy_s !== 0 || end_ad_s !== 0 || end_pt_s !== 0 ||
          cipher_valid_s !== 0 || cipher_expected_s) $fatal(1, "Full block confirmation");
    end else check_busy();
  endtask

  task automatic finish_ad(input type_state expected, input bit paused);
    if (paused) pause_busy();
    @(negedge clock_s); enable_s = 1; valid_s = 0; init_s = 0;
    tick(); check_state(state_s, expected, "domain separation vs C");
    if (end_ad_s !== 1 || block_done_s !== 1 || end_pt_s !== 0 || cipher_valid_s !== 0 ||
        busy_s !== 0 || init_ready_s !== 1) $fatal(1, "AD confirmation");
  endtask

  task automatic finish_pt(input type_state expected, input bit emits_cipher, paused);
    if (paused) pause_busy();
    @(negedge clock_s); poison_inputs();
    tick(); check_state(state_s, expected, "final PT padding vs C");
    if (end_pt_s !== 1 || block_done_s !== 1 || end_ad_s !== 0 || busy_s !== 0 ||
        cipher_valid_s !== emits_cipher || cipher_expected_s || ready_s !== 0)
      $fatal(1, "Final PT confirmation/ciphertext");
    // A pause immediately after an emitted fragment clears the pulse.
    @(negedge clock_s); enable_s = 0; init_s = 0;
    repeat (3) begin
      tick(); check_state(state_s, expected, "PT final state retention");
      if (end_pt_s !== 0 || block_done_s !== 0 || cipher_valid_s !== 0 || busy_s !== 0 || ready_s !== 0)
        $fatal(1, "PT completion repeated during pause");
    end
  endtask

  task automatic check_resets(input logic [127:0] key_value, nonce_value,
                              input type_state initialized, separated);
    int bytes_value, steps;
    logic [127:0] value;
    for (int phase = 0; phase < 12; phase++) begin
      initialize(key_value, nonce_value, initialized, 0);
      accept_transfer('1, 0, 1, 1, 0);
      finish_ad(separated, 0);
      bytes_value = phase == 0 ? 0 : phase < 3 ? 1 : 16;
      value = {separated[1], separated[0]} ^ {128{1'b1}};
      expected_cipher_s = bytes_value == 1 ? {120'b0, value[7:0]} : value;
      expected_bytes_s = bytes_value;
      cipher_expected_s = bytes_value != 0;
      accept_transfer('1, bytes_value, phase != 11, 0, 0);
      steps = phase == 0 || phase == 1 || phase == 3 ? 0 :
              phase == 2 || phase == 4 ? 1 : phase == 5 ? 2 : phase == 6 ? 6 :
              phase == 7 ? 10 : phase == 8 ? 11 : phase == 10 ? 13 : 12;
      if (steps) begin
        @(negedge clock_s); valid_s = 0;
        repeat (steps) tick();
      end
      if (phase == 7 || phase == 9) pause_busy();
      reset_and_check();
    end
  endtask

  task automatic check_vectors;
    int fd, total, id, alen, plen, ad_count, pt_count, bytes_value, last_value;
    logic [127:0] key_value, nonce_value, value, cipher_value;
    type_state initialized, separated, tail;
    bit paused;
    string trailing;
    fd = $fopen("pt.txt", "r"); actual_fd_s = $fopen("pt_actual.txt", "w");
    if (!fd || !actual_fd_s || $fscanf(fd, "%d\n", total) != 1 || total != 1558) $fatal(1, "Invalid PT corpus");
    for (int sample = 0; sample < total; sample++) begin
      if ($fscanf(fd, "%d %d %d %d %d\n", id, alen, plen, ad_count, pt_count) != 5 || id != sample ||
          alen < 0 || alen > 256 || plen < 0 || plen > 256 ||
          ad_count != (alen == 0 ? 1 : (alen+15)/16) || pt_count != (plen == 0 ? 1 : (plen+15)/16))
        $fatal(1, "Malformed PT header");
      if ($fscanf(fd, "%h %h\n", key_value, nonce_value) != 2) $fatal(1, "Missing key/nonce");
      read_state(fd, initialized);
      initialize(key_value, nonce_value, initialized, sample % 23 == 0);
      if (sample == 0) reject_descriptor(16, 0, 0);
      paused = sample % 17 == 0;
      for (int transfer = 0; transfer < ad_count; transfer++) begin
        if ($fscanf(fd, "%d %d %h\n", bytes_value, last_value, value) != 3 ||
            bytes_value != (alen == 0 ? 0 : alen-16*transfer >= 16 ? 16 : alen-16*transfer) ||
            last_value != (transfer == ad_count-1)) $fatal(1, "Malformed AD transfer");
        accept_transfer(value, bytes_value, last_value != 0, 1, paused);
        for (int op = 0; op < (alen == 0 ? 0 : last_value && bytes_value == 16 ? 2 : 1); op++)
          run_full_operation(fd, 0, paused, !last_value, sample % 19 == 0);
        ad_transfers_s++;
      end
      read_state(fd, separated);
      finish_ad(separated, paused);
      if (sample == 0) begin
        for (int n = 0; n < 16; n++) reject_descriptor(n, 0, 0);
        for (int n = 17; n < 32; n++) begin
          reject_descriptor(n, 0, 0); reject_descriptor(n, 1, 0);
        end
        reject_descriptor(16, 0, 1);
      end
      $fwrite(actual_fd_s, "%0d %0d ", sample, plen); recording_s = 1;
      for (int transfer = 0; transfer < pt_count; transfer++) begin
        if ($fscanf(fd, "%d %d %h\n", bytes_value, last_value, value) != 3 ||
            bytes_value != (plen == 0 ? 0 : plen-16*transfer >= 16 ? 16 : plen-16*transfer) ||
            last_value != (transfer == pt_count-1) || $fscanf(fd, "%h\n", cipher_value) != 1)
          $fatal(1, "Malformed PT transfer");
        expected_cipher_s = cipher_value; expected_bytes_s = bytes_value; cipher_expected_s = bytes_value != 0;
        accept_transfer(value, bytes_value, last_value != 0, 0, paused);
        if (bytes_value == 16) run_full_operation(fd, 1, paused, !last_value, sample % 19 == 0);
        if (last_value) begin
          read_state(fd, tail);
          finish_pt(tail, bytes_value > 0 && bytes_value < 16, paused);
          reject_descriptor(16, 0, 0); reject_descriptor(16, 0, 1);
        end else if (plen == 17 && transfer == 0) begin
          reject_descriptor(0, 1, 0); reject_descriptor(1, 0, 0); reject_descriptor(16, 0, 1);
        end
        pt_transfers_s++;
      end
      recording_s = 0; $fwrite(actual_fd_s, "\n");
      if (sample == 0) begin
        reset_and_check();
        check_resets(key_value, nonce_value, initialized, separated);
      end
      cases_s++;
    end
    if ($fscanf(fd, "%s", trailing) != -1) $fatal(1, "Extra PT records");
    $fclose(fd); $fclose(actual_fd_s);
    reset_and_check();
  endtask

  initial begin
    repeat (2) @(negedge clock_s);
    reset_and_check();
    check_vectors();
    $display("[PT] CASES: %0d", cases_s);
    $display("[PT] AD_TRANSFERS: %0d", ad_transfers_s);
    $display("[PT] PT_TRANSFERS: %0d", pt_transfers_s);
    $display("[PT] CIPHER_BLOCKS: %0d", cipher_blocks_s);
    $display("[PT] ROUND_CHECKS: %0d", rounds_s);
    $display("[PT] PASS");
    $finish;
  end

  initial begin
    #20000000;
    $fatal(1, "PT watchdog timeout");
  end
endmodule : ascon_pt_tb
