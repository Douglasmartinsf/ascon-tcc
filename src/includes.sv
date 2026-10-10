`include "ascon_pack.sv"
`include "ascon_round_counter.sv"
`include "ascon_permutation.sv"
`include "ascon_aead128_init.sv"
`include "ascon_aead128_datapath.sv"

`include "ascon.sv"

`include "Permutation.sv"
`include "fsm_moore.sv"
`include "compteur_double_init.sv"

`include "mux_state.sv"
`include "xor_begin_perm.sv"
`include "register_w_en.sv"

`include "Pc.sv"
`include "Ps.sv"
`include "Pl.sv"
`include "xor_end_perm.sv"
`include "state_register_w_en.sv"
`include "Sbox.sv"
