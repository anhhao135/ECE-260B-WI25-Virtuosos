module mac_array (clk, reset, in, out, fifo_wr, inst, col_ids, cnt_q_out);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+6;
parameter pr = 8;

output [bw_psum*col-1:0] out;
input  [pr*bw-1:0] in;
input  clk, reset;
input  [1:0] inst; // [1]: execute, [0]: load 
output [col-1:0] fifo_wr;
input [23:0] col_ids;
output [7:0] cnt_q_out;

wire   [col*bw_psum-1:0] psum;
wire   [2*(col+1)-1:0] inst_temp;
wire   [2*(col+1)*bw*pr-1:0] q_temp;
reg [7:0] cnt_q = 0;

genvar i;

assign inst_temp[1:0]    = inst;
assign q_temp[bw*pr-1:0] = in;
assign cnt_q_out = cnt_q;



for (i=0; i<col ; i=i+1) begin
	
   mac_col #(.bw(bw), .bw_psum(bw_psum), .pr(pr)) mac_col_inst (
        .q_in( q_temp[pr*bw*(i+1)-1    :pr*bw*(i)]), 
        .q_out(q_temp[pr*bw*(i+2)-1:pr*bw*(i+1)]), 
        .clk(clk), 
        .reset(reset), 
        .fifo_wr(fifo_wr[i]),
        .i_inst(inst_temp[2*(i+1)-1:2*(i)]),     
        .o_inst(inst_temp[2*(i+2)-1:2*(i+1)]),     
	.out(out[bw_psum*(i+1)-1 : bw_psum*(i)]),
	.col_id(col_ids[i*3+2:i*3]),
	.cnt_q(cnt_q)
   );
   
end 

always @ (negedge clk) begin
	if (reset)
		cnt_q = 0;
	else begin
		if (inst[0]) begin
			cnt_q = cnt_q + 1;
		end
	end
end

endmodule
