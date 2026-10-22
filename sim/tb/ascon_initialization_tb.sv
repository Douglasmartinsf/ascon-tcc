`timescale 1ns/1ps
module ascon_initialization_tb;
  import ascon_pack::*;
  logic clock_s = 0, resetb_s = 0;
  logic init_start_s = 0;
  logic [127:0] key_s = 0, nonce_s = 0;
  logic init_ready_s, init_busy_s, init_done_s;
  type_state initialized_s;
  int initialization_count_s = 0, state_checks_s = 0;

  always #5 clock_s = ~clock_s;
  ascon_aead128_init init_dut (
    .clock_i(clock_s), .resetb_i(resetb_s), .start_i(init_start_s),
    .key_i(key_s), .nonce_i(nonce_s), .ready_o(init_ready_s),
    .busy_o(init_busy_s), .done_o(init_done_s), .state_o(initialized_s)
  );

  task automatic read_state(input int fd, output type_state value);
    if ($fscanf(fd, "%h %h %h %h %h\n", value[0], value[1], value[2], value[3], value[4]) != 5)
      $fatal(1, "Truncated or malformed state vector");
  endtask

  task automatic check_state(input type_state actual, expected, input string label);
    if (actual !== expected)
      $fatal(1, "%s: received=%080h expected=%080h", label, actual, expected);
  endtask

  task automatic check_abort;
    for (int phase = 0; phase < 2; phase++) begin
      @(negedge clock_s);
      init_start_s = 1; key_s = '1; nonce_s = '1;
      @(posedge clock_s); #1;
      if (init_busy_s !== 1 || init_ready_s !== 0 || init_done_s !== 0)
        $fatal(1, "Initialization did not start before reset");
      @(negedge clock_s); init_start_s = 0;
      repeat (phase == 0 ? 2 : 12) @(negedge clock_s);
      resetb_s = 0;
      #1;
      if (init_busy_s !== 0 || init_ready_s !== 0 || init_done_s !== 0 || init_dut.key_s !== 0)
        $fatal(1, "Reset did not clear initialization status/key");
      check_state(initialized_s, '0, "reset output");
      check_state(init_dut.permutation.state_o, '0, "reset internal permutation");
      @(negedge clock_s); resetb_s = 1;
      @(posedge clock_s); #1;
      if (init_busy_s !== 0 || init_ready_s !== 1 || init_done_s !== 0)
        $fatal(1, "Initialization did not return to idle after reset");
      check_state(initialized_s, '0, "aborted initialization changed output");
    end
  endtask

  task automatic check_initializations();
    int fd, total;
    logic [127:0] key_value, nonce_value;
    type_state expected, held_state_s;
    string trailing;
    fd = $fopen("initializations.txt", "r");
    if (!fd || $fscanf(fd, "%d\n", total) != 1 || total != 323)
      $fatal(1, "Invalid initialization corpus");
    for (int vector_id = 0; vector_id < total; vector_id++) begin
      if ($fscanf(fd, "%h %h\n", key_value, nonce_value) != 2) $fatal(1, "Truncated key/nonce");
      read_state(fd, expected);
      held_state_s = initialized_s;
      @(negedge clock_s); init_start_s = 1; key_s = key_value; nonce_s = nonce_value;
      @(posedge clock_s); #1;
      if (init_busy_s !== 1 || init_ready_s !== 0 || init_done_s !== 0) $fatal(1, "Init acceptance");
      check_state(init_dut.permutation.state_o, expected, "IV/key/nonce loading");
      check_state(initialized_s, held_state_s, "output holds after acceptance");
      state_checks_s++;
      for (int r = 0; r < 12; r++) begin
        read_state(fd, expected);
        @(negedge clock_s);
        init_start_s = 1; key_s = ~key_value; nonce_s = ~nonce_value;
        @(posedge clock_s); #1;
        check_state(init_dut.permutation.state_o, expected, "initialization round");
        check_state(initialized_s, held_state_s, "output holds while busy");
        state_checks_s++;
        if (init_done_s !== 0 || init_busy_s !== 1) $fatal(1, "Init completed too early");
      end
      read_state(fd, expected);
      held_state_s = initialized_s;
      @(negedge clock_s); init_start_s = 0;
      @(posedge clock_s); #1;
      check_state(initialized_s, expected, $sformatf("post-key initialization %0d", vector_id));
      if (init_done_s !== 1 || init_busy_s !== 0 || init_ready_s !== 1) $fatal(1, "Init completion");
      initialization_count_s++;
      state_checks_s++;
    end
    if ($fscanf(fd, "%s", trailing) != -1) $fatal(1, "Unexpected initialization records");
    $fclose(fd);
    @(posedge clock_s); #1;
    if (init_done_s !== 0) $fatal(1, "Init done is not a pulse");
    check_state(initialized_s, expected, "initialization holds when idle");
  endtask
  initial begin
    repeat (2) @(negedge clock_s);
    resetb_s = 1;
    check_abort();
    check_initializations();
    $display("[INITIALIZATION] CASES: %0d", initialization_count_s);
    $display("[INITIALIZATION] STATE_CHECKS: %0d", state_checks_s);
    $display("[INITIALIZATION] PASS");
    $finish;
  end

  initial begin
    #1000000;
    $fatal(1, "Initialization watchdog timeout");
  end
endmodule
