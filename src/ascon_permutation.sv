// Iterative Ascon-p[n], one round per enabled clock, n in 1..16.
module ascon_permutation
  import ascon_pack::*;
(
  input logic clock_i,
  input logic resetb_i,
  input logic start_i,
  input logic enable_i,
  input logic [4:0] rounds_i,
  input type_state state_i,
  output logic ready_o,
  output logic busy_o,
  output logic done_o,
  output logic error_o,
  output type_state state_o
);
  logic accept_s;
  logic [4:0] first_s;
  logic [3:0] round_s;
  type_state pc_s;
  type_state ps_s;
  type_state next_s;

  assign ready_o = resetb_i && !busy_o;
  assign accept_s = start_i && ready_o && (rounds_i >= 1) && (rounds_i <= 16);
  assign first_s = 5'd16 - rounds_i;

  ascon_round_counter counter (
    .clock_i(clock_i), .resetb_i(resetb_i),
    .enable_i(busy_o && enable_i && round_s != 4'd15),
    .load_i(accept_s), .first_i(first_s[3:0]), .round_o(round_s)
  );
  Pc #(.INDEX_OFFSET(0)) pc (.Pc_in_i(state_o), .Round_i(round_s), .Pc_out_o(pc_s));
  Ps ps (.Ps_in_i(pc_s), .Ps_out_o(ps_s));
  Pl pl (.Pl_in_i(ps_s), .Pl_out_o(next_s));

  always_ff @(posedge clock_i or negedge resetb_i) begin
    if (!resetb_i) begin
      state_o <= '0;
      busy_o <= 1'b0;
      done_o <= 1'b0;
      error_o <= 1'b0;
    end else begin
      done_o <= 1'b0;
      error_o <= 1'b0;
      if (accept_s) begin
        state_o <= state_i;
        busy_o <= 1'b1;
      end else if (busy_o && enable_i) begin
        state_o <= next_s;
        if (round_s == 4'd15) begin
          busy_o <= 1'b0;
          done_o <= 1'b1;
        end
      end else if (start_i && ready_o) begin
        error_o <= 1'b1;
      end
    end
  end
endmodule : ascon_permutation
