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
  input logic tag_truncate_i,
  input logic [4:0] tag_bytes_i,
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
  output logic [4:0] tag_bytes_o,
  output logic end_tag_o
);
  logic resetb_s;
  logic init_ready_s, data_ready_s, finalisation_ready_s;
  logic tag_config_valid_s;
  logic [4:0] requested_tag_bytes_s, tag_bytes_s;
  logic [127:0] full_tag_s;

  assign resetb_s = ~resetb_i;
  assign requested_tag_bytes_s = tag_truncate_i ? tag_bytes_i : 5'd16;
  assign tag_config_valid_s = !tag_truncate_i || ((tag_bytes_i >= 5'd4) && (tag_bytes_i <= 5'd16));
  assign init_ready_o = init_ready_s && tag_config_valid_s;
  // A rejected init must not accidentally accept simultaneous data/finalization.
  // Configuration changes without init do not pause an ongoing transaction.
  assign data_ready_o = data_ready_s && !init_i;
  assign finalisation_ready_o = finalisation_ready_s && !init_i;
  assign tag_bytes_o = tag_bytes_s;

  always_ff @(posedge clock_i or negedge resetb_s) begin
    if (!resetb_s) tag_bytes_s <= '0;
    else if (init_i && init_ready_o) tag_bytes_s <= requested_tag_bytes_s;
  end

  // Prefix in serialization order: byte zero is in the low byte of the LE bus.
  always_comb begin
    tag_o = '0;
    for (int byte_index = 0; byte_index < 16; byte_index++) begin
      if (byte_index < tag_bytes_s)
        tag_o[8*byte_index +: 8] = full_tag_s[8*byte_index +: 8];
    end
  end

  ascon_aead128_controller controller (
    .clock_i(clock_i), .resetb_i(resetb_s), .enable_i(en_reg_ascon_i),
    .init_i(init_i && tag_config_valid_s),
    .key_i(key_i), .nonce_i(nonce_i), .data_i(data_i), .data_valid_i(data_valid_i && !init_i),
    .associate_data_i(associate_data_i), .data_bytes_i(data_bytes_i), .data_last_i(data_last_i),
    .finalisation_i(finalisation_i && !init_i), .init_ready_o(init_ready_s), .data_ready_o(data_ready_s),
    .finalisation_ready_o(finalisation_ready_s), .busy_o(busy_o),
    .end_initialisation_o(end_initialisation_o), .block_done_o(block_done_o),
    .end_associate_o(end_associate_o), .end_cipher_o(end_cipher_o),
    .cipher_o(cipher_o), .cipher_bytes_o(cipher_bytes_o), .cipher_valid_o(cipher_valid_o),
    .tag_o(full_tag_s), .end_tag_o(end_tag_o), .state_o()
  );
endmodule : ascon_aead128
