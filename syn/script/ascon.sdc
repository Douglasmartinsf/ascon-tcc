# Restrições canônicas para a comparação entre as implementações.
# Estes valores devem permanecer idênticos em todas as versões comparadas.
set clock_period_ns       100.0
set clock_uncertainty_ns   0.25
set clock_latency_ns       0.35
set input_delay_ns         1.0
set output_delay_ns        2.958
set output_load            0.045

# Transições de entrada herdadas do fluxo da implementação original.
set slew_min_rise_ns 0.146
set slew_min_fall_ns 0.164
set slew_max_rise_ns 0.264
set slew_max_fall_ns 0.252

create_clock -name clock_i -period $clock_period_ns [get_ports clock_i]
set_clock_uncertainty $clock_uncertainty_ns [get_clocks clock_i]
set_clock_latency $clock_latency_ns [get_clocks clock_i]

# Clock e reset são redes ideais durante a síntese lógica. O reset assíncrono
# também não participa das restrições de dados da interface.
set_ideal_network [get_ports {clock_i resetb_i}]
set functional_inputs [remove_from_collection \
    [all_inputs] [get_ports {clock_i resetb_i}]]

set_input_delay $input_delay_ns -clock clock_i $functional_inputs
set_input_transition -rise -min $slew_min_rise_ns $functional_inputs
set_input_transition -fall -min $slew_min_fall_ns $functional_inputs
set_input_transition -rise -max $slew_max_rise_ns $functional_inputs
set_input_transition -fall -max $slew_max_fall_ns $functional_inputs

set_output_delay $output_delay_ns -clock clock_i [all_outputs]
set_load $output_load [all_outputs]

set_false_path -from [get_ports resetb_i]
