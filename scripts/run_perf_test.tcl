source [file join [file dirname [info script]] "import_files.tcl"]

cd [get_property DIRECTORY [current_project]]

generate_target simulation [get_ips *]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
launch_simulation -simset sim_1

set test [lindex $argv 0]

file copy -force ../../../soft/perf_func/obj/$test/axi_ram.mif ./mycpu.sim/sim_1/behav/xsim/axi_ram.mif
restart

run all
close_sim
exit
