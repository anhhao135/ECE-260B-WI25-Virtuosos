module mac_8in (out, a, b, clk, reset);

parameter bw = 8;
parameter bw_psum = 2*bw+6;
parameter pr = 8;

output reg signed [bw_psum-1:0] out;
input  [pr*bw-1:0] a;
input  [pr*bw-1:0] b;
input clk;
input reset;


reg signed		[2*bw-1:0]	product0	;
reg signed		[2*bw-1:0]	product1	;
reg signed		[2*bw-1:0]	product2	;
reg signed		[2*bw-1:0]	product3	;
reg signed		[2*bw-1:0]	product4	;
reg signed		[2*bw-1:0]	product5	;
reg signed		[2*bw-1:0]	product6	;
reg signed		[2*bw-1:0]	product7	;

reg signed [bw_psum-1:0] psum_0_0;
reg signed [bw_psum-1:0] psum_0_1;
reg signed [bw_psum-1:0] psum_0_2;
reg signed [bw_psum-1:0] psum_0_3;

reg signed [bw_psum-1:0] psum_1_0;
reg signed [bw_psum-1:0] psum_1_1;


always @ (posedge clk) begin
	if (reset) begin
		out <= 0;
		product0 <= 0;
		product1 <= 0;
		product2 <= 0;
		product3 <= 0;
		product4 <= 0;
		product5 <= 0;
		product6 <= 0;
		product7 <= 0;
		psum_0_0 <= 0;
		psum_0_1 <= 0;
		psum_0_2 <= 0;
		psum_0_3 <= 0;
		psum_1_0 <= 0;
		psum_1_1 <= 0;
	end
	else begin
		product0	<=	{{(bw){a[bw*	1	-1]}},	a[bw*	1	-1:bw*	0	]}	*	{{(bw){b[bw*	1	-1]}},	b[bw*	1	-1:	bw*	0	]};
		product1	<=	{{(bw){a[bw*	2	-1]}},	a[bw*	2	-1:bw*	1	]}	*	{{(bw){b[bw*	2	-1]}},	b[bw*	2	-1:	bw*	1	]};
		product2	<=	{{(bw){a[bw*	3	-1]}},	a[bw*	3	-1:bw*	2	]}	*	{{(bw){b[bw*	3	-1]}},	b[bw*	3	-1:	bw*	2	]};
		product3	<=	{{(bw){a[bw*	4	-1]}},	a[bw*	4	-1:bw*	3	]}	*	{{(bw){b[bw*	4	-1]}},	b[bw*	4	-1:	bw*	3	]};
		product4	<=	{{(bw){a[bw*	5	-1]}},	a[bw*	5	-1:bw*	4	]}	*	{{(bw){b[bw*	5	-1]}},	b[bw*	5	-1:	bw*	4	]};
		product5	<=	{{(bw){a[bw*	6	-1]}},	a[bw*	6	-1:bw*	5	]}	*	{{(bw){b[bw*	6	-1]}},	b[bw*	6	-1:	bw*	5	]};
		product6	<=	{{(bw){a[bw*	7	-1]}},	a[bw*	7	-1:bw*	6	]}	*	{{(bw){b[bw*	7	-1]}},	b[bw*	7	-1:	bw*	6	]};
		product7	<=	{{(bw){a[bw*	8	-1]}},	a[bw*	8	-1:bw*	7	]}	*	{{(bw){b[bw*	8	-1]}},	b[bw*	8	-1:	bw*	7	]};

		psum_0_0 <= product0 + product1;
		psum_0_1 <= product2 + product3;
		psum_0_2 <= product4 + product5;
		psum_0_3 <= product6 + product7;

		psum_1_0 <= psum_0_0 + psum_0_1;
		psum_1_1 <= psum_0_2 + psum_0_3;

		out <= psum_1_0 + psum_1_1;
		//out <= product0 + product1 + product2 + product3 + product4 + product5 + product6 + product7;

	end
end








endmodule
