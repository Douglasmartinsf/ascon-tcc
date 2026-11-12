// Stage 3 integration: initialization followed by full-rate XOR/p[8] blocks.
// Internal reset is active low. This interface does not delimit AD/PT phases.
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
  output logic init_ready_o,
  output logic data_ready_o,
  output logic busy_o,
  output logic end_initialisation_o,
  output logic block_done_o,
  output type_state state_o
);
  typedef enum logic [2:0] {
    IDLE, WAIT_INIT, LOAD_INIT, READY, ABSORB, START_P8, WAIT_P8
  } phase_t;
  phase_t phase_s;
  logic init_accept_s, data_accept_s;
  logic init_done_s, datapath_done_s;
  logic datapath_enable_s;
  logic [1:0] datapath_select_s;
  logic [127:0] data_s;
  type_state initial_s;

  assign init_ready_o = resetb_i && enable_i &&
                        ((phase_s == IDLE) || (phase_s == READY));
  // Initialization wins if both requests are presented while ready.
  assign data_ready_o = resetb_i && enable_i && (phase_s == READY) && !init_i;
  assign init_accept_s = init_i && init_ready_o;
  assign data_accept_s = data_valid_i && data_ready_o;
  assign busy_o = resetb_i && (phase_s != IDLE) && (phase_s != READY);

  ascon_aead128_init initialization (
    .clock_i(clock_i), .resetb_i(resetb_i), .start_i(init_accept_s),
    .key_i(key_i), .nonce_i(nonce_i), .ready_o(), .busy_o(),
    .done_o(init_done_s), .state_o(initial_s)
  );

  always_comb begin
    datapath_select_s = 2'b11;
    case (phase_s)
      LOAD_INIT: datapath_select_s = 2'b00;
      ABSORB: datapath_select_s = 2'b01;
      START_P8: datapath_select_s = 2'b10;
      default: ;
    endcase
  end
  assign datapath_enable_s = enable_i &&
                            ((phase_s == LOAD_INIT) || (phase_s == ABSORB) ||
                             (phase_s == START_P8) || (phase_s == WAIT_P8));

  ascon_aead128_datapath datapath (
    .clock_i(clock_i), .resetb_i(resetb_i),
    .enable_state_i(datapath_enable_s), .select_state_i(datapath_select_s),
    .initial_state_i(initial_s), .data_i(data_s), .state_o(state_o),
    .ready_o(), .busy_o(), .done_o(datapath_done_s)
  );

  always_ff @(posedge clock_i or negedge resetb_i) begin
    if (!resetb_i) begin
      phase_s <= IDLE;
      data_s <= '0;
      end_initialisation_o <= 1'b0;
      block_done_o <= 1'b0;
    end else begin
      end_initialisation_o <= 1'b0;
      block_done_o <= 1'b0;
      case (phase_s)
        IDLE, READY: begin
          if (init_accept_s) phase_s <= WAIT_INIT;
          else if (data_accept_s) begin
            data_s <= data_i;
            phase_s <= ABSORB;
          end
        end
        // The initializer runs independently of enable. Retain its completion
        // in LOAD_INIT until the caller enables the datapath load.
        WAIT_INIT: if (init_done_s) phase_s <= LOAD_INIT;
        LOAD_INIT: if (enable_i) begin
          phase_s <= READY;
          end_initialisation_o <= 1'b1;
        end
        ABSORB: if (enable_i) phase_s <= START_P8;
        START_P8: if (enable_i) phase_s <= WAIT_P8;
        // Retire an already committed result even if enable has just dropped.
        // Completion pulses last one clock and never repeat during a pause.
        WAIT_P8: if (datapath_done_s) begin
          phase_s <= READY;
          block_done_o <= 1'b1;
        end
        default: phase_s <= IDLE;
      endcase
    end
  end
endmodule : ascon_aead128_controller
