// First integration step: one state register with an internal input mux.
// XOR and round results are supplied by the surrounding datapath for now.
module ascon_aead128_datapath
  import ascon_pack::*;
(
  input logic clock_i,
  input logic resetb_i, // Internal reset, active low.
  input logic enable_state_i,
  input logic [1:0] select_state_i,
  input type_state initial_state_i,
  input type_state xor_state_i,
  input type_state round_state_i,
  output type_state state_o
);
  localparam logic [1:0] SELECT_INITIAL = 2'b00;
  localparam logic [1:0] SELECT_XOR = 2'b01;
  localparam logic [1:0] SELECT_ROUND = 2'b10;

  type_state state_s;
  type_state next_state_s;

  always_comb begin
    case (select_state_i)
      SELECT_INITIAL: next_state_s = initial_state_i;
      SELECT_XOR: next_state_s = xor_state_i;
      SELECT_ROUND: next_state_s = round_state_i;
      default: next_state_s = state_s;
    endcase
  end

  always_ff @(posedge clock_i or negedge resetb_i) begin
    if (!resetb_i) begin
      state_s <= '0;
    end else if (enable_state_i) begin
      state_s <= next_state_s;
    end
  end

  assign state_o = state_s;
endmodule : ascon_aead128_datapath
