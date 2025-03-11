#!/bin/bash

rm -rf ./netlist/*
cp ../syn_ofifo/ofifo.out.v ./netlist/ofifo.v

rm -rf  ./constraints/*.sdc
cp ../syn_ofifo/ofifo.sdc ./constraints/
