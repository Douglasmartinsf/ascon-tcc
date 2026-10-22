//                              -*- Mode: Verilog -*-
// Filename        : compteur_double_init.sv
// Description     : package definition
// Author          : Jean-Baptiste RIGAUD
// Created On      : Sat Oct 14 15:30:30 2023
// Last Modified By: Jean-Baptiste RIGAUD
// Last Modified On: Sat Oct 14 15:30:30 2023
// Update Count    : 0
// Status          : Unknown, Use with caution!
`timescale 1 ns / 1 ps

module compteur_double_init
  import ascon_pack::*;
(
    input  logic         clock_i,
    input  logic         resetb_i,
    input  logic         en_i,
    input  logic         init_a_i,
    input  logic         init_b_i,
    output logic [3 : 0] data_o
);

  // Compatibility adapter: retain the v1.2 FSM's enable and init priority.
  ascon_round_counter counter (
    .clock_i(clock_i),
    .resetb_i(resetb_i),
    .enable_i(en_i),
    .load_i(en_i && (init_a_i || init_b_i)),
    .first_i(init_a_i ? 4'd0 : 4'd6),
    .round_o(data_o)
  );

endmodule : compteur_double_init

