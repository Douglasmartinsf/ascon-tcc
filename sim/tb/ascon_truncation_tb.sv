`timescale 1ns/1ps
module ascon_truncation_tb;
  ascon_top_tb #(.TEST_TRUNCATION(1'b1)) suite ();
endmodule : ascon_truncation_tb
