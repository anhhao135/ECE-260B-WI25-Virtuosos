#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Mar 10 10:22:30 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v15.23-s045_1 (64bit) 04/22/2016 12:32 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 15.23-s045_1 NR160414-1105/15_23-UB (database version 2.30, 317.6.1) {superthreading v1.26}
#@(#)CDS: AAE 15.23-s014 (64bit) 04/22/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 15.23-s022_1 () Apr 22 2016 09:38:45 ( )
#@(#)CDS: SYNTECH 15.23-s008_1 () Apr 12 2016 21:52:59 ( )
#@(#)CDS: CPE v15.23-s045
#@(#)CDS: IQRC/TQRC 15.1.4-s213 (64bit) Tue Feb  9 17:31:28 PST 2016 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set init_pwr_net VDD
set init_gnd_net VSS
set init_verilog ./netlist/mac_8in.v
set init_design_netlisttype Verilog
set init_design_settop 1
set init_top_cell mac_8in
set init_lef_file /home/linux/ieng6/ee260bwi25/public/PDKdata/lef/tcbn65gplus_8lmT2.lef
create_library_set -name WC_LIB -timing $worst_timing_lib
create_library_set -name BC_LIB -timing $best_timing_lib
create_rc_corner -name Cmax -cap_table $worst_captbl -T 125
create_rc_corner -name Cmin -cap_table $best_captbl -T -40
create_delay_corner -name WC -library_set WC_LIB -rc_corner Cmax
create_delay_corner -name BC -library_set BC_LIB -rc_corner Cmin
create_constraint_mode -name CON -sdc_file [list $sdc]
create_analysis_view -name WC_VIEW -delay_corner WC -constraint_mode CON
create_analysis_view -name BC_VIEW -delay_corner BC -constraint_mode CON
init_design -setup WC_VIEW -hold BC_VIEW
set_interactive_constraint_modes {CON}
setDesignMode -process 65
floorPlan -site core -r 1 0.5 10 10 10 10
timeDesign -preplace -prefix preplace
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose
addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS VDD}
setAddStripeMode -break_at block_ring
addStripe -nets {VDD VSS} -layer M4 -direction vertical -width 2 -spacing 6 -number_of_sets 20
sroute
pan -2.221 -4.442
pan -1.837 13.030
deleteAllFPObjects
floorPlan -site core -r 1 0.5 10 10 10 10
timeDesign -preplace -prefix preplace
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose
addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS VDD}
setAddStripeMode -break_at block_ring
addStripe -nets {VDD VSS} -layer M4 -direction vertical -width 2 -spacing 6 -number_of_sets 10
sroute
pan 22.654 29.828
pan -0.818 -7.508
getPinAssignMode -pinEditInBatch -quiet
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell mac_8in -pin clk -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin reset -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[0]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[1]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[2]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[3]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[4]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[5]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[6]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[7]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[8]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[9]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[10]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[11]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[12]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[13]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[14]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[15]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[16]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[17]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[18]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[19]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[20]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[21]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[22]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[23]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[24]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[25]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[26]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[27]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[28]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[29]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[30]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[31]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[32]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[33]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[34]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[35]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[36]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[37]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[38]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[39]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[40]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[41]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[42]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[43]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[44]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[45]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[46]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[47]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[48]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[49]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[50]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[51]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[52]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[53]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[54]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[55]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[56]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[57]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[58]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[59]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[60]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[61]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[62]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {b[63]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[0]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[1]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[2]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[3]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[4]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[5]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[6]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[7]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[8]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[9]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[10]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[11]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[12]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[13]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[14]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[15]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[16]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[17]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[18]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[19]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[20]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[21]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[22]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[23]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[24]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[25]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[26]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[27]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[28]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[29]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[30]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[31]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[32]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[33]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[34]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[35]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[36]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[37]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[38]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[39]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[40]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[41]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[42]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[43]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[44]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[45]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[46]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[47]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[48]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[49]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[50]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[51]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[52]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[53]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[54]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[55]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[56]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[57]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[58]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[59]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[60]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[61]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[62]} -status unplaced -silent
setPtnPinStatus -cell mac_8in -pin {a[63]} -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 1.0 -pin {clk reset {b[0]} {b[1]} {b[2]} {b[3]} {b[4]} {b[5]} {b[6]} {b[7]} {b[8]} {b[9]} {b[10]} {b[11]} {b[12]} {b[13]} {b[14]} {b[15]} {b[16]} {b[17]} {b[18]} {b[19]} {b[20]} {b[21]} {b[22]} {b[23]} {b[24]} {b[25]} {b[26]} {b[27]} {b[28]} {b[29]} {b[30]} {b[31]} {b[32]} {b[33]} {b[34]} {b[35]} {b[36]} {b[37]} {b[38]} {b[39]} {b[40]} {b[41]} {b[42]} {b[43]} {b[44]} {b[45]} {b[46]} {b[47]} {b[48]} {b[49]} {b[50]} {b[51]} {b[52]} {b[53]} {b[54]} {b[55]} {b[56]} {b[57]} {b[58]} {b[59]} {b[60]} {b[61]} {b[62]} {b[63]} {a[0]} {a[1]} {a[2]} {a[3]} {a[4]} {a[5]} {a[6]} {a[7]} {a[8]} {a[9]} {a[10]} {a[11]} {a[12]} {a[13]} {a[14]} {a[15]} {a[16]} {a[17]} {a[18]} {a[19]} {a[20]} {a[21]} {a[22]} {a[23]} {a[24]} {a[25]} {a[26]} {a[27]} {a[28]} {a[29]} {a[30]} {a[31]} {a[32]} {a[33]} {a[34]} {a[35]} {a[36]} {a[37]} {a[38]} {a[39]} {a[40]} {a[41]} {a[42]} {a[43]} {a[44]} {a[45]} {a[46]} {a[47]} {a[48]} {a[49]} {a[50]} {a[51]} {a[52]} {a[53]} {a[54]} {a[55]} {a[56]} {a[57]} {a[58]} {a[59]} {a[60]} {a[61]} {a[62]} {a[63]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.09 -pinDepth 0.47 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 1.0 -pin {clk reset {b[0]} {b[1]} {b[2]} {b[3]} {b[4]} {b[5]} {b[6]} {b[7]} {b[8]} {b[9]} {b[10]} {b[11]} {b[12]} {b[13]} {b[14]} {b[15]} {b[16]} {b[17]} {b[18]} {b[19]} {b[20]} {b[21]} {b[22]} {b[23]} {b[24]} {b[25]} {b[26]} {b[27]} {b[28]} {b[29]} {b[30]} {b[31]} {b[32]} {b[33]} {b[34]} {b[35]} {b[36]} {b[37]} {b[38]} {b[39]} {b[40]} {b[41]} {b[42]} {b[43]} {b[44]} {b[45]} {b[46]} {b[47]} {b[48]} {b[49]} {b[50]} {b[51]} {b[52]} {b[53]} {b[54]} {b[55]} {b[56]} {b[57]} {b[58]} {b[59]} {b[60]} {b[61]} {b[62]} {b[63]} {a[0]} {a[1]} {a[2]} {a[3]} {a[4]} {a[5]} {a[6]} {a[7]} {a[8]} {a[9]} {a[10]} {a[11]} {a[12]} {a[13]} {a[14]} {a[15]} {a[16]} {a[17]} {a[18]} {a[19]} {a[20]} {a[21]} {a[22]} {a[23]} {a[24]} {a[25]} {a[26]} {a[27]} {a[28]} {a[29]} {a[30]} {a[31]} {a[32]} {a[33]} {a[34]} {a[35]} {a[36]} {a[37]} {a[38]} {a[39]} {a[40]} {a[41]} {a[42]} {a[43]} {a[44]} {a[45]} {a[46]} {a[47]} {a[48]} {a[49]} {a[50]} {a[51]} {a[52]} {a[53]} {a[54]} {a[55]} {a[56]} {a[57]} {a[58]} {a[59]} {a[60]} {a[61]} {a[62]} {a[63]}}
setPinAssignMode -pinEditInBatch false
pan 14.693 25.712
pan -1.510 31.717
pan 4.305 -37.516
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.09 -pinDepth 0.47 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 1.0 -pin {{a[0]} {a[1]} {a[2]} {a[3]} {a[4]} {a[5]} {a[6]} {a[7]} {a[8]} {a[9]} {a[10]} {a[11]} {a[12]} {a[13]} {a[14]} {a[15]} {a[16]} {a[17]} {a[18]} {a[19]} {a[20]} {a[21]} {a[22]} {a[23]} {a[24]} {a[25]} {a[26]} {a[27]} {a[28]} {a[29]} {a[30]} {a[31]} {a[32]} {a[33]} {a[34]} {a[35]} {a[36]} {a[37]} {a[38]} {a[39]} {a[40]} {a[41]} {a[42]} {a[43]} {a[44]} {a[45]} {a[46]} {a[47]} {a[48]} {a[49]} {a[50]} {a[51]} {a[52]} {a[53]} {a[54]} {a[55]} {a[56]} {a[57]} {a[58]} {a[59]} {a[60]} {a[61]} {a[62]} {a[63]} {b[0]} {b[1]} {b[2]} {b[3]} {b[4]} {b[5]} {b[6]} {b[7]} {b[8]} {b[9]} {b[10]} {b[11]} {b[12]} {b[13]} {b[14]} {b[15]} {b[16]} {b[17]} {b[18]} {b[19]} {b[20]} {b[21]} {b[22]} {b[23]} {b[24]} {b[25]} {b[26]} {b[27]} {b[28]} {b[29]} {b[30]} {b[31]} {b[32]} {b[33]} {b[34]} {b[35]} {b[36]} {b[37]} {b[38]} {b[39]} {b[40]} {b[41]} {b[42]} {b[43]} {b[44]} {b[45]} {b[46]} {b[47]} {b[48]} {b[49]} {b[50]} {b[51]} {b[52]} {b[53]} {b[54]} {b[55]} {b[56]} {b[57]} {b[58]} {b[59]} {b[60]} {b[61]} {b[62]} {b[63]} clk reset}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.09 -pinDepth 0.47 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 1.0 -pin {{a[0]} {a[1]} {a[2]} {a[3]} {a[4]} {a[5]} {a[6]} {a[7]} {a[8]} {a[9]} {a[10]} {a[11]} {a[12]} {a[13]} {a[14]} {a[15]} {a[16]} {a[17]} {a[18]} {a[19]} {a[20]} {a[21]} {a[22]} {a[23]} {a[24]} {a[25]} {a[26]} {a[27]} {a[28]} {a[29]} {a[30]} {a[31]} {a[32]} {a[33]} {a[34]} {a[35]} {a[36]} {a[37]} {a[38]} {a[39]} {a[40]} {a[41]} {a[42]} {a[43]} {a[44]} {a[45]} {a[46]} {a[47]} {a[48]} {a[49]} {a[50]} {a[51]} {a[52]} {a[53]} {a[54]} {a[55]} {a[56]} {a[57]} {a[58]} {a[59]} {a[60]} {a[61]} {a[62]} {a[63]} {b[0]} {b[1]} {b[2]} {b[3]} {b[4]} {b[5]} {b[6]} {b[7]} {b[8]} {b[9]} {b[10]} {b[11]} {b[12]} {b[13]} {b[14]} {b[15]} {b[16]} {b[17]} {b[18]} {b[19]} {b[20]} {b[21]} {b[22]} {b[23]} {b[24]} {b[25]} {b[26]} {b[27]} {b[28]} {b[29]} {b[30]} {b[31]} {b[32]} {b[33]} {b[34]} {b[35]} {b[36]} {b[37]} {b[38]} {b[39]} {b[40]} {b[41]} {b[42]} {b[43]} {b[44]} {b[45]} {b[46]} {b[47]} {b[48]} {b[49]} {b[50]} {b[51]} {b[52]} {b[53]} {b[54]} {b[55]} {b[56]} {b[57]} {b[58]} {b[59]} {b[60]} {b[61]} {b[62]} {b[63]} clk reset}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.09 -pinDepth 0.47 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 1.0 -pin {{b[0]} {b[1]} {b[2]} {b[3]} {b[4]} {b[5]} {b[6]} {b[7]} {b[8]} {b[9]} {b[10]} {b[11]} {b[12]} {b[13]} {b[14]} {b[15]} {b[16]} {b[17]} {b[18]} {b[19]} {b[20]} {b[21]} {b[22]} {b[23]} {b[24]} {b[25]} {b[26]} {b[27]} {b[28]} {b[29]} {b[30]} {b[31]} {b[32]} {b[33]} {b[34]} {b[35]} {b[36]} {b[37]} {b[38]} {b[39]} {b[40]} {b[41]} {b[42]} {b[43]} {b[44]} {b[45]} {b[46]} {b[47]} {b[48]} {b[49]} {b[50]} {b[51]} {b[52]} {b[53]} {b[54]} {b[55]} {b[56]} {b[57]} {b[58]} {b[59]} {b[60]} {b[61]} {b[62]} {b[63]} {a[0]} {a[1]} {a[2]} {a[3]} {a[4]} {a[5]} {a[6]} {a[7]} {a[8]} {a[9]} {a[10]} {a[11]} {a[12]} {a[13]} {a[14]} {a[15]} {a[16]} {a[17]} {a[18]} {a[19]} {a[20]} {a[21]} {a[22]} {a[23]} {a[24]} {a[25]} {a[26]} {a[27]} {a[28]} {a[29]} {a[30]} {a[31]} {a[32]} {a[33]} {a[34]} {a[35]} {a[36]} {a[37]} {a[38]} {a[39]} {a[40]} {a[41]} {a[42]} {a[43]} {a[44]} {a[45]} {a[46]} {a[47]} {a[48]} {a[49]} {a[50]} {a[51]} {a[52]} {a[53]} {a[54]} {a[55]} {a[56]} {a[57]} {a[58]} {a[59]} {a[60]} {a[61]} {a[62]} {a[63]} clk reset}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.47 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 1.0 -pin {{b[0]} {b[1]} {b[2]} {b[3]} {b[4]} {b[5]} {b[6]} {b[7]} {b[8]} {b[9]} {b[10]} {b[11]} {b[12]} {b[13]} {b[14]} {b[15]} {b[16]} {b[17]} {b[18]} {b[19]} {b[20]} {b[21]} {b[22]} {b[23]} {b[24]} {b[25]} {b[26]} {b[27]} {b[28]} {b[29]} {b[30]} {b[31]} {b[32]} {b[33]} {b[34]} {b[35]} {b[36]} {b[37]} {b[38]} {b[39]} {b[40]} {b[41]} {b[42]} {b[43]} {b[44]} {b[45]} {b[46]} {b[47]} {b[48]} {b[49]} {b[50]} {b[51]} {b[52]} {b[53]} {b[54]} {b[55]} {b[56]} {b[57]} {b[58]} {b[59]} {b[60]} {b[61]} {b[62]} {b[63]} {a[0]} {a[1]} {a[2]} {a[3]} {a[4]} {a[5]} {a[6]} {a[7]} {a[8]} {a[9]} {a[10]} {a[11]} {a[12]} {a[13]} {a[14]} {a[15]} {a[16]} {a[17]} {a[18]} {a[19]} {a[20]} {a[21]} {a[22]} {a[23]} {a[24]} {a[25]} {a[26]} {a[27]} {a[28]} {a[29]} {a[30]} {a[31]} {a[32]} {a[33]} {a[34]} {a[35]} {a[36]} {a[37]} {a[38]} {a[39]} {a[40]} {a[41]} {a[42]} {a[43]} {a[44]} {a[45]} {a[46]} {a[47]} {a[48]} {a[49]} {a[50]} {a[51]} {a[52]} {a[53]} {a[54]} {a[55]} {a[56]} {a[57]} {a[58]} {a[59]} {a[60]} {a[61]} {a[62]} {a[63]} clk reset}
setPinAssignMode -pinEditInBatch false
pan 3.699 14.203
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 0.2 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -0.2 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch false
pan -17.774 55.101
pan 0.015 -1.560
pan 19.614 -19.949
pan -19.516 20.741
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 0.5 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch false
pan -2.138 -11.828
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch false
pan -8.678 -7.692
pan -10.730 -2.850
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.6 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 1.0 -pin {{a[0]} {a[1]} {a[2]} {a[3]} {a[4]} {a[5]} {a[6]} {a[7]} {a[8]} {a[9]} {a[10]} {a[11]} {a[12]} {a[13]} {a[14]} {a[15]} {a[16]} {a[17]} {a[18]} {a[19]} {a[20]} {a[21]} {a[22]} {a[23]} {a[24]} {a[25]} {a[26]} {a[27]} {a[28]} {a[29]} {a[30]} {a[31]} {a[32]} {a[33]} {a[34]} {a[35]} {a[36]} {a[37]} {a[38]} {a[39]} {a[40]} {a[41]} {a[42]} {a[43]} {a[44]} {a[45]} {a[46]} {a[47]} {a[48]} {a[49]} {a[50]} {a[51]} {a[52]} {a[53]} {a[54]} {a[55]} {a[56]} {a[57]} {a[58]} {a[59]} {a[60]} {a[61]} {a[62]} {a[63]} {b[0]} {b[1]} {b[2]} {b[3]} {b[4]} {b[5]} {b[6]} {b[7]} {b[8]} {b[9]} {b[10]} {b[11]} {b[12]} {b[13]} {b[14]} {b[15]} {b[16]} {b[17]} {b[18]} {b[19]} {b[20]} {b[21]} {b[22]} {b[23]} {b[24]} {b[25]} {b[26]} {b[27]} {b[28]} {b[29]} {b[30]} {b[31]} {b[32]} {b[33]} {b[34]} {b[35]} {b[36]} {b[37]} {b[38]} {b[39]} {b[40]} {b[41]} {b[42]} {b[43]} {b[44]} {b[45]} {b[46]} {b[47]} {b[48]} {b[49]} {b[50]} {b[51]} {b[52]} {b[53]} {b[54]} {b[55]} {b[56]} {b[57]} {b[58]} {b[59]} {b[60]} {b[61]} {b[62]} {b[63]} clk reset}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.6 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 1.0 -pin {{a[0]} {a[1]} {a[2]} {a[3]} {a[4]} {a[5]} {a[6]} {a[7]} {a[8]} {a[9]} {a[10]} {a[11]} {a[12]} {a[13]} {a[14]} {a[15]} {a[16]} {a[17]} {a[18]} {a[19]} {a[20]} {a[21]} {a[22]} {a[23]} {a[24]} {a[25]} {a[26]} {a[27]} {a[28]} {a[29]} {a[30]} {a[31]} {a[32]} {a[33]} {a[34]} {a[35]} {a[36]} {a[37]} {a[38]} {a[39]} {a[40]} {a[41]} {a[42]} {a[43]} {a[44]} {a[45]} {a[46]} {a[47]} {a[48]} {a[49]} {a[50]} {a[51]} {a[52]} {a[53]} {a[54]} {a[55]} {a[56]} {a[57]} {a[58]} {a[59]} {a[60]} {a[61]} {a[62]} {a[63]} {b[0]} {b[1]} {b[2]} {b[3]} {b[4]} {b[5]} {b[6]} {b[7]} {b[8]} {b[9]} {b[10]} {b[11]} {b[12]} {b[13]} {b[14]} {b[15]} {b[16]} {b[17]} {b[18]} {b[19]} {b[20]} {b[21]} {b[22]} {b[23]} {b[24]} {b[25]} {b[26]} {b[27]} {b[28]} {b[29]} {b[30]} {b[31]} {b[32]} {b[33]} {b[34]} {b[35]} {b[36]} {b[37]} {b[38]} {b[39]} {b[40]} {b[41]} {b[42]} {b[43]} {b[44]} {b[45]} {b[46]} {b[47]} {b[48]} {b[49]} {b[50]} {b[51]} {b[52]} {b[53]} {b[54]} {b[55]} {b[56]} {b[57]} {b[58]} {b[59]} {b[60]} {b[61]} {b[62]} {b[63]} clk reset}
setPinAssignMode -pinEditInBatch false
pan -7.179 130.739
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.6 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.6 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing 1 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType center -spacing -1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 1 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.6 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.6 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.6 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 1.0 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]} {out[6]} {out[7]} {out[8]} {out[9]} {out[10]} {out[11]} {out[12]} {out[13]} {out[14]} {out[15]} {out[16]} {out[17]} {out[18]} {out[19]} {out[20]} {out[21]}}
setPinAssignMode -pinEditInBatch false
pan 0.000 -17.747
pan -11.739 22.661
pan -33.733 2.170
saveDesign floorplan.enc
setPlaceMode -timingDriven true -reorderScan false -congEffort medium -modulePlan false
setOptMode -effort high -powerEffort high -leakageToDynamicRatio 0.5 -fixFanoutLoad true -restruct true -verbose true
place_opt_design
saveDesign placement.enc
pan -3.354 -19.728
setDrawView ameba
pan 15.149 -2.826
setDrawView fplan
pan 16.145 10.598
setDrawView place
pan 41.758 0.670
pan -0.059 -0.425
pan 0.283 -1.698
pan 0.084 0.444
pan 0.018 1.008
pan 0.044 -1.371
pan 0.056 -1.365
pan 0.435 2.347
pan 0.065 2.328
pan 0.398 2.784
pan -0.015 3.328
pan 0.100 3.121
pan -0.100 2.012
pan -0.475 -2.073
pan 0.072 9.219
pan 0.478 7.595
pan 2.717 29.012
pan 0.043 -2.405
pan -0.106 -2.543
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM5Cont -isVisible 0
setLayerPreference allM5Cont -isVisible 1
setLayerPreference allM7Cont -isVisible 0
setLayerPreference allM7Cont -isVisible 1
setLayerPreference allM7Cont -isVisible 0
setLayerPreference allM7Cont -isVisible 1
setLayerPreference allM7Cont -isVisible 0
setLayerPreference allM7Cont -isVisible 1
set_ccopt_property -update_io_latency false
create_ccopt_clock_tree_spec -file ./constraints/mac_8in.ccopt
ccopt_design
