// Standard initialization only. AD/PT/finalization are integrated in later stages.
// Inputs are little-endian buses: byte zero occupies bits [7:0].
module ascon_aead128_init
  import ascon_pack::*;
(
  input logic clock_i,
  input logic resetb_i,
  input logic start_i,
  input logic [127:0] key_i,
  input logic [127:0] nonce_i,
  output logic ready_o,
  output logic busy_o,
  output logic done_o,
  output type_state state_o
);
  logic accept_s;
  logic permutation_done_s;
  logic [127:0] key_s;
  type_state initial_s;
  type_state permuted_s;

  assign ready_o = resetb_i && !busy_o;
  assign accept_s = start_i && ready_o;
  assign initial_s[0] = AEAD128_IV;
  assign initial_s[1] = key_i[63:0];
  assign initial_s[2] = key_i[127:64];
  assign initial_s[3] = nonce_i[63:0];
  assign initial_s[4] = nonce_i[127:64];

  ascon_permutation permutation (
    .clock_i(clock_i), .resetb_i(resetb_i), .start_i(accept_s),
    .enable_i(1'b1), .rounds_i(5'd12), .state_i(initial_s),
    .ready_o(), .busy_o(), .done_o(permutation_done_s), .error_o(),
    .state_o(permuted_s)
  );

  always_ff @(posedge clock_i or negedge resetb_i) begin
    if (!resetb_i) begin
      key_s <= '0;
      state_o <= '0;
      busy_o <= 1'b0;
      done_o <= 1'b0;
    end else begin
      done_o <= 1'b0;
      if (accept_s) begin
        key_s <= key_i;
        busy_o <= 1'b1;
      end else if (permutation_done_s) begin
        state_o[0] <= permuted_s[0];
        state_o[1] <= permuted_s[1];
        state_o[2] <= permuted_s[2];
        state_o[3] <= permuted_s[3] ^ key_s[63:0];
        state_o[4] <= permuted_s[4] ^ key_s[127:64];
        busy_o <= 1'b0;
        done_o <= 1'b1;
      end
    end
  end
endmodule : ascon_aead128_init
