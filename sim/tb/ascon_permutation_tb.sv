`timescale 1ns/1ps
module ascon_permutation_tb;
  import ascon_pack::*;
  logic clock_s = 0, resetb_s = 0;
  logic start_s = 0, enable_s = 0;
  logic [4:0] rounds_s = 0;
  type_state input_s, output_s;
  logic ready_s, busy_s, done_s, error_s;
  int permutation_count_s = 0, round_checks_s = 0;

  always #5 clock_s = ~clock_s;
  ascon_permutation dut (
    .clock_i(clock_s), .resetb_i(resetb_s), .start_i(start_s),
    .enable_i(enable_s), .rounds_i(rounds_s), .state_i(input_s),
    .state_o(output_s), .ready_o(ready_s), .busy_o(busy_s),
    .done_o(done_s), .error_o(error_s)
  );

  task automatic read_state(input int fd, output type_state value);
    if ($fscanf(fd, "%h %h %h %h %h\n", value[0], value[1], value[2], value[3], value[4]) != 5)
      $fatal(1, "Truncated or malformed state vector");
  endtask

  task automatic check_state(input type_state actual, expected, input string label);
    if (actual !== expected)
      $fatal(1, "%s: received=%080h expected=%080h", label, actual, expected);
  endtask

  task automatic check_abort_and_invalid;
    @(negedge clock_s);
    start_s = 1; rounds_s = 16; enable_s = 1; input_s = '1;
    repeat (3) @(negedge clock_s);
    start_s = 0; resetb_s = 0;
    #1;
    if (busy_s !== 0 || done_s !== 0 || ready_s !== 0 || error_s !== 0)
      $fatal(1, "Reset did not clear permutation status");
    check_state(output_s, '0, "reset permutation");
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
        round_checks_s++;
      end
      permutation_count_s++;
    end
    if ($fscanf(fd, "%s", trailing) != -1) $fatal(1, "Unexpected permutation records");
    $fclose(fd);
    @(negedge clock_s); start_s = 0; enable_s = 0;
    @(posedge clock_s); #1;
    if (done_s !== 0 || ready_s !== 1) $fatal(1, "Done is not a pulse");
    check_state(output_s, expected, "result holds when idle");
  endtask

  initial begin
    input_s = '0;
    repeat (2) @(negedge clock_s);
    resetb_s = 1;
    check_abort_and_invalid();
    check_permutations();
    $display("[PERMUTATION] PERMUTATIONS: %0d", permutation_count_s);
    $display("[PERMUTATION] ROUND_CHECKS: %0d", round_checks_s);
    $display("[PERMUTATION] PASS");
    $finish;
  end

  initial begin
    #10000000;
    $fatal(1, "Permutation watchdog timeout");
  end
endmodule
