# Floorplan
floorPlan -site core -r 1 0.4 20 20 20 20

timeDesign -preplace -prefix preplace

globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose

# TODO: Set stripes

setAddStripeMode -break_at {block_ring}

addStripe -nets {VDD VSS} -layer M4 -direction vertical -width 2 -spacing 6 -number_of_sets 10

sroute
