module mac_array (clk, reset, in, out, fifo_wr, inst);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+6;
parameter pr = 8;


output [bw_psum*col-1:0] out;
input  [pr*bw-1:0] in;
input  clk, reset;
input  [1:0] inst; // [1]: execute, [0]: load 
output [col-1:0] fifo_wr;

wire   [col*bw_psum-1:0] psum;
wire   [2*(col+1)-1:0] inst_temp;
wire   [2*(col+1)*bw*pr-1:0] q_temp;

genvar i;

assign inst_temp[1:0]    = inst;
assign q_temp[bw*pr-1:0] = in;

(*keep = "true" *) wire [3:0] col_id_var = 4'b0100;


mac_col #(.bw(bw), .bw_psum(bw_psum), .pr(pr)) mac_col_inst_0 (
        .q_in( q_temp[pr*bw*(0+1)-1    :pr*bw*(0)]), 
        .q_out(q_temp[pr*bw*(0+2)-1:pr*bw*(0+1)]), 
        .clk(clk), 
        .reset(reset), 
        .fifo_wr(fifo_wr[0]),
        .i_inst(inst_temp[2*(0+1)-1:2*(0)]),     
        .o_inst(inst_temp[2*(0+2)-1:2*(0+1)]),     
	.out(out[bw_psum*(0+1)-1 : bw_psum*(0)]),
	.col_id(col_id_var)
);
 

mac_col #(.bw(bw), .bw_psum(bw_psum), .pr(pr)) mac_col_inst_1 (
        .q_in( q_temp[pr*bw*(1+1)-1    :pr*bw*(1)]), 
        .q_out(q_temp[pr*bw*(1+2)-1:pr*bw*(1+1)]), 
        .clk(clk), 
        .reset(reset), 
        .fifo_wr(fifo_wr[1]),
        .i_inst(inst_temp[2*(1+1)-1:2*(1)]),     
        .o_inst(inst_temp[2*(1+2)-1:2*(1+1)]),     
	.out(out[bw_psum*(1+1)-1 : bw_psum*(1)]),
	.col_id(col_id_var)
);
 

/*
generate

for (i=0; i<4; i=i+1) begin
	
   //wire [3:0] col_id_var;
   //assign col_id_var = i;

   mac_col #(.bw(bw), .bw_psum(bw_psum), .pr(pr)) mac_col_inst (
        .q_in( q_temp[pr*bw*(i+1)-1    :pr*bw*(i)]), 
        .q_out(q_temp[pr*bw*(i+2)-1:pr*bw*(i+1)]), 
        .clk(clk), 
        .reset(reset), 
        .fifo_wr(fifo_wr[i]),
        .i_inst(inst_temp[2*(i+1)-1:2*(i)]),     
        .o_inst(inst_temp[2*(i+2)-1:2*(i+1)]),     
	.out(out[bw_psum*(i+1)-1 : bw_psum*(i)]),
	.col_id(col_id_var)
   );
   
end 

endgenerate

*/

endmodule
