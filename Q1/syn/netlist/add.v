// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module add (clk, out, x, y, z);

parameter bw = 4;
parameter psum_bw = 4+2;

output reg [psum_bw-1:0] out;
input [bw-1:0] x;
input [bw-1:0] y;
input [bw-1:0] z;

reg [bw-1:0] x_q;
reg [bw-1:0] y_q;
reg [bw-1:0] z_q;

input clk;

wire s0, c0, s1, c1, s2, c2, s3, c3, s5, c5, s6, c6, s7, c7, s8, c8;

wire [psum_bw-1:0] out_wire;

csa3_2  csa3_2_instance0 (.x(x_q[0]), .y(y_q[0]), .z(z_q[0]), .s(s0), .c(c0));
csa3_2  csa3_2_instance1 (.x(x_q[1]), .y(y_q[1]), .z(z_q[1]), .s(s1), .c(c1));
csa3_2  csa3_2_instance2 (.x(x_q[2]), .y(y_q[2]), .z(z_q[2]), .s(s2), .c(c2));
csa3_2  csa3_2_instance3 (.x(x_q[3]), .y(y_q[3]), .z(z_q[3]), .s(s3), .c(c3));

csa2_2  csa2_2_instance4 (.x(c0), .y(s1), .s(s5), .c(c5));

csa3_2  csa3_2_instance5 (.x(c1), .y(s2), .z(c5), .s(s6), .c(c6));

csa3_2  csa3_2_instance6 (.x(c2), .y(s3), .z(c6), .s(s7), .c(c7));

csa2_2  csa2_2_instance7 (.x(c3), .y(c7), .s(s8), .c(c8));

assign out_wire[0] = s0;
assign out_wire[1] = s5;
assign out_wire[2] = s6;
assign out_wire[3] = s7;
assign out_wire[4] = s8;
assign out_wire[5] = c8;

always @ (posedge clk) begin
        out  <= out_wire;
	x_q <= x;
	x_q <= x;
	y_q <= y;
	z_q <= z;
end

endmodule
