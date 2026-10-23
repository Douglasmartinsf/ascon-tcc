module ascon_datapath_tb;
  import ascon_pack::*;

  logic clock_s = 0;
  logic resetb_s = 1;
  logic enable_s = 0;
  logic [1:0] select_s = 0;
  type_state initial_s, xor_s, round_s, state_s, expected_s;
  int checks_s = 0;

  ascon_aead128_datapath dut (
    .clock_i(clock_s), .resetb_i(resetb_s),
    .enable_state_i(enable_s), .select_state_i(select_s),
    .initial_state_i(initial_s), .xor_state_i(xor_s),
    .round_state_i(round_s), .state_o(state_s)
  );

  task automatic check_state;
    if (state_s !== expected_s)
      $fatal(1, "Estado incorreto: check=%0d enable=%0b select=%0d",
             checks_s, enable_s, select_s);
    checks_s++;
  endtask

  task automatic cycle;
    #1;
    check_state(); // Inputs alone must not change the stored state.
    if (enable_s) begin
      case (select_s)
        0: expected_s = initial_s;
        1: expected_s = xor_s;
        2: expected_s = round_s;
        3: begin end
      endcase
    end
    clock_s = 1;
    #1;
    check_state();
    clock_s = 0;
  endtask

  initial begin
    initial_s = '1;
    xor_s = '0;
    round_s = '1;
    expected_s = '0;
    #1;
    resetb_s = 0;
    #1;
    check_state(); // Reset is checked without a clock edge.
    resetb_s = 1;
    for (int pattern = 0; pattern < 323; pattern++) begin
      if (pattern < 320) begin
        initial_s = 320'b1 << pattern;
        xor_s = ~initial_s;
        round_s = 320'b1 << ((pattern + 157) % 320);
      end else begin
        initial_s = (pattern == 320) ? '0 : '1;
        xor_s = (pattern == 321) ? '0 : '1;
        round_s = (pattern == 322) ? '0 : '1;
      end
      for (int control = 0; control < 8; control++) begin
        enable_s = (control < 4);
        select_s = 2'(control);
        cycle();
      end
    end
    // Reset wins over a simultaneous enabled load, then loading resumes.
    enable_s = 1;
    select_s = 0;
    initial_s = '1;
    cycle();
    #1;
    resetb_s = 0;
    expected_s = '0;
    #1;
    check_state();
    clock_s = 1;
    #1;
    check_state();
    clock_s = 0;
    resetb_s = 1;
    cycle();
    $display("[DATAPATH] CHECKS: %0d", checks_s);
    $display("[DATAPATH] PASS");
    $finish;
  end
endmodule
