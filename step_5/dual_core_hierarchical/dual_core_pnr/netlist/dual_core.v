/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06-SP2
// Date      : Sat Mar 22 20:15:27 2025
/////////////////////////////////////////////////////////////


module dual_core ( clk, mem_in_core1, mem_in_core2, out_core1, out_core2, 
        inst_core1, inst_core2, reset );
  input [63:0] mem_in_core1;
  input [63:0] mem_in_core2;
  output [159:0] out_core1;
  output [159:0] out_core2;
  input [20:0] inst_core1;
  input [20:0] inst_core2;
  input clk, reset;
  wire   sum_out_valid_core2_d, sum_out_valid_core1_d;
  tri   clk;
  tri   [63:0] mem_in_core1;
  tri   [63:0] mem_in_core2;
  tri   [159:0] out_core1;
  tri   [159:0] out_core2;
  tri   [20:0] inst_core1;
  tri   [20:0] inst_core2;
  tri   reset;
  tri   [23:0] sum_in_core1;
  tri   [23:0] sum_in_core2;
  tri   sum_out_valid_core1;
  tri   sum_out_valid_core2;
  tri   sum_in_valid_core1;
  tri   sum_in_valid_core2;

  core core1 ( .reset(reset), .clk(clk), .mem_in(mem_in_core1), .inst(
        inst_core1), .sum_in(sum_in_core1), .sum_in_valid(sum_in_valid_core1), 
        .sum_out_valid(sum_out_valid_core1), .sum_out(sum_in_core2), .out(
        out_core1) );
  core core2 ( .reset(reset), .clk(clk), .mem_in(mem_in_core2), .inst(
        inst_core2), .sum_in(sum_in_core2), .sum_in_valid(sum_in_valid_core2), 
        .sum_out_valid(sum_out_valid_core2), .sum_out(sum_in_core1), .out(
        out_core2) );
  DFQD1 sum_in_valid_core2_reg ( .D(sum_out_valid_core1_d), .CP(clk), .Q(
        sum_in_valid_core2) );
  DFQD1 sum_out_valid_core2_d_reg ( .D(sum_out_valid_core2), .CP(clk), .Q(
        sum_out_valid_core2_d) );
  DFQD1 sum_out_valid_core1_d_reg ( .D(sum_out_valid_core1), .CP(clk), .Q(
        sum_out_valid_core1_d) );
  DFQD1 sum_in_valid_core1_reg ( .D(sum_out_valid_core2_d), .CP(clk), .Q(
        sum_in_valid_core1) );
endmodule

