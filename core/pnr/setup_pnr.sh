#!/bin/bash

rm -rf ./netlist/*
cp ../syn/core.out.v ./netlist/core.v

rm -rf  ./constraints/*.sdc
cp ../syn/core.sdc ./constraints/