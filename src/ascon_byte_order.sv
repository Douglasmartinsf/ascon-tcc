package ascon_byte_order;
  typedef logic [0:7][7:0] bytes8_t;
  typedef logic [0:15][7:0] bytes16_t;

  function automatic logic [63:0] pack_le64(input bytes8_t bytes_i);
    logic [63:0] word_s;
    for (int j = 0; j < 8; j++)
      word_s[8*j +: 8] = bytes_i[j];
    return word_s;
  endfunction

  function automatic bytes8_t unpack_le64(input logic [63:0] word_i);
    bytes8_t bytes_s;
    for (int j = 0; j < 8; j++)
      bytes_s[j] = word_i[8*j +: 8];
    return bytes_s;
  endfunction

  function automatic logic [127:0] pack_le128(input bytes16_t bytes_i);
    logic [127:0] block_s;
    for (int j = 0; j < 16; j++)
      block_s[8*j +: 8] = bytes_i[j];
    return block_s;
  endfunction

  function automatic bytes16_t unpack_le128(input logic [127:0] block_i);
    bytes16_t bytes_s;
    for (int j = 0; j < 16; j++)
      bytes_s[j] = block_i[8*j +: 8];
    return bytes_s;
  endfunction
endpackage : ascon_byte_order
