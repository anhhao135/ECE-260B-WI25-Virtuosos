#!/bin/bash

rm -rf ./netlist/*
cp ../syn_sram_w16/sram_w16.out.v ./netlist/sram_w16.v

rm -rf  ./constraints/*.sdc
cp ../syn_sram_w16/sram_w16.sdc ./constraints/
