# Floorplan
floorPlan -site core -r 1 0.4 50 50 50 50

timeDesign -preplace -prefix preplace

globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose

addRing -spacing {top 10 bottom 10 left 10 right 10} -width {top 3 bottom 3 left 3 right 3} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS VDD}

setAddStripeMode -break_at {block_ring}
addStripe -nets {VDD VSS} -layer M8 -direction vertical -width 2 -spacing 6 -number_of_sets 20

setObjFPlanBox Instance core1 258.8355 92.877 1369.4355 1202.677
setObjFPlanBox Instance core2 1307.5735 1381.5115 2418.1735 2491.3115

addHaloToBlock {3 3 3 3} -allBlock
setInstancePlacementStatus -status fixed -name {core1 core2}

addRing -nets {VDD VSS} -type block_rings -around each_block -layer {top M1 bottom M1 left M2 right M2} -width {top 0.5 bottom 0.5 left 0.5 right 0.5} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} 

globalNetConnect VDD -type pgpin -pin VDD -sinst core1 -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst core1 -verbose -override  

globalNetConnect VDD -type pgpin -pin VDD -sinst core2 -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst core2 -verbose -override    

sroute