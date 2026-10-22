module ascon_byte_order_tb;
  import ascon_byte_order::*;
  bytes8_t bytes8_s;
  bytes16_t bytes16_s;
  logic [63:0] word_s;
  logic [127:0] block_s;

  initial begin
    bytes8_s = 64'h0001020304050607;
    bytes16_s = 128'h000102030405060708090a0b0c0d0e0f;
    if (pack_le64(bytes8_s) !== 64'h0706050403020100)
      $fatal(1, "pack_le64: ordem incorreta");
    if (unpack_le64(64'h0706050403020100) !== bytes8_s)
      $fatal(1, "unpack_le64: ordem incorreta");
    if (pack_le128(bytes16_s) !== 128'h0f0e0d0c0b0a09080706050403020100)
      $fatal(1, "pack_le128: ordem incorreta");
    if (unpack_le128(128'h0f0e0d0c0b0a09080706050403020100) !== bytes16_s)
      $fatal(1, "unpack_le128: ordem incorreta");

    for (int j = 0; j < 16; j++) begin
      for (int k = 0; k < 8; k++) begin
        bytes16_s = '0;
        bytes16_s[j][k] = 1'b1;
        block_s = 128'b1 << (8*j + k);
        if (pack_le128(bytes16_s) !== block_s)
          $fatal(1, "pack128: byte=%0d bit=%0d", j, k);
        if (unpack_le128(block_s) !== bytes16_s)
          $fatal(1, "unpack128: byte=%0d bit=%0d", j, k);
        if (j < 8) begin
          bytes8_s = '0;
          bytes8_s[j][k] = 1'b1;
          word_s = 64'b1 << (8*j + k);
          if (pack_le64(bytes8_s) !== word_s)
            $fatal(1, "pack64: byte=%0d bit=%0d", j, k);
          if (unpack_le64(word_s) !== bytes8_s)
            $fatal(1, "unpack64: byte=%0d bit=%0d", j, k);
        end
      end
    end

    // De 0 a 16 bytes validos; os demais permanecem zerados.
    for (int n = 0; n <= 16; n++) begin
      bytes16_s = '0;
      block_s = '0;
      for (int j = 0; j < n; j++) begin
        bytes16_s[j] = 8'hff;
        block_s = (block_s << 8) | 128'hff;
      end
      if (pack_le128(bytes16_s) !== block_s)
        $fatal(1, "Bloco parcial: n=%0d", n);
      if (unpack_le128(block_s) !== bytes16_s)
        $fatal(1, "Saida parcial: n=%0d", n);
    end
    $display("[BYTE_ORDER] PASS");
    $finish;
  end
endmodule
