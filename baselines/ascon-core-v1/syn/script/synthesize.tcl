# Elaboração e síntese do core ASCON com Fusion Compiler.
# Execute preferencialmente por meio de syn/run_fc.sh.
#
# Para o mapeamento tecnológico, informe:
#   REFERENCE_LIBRARIES=/caminho/lib1.nlib:/caminho/lib2.nlib
# Opcionalmente, selecione a biblioteca tecnológica dedicada:
#   TECHNOLOGY_LIBRARY=/caminho/tech.nlib

set project_dir [file normalize [file join [file dirname [info script]] ../..]]
set source_dir  [file join $project_dir src]
set work_dir    [file join $source_dir work]
set output_dir  [file join $project_dir syn]
set design_lib  [file join $output_dir unmapped ascon.nlib]

set_app_var search_path [concat $search_path [list $source_dir]]
define_hdl_library WORK -path $work_dir
set_svf [file join $output_dir unmapped ascon.svf]

set has_reference_libraries [info exists ::env(REFERENCE_LIBRARIES)]
if {$has_reference_libraries} {
    set reference_libraries [split $::env(REFERENCE_LIBRARIES) ":"]
    if {[info exists ::env(TECHNOLOGY_LIBRARY)]} {
        create_lib -use_technology_lib $::env(TECHNOLOGY_LIBRARY) \
            -ref_libs $reference_libraries $design_lib
    } else {
        create_lib -ref_libs $reference_libraries $design_lib
    }
} else {
    create_lib $design_lib
}

analyze -format sverilog -hdl_library WORK [file join $source_dir includes.sv]
elaborate ascon -hdl_library WORK
set_top_module ascon

source [file join $output_dir script ascon.sdc]
redirect [file join $output_dir log check_design.rpt] {
    check_design -checks {unbound netlist}
}
redirect [file join $output_dir log check_timing.rpt] {check_timing}
save_block

if {!$has_reference_libraries} {
    puts "INFO: RTL analisado, elaborado e verificado."
    puts "INFO: Síntese tecnológica não executada: defina REFERENCE_LIBRARIES."
    quit
}

compile_fusion -to logic_opto

redirect [file join $output_dir log timing.rpt] {report_timing -max_paths 10}
redirect [file join $output_dir log area.rpt]   {report_area -hierarchy}
redirect [file join $output_dir log power.rpt]  {report_power}

save_block -as [file join $output_dir mapped ascon]
write_verilog [file join $output_dir netlist ascon_mapped.v]
write_sdc [file join $output_dir mapped ascon_mapped.sdc]

quit
