set top_module core
set rtlPath "./verilog"

# Target library
set target_library /home/linux/ieng6/ee260bwi25/public/PDKdata/db/tcbn65gpluswc.db 
set link_library $target_library
set symbol_library {}
set wire_load_mode enclosed
set timing_use_enhanced_capacitance_modeling true

set search_path [concat $rtlPath $search_path]
set link_library [concat * $link_library ]

set synthetic_library {}
set link_path [concat  $link_library $synthetic_library]
set dont_use_cells 1
set dont_use_cell_list ""

remove_design -all
if {[file exists template]} {
	exec rm -rf template
}
exec mkdir template
if {![file exists log]} {
    exec mkdir log
}
if {![file exists gate]} {
	exec mkdir gate
}

sh date
sh echo hostname
sh echo uptime


define_design_lib WORK -path .template

# read RTL
analyze -format verilog -lib WORK core.v
analyze -format verilog -lib WORK fifo_mux_16_1.v
analyze -format verilog -lib WORK fifo_mux_8_1.v
analyze -format verilog -lib WORK fifo_mux_2_1.v
analyze -format verilog -lib WORK fifo_depth16.v
analyze -format verilog -lib WORK ofifo.v
analyze -format verilog -lib WORK sram_w16.v
analyze -format verilog -lib WORK mac_array.v
analyze -format verilog -lib WORK mac_col.v
analyze -format verilog -lib WORK mac_8in.v

elaborate $top_module -lib WORK -update
current_design $top_module

# Link Design
link

# Default SDC Constraints
read_sdc ${top_module}.sdc
propagate_constraints

current_design $top_module

#set_register_merging false [get_cells -hierarchical *]

set_optimize_registers false
set_register_merging [get_designs $top_module] false

# Compile
# Source user compile options
#compile_ultra -no_autoungroup
#ungroup -flatten -all

compile_ultra -no_autoungroup -no_boundary_optimization -no_seq_output_inversion

# Write Out Design - Hierarchical
current_design $top_module

change_names -rules verilog -hierarchy

write -format verilog -hier -output [format "%s%s" $top_module .out.v]

# Write Reports
redirect [format "%s%s%s" log/ $top_module _area.rep] { report_area }
redirect -append [format "%s%s%s" log/ $top_module _area.rep] { report_reference }
redirect [format "%s%s%s" log/ $top_module _power.rep] { report_power }
redirect [format "%s%s%s" log/ $top_module _timing.rep] \
  { report_timing -path full -max_paths 100 -nets -transition_time -capacitance -significant_digits 3 -nosplit}

set inFile  [open log/$top_module\_area.rep]
while { [gets $inFile line]>=0 } {
    if { [regexp {Total cell area:} $line] } {
        set AREA [lindex $line 3]
    }
}
close $inFile
set inFile  [open log/$top_module\_power.rep]
while { [gets $inFile line]>=0 } {
    if { [regexp {Total Dynamic Power} $line] } {
        set PWR [lindex $line 4]
    } elseif { [regexp {Cell Leakage Power} $line] } {  
        set LEAK [lindex $line 4] 
    }
}
close $inFile

set unmapped_designs [get_designs -filter "is_unmapped == true" $top_module]
if {  [sizeof_collection $unmapped_designs] != 0 } {
	echo "****************************************************"
	echo "* ERROR!!!! Compile finished with unmapped logic.  *"
	echo "****************************************************"
}
# Done
sh date
sh uptime

# Done
echo "run.scr completed successfully"

