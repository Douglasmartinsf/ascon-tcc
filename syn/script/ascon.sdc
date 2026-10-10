set clock_period_ns 100.0

create_clock -name clock_i -period $clock_period_ns [get_ports clock_i]
set_clock_uncertainty 0.25 [get_clocks clock_i]

set non_clock_inputs [remove_from_collection [all_inputs] [get_ports clock_i]]
set_input_delay 1.0 -clock clock_i $non_clock_inputs
set_output_delay 2.958 -clock clock_i [all_outputs]
set_load 0.045 [all_outputs]

set_false_path -from [get_ports resetb_i]

