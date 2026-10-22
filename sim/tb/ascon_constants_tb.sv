module ascon_constants_tb;
  import ascon_pack::*;

  type_state state_s, general_s, legacy_s, expected_s;
  logic [3:0] index_s, legacy_index_s;
  int checks_s = 0;

  Pc #(.INDEX_OFFSET(0)) general_pc (
    .Pc_in_i(state_s), .Round_i(index_s), .Pc_out_o(general_s)
  );
  Pc legacy_pc (
    .Pc_in_i(state_s), .Round_i(legacy_index_s), .Pc_out_o(legacy_s)
  );

  function automatic logic [7:0] reference_constant(input int index);
    return (((19 - index) & 15) << 4) | ((index - 4) & 15);
  endfunction

  initial begin
    if (AEAD128_IV !== 64'h00001000808c0001)
      $fatal(1, "IV incorreto");
    for (int pattern = 0; pattern < 3; pattern++) begin
      case (pattern)
        0: state_s = '0;
        1: state_s = '1;
        2: state_s = {64'h0123456789abcdef, 64'hfedcba9876543210,
                      64'h55aa00ffdeadbeef, 64'h1020304050607080,
                      64'h8877665544332211};
      endcase
      for (int index = 0; index < 16; index++) begin
        index_s = 4'(index);
        legacy_index_s = (index < 12) ? 4'(index) : 4'd0;
        #1;
        expected_s = state_s;
        expected_s[2][7:0] ^= reference_constant(index);
        if (general_s !== expected_s)
          $fatal(1, "Pc geral: pattern=%0d index=%0d", pattern, index);
        checks_s++;
        if (index < 12) begin
          expected_s = state_s;
          expected_s[2][7:0] ^= reference_constant(index + 4);
          if (legacy_s !== expected_s)
            $fatal(1, "Pc legado: pattern=%0d index=%0d", pattern, index);
          checks_s++;
        end
      end
    end
    $display("[CONSTANTS] CHECKS: %0d", checks_s);
    $display("[CONSTANTS] PASS");
    $finish;
  end
endmodule
