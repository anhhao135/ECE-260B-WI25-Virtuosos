#!/bin/bash

rm -rf ./netlist/*
cp ../syn_mac_col/mac_col.out.v ./netlist/mac_col.v

rm -rf  ./constraints/*.sdc
cp ../syn_mac_col/mac_col.sdc ./constraints/
