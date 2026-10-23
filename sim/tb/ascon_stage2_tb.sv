`timescale 1ns/1ps
module ascon_stage2_tb;
  import ascon_pack::*;
  logic clock_s = 0;
  logic resetb_s = 0;
  logic start_s = 0, enable_s = 0;
  logic [4:0] rounds_s = 0;
  type_state input_s, output_s;
  logic ready_s, busy_s, done_s, error_s;
  logic init_start_s = 0;
  logic [127:0] key_s, nonce_s;
  logic init_ready_s, init_busy_s, init_done_s;
  type_state initialized_s;
  logic counter_load_s = 0, counter_enable_s = 0;
  logic [3:0] counter_first_s = 0, counter_round_s;
  type_state pc_input_s, pc_output_s;
  logic [3:0] pc_index_s;
  int permutation_count = 0, initialization_count = 0, round_checks = 0;

  always #5 clock_s = ~clock_s;
  ascon_permutation dut (
    .clock_i(clock_s), .resetb_i(resetb_s), .start_i(start_s), .enable_i(enable_s),
    .rounds_i(rounds_s), .state_i(input_s), .state_o(output_s),
    .ready_o(ready_s), .busy_o(busy_s), .done_o(done_s), .error_o(error_s)
  );
  ascon_aead128_init init_dut (
    .clock_i(clock_s), .resetb_i(resetb_s), .start_i(init_start_s),
    .key_i(key_s), .nonce_i(nonce_s), .ready_o(init_ready_s),
    .busy_o(init_busy_s), .done_o(init_done_s), .state_o(initialized_s)
  );
  ascon_round_counter counter_dut (
    .clock_i(clock_s), .resetb_i(resetb_s), .enable_i(counter_enable_s),
    .load_i(counter_load_s), .first_i(counter_first_s), .round_o(counter_round_s)
  );
  Pc #(.INDEX_OFFSET(0)) pc_dut (
    .Pc_in_i(pc_input_s), .Round_i(pc_index_s), .Pc_out_o(pc_output_s)
  );

  task automatic read_state(input int fd, output type_state value);
    if ($fscanf(fd, "%h %h %h %h %h\n", value[0], value[1], value[2], value[3], value[4]) != 5)
      $fatal(1, "Truncated or malformed state vector");
  endtask

  task automatic check_state(input type_state actual, expected, input string label);
    if (actual !== expected)
      $fatal(1, "%s: received=%080h expected=%080h", label, actual, expected);
  endtask

  task automatic check_constants();
    // Independent formula for Table 5's two nibbles (including indices 0..3).
    logic [3:0] high_s, low_s;
    type_state expected;
    pc_input_s = '1;
    for (int i = 0; i < 16; i++) begin
      pc_index_s = 4'(i);
      high_s = 4'(3 - i);
      low_s = 4'(12 + i);
      expected = pc_input_s;
      expected[2][7:0] ^= {high_s, low_s};
      #1;
      check_state(pc_output_s, expected, "constant layer");
    end
  endtask

  task automatic check_counter();
    for (int first = 0; first < 16; first++) begin
      @(negedge clock_s);
      counter_load_s = 1;
      counter_enable_s = 1;
      counter_first_s = 4'(first);
      @(posedge clock_s); #1;
      if (counter_round_s !== 4'(first)) $fatal(1, "Counter load priority");
      @(negedge clock_s); counter_load_s = 0; counter_enable_s = 0;
      @(posedge clock_s); #1;
      if (counter_round_s !== 4'(first)) $fatal(1, "Counter hold");
      @(negedge clock_s); counter_enable_s = 1;
      @(posedge clock_s); #1;
      if (counter_round_s !== 4'(first + 1)) $fatal(1, "Counter increment/wrap");
    end
    @(negedge clock_s); counter_enable_s = 0;
  endtask

  task automatic check_abort_and_invalid();
    @(negedge clock_s);
    start_s = 1; rounds_s = 16; enable_s = 1; input_s = '1;
    init_start_s = 1; key_s = '1; nonce_s = '1;
    repeat (3) @(negedge clock_s);
    start_s = 0; init_start_s = 0; resetb_s = 0;
    #1;
    if (busy_s !== 0 || done_s !== 0 || init_busy_s !== 0 || init_done_s !== 0 || counter_round_s !== 0)
      $fatal(1, "Reset must abort and clear counters/status");
    check_state(output_s, '0, "reset permutation");
    check_state(initialized_s, '0, "reset initialization");
    @(negedge clock_s); resetb_s = 1; enable_s = 0;
    for (int n = 0; n < 32; n++) begin
      if (n == 0 || n > 16) begin
        @(negedge clock_s); start_s = 1; rounds_s = 5'(n);
        @(posedge clock_s); #1;
        if (error_s !== 1 || busy_s !== 0 || done_s !== 0 || ready_s !== 1)
          $fatal(1, "Invalid n=%0d was not rejected", n);
        check_state(output_s, '0, "invalid request changes state");
        @(negedge clock_s); start_s = 0;
        @(posedge clock_s); #1;
        if (error_s !== 0) $fatal(1, "Error is not a pulse");
      end
    end
  endtask

  task automatic check_permutations();
    int fd, total, n;
    type_state expected, previous;
    string trailing;
    fd = $fopen("permutations.txt", "r");
    if (!fd || $fscanf(fd, "%d\n", total) != 1 || total != 5424)
      $fatal(1, "Invalid permutation corpus");
    for (int vector_id = 0; vector_id < total; vector_id++) begin
      if ($fscanf(fd, "%d\n", n) != 1 || n < 1 || n > 16) $fatal(1, "Invalid n in corpus");
      read_state(fd, expected);
      @(negedge clock_s);
      start_s = 1; enable_s = 0; rounds_s = 5'(n); input_s = expected;
      @(posedge clock_s); #1;
      if (busy_s !== 1 || ready_s !== 0 || done_s !== 0 || error_s !== 0 || dut.round_s !== 4'(16-n))
        $fatal(1, "Permutation acceptance/counter failed");
      check_state(output_s, expected, "permutation input capture");
      for (int r = 0; r < n; r++) begin
        previous = expected;
        if (vector_id % 11 == 0 && r == n/2) begin
          @(negedge clock_s); enable_s = 0; start_s = 1; rounds_s = 0; input_s = ~previous;
          repeat (2) begin
            @(posedge clock_s); #1;
            check_state(output_s, previous, "pause holds state");
            if (done_s !== 0 || busy_s !== 1 || error_s !== 0 || dut.round_s !== 4'(16-n+r))
              $fatal(1, "Pause/busy request changes control");
          end
        end
        read_state(fd, expected);
        @(negedge clock_s);
        enable_s = 1; start_s = (r == 0 && n > 1); rounds_s = 31; input_s = ~previous;
        @(posedge clock_s); #1;
        check_state(output_s, expected, $sformatf("p[%0d] vector=%0d round=%0d", n, vector_id, r));
        if (done_s !== (r == n-1) || busy_s !== (r != n-1) || error_s !== 0)
          $fatal(1, "Wrong permutation latency/status");
        if (dut.round_s !== 4'((r == n-1) ? 15 : 16-n+r+1))
          $fatal(1, "Wrong round sequence");
        round_checks++;
      end
      permutation_count++;
    end
    if ($fscanf(fd, "%s", trailing) != -1) $fatal(1, "Unexpected permutation records");
    $fclose(fd);
    @(negedge clock_s); start_s = 0; enable_s = 0;
    @(posedge clock_s); #1;
    if (done_s !== 0 || ready_s !== 1) $fatal(1, "Done is not a pulse");
    check_state(output_s, expected, "result holds when idle");
  endtask

  task automatic check_initializations();
    int fd, total;
    logic [127:0] key_value, nonce_value;
    type_state expected;
    string trailing;
    fd = $fopen("initializations.txt", "r");
    if (!fd || $fscanf(fd, "%d\n", total) != 1 || total != 323)
      $fatal(1, "Invalid initialization corpus");
    for (int vector_id = 0; vector_id < total; vector_id++) begin
      if ($fscanf(fd, "%h %h\n", key_value, nonce_value) != 2) $fatal(1, "Truncated key/nonce");
      read_state(fd, expected);
      @(negedge clock_s); init_start_s = 1; key_s = key_value; nonce_s = nonce_value;
      @(posedge clock_s); #1;
      if (init_busy_s !== 1 || init_ready_s !== 0 || init_done_s !== 0) $fatal(1, "Init acceptance");
      check_state(init_dut.permutation.state_o, expected, "IV/key/nonce loading");
      for (int r = 0; r < 12; r++) begin
        read_state(fd, expected);
        @(negedge clock_s);
        init_start_s = 1; key_s = ~key_value; nonce_s = ~nonce_value;
        @(posedge clock_s); #1;
        check_state(init_dut.permutation.state_o, expected, "initialization round");
        if (init_done_s !== 0 || init_busy_s !== 1) $fatal(1, "Init completed too early");
      end
      read_state(fd, expected);
      @(negedge clock_s); init_start_s = 0;
      @(posedge clock_s); #1;
      check_state(initialized_s, expected, $sformatf("post-key initialization %0d", vector_id));
      if (init_done_s !== 1 || init_busy_s !== 0 || init_ready_s !== 1) $fatal(1, "Init completion");
      initialization_count++;
    end
    if ($fscanf(fd, "%s", trailing) != -1) $fatal(1, "Unexpected initialization records");
    $fclose(fd);
    @(posedge clock_s); #1;
    if (init_done_s !== 0) $fatal(1, "Init done is not a pulse");
    check_state(initialized_s, expected, "initialization holds when idle");
  endtask

  initial begin
    input_s = '0; key_s = '0; nonce_s = '0;
    repeat (2) @(negedge clock_s);
    resetb_s = 1;
    check_constants();
    check_counter();
    check_abort_and_invalid();
    check_permutations();
    check_initializations();
    $display("[STAGE2] PERMUTATIONS: %0d", permutation_count);
    $display("[STAGE2] ROUND_CHECKS: %0d", round_checks);
    $display("[STAGE2] INITIALIZATIONS: %0d", initialization_count);
    $display("[STAGE2] PASS");
    $finish;
  end
  initial begin
    #10000000;
    $fatal(1, "Stage 2 watchdog timeout");
  end
endmodule : ascon_stage2_tb
