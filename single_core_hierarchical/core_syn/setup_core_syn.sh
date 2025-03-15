#!/bin/bash

rm -rf ./verilog/*

cp -r ../../core/behavorial/core/verilog/* ./verilog
cp -r ../../core/behavorial/mac_array/verilog/* ./verilog

rm -f ./verilog/sram_w16.v
rm -r ./verilog/*tb*