module mac_col (clk, reset, out, q_in, q_out, i_inst, fifo_wr, o_inst);

parameter col_id = 0;

output [18:0] out;
input [63:0] q_in;
output [63:0] q_out;

input clk;
input reset;

input [1:0] i_inst; // [1]: execute, [0]: load 
output [1:0] o_inst; // [1]: execute, [0]: load 
output fifo_wr;
reg load_ready_q;
reg [3:0] cnt_q;
reg [1:0] inst_q;
reg [1:0] inst_2q;
reg [63:0] query_q;
reg [63:0] key_q;
wire [18:0] psum;

assign o_inst = inst_q;
assign fifo_wr = inst_2q[1];
assign q_out = query_q;
assign out = psum;

mac_8in mac_8in_instance (.a(query_q), .b(key_q), .out(psum));


always @ (posedge clk) begin

  if (reset) begin
    cnt_q <= 0;
    load_ready_q <= 1;
    inst_q <= 0;
    inst_2q <= 0;
  end

  else begin
    inst_q <= i_inst;
    inst_2q <= inst_q;

    if (inst_q[0]) begin //load
      query_q <= q_in;

      if (cnt_q == col_id)begin //if number of Q's that have passed through here equals column ID, then the current Q should be loaded as K
        cnt_q <= 0;
        key_q <= q_in;
        load_ready_q <= 0;
      end

      else if (load_ready_q)
        cnt_q <= cnt_q + 1;

    end

    else if(inst_q[1]) begin //execute
      query_q <= q_in;
    end

  end

end

endmodule
