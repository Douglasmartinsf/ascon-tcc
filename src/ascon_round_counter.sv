// Four-bit table index; the caller selects the first round and stops at the last.
module ascon_round_counter (
  input logic clock_i,
  input logic resetb_i,
  input logic enable_i,
  input logic load_i,
  input logic [3:0] first_i,
  output logic [3:0] round_o
);
  always_ff @(posedge clock_i or negedge resetb_i) begin
    if (!resetb_i)
      round_o <= '0;
    else if (load_i)
      round_o <= first_i;
    else if (enable_i)
      round_o <= round_o + 4'd1;
  end
endmodule : ascon_round_counter
