#!/bin/bash

rm -rf ./verilog/*
cp -r ../behavorial/mac_array/verilog/* ./verilog
cp -r ../behavorial/core/verilog/* ./verilog
rm -r ./verilog/*tb*