// Initialization, associated data and plaintext encryption. No finalization/tag.
// Internal reset is active low; associate_data_i selects AD (1) or PT (0).
module ascon_aead128_controller
  import ascon_pack::*;
(
  input logic clock_i,
  input logic resetb_i,
  input logic enable_i,
  input logic init_i,
  input logic [127:0] key_i,
  input logic [127:0] nonce_i,
  input logic [127:0] data_i,
  input logic data_valid_i,
  input logic associate_data_i,
  input logic [4:0] data_bytes_i,
  input logic data_last_i,
  output logic init_ready_o,
  output logic data_ready_o,
  output logic busy_o,
  output logic end_initialisation_o,
  output logic block_done_o,
  output logic end_associate_o,
  output logic [127:0] cipher_o,
  output logic [4:0] cipher_bytes_o,
  output logic cipher_valid_o,
  output logic end_cipher_o,
  output type_state state_o
);
  typedef enum logic [3:0] {
    IDLE, WAIT_INIT, LOAD_INIT, READY, ABSORB, START_P8, WAIT_P8,
    DOMAIN_SEPARATE, AD_FINISHED, PT_FINISHED
  } phase_t;
  phase_t phase_s;
  logic init_accept_s, data_accept_s;
  logic init_done_s, datapath_done_s;
  logic datapath_enable_s;
  logic [1:0] datapath_select_s;
  logic [127:0] data_s;
  logic [127:0] padded_data_s;
  logic descriptor_valid_s, ad_seen_s, last_s, extra_padding_s;
  logic pt_s, pt_seen_s;
  logic [4:0] bytes_s;
  logic [127:0] cipher_s, rate_s;
  type_state initial_s, load_state_s;

  assign init_ready_o = resetb_i && enable_i &&
                        ((phase_s == IDLE) || (phase_s == READY) ||
                         (phase_s == AD_FINISHED) || (phase_s == PT_FINISHED));
  // Initialization wins if both requests are presented while ready.
  assign descriptor_valid_s = (data_bytes_i == 5'd16) ||
                              (data_last_i && (data_bytes_i > 0) &&
                               (data_bytes_i < 5'd16)) ||
                              (data_last_i && (data_bytes_i == 0) &&
                               !((phase_s == AD_FINISHED) ? pt_seen_s : ad_seen_s));
  assign data_ready_o = resetb_i && enable_i && !init_i && descriptor_valid_s &&
                        (((phase_s == READY) && associate_data_i) ||
                         ((phase_s == AD_FINISHED) && !associate_data_i));
  assign init_accept_s = init_i && init_ready_o;
  assign data_accept_s = data_valid_i && data_ready_o;
  assign busy_o = resetb_i && (phase_s != IDLE) && (phase_s != READY) &&
                  (phase_s != AD_FINISHED) && (phase_s != PT_FINISHED);

  // Ignore high bytes. In LE, the first unused byte receives 0x01 padding.
  always_comb begin
    padded_data_s = '0;
    for (int byte_index = 0; byte_index < 16; byte_index++) begin
      if (byte_index < data_bytes_i)
        padded_data_s[8*byte_index +: 8] = data_i[8*byte_index +: 8];
      else if ((byte_index == data_bytes_i) && data_last_i)
        padded_data_s[8*byte_index +: 8] = 8'h01;
    end
    rate_s = {state_o[1], state_o[0]};
    cipher_s = '0;
    for (int byte_index = 0; byte_index < 16; byte_index++) begin
      if (byte_index < bytes_s)
        cipher_s[8*byte_index +: 8] = rate_s[8*byte_index +: 8] ^ data_s[8*byte_index +: 8];
    end
    load_state_s = initial_s;
    if (phase_s == DOMAIN_SEPARATE) begin
      load_state_s = state_o;
      load_state_s[4] = state_o[4] ^ 64'h8000000000000000;
    end
  end

  ascon_aead128_init initialization (
    .clock_i(clock_i), .resetb_i(resetb_i), .start_i(init_accept_s),
    .key_i(key_i), .nonce_i(nonce_i), .ready_o(), .busy_o(),
    .done_o(init_done_s), .state_o(initial_s)
  );

  always_comb begin
    datapath_select_s = 2'b11;
    case (phase_s)
      LOAD_INIT, DOMAIN_SEPARATE: datapath_select_s = 2'b00;
      ABSORB: datapath_select_s = 2'b01;
      START_P8: datapath_select_s = 2'b10;
      default: ;
    endcase
  end
  assign datapath_enable_s = enable_i &&
                            ((phase_s == LOAD_INIT) || (phase_s == ABSORB) ||
                             (phase_s == START_P8) || (phase_s == WAIT_P8) ||
                             (phase_s == DOMAIN_SEPARATE));

  ascon_aead128_datapath datapath (
    .clock_i(clock_i), .resetb_i(resetb_i),
    .enable_state_i(datapath_enable_s), .select_state_i(datapath_select_s),
    .initial_state_i(load_state_s), .data_i(data_s), .state_o(state_o),
    .ready_o(), .busy_o(), .done_o(datapath_done_s)
  );

  always_ff @(posedge clock_i or negedge resetb_i) begin
    if (!resetb_i) begin
      phase_s <= IDLE;
      data_s <= '0;
      ad_seen_s <= 1'b0;
      last_s <= 1'b0;
      extra_padding_s <= 1'b0;
      pt_s <= 1'b0;
      pt_seen_s <= 1'b0;
      bytes_s <= '0;
      cipher_o <= '0;
      cipher_bytes_o <= '0;
      cipher_valid_o <= 1'b0;
      end_cipher_o <= 1'b0;
      end_initialisation_o <= 1'b0;
      block_done_o <= 1'b0;
      end_associate_o <= 1'b0;
    end else begin
      end_initialisation_o <= 1'b0;
      block_done_o <= 1'b0;
      end_associate_o <= 1'b0;
      cipher_valid_o <= 1'b0;
      end_cipher_o <= 1'b0;
      case (phase_s)
        IDLE, READY, AD_FINISHED, PT_FINISHED: begin
          if (init_accept_s) begin
            phase_s <= WAIT_INIT;
            ad_seen_s <= 1'b0;
            last_s <= 1'b0;
            extra_padding_s <= 1'b0;
            pt_s <= 1'b0;
            pt_seen_s <= 1'b0;
            bytes_s <= '0;
          end
          else if (data_accept_s) begin
            data_s <= padded_data_s;
            last_s <= data_last_i;
            extra_padding_s <= data_last_i && (data_bytes_i == 5'd16);
            pt_s <= (phase_s == AD_FINISHED);
            bytes_s <= data_bytes_i;
            if (phase_s == AD_FINISHED) begin
              pt_seen_s <= 1'b1;
              phase_s <= ABSORB;
            end else if (data_bytes_i == 0) phase_s <= DOMAIN_SEPARATE;
            else begin
              ad_seen_s <= 1'b1;
              phase_s <= ABSORB;
            end
          end
        end
        // The initializer runs independently of enable. Retain its completion
        // in LOAD_INIT until the caller enables the datapath load.
        WAIT_INIT: if (init_done_s) phase_s <= LOAD_INIT;
        LOAD_INIT: if (enable_i) begin
          phase_s <= READY;
          end_initialisation_o <= 1'b1;
        end
        ABSORB: if (enable_i) begin
          if (pt_s) begin
            cipher_o <= cipher_s;
            cipher_bytes_o <= bytes_s;
            cipher_valid_o <= (bytes_s != 0);
          end
          // PT's final partial/empty block is padded without a following p[8].
          if (pt_s && last_s && (bytes_s < 5'd16)) begin
            phase_s <= PT_FINISHED;
            block_done_o <= 1'b1;
            end_cipher_o <= 1'b1;
          end else phase_s <= START_P8;
        end
        START_P8: if (enable_i) phase_s <= WAIT_P8;
        // Retire an already committed result even if enable has just dropped.
        // Completion pulses last one clock and never repeat during a pause.
        WAIT_P8: if (datapath_done_s) begin
          if (extra_padding_s) begin
            // An exact-rate final block needs a separate padded empty block.
            data_s <= 128'd1;
            bytes_s <= '0;
            extra_padding_s <= 1'b0;
            phase_s <= ABSORB;
          end else if (last_s) phase_s <= DOMAIN_SEPARATE;
          else begin
            phase_s <= pt_s ? AD_FINISHED : READY;
            block_done_o <= 1'b1;
          end
        end
        DOMAIN_SEPARATE: if (enable_i) begin
          phase_s <= AD_FINISHED;
          block_done_o <= 1'b1;
          end_associate_o <= 1'b1;
        end
        default: phase_s <= IDLE;
      endcase
    end
  end
endmodule : ascon_aead128_controller
