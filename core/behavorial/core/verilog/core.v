module core (clk, sum_out, mem_in, out, inst, reset);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 8;

output [bw_psum+3:0] sum_out;
output [bw_psum*col-1:0] out;
wire   [bw_psum*col-1:0] pmem_out;
input  [pr*bw-1:0] mem_in;
input  clk;
input  [19:0] inst; 
input  reset;

wire  [pr*bw-1:0] mac_in;
wire  [pr*bw-1:0] kmem_out;
wire  [pr*bw-1:0] qmem_out;
wire  [bw_psum*col-1:0] pmem_in;
wire  [bw_psum*col-1:0] fifo_out;
wire  [bw_psum*col-1:0] sfp_out;
wire  [bw_psum*col-1:0] sfp_fifo_out;
wire  [bw_psum*col-1:0] array_out;
wire  [col-1:0] fifo_wr;
wire  ofifo_rd;
wire [3:0] qkmem_add;
wire [3:0] pmem_add;
wire div_complete;

wire  qmem_rd;
wire  qmem_wr; 
wire  kmem_rd;
wire  kmem_wr; 
wire  pmem_rd;
wire  pmem_wr; 
wire sfp_valid;
reg  sfp_valid_d;
wire sfp_fifo_rd;
wire sfp_fifo_valid;

assign sfp_fifo_rd=inst[19];
assign norm_valid=inst[18];
assign norm_start =inst[17];
assign ofifo_rd = inst[16];
assign qkmem_add = inst[15:12];
assign pmem_add = inst[11:8];
assign qmem_rd = inst[5];
assign qmem_wr = inst[4];
assign kmem_rd = inst[3];
assign kmem_wr = inst[2];
assign pmem_rd = inst[1];
assign pmem_wr = inst[0];

assign mac_in  = inst[6] ? kmem_out : qmem_out;
assign pmem_in = norm_start?sfp_fifo_out:fifo_out;
assign out = pmem_out;
assign sfp_fifo_valid=sfp_valid && ~sfp_valid_d;

mac_array #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) mac_array_instance (
        .in(mac_in), 
        .clk(clk), 
        .reset(reset), 
        .inst(inst[7:6]),     
        .fifo_wr(fifo_wr),     
	.out(array_out)
);

ofifo #(.bw(bw_psum), .col(col))  ofifo_inst (
        .reset(reset),
        .clk(clk),
        .in(array_out),
        .wr(fifo_wr),
        .rd(ofifo_rd),
        .o_valid(fifo_valid),
        .out(fifo_out)
);

fifo_depth16 #(.bw(bw_psum*col)) fifo_sfp (.rd_clk(clk),
       				           .wr_clk(clk),
					   .in(sfp_out),
					   .out(sfp_fifo_out),
					   .rd(sfp_fifo_rd),
					   .wr(sfp_fifo_valid),
					   .reset(reset)
				   );




sram_w16 #(.sram_bit(pr*bw)) qmem_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(qmem_out),
        .CEN(!(qmem_rd||qmem_wr)),
        .WEN(!qmem_wr), 
        .A(qkmem_add)
);



sram_w16 #(.sram_bit(pr*bw)) kmem_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(kmem_out),
        .CEN(!(kmem_rd||kmem_wr)),
        .WEN(!kmem_wr), 
        .A(qkmem_add)
);



sram_w16 #(.sram_bit(col*bw_psum)) psum_mem_instance (
        .CLK(clk),
        .D(pmem_in),
        .Q(pmem_out),
        .CEN(!(pmem_rd||pmem_wr)),
        .WEN(!pmem_wr), 
        .A(pmem_add)
);
norm norm_inst (
	.clk(clk),
	.reset(reset),
	.in(pmem_out),
	.out(sfp_out),
	.out_valid(sfp_valid),
	.valid(norm_valid),
	.div_complete(div_complete)
);



  //////////// For printing purpose ////////////
  always @(posedge clk) begin
      sfp_valid_d<=sfp_valid;
      if(pmem_wr)
         $display("Memory write to PSUM mem add %x %x ", pmem_add, pmem_in); 
  end



endmodule
