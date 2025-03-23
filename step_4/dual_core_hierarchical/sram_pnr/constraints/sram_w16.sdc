set clock_cycle 1.0
set uncertainty 0.0
set io_delay 0.2
set clock_port CLK 

create_clock -name clk -add -period $clock_cycle [get_ports $clock_port]
set_clock_uncertainty $uncertainty  [get_clocks clk]


set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {CLK}]
set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {WEN}]
set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {CEN}]
set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {D}]
set_input_delay  $io_delay -clock [get_clocks {clk}] [get_ports {A}]

set_output_delay  $io_delay -clock [get_clocks {clk}] [get_ports {Q}]