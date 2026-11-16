// Public Ascon-AEAD128 encryption interface. Like the legacy top, resetb_i
// keeps its historical name but is asynchronous and active HIGH externally.
module ascon_aead128 (
  input logic clock_i,
  input logic resetb_i,
  input logic init_i,
  input logic en_reg_ascon_i,
  input logic associate_data_i,
  input logic finalisation_i,
  input logic [127:0] key_i,
  input logic [127:0] nonce_i,
  input logic [127:0] data_i,
  input logic data_valid_i,
  input logic [4:0] data_bytes_i,
  input logic data_last_i,
  output logic init_ready_o,
  output logic data_ready_o,
  output logic finalisation_ready_o,
  output logic busy_o,
  output logic end_initialisation_o,
  output logic block_done_o,
  output logic end_associate_o,
  output logic end_cipher_o,
  output logic [127:0] cipher_o,
  output logic [4:0] cipher_bytes_o,
  output logic cipher_valid_o,
  output logic [127:0] tag_o,
  output logic end_tag_o
);
  logic resetb_s;

  assign resetb_s = ~resetb_i;

  ascon_aead128_controller controller (
    .clock_i(clock_i), .resetb_i(resetb_s), .enable_i(en_reg_ascon_i), .init_i(init_i),
    .key_i(key_i), .nonce_i(nonce_i), .data_i(data_i), .data_valid_i(data_valid_i),
    .associate_data_i(associate_data_i), .data_bytes_i(data_bytes_i), .data_last_i(data_last_i),
    .finalisation_i(finalisation_i), .init_ready_o(init_ready_o), .data_ready_o(data_ready_o),
    .finalisation_ready_o(finalisation_ready_o), .busy_o(busy_o),
    .end_initialisation_o(end_initialisation_o), .block_done_o(block_done_o),
    .end_associate_o(end_associate_o), .end_cipher_o(end_cipher_o),
    .cipher_o(cipher_o), .cipher_bytes_o(cipher_bytes_o), .cipher_valid_o(cipher_valid_o),
    .tag_o(tag_o), .end_tag_o(end_tag_o), .state_o()
  );
endmodule : ascon_aead128
