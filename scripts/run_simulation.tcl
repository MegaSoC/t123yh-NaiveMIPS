source [file join [file dirname [info script]] "import_files.tcl"]
update_compile_order -fileset sources_1

set_property -name {xsim.elaborate.debug_level} -value off  -objects [get_filesets sim_1]
set_property -name {xsim.simulate.log_all_signals} -value false  -objects [get_filesets sim_1]

generate_target simulation [get_ips *]
set simulations [get_fileset $env(SIMULATION)]

if { [llength simulations] != 0} {
	foreach sim $simulations {
                update_compile_order -fileset $sim
                launch_simulation -simset $sim
                # make simulation complete
                run all
	}
}

exit
