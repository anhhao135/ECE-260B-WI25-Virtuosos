# Floorplan
floorPlan -site core -r 1 0.4 50 50 50 50

timeDesign -preplace -prefix preplace

globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose

# TODO: Set power ring and stripes
addRing -spacing {top 10 bottom 10 left 10 right 10} -width {top 3 bottom 3 left 3 right 3} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS VDD}

setAddStripeMode -break_at {block_ring}
addStripe -number_of_sets 20  -spacing 1 -layer M5 -width 1 -nets { VSS VDD } -direction horizontal

setObjFPlanBox Instance kmem_instance 594.637 665.363 881.037 950.163
setObjFPlanBox Instance qmem_instance 136.37 688.835 422.77 973.635

selectInst psum_mem_instance
uiSetTool move
setDrawView fplan
setObjFPlanBox Instance psum_mem_instance 382.695 231.0565 669.095 515.8565
flipOrRotateObject -flip MX
deselectInst psum_mem_instance


addHaloToBlock {3 3 3 3} qmem_instance
addHaloToBlock {3 3 3 3} kmem_instance
addHaloToBlock {3 3 3 3} psum_mem_instance

addRing -nets {VDD VSS} -type block_rings -around each_block -layer {top M1 bottom M1 left M2 right M2} -width {top 0.5 bottom 0.5 left 0.5 right 0.5} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} 

globalNetConnect VDD -type pgpin -pin VDD -sinst qmem_instance -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst qmem_instance -verbose -override  

globalNetConnect VDD -type pgpin -pin VDD -sinst kmem_instance -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst kmem_instance -verbose -override  

globalNetConnect VDD -type pgpin -pin VDD -sinst psum_mem_instance -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst psum_mem_instance -verbose -override  

sroute
