module mac_8in (out, a, b);

//Vector A, 8 elements, each element is 8-bit
//Vector B, 8 elements, each element is 8-bit
//Out, scalar, 19-bit (maximum sum out is 255*255*8 = 520200 which is 19-bits)

output [18:0] out;
input [63:0] a; //{a7,a6,a5,a4,a3,a2,a1,a0}
input [63:0] b; //{b7,b6,b5,b4,b3,b2,b1,b0}

wire [15:0] a0b0;
wire [15:0] a1b1;
wire [15:0] a2b2;
wire [15:0] a3b3;
wire [15:0] a4b4;
wire [15:0] a5b5;
wire [15:0] a6b6;
wire [15:0] a7b7;

assign a0b0 = a[7:0] * b[7:0];
assign a1b1 = a[15:8] * b[15:8];
assign a2b2 = a[23:16] * b[23:16];
assign a3b3 = a[31:24] * b[31:24];
assign a4b4 = a[39:32] * b[39:32];
assign a5b5 = a[47:40] * b[47:40];
assign a6b6 = a[55:48] * b[55:48];
assign a7b7 = a[63:56] * b[63:56];

assign out = a0b0 + a1b1 + a2b2 + a3b3 + a4b4 + a5b5 + a6b6 + a7b7;

endmodule
