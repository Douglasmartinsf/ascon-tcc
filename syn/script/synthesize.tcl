# Elaboration/synthesis of either public top, with the canonical comparison SDC.
# TOP_MODULE defaults to ascon; use syn/run_fc.sh to isolate every run.
# REFERENCE_LIBRARIES and optional TECHNOLOGY_LIBRARY retain the NDM interface.

proc run_ascon_synthesis {project_dir} {
    global search_path
    set top_module ascon
    if {[info exists ::env(TOP_MODULE)]} {
        set top_module $::env(TOP_MODULE)
    }
    if {$top_module ni {ascon ascon_aead128}} {
        error "Unsupported TOP_MODULE: $top_module"
    }
    set run_name "${top_module}.[clock seconds].[pid]"
    if {[info exists ::env(ASCON_SYN_RUN)]} {
        set run_name $::env(ASCON_SYN_RUN)
    }
    if {![regexp {^[a-zA-Z0-9_.-]+$} $run_name] ||
        [string first "${top_module}." $run_name] != 0} {
        error "Invalid synthesis run name"
    }
    set source_dir [file join $project_dir src]
    set work_dir [file join $source_dir work $run_name]
    set output_dir [file join $project_dir syn]
    set log_dir [file join $output_dir log $run_name]
    set unmapped_dir [file join $output_dir unmapped $run_name]
    set mapped_dir [file join $output_dir mapped $run_name]
    set netlist_dir [file join $output_dir netlist $run_name]
    foreach path [list $work_dir $log_dir $unmapped_dir $mapped_dir $netlist_dir] {
        file mkdir $path
    }
    set design_lib [file join $unmapped_dir ${top_module}.nlib]
    set_app_var search_path [concat $search_path [list $source_dir]]
    define_hdl_library WORK -path $work_dir
    set_svf [file join $unmapped_dir ${top_module}.svf]

    set has_reference_libraries [info exists ::env(REFERENCE_LIBRARIES)]
    if {$has_reference_libraries} {
        if {[string trim $::env(REFERENCE_LIBRARIES)] eq ""} {
            error "REFERENCE_LIBRARIES must not be empty"
        }
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

    if {![analyze -format sverilog -hdl_library WORK [file join $source_dir includes.sv]]} {
        error "RTL analysis failed"
    }
    if {![elaborate $top_module -hdl_library WORK]} {
        error "Elaboration failed for $top_module"
    }
    set_top_module $top_module
    source [file join $output_dir script ascon.sdc]
    redirect [file join $log_dir check_design.rpt] {
        set design_ok [check_design -checks {unbound netlist}]
    }
    redirect [file join $log_dir check_timing.rpt] {
        set timing_ok [check_timing]
    }
    if {!$design_ok || !$timing_ok} {
        error "Design/timing checks failed for $top_module"
    }
    save_block

    set mode elaboration
    if {$has_reference_libraries} {
        if {![compile_fusion -to logic_opto]} {
            error "Technology mapping failed for $top_module"
        }
        redirect [file join $log_dir timing.rpt] {report_timing -max_paths 10}
        redirect [file join $log_dir area.rpt] {report_area -hierarchy}
        redirect [file join $log_dir power.rpt] {report_power}
        save_block -as [file join $mapped_dir $top_module]
        write_verilog [file join $netlist_dir ${top_module}_mapped.v]
        write_sdc [file join $mapped_dir ${top_module}_mapped.sdc]
        set mode mapped
    } else {
        puts "INFO: Elaboration only; set REFERENCE_LIBRARIES for technology mapping."
    }
    set summary [open [file join $log_dir status.tsv] w]
    puts $summary "top\t$top_module"
    puts $summary "mode\t$mode"
    puts $summary "check_design\t$design_ok"
    puts $summary "check_timing\t$timing_ok"
    puts $summary "clock_period_ns\t[get_attribute [get_clocks clock_i] period]"
    close $summary
    puts "\[FC\] PASS: $top_module"
}

set project_dir [file normalize [file join [file dirname [info script]] ../..]]
if {[catch {run_ascon_synthesis $project_dir} failure]} {
    puts stderr "\[FC\] FAIL: $failure"
    exit 1
}
exit 0
