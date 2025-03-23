#!/bin/bash

rm -rf ./netlist/*
cp ../core_syn/core.out.v ./netlist/core.v

rm -rf  ./constraints/*.sdc
cp ../core_syn/core.sdc ./constraints/