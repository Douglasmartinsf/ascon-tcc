module ascon_round_counter_tb;
  logic clock_s = 0;
  logic resetb_s = 1;
  logic enable_s = 0, load_s = 0;
  logic [3:0] first_s = 0, round_s;
  logic legacy_enable_s = 0, init_a_s = 0, init_b_s = 0;
  logic [3:0] legacy_s, reference_s;
  int checks_s = 0;

  always #5 clock_s = ~clock_s;

  ascon_round_counter counter (
    .clock_i(clock_s), .resetb_i(resetb_s), .enable_i(enable_s),
    .load_i(load_s), .first_i(first_s), .round_o(round_s)
  );
  compteur_double_init legacy (
    .clock_i(clock_s), .resetb_i(resetb_s), .en_i(legacy_enable_s),
    .init_a_i(init_a_s), .init_b_i(init_b_s), .data_o(legacy_s)
  );
  compteur_double_init_ref reference_counter (
    .clock_i(clock_s), .resetb_i(resetb_s), .en_i(legacy_enable_s),
    .init_a_i(init_a_s), .init_b_i(init_b_s), .data_o(reference_s)
  );

  task automatic step_counter(input logic load_i, enable_i,
                              input logic [3:0] first_i, expected_i);
    @(negedge clock_s);
    load_s = load_i;
    enable_s = enable_i;
    first_s = first_i;
    @(posedge clock_s);
    #1;
    if (round_s !== expected_i)
      $fatal(1, "Contador: esperado=%0d recebido=%0d", expected_i, round_s);
    checks_s++;
  endtask

  task automatic step_legacy(input logic enable_i, init_a_i, init_b_i);
    @(negedge clock_s);
    legacy_enable_s = enable_i;
    init_a_s = init_a_i;
    init_b_s = init_b_i;
    @(posedge clock_s);
    #1;
    if (legacy_s !== reference_s)
      $fatal(1, "Adaptador: original=%0d recebido=%0d", reference_s, legacy_s);
    checks_s++;
  endtask

  task automatic check_reset;
    if (round_s !== 0 || legacy_s !== 0 || reference_s !== 0)
      $fatal(1, "Reset nao zerou os contadores");
    checks_s++;
  endtask

  initial begin
    #2 resetb_s = 0;
    #1 check_reset();
    @(negedge clock_s);
    resetb_s = 1;
    for (int first = 0; first < 16; first++) begin
      step_counter(1, 0, 4'(first), 4'(first));
      step_counter(0, 0, 0, 4'(first));
      step_counter(0, 1, 0, 4'(first + 1));
    end
    step_counter(1, 1, 9, 9);
    step_counter(0, 0, 2, 9);

    for (int value = 0; value < 16; value++) begin
      for (int controls = 0; controls < 8; controls++) begin
        step_legacy(1, 1, 0);
        for (int tick = 0; tick < value; tick++)
          step_legacy(1, 0, 0);
        step_legacy(controls[0], controls[1], controls[2]);
      end
    end

    @(negedge clock_s);
    load_s = 1;
    enable_s = 1;
    first_s = 15;
    legacy_enable_s = 1;
    init_a_s = 0;
    init_b_s = 1;
    #1 resetb_s = 0;
    #1 check_reset();
    @(posedge clock_s);
    #1 check_reset();
    @(negedge clock_s);
    resetb_s = 1;
    load_s = 0;
    enable_s = 0;
    legacy_enable_s = 0;
    @(posedge clock_s);
    #1 check_reset();
    $display("[ROUND_COUNTER] CHECKS: %0d", checks_s);
    $display("[ROUND_COUNTER] PASS");
    $finish;
  end

  initial begin
    #100000;
    $fatal(1, "Timeout do teste de contador");
  end
endmodule
