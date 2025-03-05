`timescale 1ns/1ps

module mac_8in_tb;

reg [63:0] a = 0;
reg [63:0] b = 0;
wire [31:0] out;

mac_8in #(.bw(8), .bw_psum(32), .pr(8)) mac_8in_instance (
      .a(a),
      .b(b), 
      .out(out)
);


initial begin 
    a = {8'd1, 8'd2, 8'd3, 8'd4, 8'd5, 8'd6, 8'd7, 8'd8};
    b = {8'd1, 8'd2, 8'd3, 8'd4, 8'd5, 8'd6, 8'd7, 8'd8};
    #1;
    $display("Out result: %32d", out);
    #1 $finish;
end

endmodule




