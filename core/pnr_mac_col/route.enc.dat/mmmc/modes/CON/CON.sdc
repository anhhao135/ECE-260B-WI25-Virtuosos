###############################################################
#  Generated by:      Cadence Innovus 15.23-s045_1
#  OS:                Linux x86_64(Host ID ieng6-ece-04.ucsd.edu)
#  Generated on:      Mon Mar 10 15:05:25 2025
#  Design:            mac_col
#  Command:           saveDesign route.enc
###############################################################
current_design mac_col
create_clock [get_ports {clk}]  -name clk -period 1.000000 -waveform {0.000000 0.500000}
set_propagated_clock  [get_clocks {clk}]
set_propagated_clock  [get_ports {clk}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[42]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[35]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[28]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[8]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[17]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[24]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[58]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[31]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[4]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[13]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[20]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[61]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[54]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[47]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[0]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[50]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[43]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[36]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[29]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[9]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[18]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[25]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[59]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[32]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {i_inst[0]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[5]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[14]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[21]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[62]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[55]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[48]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[1]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[10]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[51]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[44]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[37]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[19]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[26]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[40]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[33]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {i_inst[1]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[6]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[15]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[22]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[63]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[56]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[49]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[2]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[11]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[52]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[45]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[38]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {reset}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[41]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[34]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[27]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[7]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[16]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[23]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[57]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[30]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[3]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[12]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[60]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[53]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[46]}]
set_input_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_in[39]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {o_inst[0]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[32]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[25]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[18]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[48]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[55]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[62]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[18]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[4]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[1]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[10]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {o_inst[1]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[40]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[33]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[26]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[19]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[10]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[49]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[56]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[63]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[19]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[5]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[2]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[11]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[41]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[34]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[27]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[11]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[57]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {fifo_wr}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[6]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[3]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[12]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[12]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[42]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[35]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[28]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[58]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[7]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[4]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[20]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[13]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[50]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[43]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[36]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[29]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[13]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[20]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[59]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[8]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[5]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[21]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[14]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[51]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[44]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[37]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[14]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[21]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[0]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[9]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[6]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[22]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[15]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[52]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[45]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[38]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[15]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[1]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[7]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[30]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[23]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[16]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[53]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[60]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[46]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[39]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[16]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[2]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[8]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[31]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[24]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[17]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[17]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[54]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[61]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[47]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {q_out[3]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[0]}]
set_output_delay -add_delay 0.2 -clock [get_clocks {clk}] [get_ports {out[9]}]
set_clock_uncertainty 0 [get_clocks {clk}]
