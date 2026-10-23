// Full-rate block datapath. Commands are accepted only when ready and enabled:
// 00 loads a state, 01 absorbs 128 bits, 10 starts p[8], 11 holds.
// p[8] takes eight enabled rounds plus one enabled writeback cycle. While busy,
// command inputs are ignored and enable_state_i pauses rounds/writeback.
module ascon_aead128_datapath
  import ascon_pack::*;
(
  input logic clock_i,
  input logic resetb_i, // Internal reset, active low.
  input logic enable_state_i,
  input logic [1:0] select_state_i,
  input type_state initial_state_i,
  input logic [127:0] data_i,
  output type_state state_o,
  output logic ready_o,
  output logic busy_o,
  output logic done_o
);
  localparam logic [1:0] SELECT_INITIAL = 2'b00;
  localparam logic [1:0] SELECT_XOR = 2'b01;
  localparam logic [1:0] SELECT_PERMUTATION = 2'b10;

  type_state state_s;
  type_state next_state_s;
  type_state xor_state_s;
  type_state permuted_s;
  logic permutation_start_s;
  logic permutation_done_s;
  logic completion_pending_s;

  assign ready_o = resetb_i && !busy_o;
  assign permutation_start_s = ready_o && enable_state_i &&
                               (select_state_i == SELECT_PERMUTATION);

  always_comb begin
    xor_state_s = state_s;
    xor_state_s[0] = state_s[0] ^ data_i[63:0];
    xor_state_s[1] = state_s[1] ^ data_i[127:64];
  end

  ascon_permutation permutation (
    .clock_i(clock_i), .resetb_i(resetb_i), .start_i(permutation_start_s),
    .enable_i(enable_state_i), .rounds_i(5'd8), .state_i(state_s),
    .ready_o(), .busy_o(), .done_o(permutation_done_s), .error_o(),
    .state_o(permuted_s)
  );

  always_comb begin
    case (select_state_i)
      SELECT_INITIAL: next_state_s = initial_state_i;
      SELECT_XOR: next_state_s = xor_state_s;
      default: next_state_s = state_s;
    endcase
  end

  always_ff @(posedge clock_i or negedge resetb_i) begin
    if (!resetb_i) begin
      state_s <= '0;
      busy_o <= 1'b0;
      done_o <= 1'b0;
      completion_pending_s <= 1'b0;
    end else begin
      done_o <= 1'b0;
      if (busy_o) begin
        // Retain completion if the caller pauses on the writeback cycle.
        if (permutation_done_s) completion_pending_s <= 1'b1;
        if (enable_state_i && (permutation_done_s || completion_pending_s)) begin
          state_s <= permuted_s;
          busy_o <= 1'b0;
          done_o <= 1'b1;
          completion_pending_s <= 1'b0;
        end
      end else if (enable_state_i) begin
        state_s <= next_state_s;
        if (permutation_start_s) busy_o <= 1'b1;
      end
    end
  end

  assign state_o = state_s;
endmodule : ascon_aead128_datapath
