#!/bin/bash

rm -rf ./verilog/*

cp -r ../../dual_core/behavorial/core/verilog/* ./verilog
cp -r ../../dual_core/behavorial/mac_array/verilog/* ./verilog

rm -f ./verilog/sram_w16.v
rm -r ./verilog/*tb*