set clock_cycle 1.0
set uncertainty 0.0
set io_delay 0.2
set clock_port clk 

create_clock -name clk -add -period $clock_cycle [get_ports $clock_port]
set_clock_uncertainty $uncertainty  [get_clocks clk]


set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {reset}]
set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {inst_core1}]
set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {inst_core2}]
set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {mem_in_core1}]
set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {mem_in_core2}]

set_output_delay  $io_delay -clock [get_clocks {clk}] [get_ports {out_core1}]
set_output_delay  $io_delay -clock [get_clocks {clk}] [get_ports {out_core2}]