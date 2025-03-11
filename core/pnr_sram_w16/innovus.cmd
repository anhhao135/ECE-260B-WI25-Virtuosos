#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Mar 10 12:45:04 2025                
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
set init_verilog ./netlist/sram_w16.v
set init_design_netlisttype Verilog
set init_design_settop 1
set init_top_cell sram_w16
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
pan 0.705 -0.389
floorPlan -site core -r 1 0.5 10 10 10 10
timeDesign -preplace -prefix preplace
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose
addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS VDD}
setAddStripeMode -break_at block_ring
addStripe -nets {VDD VSS} -layer M4 -direction vertical -width 2 -spacing 6 -number_of_sets 10
sroute
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 0.2 -pin {CEN CLK {D[0]} {D[1]} {D[2]} {D[3]} {D[4]} {D[5]} {D[6]} {D[7]} {D[8]} {D[9]} {D[10]} {D[11]} {D[12]} {D[13]} {D[14]} {D[15]} {D[16]} {D[17]} {D[18]} {D[19]} {D[20]} {D[21]} {D[22]} {D[23]} {D[24]} {D[25]} {D[26]} {D[27]} {D[28]} {D[29]} {D[30]} {D[31]} {D[32]} {D[33]} {D[34]} {D[35]} {D[36]} {D[37]} {D[38]} {D[39]} {D[40]} {D[41]} {D[42]} {D[43]} {D[44]} {D[45]} {D[46]} {D[47]} {D[48]} {D[49]} {D[50]} {D[51]} {D[52]} {D[53]} {D[54]} {D[55]} {D[56]} {D[57]} {D[58]} {D[59]} {D[60]} {D[61]} {D[62]} {D[63]} WEN {A[0]} {A[1]} {A[2]} {A[3]}}
set ptngSprNoRefreshPins 1
setPtnPinStatus -cell sram_w16 -pin {Q[0]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[1]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[2]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[3]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[4]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[5]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[6]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[7]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[8]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[9]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[10]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[11]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[12]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[13]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[14]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[15]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[16]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[17]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[18]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[19]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[20]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[21]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[22]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[23]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[24]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[25]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[26]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[27]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[28]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[29]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[30]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[31]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[32]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[33]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[34]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[35]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[36]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[37]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[38]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[39]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[40]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[41]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[42]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[43]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[44]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[45]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[46]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[47]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[48]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[49]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[50]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[51]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[52]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[53]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[54]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[55]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[56]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[57]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[58]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[59]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[60]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[61]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[62]} -status unplaced -silent
setPtnPinStatus -cell sram_w16 -pin {Q[63]} -status unplaced -silent
set ptngSprNoRefreshPins 0
ptnSprRefreshPinsAndBlockages
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType center -spacing 0.2 -pin {{Q[0]} {Q[1]} {Q[2]} {Q[3]} {Q[4]} {Q[5]} {Q[6]} {Q[7]} {Q[8]} {Q[9]} {Q[10]} {Q[11]} {Q[12]} {Q[13]} {Q[14]} {Q[15]} {Q[16]} {Q[17]} {Q[18]} {Q[19]} {Q[20]} {Q[21]} {Q[22]} {Q[23]} {Q[24]} {Q[25]} {Q[26]} {Q[27]} {Q[28]} {Q[29]} {Q[30]} {Q[31]} {Q[32]} {Q[33]} {Q[34]} {Q[35]} {Q[36]} {Q[37]} {Q[38]} {Q[39]} {Q[40]} {Q[41]} {Q[42]} {Q[43]} {Q[44]} {Q[45]} {Q[46]} {Q[47]} {Q[48]} {Q[49]} {Q[50]} {Q[51]} {Q[52]} {Q[53]} {Q[54]} {Q[55]} {Q[56]} {Q[57]} {Q[58]} {Q[59]} {Q[60]} {Q[61]} {Q[62]} {Q[63]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType center -spacing -0.2 -pin {{Q[0]} {Q[1]} {Q[2]} {Q[3]} {Q[4]} {Q[5]} {Q[6]} {Q[7]} {Q[8]} {Q[9]} {Q[10]} {Q[11]} {Q[12]} {Q[13]} {Q[14]} {Q[15]} {Q[16]} {Q[17]} {Q[18]} {Q[19]} {Q[20]} {Q[21]} {Q[22]} {Q[23]} {Q[24]} {Q[25]} {Q[26]} {Q[27]} {Q[28]} {Q[29]} {Q[30]} {Q[31]} {Q[32]} {Q[33]} {Q[34]} {Q[35]} {Q[36]} {Q[37]} {Q[38]} {Q[39]} {Q[40]} {Q[41]} {Q[42]} {Q[43]} {Q[44]} {Q[45]} {Q[46]} {Q[47]} {Q[48]} {Q[49]} {Q[50]} {Q[51]} {Q[52]} {Q[53]} {Q[54]} {Q[55]} {Q[56]} {Q[57]} {Q[58]} {Q[59]} {Q[60]} {Q[61]} {Q[62]} {Q[63]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType center -spacing 0.2 -pin {{Q[0]} {Q[1]} {Q[2]} {Q[3]} {Q[4]} {Q[5]} {Q[6]} {Q[7]} {Q[8]} {Q[9]} {Q[10]} {Q[11]} {Q[12]} {Q[13]} {Q[14]} {Q[15]} {Q[16]} {Q[17]} {Q[18]} {Q[19]} {Q[20]} {Q[21]} {Q[22]} {Q[23]} {Q[24]} {Q[25]} {Q[26]} {Q[27]} {Q[28]} {Q[29]} {Q[30]} {Q[31]} {Q[32]} {Q[33]} {Q[34]} {Q[35]} {Q[36]} {Q[37]} {Q[38]} {Q[39]} {Q[40]} {Q[41]} {Q[42]} {Q[43]} {Q[44]} {Q[45]} {Q[46]} {Q[47]} {Q[48]} {Q[49]} {Q[50]} {Q[51]} {Q[52]} {Q[53]} {Q[54]} {Q[55]} {Q[56]} {Q[57]} {Q[58]} {Q[59]} {Q[60]} {Q[61]} {Q[62]} {Q[63]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType center -spacing 0.2 -pin {{Q[0]} {Q[1]} {Q[2]} {Q[3]} {Q[4]} {Q[5]} {Q[6]} {Q[7]} {Q[8]} {Q[9]} {Q[10]} {Q[11]} {Q[12]} {Q[13]} {Q[14]} {Q[15]} {Q[16]} {Q[17]} {Q[18]} {Q[19]} {Q[20]} {Q[21]} {Q[22]} {Q[23]} {Q[24]} {Q[25]} {Q[26]} {Q[27]} {Q[28]} {Q[29]} {Q[30]} {Q[31]} {Q[32]} {Q[33]} {Q[34]} {Q[35]} {Q[36]} {Q[37]} {Q[38]} {Q[39]} {Q[40]} {Q[41]} {Q[42]} {Q[43]} {Q[44]} {Q[45]} {Q[46]} {Q[47]} {Q[48]} {Q[49]} {Q[50]} {Q[51]} {Q[52]} {Q[53]} {Q[54]} {Q[55]} {Q[56]} {Q[57]} {Q[58]} {Q[59]} {Q[60]} {Q[61]} {Q[62]} {Q[63]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType center -spacing 0.2 -pin {{Q[0]} {Q[1]} {Q[2]} {Q[3]} {Q[4]} {Q[5]} {Q[6]} {Q[7]} {Q[8]} {Q[9]} {Q[10]} {Q[11]} {Q[12]} {Q[13]} {Q[14]} {Q[15]} {Q[16]} {Q[17]} {Q[18]} {Q[19]} {Q[20]} {Q[21]} {Q[22]} {Q[23]} {Q[24]} {Q[25]} {Q[26]} {Q[27]} {Q[28]} {Q[29]} {Q[30]} {Q[31]} {Q[32]} {Q[33]} {Q[34]} {Q[35]} {Q[36]} {Q[37]} {Q[38]} {Q[39]} {Q[40]} {Q[41]} {Q[42]} {Q[43]} {Q[44]} {Q[45]} {Q[46]} {Q[47]} {Q[48]} {Q[49]} {Q[50]} {Q[51]} {Q[52]} {Q[53]} {Q[54]} {Q[55]} {Q[56]} {Q[57]} {Q[58]} {Q[59]} {Q[60]} {Q[61]} {Q[62]} {Q[63]}}
setPinAssignMode -pinEditInBatch false
pan 97.268 -5.707
pan -4.801 -1.614
pan 0.284 -1.540
pan -69.029 36.850
pan 13.944 -6.761
saveDesign floorplan.enc
setPlaceMode -timingDriven true -reorderScan false -congEffort medium -modulePlan false
setOptMode -effort high -powerEffort high -leakageToDynamicRatio 0.5 -fixFanoutLoad true -restruct true -verbose true
place_opt_design
saveDesign placement.enc
pan 5.205 -7.236
pan -0.641 1.009
pan 0.584 1.125
setLayerPreference allM8Cont -isVisible 0
setLayerPreference allM8Cont -isVisible 1
setLayerPreference allM8 -isVisible 0
setLayerPreference allM8 -isVisible 1
setLayerPreference allM8 -isVisible 0
setLayerPreference allM8 -isVisible 1
pan 0.130 -1.938
pan 0.013 -1.094
pan 31.631 22.890
pan 91.924 -9.005
pan 0.085 -0.661
pan -89.426 24.730
setDrawView ameba
setDrawView fplan
setDrawView place
setDrawView place
setDrawView fplan
setDrawView place
setLayerPreference allM0 -isSelectable 0
setLayerPreference allM1Cont -isSelectable 0
setLayerPreference allM1 -isSelectable 0
setLayerPreference allM2Cont -isSelectable 0
setLayerPreference allM2 -isSelectable 0
setLayerPreference allM3Cont -isSelectable 0
setLayerPreference allM3 -isSelectable 0
setLayerPreference allM4Cont -isSelectable 0
setLayerPreference allM4 -isSelectable 0
setLayerPreference allM5Cont -isSelectable 0
setLayerPreference allM5 -isSelectable 0
setLayerPreference allM6Cont -isSelectable 0
setLayerPreference allM6 -isSelectable 0
setLayerPreference allM7Cont -isSelectable 0
setLayerPreference allM7 -isSelectable 0
setLayerPreference allM8Cont -isSelectable 0
setLayerPreference allM8 -isSelectable 0
setLayerPreference allM0 -isSelectable 1
setLayerPreference allM1Cont -isSelectable 1
setLayerPreference allM1 -isSelectable 1
setLayerPreference allM2Cont -isSelectable 1
setLayerPreference allM2 -isSelectable 1
setLayerPreference allM3Cont -isSelectable 1
setLayerPreference allM3 -isSelectable 1
setLayerPreference allM4Cont -isSelectable 1
setLayerPreference allM4 -isSelectable 1
setLayerPreference allM5Cont -isSelectable 1
setLayerPreference allM5 -isSelectable 1
setLayerPreference allM6Cont -isSelectable 1
setLayerPreference allM6 -isSelectable 1
setLayerPreference allM7Cont -isSelectable 1
setLayerPreference allM7 -isSelectable 1
setLayerPreference allM8Cont -isSelectable 1
setLayerPreference allM8 -isSelectable 1
setLayerPreference allM0 -isVisible 0
setLayerPreference allM1Cont -isVisible 0
setLayerPreference allM1 -isVisible 0
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2 -isVisible 0
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3 -isVisible 0
setLayerPreference allM4Cont -isVisible 0
setLayerPreference allM4 -isVisible 0
setLayerPreference allM5Cont -isVisible 0
setLayerPreference allM5 -isVisible 0
setLayerPreference allM6Cont -isVisible 0
setLayerPreference allM6 -isVisible 0
setLayerPreference allM7Cont -isVisible 0
setLayerPreference allM7 -isVisible 0
setLayerPreference allM8Cont -isVisible 0
setLayerPreference allM8 -isVisible 0
setLayerPreference allM0 -isVisible 1
setLayerPreference allM1Cont -isVisible 1
setLayerPreference allM1 -isVisible 1
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2 -isVisible 1
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3 -isVisible 1
setLayerPreference allM4Cont -isVisible 1
setLayerPreference allM4 -isVisible 1
setLayerPreference allM5Cont -isVisible 1
setLayerPreference allM5 -isVisible 1
setLayerPreference allM6Cont -isVisible 1
setLayerPreference allM6 -isVisible 1
setLayerPreference allM7Cont -isVisible 1
setLayerPreference allM7 -isVisible 1
setLayerPreference allM8Cont -isVisible 1
setLayerPreference allM8 -isVisible 1
addFiller -cell {FILL1 FILL2 DCAP DCAP4 DCAP16 DCAP32 DCAP64}
setNanoRouteMode -quiet -drouteAllowMergedWireAtPin false
setNanoRouteMode -quiet -drouteFixAntenna true
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
setNanoRouteMode -quiet -routeSiEffort medium
setNanoRouteMode -quiet -routeWithSiPostRouteFix false
setNanoRouteMode -quiet -drouteAutoStop true
setNanoRouteMode -quiet -routeSelectedNetOnly false
setNanoRouteMode -quiet -drouteStartIteration default
routeDesign
setExtractRCMode -engine postRoute
extractRC
setAnalysisMode -analysisType onChipVariation -cppr both
optDesign -postRoute -setup -hold
saveDesign route.enc
setLayerPreference allM0 -isSelectable 0
setLayerPreference allM1Cont -isSelectable 0
setLayerPreference allM1 -isSelectable 0
setLayerPreference allM2Cont -isSelectable 0
setLayerPreference allM2 -isSelectable 0
setLayerPreference allM3Cont -isSelectable 0
setLayerPreference allM3 -isSelectable 0
setLayerPreference allM4Cont -isSelectable 0
setLayerPreference allM4 -isSelectable 0
setLayerPreference allM5Cont -isSelectable 0
setLayerPreference allM5 -isSelectable 0
setLayerPreference allM6Cont -isSelectable 0
setLayerPreference allM6 -isSelectable 0
setLayerPreference allM7Cont -isSelectable 0
setLayerPreference allM7 -isSelectable 0
setLayerPreference allM8Cont -isSelectable 0
setLayerPreference allM8 -isSelectable 0
setLayerPreference allM0 -isSelectable 1
setLayerPreference allM1Cont -isSelectable 1
setLayerPreference allM1 -isSelectable 1
setLayerPreference allM2Cont -isSelectable 1
setLayerPreference allM2 -isSelectable 1
setLayerPreference allM3Cont -isSelectable 1
setLayerPreference allM3 -isSelectable 1
setLayerPreference allM4Cont -isSelectable 1
setLayerPreference allM4 -isSelectable 1
setLayerPreference allM5Cont -isSelectable 1
setLayerPreference allM5 -isSelectable 1
setLayerPreference allM6Cont -isSelectable 1
setLayerPreference allM6 -isSelectable 1
setLayerPreference allM7Cont -isSelectable 1
setLayerPreference allM7 -isSelectable 1
setLayerPreference allM8Cont -isSelectable 1
setLayerPreference allM8 -isSelectable 1
setLayerPreference allM0 -isVisible 0
setLayerPreference allM1Cont -isVisible 0
setLayerPreference allM1 -isVisible 0
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2 -isVisible 0
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3 -isVisible 0
setLayerPreference allM4Cont -isVisible 0
setLayerPreference allM4 -isVisible 0
setLayerPreference allM5Cont -isVisible 0
setLayerPreference allM5 -isVisible 0
setLayerPreference allM6Cont -isVisible 0
setLayerPreference allM6 -isVisible 0
setLayerPreference allM7Cont -isVisible 0
setLayerPreference allM7 -isVisible 0
setLayerPreference allM8Cont -isVisible 0
setLayerPreference allM8 -isVisible 0
pan -3.683 -24.498
pan 54.723 81.525
pan -34.939 56.797
selectInst FILLER_397
deselectAll
selectInst U1304
deselectAll
selectInst FILLER_397
setLayerPreference allM0 -isVisible 1
setLayerPreference allM1Cont -isVisible 1
setLayerPreference allM1 -isVisible 1
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2 -isVisible 1
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3 -isVisible 1
setLayerPreference allM4Cont -isVisible 1
setLayerPreference allM4 -isVisible 1
setLayerPreference allM5Cont -isVisible 1
setLayerPreference allM5 -isVisible 1
setLayerPreference allM6Cont -isVisible 1
setLayerPreference allM6 -isVisible 1
setLayerPreference allM7Cont -isVisible 1
setLayerPreference allM7 -isVisible 1
setLayerPreference allM8Cont -isVisible 1
setLayerPreference allM8 -isVisible 1
verifyConnectivity
verifyGeometry
pan 68.758 -32.141
pan 56.010 -43.533
pan -10.171 -37.431
pan -54.383 -12.341
pan 1.754 -3.294
pan -0.669 2.035
