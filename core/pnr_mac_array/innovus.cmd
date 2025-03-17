#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Mar 17 12:42:31 2025                
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
set init_verilog ./netlist/mac_array.v
set init_design_netlisttype Verilog
set init_design_settop 1
set init_top_cell mac_array
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
addStripe -nets {VDD VSS} -layer M4 -direction vertical -width 2 -spacing 6 -number_of_sets 10
sroute
saveDesign floorplan.enc
setPlaceMode -timingDriven true -reorderScan false -congEffort medium -modulePlan false
setOptMode -effort high -powerEffort high -leakageToDynamicRatio 0.5 -fixFanoutLoad true -restruct true -verbose true
place_opt_design
saveDesign placement.enc
addFiller -cell {FILL1 FILL2 DCAP DCAP4 DCAP16 DCAP32 DCAP64}
restoreDesign /home/linux/ieng6/ee260bwi25/h3le/ECE-260B-WI25-Virtuosos/core/pnr_mac_array/placement.enc.dat mac_array
set_ccopt_property -update_io_latency false
create_ccopt_clock_tree_spec -file ./constraints/mac_array.ccopt
ccopt_design
set_propagated_clock [all_clocks]
optDesign -postCTS -hold
saveDesign cts.enc
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
addFiller -cell {FILL1 FILL2 DCAP DCAP4 DCAP16 DCAP32 DCAP64}
verifyConnectivity
verifyGeometry
ecoRoute
verifyConnectivity
verifyGeometry
optDesign -postRoute -drv
verifyGeometry
setLayerPreference violation -isVisible 1
uiKit::addWidget vb -type main
violationBrowser -all -no_display_false
zoomBox 118.11 167.45 119.49 168.55
optDesign -postRoute -inc
verifyGeometry
selectInst genblk1_5__mac_col_inst/mac_8in_instance/U563
pan 0.359 -0.059
setDrawView ameba
setDrawView place
pan 0.072 -0.201
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
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2 -isVisible 0
setLayerPreference allM2 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM2 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM2 -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
pan -0.701 -0.722
pan -0.138 -0.072
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
pan 0.671 0.689
pan 0.613 0.092
pan 0.081 0.011
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2Cont -isVisible 0
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
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM3 -isVisible 1
setLayerPreference allM2 -isVisible 1
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM2 -isVisible 0
setLayerPreference allM2 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM2 -isVisible 1
setLayerPreference allM4Cont -isVisible 1
setLayerPreference allM4Cont -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
pan -0.035 0.105
pan 0.489 0.675
deselectAll
selectWire 117.8500 167.9500 122.1500 168.0500 3 {genblk1_5__mac_col_inst/key_q[47]}
pan -0.119 -0.238
pan 0.005 0.466
zoomBox 118.11 167.45 119.49 168.55
pan -0.210 -0.071
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM3 -isVisible 0
setLayerPreference allM2 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM2 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM2 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM2 -isVisible 1
setLayerPreference allM1 -isVisible 0
setLayerPreference allM1 -isVisible 1
report_timing -max_paths 5 > ${design}.post_route.timing.rpt
report_power -outfile mac_array.post_route.power.rpt
summaryReport -nohtml -outfile mac_array.post_route.summary.rpt
streamOut mac_array.gds2
write_lef_abstract mac_array.lef
defOut -netlist -routing mac_array.def
saveNetlist mac_array.pnr.v
setAnalysisMode -setup
set_analysis_view -setup WC_VIEW -hold WC_VIEW
do_extract_model -view WC_VIEW -format dotlib ${design}_WC.lib
