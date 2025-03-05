`timescale 1ns/1ps

module mac_col_tb;

reg clk = 0;
reg reset = 1;
reg [63:0] q_in = 0;
reg [1:0] i_inst = 0;

integer i = 0;

wire [31:0] out_0;
wire [63:0] q_out_0;
wire [1:0] o_inst_0;
wire fifo_wr_0;

wire [31:0] out_1;
wire [63:0] q_out_1;
wire [1:0] o_inst_1;
wire fifo_wr_1;

wire [31:0] out_2;
wire [63:0] q_out_2;
wire [1:0] o_inst_2;
wire fifo_wr_2;


mac_col #(.bw(8), .bw_psum(32), .pr(8), .col_id(0)) mac_col_instance_0 (
      .clk(clk),
      .reset(reset),
      .out(out_0),
      .q_in(q_in),
      .q_out(q_out_0),
      .i_inst(i_inst),
      .o_inst(o_inst_0),
      .fifo_wr(fifo_wr_0)
);

mac_col #(.bw(8), .bw_psum(32), .pr(8), .col_id(1)) mac_col_instance_1 (
      .clk(clk),
      .reset(reset),
      .out(out_1),
      .q_in(q_out_0),
      .q_out(q_out_1),
      .i_inst(o_inst_0),
      .o_inst(o_inst_1),
      .fifo_wr(fifo_wr_1)
);

mac_col #(.bw(8), .bw_psum(32), .pr(8), .col_id(2)) mac_col_instance_2 (
      .clk(clk),
      .reset(reset),
      .out(out_2),
      .q_in(q_out_1),
      .q_out(q_out_2),
      .i_inst(o_inst_1),
      .o_inst(o_inst_2),
      .fifo_wr(fifo_wr_2)
);


initial begin 
      $dumpfile("mac_col_tb.vcd");
      $dumpvars(0, mac_col_tb);
      #1 clk = 1;
      #1 clk = 0; reset = 0;
      #1 clk = 1;
      #1 clk = 0; i_inst = 2'b01;
      #1 clk = 1;
      #1 clk = 0; q_in = {8'd1, 8'd2, 8'd3, 8'd4, 8'd5, 8'd6, 8'd7, 8'd8};
      #1 clk = 1;
      #1 clk = 0; q_in = {8'd1, 8'd3, 8'd5, 8'd7, 8'd9, 8'd11, 8'd13, 8'd15};
      #1 clk = 1;
      #1 clk = 0; q_in = {8'd2, 8'd4, 8'd6, 8'd8, 8'd10, 8'd12, 8'd14, 8'd16}; i_inst = 2'b00;

      for (i = 0; i < 10; i = i + 1) begin
            #1 clk = 1;
            #1 clk = 0;
            #1 clk = 1;
            #1 clk = 0;
      end

      #1 $display("Finished.");
      #1 $finish;
end

endmodule




