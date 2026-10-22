package ascon_pack;

  // 320-bit state as 5 64-bit words
  typedef logic [0:4][63:0] type_state;
  typedef logic [0:15][7:0] type_const;

  // SP 800-232, Table 5: p[n] uses indices 16-n through 15.
  localparam type_const ROUND_CONSTANTS = {
    8'h3c, 8'h2d, 8'h1e, 8'h0f,
    8'hf0, 8'he1, 8'hd2, 8'hc3,
    8'hb4, 8'ha5, 8'h96, 8'h87,
    8'h78, 8'h69, 8'h5a, 8'h4b
  };
  localparam logic [63:0] AEAD128_IV = 64'h00001000808c0001;

endpackage : ascon_pack

