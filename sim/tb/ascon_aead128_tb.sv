`timescale 1ns/1ps
module ascon_aead128_tb;
  ascon_pt_tb #(.TEST_FINALIZATION(1'b1)) suite ();
endmodule : ascon_aead128_tb
