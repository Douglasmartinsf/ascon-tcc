// ASCON Pc transformation
import ascon_pack::*;

module Pc #(
    // The legacy controller numbers its 12-round table from zero.
    // New users pass zero and supply the absolute SP 800-232 table index.
    parameter int unsigned INDEX_OFFSET = 4
) (
    input  type_state       Pc_in_i,
    input  logic      [3:0] Round_i,
    output type_state       Pc_out_o
);

  logic [7:0] Cr_s;

  assign Cr_s              = ROUND_CONSTANTS[int'(Round_i) + INDEX_OFFSET];
  assign Pc_out_o[0]       = Pc_in_i[0];
  assign Pc_out_o[1]       = Pc_in_i[1];
  assign Pc_out_o[2][63:8] = Pc_in_i[2][63:8];
  assign Pc_out_o[2][7:0]  = Pc_in_i[2][7:0] ^ Cr_s;
  assign Pc_out_o[3]       = Pc_in_i[3];
  assign Pc_out_o[4]       = Pc_in_i[4];

endmodule
