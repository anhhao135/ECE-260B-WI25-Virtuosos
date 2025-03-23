#!/bin/bash

rm -rf ./netlist/*
cp ../sram_syn/sram_w16.out.v ./netlist/sram_w16.v

rm -rf  ./constraints/*.sdc
cp ../sram_syn/sram_w16.sdc ./constraints/