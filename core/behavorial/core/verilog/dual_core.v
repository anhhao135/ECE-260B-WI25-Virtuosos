module dual_core (clk,mem_in_core1,mem_in_core2, out_core1,out_core2, inst_core1,inst_core_2, reset);
parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 8;
output [bw_psum*col-1:0] out_core1;
output [bw_psum*col-1:0] out_core2;
wire   [bw_psum*col-1:0] pmem_out;
input  [pr*bw-1:0] mem_in_core1;
input  [pr*bw-1:0] mem_in_core2;
input  clk;
input  [19:0] inst_core1;
input  [19:0] inst_core2;
input  reset;
reg [bw_psum+3:0] sum_out_core1;
reg [bw_psum+3:0] sum_out_core2;

reg [bw_psum+3:0] sum_in_core1;
reg [bw_psum+3:0] sum_in_core2;
assign exchange_sum=inst_core1[20] && inst_core2[20];
always @(posedge clk)
begin
	if (reset)
	begin
		sum_in_core1<=0;
		sum_in_core2<=0;
	end
	else
	begin
		if (exchange_sum)
		begin
			sum_in_core1<=sum_out_core2;
			sum_in_core2<=sum_out_core1;
		end
		else
		begin
			sum_in_core1<=sum_out_core2;
			sum_in_core2<=sum_out_core1;
		end
	end	
end

core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) core1 (
      .reset(reset),
      .clk(clk), 
      .mem_in(mem_in_core1), 
      .inst(inst_core1),
      .sum_in(sum_in_core1),
      .sum_out(sum_out_core1),
      .out(out_core1)
);

core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) core2 (
      .reset(reset),
      .clk(clk), 
      .mem_in(mem_in_core2),
      .inst(inst_core2),
      .sum_in(sum_in_core2),
      .sum_out(sum_out_core2),
      .out(out_core2)
);
endmodule
