// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module norm (clk, in,sum_in,sum_out,sum_in_valid,sum_out_valid, out,out_valid,valid, reset, div_complete);

  parameter bw = 8;
  parameter bw_psum = 2*bw+4;
  parameter col=8;
  parameter width = 1;

  input  clk;
  input  valid;
  input  reset;
  input  [bw_psum*col-1:0] in;
  input  signed [bw_psum+3:0] sum_in;
  input sum_in_valid;
  output reg signed [bw_psum+3:0] sum_out;  
  output reg [bw_psum*col-1:0] out;
  output reg sum_out_valid;
  output reg div_complete;
  output out_valid;
  reg signed [2*bw_psum-1:0] div_out;
  reg signed [bw_psum+3:0] sum;  
  reg signed [bw_psum+3:0] sum_q;
  reg signed [bw_psum-1:0] psum_out;
  reg div_state;
  reg div_complete_d;
  //reg div_complete;
  reg valid_d;
  reg sum_flag;
  reg [2:0] cnt;
  reg [2:0] cnt_d;
  reg [2:0] cnt_dd;
  reg [2:0] cnt_ddd;
  reg clk_div;
  reg clk_div_d;
  reg sum_complete;
  reg signed [bw_psum-2:0] input_abs;
  reg input_sgn;
  reg signed [bw_psum-1:0] psum_mem [col-1:0];
  wire signed [bw_psum-2:0] psum_mem_abs [col-1:0];  
  reg signed [bw_psum-1:0] psum_mem_out [col-1:0];
  assign out_valid=(cnt_ddd==3'b111);
  assign psum_mem_abs[0]=psum_mem[0][bw_psum-1]?(~psum_mem[0][bw_psum-2:0]+1):psum_mem[0][bw_psum-2:0];
  assign psum_mem_abs[1]=psum_mem[1][bw_psum-1]?(~psum_mem[1][bw_psum-2:0]+1):psum_mem[1][bw_psum-2:0];
  assign psum_mem_abs[2]=psum_mem[2][bw_psum-1]?(~psum_mem[2][bw_psum-2:0]+1):psum_mem[2][bw_psum-2:0];
  assign psum_mem_abs[3]=psum_mem[3][bw_psum-1]?(~psum_mem[3][bw_psum-2:0]+1):psum_mem[3][bw_psum-2:0];
  assign psum_mem_abs[4]=psum_mem[4][bw_psum-1]?(~psum_mem[4][bw_psum-2:0]+1):psum_mem[4][bw_psum-2:0];
  assign psum_mem_abs[5]=psum_mem[5][bw_psum-1]?(~psum_mem[5][bw_psum-2:0]+1):psum_mem[5][bw_psum-2:0];
  assign psum_mem_abs[6]=psum_mem[6][bw_psum-1]?(~psum_mem[6][bw_psum-2:0]+1):psum_mem[6][bw_psum-2:0];
  assign psum_mem_abs[7]=psum_mem[7][bw_psum-1]?(~psum_mem[7][bw_psum-2:0]+1):psum_mem[7][bw_psum-2:0];
  
  always @(*)
  begin
        sum_q = psum_mem_abs[7]+psum_mem_abs[6]+psum_mem_abs[5]+psum_mem_abs[4]+psum_mem_abs[3]+psum_mem_abs[2]+psum_mem_abs[1]+psum_mem_abs[0];
	sum_out=sum_q[bw_psum+3]?(~sum_q[bw_psum+3:0]+1):sum_q[bw_psum+3:0];
	//sum=sum_out+sum_in;
	input_abs=psum_mem[cnt][bw_psum-1]?(~psum_mem[cnt][bw_psum-2:0]+1):psum_mem[cnt][bw_psum-2:0];
	input_sgn=psum_mem[cnt][bw_psum-1];
  end
  always @ (posedge clk) begin
   if (reset) begin
      //sum_q <= 0;
      out<=0;
      cnt<=0;
      div_state<=0;
      div_complete<=1;
      clk_div<=0;
      out<=0;
      sum_out_valid<=0;
      sum_flag<=0;
   end
   else
   begin
	 valid_d<=valid;
	//clk_div<=clk_div+1;
	clk_div_d<=clk_div;
	cnt_d<=cnt;
	cnt_dd<=cnt_d;
	cnt_ddd<=cnt_dd;
	div_complete_d<=div_complete;
	if (sum_in_valid)
	begin
		sum<=sum_out+sum_in;
		sum_flag<=1;
	end
	psum_mem_out[cnt_d]<=div_out[bw_psum-1:0];
	 if (valid && ~valid_d) begin
	div_state<=1;
	//o_ready<=0;
	div_complete<=0;
	clk_div<=0;
	cnt<=0;
        psum_mem[7] <= in[bw_psum*8-1:bw_psum*7];
	psum_mem[6]<= in[bw_psum*7-1:bw_psum*6];
	psum_mem[5]<= in[bw_psum*6-1:bw_psum*5];
	psum_mem[4]<= in[bw_psum*5-1:bw_psum*4];
	psum_mem[3]<= in[bw_psum*4-1:bw_psum*3];
	psum_mem[2]<= in[bw_psum*3-1:bw_psum*2];
	psum_mem[1]<= in[bw_psum*2-1:bw_psum];
	psum_mem[0]<= in[bw_psum-1:0];
	sum_out_valid<=1;
	end
      else if (div_state && ~div_complete_d && sum_flag)
      begin
	clk_div<=clk_div+1;
        div_out <= input_sgn?~({input_abs, 8'b00000000}/sum)+1:({input_abs, 8'b00000000}/sum);
	sum_out_valid<=0;
	if (clk_div && ~clk_div_d)
	begin
		cnt<=cnt+1;
		//psum_out<=div_out[bw_psum-1:0];
	end
	if (cnt==7)
	begin
		div_complete<=1;
		div_state<=0;
		sum_flag<=0;
	end
  end
  else if (~div_state && div_complete_d)
	out<={psum_mem_out[7],psum_mem_out[6],psum_mem_out[5],psum_mem_out[4],psum_mem_out[3],psum_mem_out[2],psum_mem_out[1],psum_mem_out[0]};
  end
  end
endmodule
