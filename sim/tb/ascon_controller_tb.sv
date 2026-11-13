`timescale 1ns/1ps
module ascon_controller_tb;
  import ascon_pack::*;
  logic clock_s = 0, resetb_s = 0, enable_s = 1, init_s = 0;
  logic [127:0] key_s = 0, nonce_s = 0, data_s = 0;
  logic valid_s = 0, init_ready_s, data_ready_s, busy_s, init_done_s, block_done_s;
  logic end_ad_s;
  type_state state_s;
  int initializations_s = 0, blocks_s = 0, round_checks_s = 0;

  always #5 clock_s = ~clock_s;
  ascon_aead128_controller dut (
    .clock_i(clock_s), .resetb_i(resetb_s), .enable_i(enable_s), .init_i(init_s),
    .key_i(key_s), .nonce_i(nonce_s), .data_i(data_s), .data_valid_i(valid_s),
    .associate_data_i(1'b1), .data_bytes_i(5'd16), .data_last_i(1'b0),
    .init_ready_o(init_ready_s), .data_ready_o(data_ready_s), .busy_o(busy_s),
    .end_initialisation_o(init_done_s), .block_done_o(block_done_s),
    .end_associate_o(end_ad_s), .state_o(state_s),
    .cipher_o(), .cipher_bytes_o(), .cipher_valid_o(), .end_cipher_o()
  );

  task automatic tick;
    @(posedge clock_s); #1;
    if (end_ad_s !== 0) $fatal(1, "AD must remain open without last");
  endtask

  task automatic check_state(input type_state actual, expected, input string label);
    if (actual !== expected)
      $fatal(1, "%s: received=%080h expected=%080h", label, actual, expected);
  endtask

  task automatic read_state(input int fd, output type_state value);
    if ($fscanf(fd, "%h %h %h %h %h\n", value[0], value[1], value[2], value[3], value[4]) != 5)
      $fatal(1, "Malformed controller state");
  endtask

  task automatic check_busy;
    if (busy_s !== 1 || init_ready_s !== 0 || data_ready_s !== 0 ||
        init_done_s !== 0 || block_done_s !== 0)
      $fatal(1, "Controller busy/handshake/completion mismatch");
  endtask

  task automatic pause_block;
    type_state held, permutation_held;
    held = state_s;
    permutation_held = dut.datapath.permuted_s;
    @(negedge clock_s); enable_s = 0;
    repeat (3) begin
      tick(); check_busy();
      check_state(state_s, held, "paused visible state");
      check_state(dut.datapath.permuted_s, permutation_held, "paused permutation");
    end
  endtask

  task automatic initialize(input logic [127:0] key_value, nonce_value,
                            input type_state expected, input bit pause_value);
    type_state held;
    held = state_s;
    // Disabled ready must not acknowledge either request.
    @(negedge clock_s);
    enable_s = 0; init_s = 1; valid_s = 1; key_s = key_value; nonce_s = nonce_value;
    tick();
    if (init_ready_s !== 0 || data_ready_s !== 0 || busy_s !== 0 ||
        init_done_s !== 0 || block_done_s !== 0) $fatal(1, "Disabled request accepted");
    check_state(state_s, held, "disabled init holds state");
    @(negedge clock_s); enable_s = 1; #1;
    if (init_ready_s !== 1 || data_ready_s !== 0) $fatal(1, "Init priority over data");
    tick(); check_busy();
    @(negedge clock_s);
    // Change all external inputs after acceptance; occupied init is ignored.
    key_s = ~key_value; nonce_s = ~nonce_value; data_s = '1;
    if (pause_value) enable_s = 0;
    for (int cycle = 1; cycle <= (pause_value ? 18 : 14); cycle++) begin
      tick(); check_busy();
      check_state(state_s, held, "initialization holds previous state");
    end
    @(negedge clock_s); enable_s = 1; init_s = 0; valid_s = 0;
    tick();
    check_state(state_s, expected, "integrated initialization vs C");
    if (init_done_s !== 1 || block_done_s !== 0 || busy_s !== 0 ||
        init_ready_s !== 1 || data_ready_s !== 1) $fatal(1, "Init completion");
  endtask

  task automatic reset_and_check;
    @(negedge clock_s); #2; resetb_s = 0; #1;
    check_state(state_s, '0, "asynchronous reset");
    check_state(dut.initial_s, '0, "reset initializer");
    check_state(dut.datapath.permuted_s, '0, "reset p[8]");
    if (init_ready_s !== 0 || data_ready_s !== 0 || busy_s !== 0 ||
        init_done_s !== 0 || block_done_s !== 0 || dut.data_s !== 0)
      $fatal(1, "Reset controls/data");
    @(negedge clock_s); resetb_s = 1; enable_s = 1; init_s = 0; valid_s = 1;
    repeat (20) begin
      tick();
      check_state(state_s, '0, "no stale result after abort");
      if (init_ready_s !== 1 || data_ready_s !== 0 || busy_s !== 0 ||
          init_done_s !== 0 || block_done_s !== 0)
        $fatal(1, "Data before init or stale completion after reset");
    end
    @(negedge clock_s); valid_s = 0;
  endtask

  task automatic check_resets(input logic [127:0] key_value, nonce_value,
                              input type_state initialized);
    // Initialization: launch, mid-p[12], result produced and deferred load.
    for (int phase = 0; phase < 4; phase++) begin
      @(negedge clock_s); init_s = 1; key_s = key_value; nonce_s = nonce_value;
      tick(); check_busy();
      @(negedge clock_s); init_s = 0;
      if (phase == 3) enable_s = 0;
      repeat (phase == 0 ? 0 : phase == 1 ? 6 : phase == 2 ? 13 : 18) tick();
      reset_and_check();
    end
    // Full blocks: pending absorption, start, rounds, deferred/final writeback.
    for (int phase = 0; phase < 6; phase++) begin
      initialize(key_value, nonce_value, initialized, 0);
      @(negedge clock_s); valid_s = 1; data_s = '1;
      tick(); check_busy();
      @(negedge clock_s); valid_s = 0;
      repeat (phase == 0 ? 0 : phase == 1 ? 1 : phase == 2 ? 2 :
              phase == 3 ? 5 : phase == 4 ? 10 : 11) tick();
      if (phase == 4) pause_block();
      reset_and_check();
    end
  endtask

  task automatic check_vectors;
    int fd, total, block_count;
    logic [127:0] key_value, nonce_value, block_value;
    type_state initialized, absorbed, expected, held;
    bit paused;
    string trailing;
    fd = $fopen("controller.txt", "r");
    if (!fd || $fscanf(fd, "%d %d\n", total, block_count) != 2 || total != 323 || block_count != 3)
      $fatal(1, "Invalid integrated corpus");
    for (int sample = 0; sample < total; sample++) begin
      if ($fscanf(fd, "%h %h\n", key_value, nonce_value) != 2) $fatal(1, "Missing key/nonce");
      read_state(fd, initialized);
      if (sample == 0) check_resets(key_value, nonce_value, initialized);
      initialize(key_value, nonce_value, initialized, sample % 7 == 0);
      initializations_s++;
      for (int block_id = 0; block_id < block_count; block_id++) begin
        if ($fscanf(fd, "%h\n", block_value) != 1) $fatal(1, "Missing full block");
        read_state(fd, absorbed);
        paused = sample % 11 == 0;
        held = state_s;
        if (block_id == 0 || paused) begin
          @(negedge clock_s); enable_s = 0; valid_s = 1; data_s = block_value;
          repeat (2) begin
            tick();
            if (data_ready_s !== 0 || busy_s !== 0 || init_done_s !== 0 || block_done_s !== 0)
              $fatal(1, "Blocked transfer accepted or completion repeated");
            check_state(state_s, held, "valid waiting for enable");
          end
        end
        // Otherwise accept the next block on the first edge after completion.
        @(negedge clock_s); enable_s = 1; valid_s = 1; data_s = block_value; #1;
        if (data_ready_s !== 1) $fatal(1, "Block handshake");
        tick(); check_busy();
        check_state(state_s, held, "acceptance captures without early absorption");
        if (paused) pause_block();
        @(negedge clock_s);
        enable_s = 1; init_s = 1; valid_s = 1; data_s = ~block_value;
        key_s = '1; nonce_s = '1;
        tick(); check_busy();
        check_state(state_s, absorbed, "captured block absorption vs C trace");
        if (paused) pause_block();
        @(negedge clock_s); enable_s = 1;
        tick(); check_busy();
        check_state(dut.datapath.permuted_s, absorbed, "p[8] launch from absorbed state");
        if (dut.datapath.permutation.round_s !== 8) $fatal(1, "Initial p[8] index");
        for (int r = 0; r < 8; r++) begin
          if (paused && (r == 0 || r == 4 || r == 7)) pause_block();
          read_state(fd, expected);
          @(negedge clock_s); enable_s = 1;
          tick(); check_busy();
          check_state(dut.datapath.permuted_s, expected, "integrated p[8] round vs C trace");
          check_state(state_s, absorbed, "output held until writeback");
          if (dut.datapath.permutation.round_s !== 4'(r == 7 ? 15 : 9+r))
            $fatal(1, "Integrated round index");
          round_checks_s++;
        end
        if (paused) pause_block();
        @(negedge clock_s); enable_s = 1;
        tick(); check_busy();
        check_state(state_s, expected, "integrated writeback vs C trace");
        // A pause immediately after writeback must not lose the done pulse.
        @(negedge clock_s); enable_s = !paused; init_s = 0; valid_s = 0;
        tick();
        if (block_done_s !== 1 || init_done_s !== 0 || busy_s !== 0 ||
            data_ready_s !== !paused || init_ready_s !== !paused)
          $fatal(1, "Integrated block completion");
        check_state(state_s, expected, "final block state");
        blocks_s++;
      end
    end
    if ($fscanf(fd, "%s", trailing) != -1) $fatal(1, "Unexpected controller records");
    $fclose(fd);
    @(negedge clock_s); enable_s = 1; valid_s = 0;
    repeat (3) begin
      tick();
      if (data_ready_s !== 1 || busy_s !== 0 || block_done_s !== 0 || init_done_s !== 0)
        $fatal(1, "Idle without valid must hold ready and clear completion");
      check_state(state_s, expected, "enabled idle retention");
    end
    @(negedge clock_s); enable_s = 0;
    repeat (3) begin
      tick();
      if (block_done_s !== 0 || init_done_s !== 0) $fatal(1, "Done repeated when paused");
      check_state(state_s, expected, "idle final retention");
    end
    reset_and_check();
  endtask

  initial begin
    repeat (2) @(negedge clock_s);
    reset_and_check();
    check_vectors();
    $display("[CONTROLLER] INITIALIZATIONS: %0d", initializations_s);
    $display("[CONTROLLER] BLOCKS: %0d", blocks_s);
    $display("[CONTROLLER] ROUND_CHECKS: %0d", round_checks_s);
    $display("[CONTROLLER] PASS");
    $finish;
  end

  initial begin
    #2000000;
    $fatal(1, "Controller watchdog timeout");
  end
endmodule : ascon_controller_tb
