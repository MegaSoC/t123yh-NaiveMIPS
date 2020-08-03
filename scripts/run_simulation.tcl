source [file join [file dirname [info script]] "import_files.tcl"]
update_compile_order -fileset sources_1

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
