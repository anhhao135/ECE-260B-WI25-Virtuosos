#!/bin/bash

rm -rf ./netlist/*
cp ../dual_core_syn/dual_core.out.v ./netlist/dual_core.v

rm -rf  ./constraints/*.sdc
cp ../dual_core_syn/dual_core.sdc ./constraints/