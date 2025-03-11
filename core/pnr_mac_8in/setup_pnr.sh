#!/bin/bash

rm -rf ./netlist/*
cp ../syn_mac_8in/mac_8in.out.v ./netlist/mac_8in.v

rm -rf  ./constraints/*.sdc
cp ../syn_mac_8in/mac_8in.sdc ./constraints/
