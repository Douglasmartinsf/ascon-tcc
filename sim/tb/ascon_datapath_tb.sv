`timescale 1ns/1ps
module ascon_datapath_tb;
  import ascon_pack::*;
  logic clock_s = 0, resetb_s = 0, enable_s = 0;
  logic [1:0] select_s = 3;
  logic [127:0] data_s = 0;
  type_state initial_s = '0, state_s;
  logic ready_s, busy_s, done_s;
  int sequences_s = 0, blocks_s = 0, round_checks_s = 0;

  always #5 clock_s = ~clock_s;
  ascon_aead128_datapath dut (
    .clock_i(clock_s), .resetb_i(resetb_s), .enable_state_i(enable_s),
    .select_state_i(select_s), .initial_state_i(initial_s), .data_i(data_s),
    .state_o(state_s), .ready_o(ready_s), .busy_o(busy_s), .done_o(done_s)
  );

  task automatic read_state(input int fd, output type_state value);
    if ($fscanf(fd, "%h %h %h %h %h\n", value[0], value[1], value[2], value[3], value[4]) != 5)
      $fatal(1, "Truncated or malformed datapath state");
  endtask

  task automatic check_state(input type_state actual, expected, input string label);
    if (actual !== expected)
      $fatal(1, "%s: received=%080h expected=%080h", label, actual, expected);
  endtask

  task automatic check_status(input logic ready_value, busy_value, done_value);
    if (ready_s !== ready_value || busy_s !== busy_value || done_s !== done_value)
      $fatal(1, "Datapath status: ready=%b busy=%b done=%b expected=%b%b%b",
             ready_s, busy_s, done_s, ready_value, busy_value, done_value);
  endtask

  task automatic tick;
    @(posedge clock_s); #1;
  endtask

  task automatic load_state(input type_state value);
    @(negedge clock_s); enable_s = 1; select_s = 0; initial_s = value;
    tick();
    check_state(state_s, value, "load complete 320-bit state");
    check_status(1, 0, 0);
  endtask

  task automatic check_commands;
    type_state expected;
    expected = {64'h0123456789abcdef, 64'hfedcba9876543210,
                64'h1122334455667788, 64'h99aabbccddeeff00, 64'h13579bdf2468ace0};
    load_state(expected);
    for (int command = 0; command < 4; command++) begin
      @(negedge clock_s);
      enable_s = 0; select_s = 2'(command); initial_s = ~expected; data_s = '1;
      tick();
      check_state(state_s, expected, "disabled command holds state");
      check_status(1, 0, 0);
    end
    @(negedge clock_s); enable_s = 1; select_s = 3;
    repeat (2) begin
      tick();
      check_state(state_s, expected, "reserved selection holds state");
      check_status(1, 0, 0);
    end
    // Absorb without permuting, including zero data and two distinct halves.
    for (int sample = 0; sample < 3; sample++) begin
      @(negedge clock_s); select_s = 1;
      data_s = sample == 0 ? 128'b0 : 128'h0f0e0d0c0b0a09080706050403020100;
      expected[0] ^= data_s[63:0];
      expected[1] ^= data_s[127:64];
      tick();
      check_state(state_s, expected, "standalone XOR / capacity preservation");
      check_status(1, 0, 0);
    end
  endtask

  task automatic check_abort;
    // Abort before rounds, during rounds, before writeback and while writeback
    // is paused; no stale result or done pulse may survive reset.
    for (int phase = 0; phase < 4; phase++) begin
      load_state('1);
      @(negedge clock_s); select_s = 2;
      tick(); check_status(0, 1, 0);
      for (int r = 0; r < (phase == 0 ? 0 : phase == 1 ? 3 : 8); r++) begin
        @(negedge clock_s); select_s = 3;
        tick(); check_status(0, 1, 0);
      end
      if (phase == 3) begin
        @(negedge clock_s); enable_s = 0;
        repeat (2) tick();
      end
      @(negedge clock_s); #2; resetb_s = 0;
      #1;
      check_state(state_s, '0, "asynchronous reset state");
      check_state(dut.permuted_s, '0, "asynchronous reset permutation");
      check_status(0, 0, 0);
      if (dut.completion_pending_s !== 0) $fatal(1, "Reset pending completion");
      @(negedge clock_s); enable_s = 0; select_s = 3; resetb_s = 1;
      repeat (3) begin
        tick();
        check_state(state_s, '0, "aborted result must not return");
        check_status(1, 0, 0);
      end
    end
  endtask

  task automatic check_vectors;
    int fd, total, block_count;
    type_state expected, absorbed, previous, held;
    logic [127:0] block_value;
    string trailing;
    fd = $fopen("datapath.txt", "r");
    if (!fd || $fscanf(fd, "%d %d\n", total, block_count) != 2 || total != 515 || block_count != 3)
      $fatal(1, "Invalid datapath corpus");
    for (int sample = 0; sample < total; sample++) begin
      read_state(fd, expected);
      load_state(expected);
      for (int block_id = 0; block_id < block_count; block_id++) begin
        if ($fscanf(fd, "%h\n", block_value) != 1) $fatal(1, "Missing data block");
        read_state(fd, absorbed);
        // Disabled absorption and changed inputs must leave the previous block.
        held = state_s;
        @(negedge clock_s); enable_s = 0; select_s = 1; data_s = ~block_value;
        tick(); check_state(state_s, held, "absorption disabled"); check_status(1, 0, 0);
        @(negedge clock_s); enable_s = 1; data_s = block_value;
        tick(); check_state(state_s, absorbed, "128-bit absorption vs C"); check_status(1, 0, 0);
        @(negedge clock_s); select_s = 2;
        tick(); check_status(0, 1, 0);
        check_state(state_s, absorbed, "output holds on p[8] acceptance");
        check_state(dut.permuted_s, absorbed, "p[8] captures absorbed state");
        if (dut.permutation.round_s !== 4'd8) $fatal(1, "p[8] initial index");
        expected = absorbed;
        for (int r = 0; r < 8; r++) begin
          previous = expected;
          if (sample % 11 == 0 && (r == 0 || r == 4 || r == 7)) begin
            @(negedge clock_s); enable_s = 0; select_s = 2;
            repeat (2) begin
              tick();
              check_state(dut.permuted_s, previous, "paused round holds state");
              check_state(state_s, absorbed, "paused output holds");
              check_status(0, 1, 0);
              if (dut.permutation.round_s !== 4'(8+r)) $fatal(1, "Paused counter changed");
            end
          end
          read_state(fd, expected);
          @(negedge clock_s);
          enable_s = 1; select_s = 2'(r % 4); initial_s = ~absorbed; data_s = ~block_value;
          tick();
          check_state(dut.permuted_s, expected, "integrated round vs upstream C");
          check_state(state_s, absorbed, "output holds until writeback");
          check_status(0, 1, 0);
          if (dut.permutation.round_s !== 4'(r == 7 ? 15 : 9+r) ||
              dut.permutation_done_s !== (r == 7))
            $fatal(1, "p[8] round sequence/completion");
          round_checks_s++;
        end
        if (sample % 13 == 0) begin
          @(negedge clock_s); enable_s = 0; select_s = 0;
          repeat (3) begin
            tick(); check_status(0, 1, 0);
            check_state(state_s, absorbed, "disabled writeback holds output");
            check_state(dut.permuted_s, expected, "final permutation holds");
            if (dut.completion_pending_s !== 1) $fatal(1, "Lost completion during pause");
          end
        end
        @(negedge clock_s); enable_s = 1; select_s = 0; initial_s = ~expected;
        tick();
        check_state(state_s, expected, "writeback vs upstream P8");
        check_status(1, 0, 1);
        if (dut.completion_pending_s !== 0) $fatal(1, "Completion was not consumed");
        blocks_s++;
      end
      sequences_s++;
    end
    if ($fscanf(fd, "%s", trailing) != -1) $fatal(1, "Unexpected datapath records");
    $fclose(fd);
    @(negedge clock_s); enable_s = 0; select_s = 2;
    tick(); check_status(1, 0, 0); check_state(state_s, expected, "idle final state");
    @(negedge clock_s); enable_s = 1; select_s = 3;
    tick(); check_status(1, 0, 0); check_state(state_s, expected, "final state retained");
  endtask

  initial begin
    repeat (2) @(negedge clock_s);
    resetb_s = 1;
    check_commands();
    check_abort();
    check_vectors();
    $display("[DATAPATH] SEQUENCES: %0d", sequences_s);
    $display("[DATAPATH] BLOCKS: %0d", blocks_s);
    $display("[DATAPATH] ROUND_CHECKS: %0d", round_checks_s);
    $display("[DATAPATH] PASS");
    $finish;
  end

  initial begin
    #1000000;
    $fatal(1, "Datapath watchdog timeout");
  end
endmodule : ascon_datapath_tb
