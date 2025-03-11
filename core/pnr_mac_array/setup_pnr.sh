#!/bin/bash

rm -rf ./netlist/*
cp ../syn_mac_array/mac_array.out.v ./netlist/mac_array.v

rm -rf  ./constraints/*.sdc
cp ../syn_mac_array/mac_array.sdc ./constraints/
