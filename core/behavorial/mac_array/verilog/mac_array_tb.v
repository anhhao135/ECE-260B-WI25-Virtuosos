`timescale 1ns/1ps

module mac_array_tb;

reg clk = 0;
reg reset = 1;
reg [63:0] q_in = 0;
reg [1:0] i_inst = 0;

parameter total_K = 8;
parameter total_Q = 1;

integer qk_file;
integer qk_scan_file;
integer  K[total_K-1:0][7:0];
integer  Q[total_Q-1:0][7:0];
integer  pred_result[total_K-1:0][total_Q-1:0];

integer  captured_data;
`define NULL 0

integer i,j,k,t,p,q,s,u,m;

wire [22*8-1:0] out;
wire [7:0] fifo_wr;


mac_array #(.col(8), .bw(8), .bw_psum(22), .pr(8)) DUT (
      .clk(clk),
      .reset(reset),
      .in(q_in),
      .out(out),
      .fifo_wr(fifo_wr),
      .inst(i_inst)
);

initial begin 
      $dumpfile("mac_array_tb.vcd");
      $dumpvars(0, mac_array_tb);


      ///// Q data txt reading /////

      $display("##### Q data txt reading #####");


      qk_file = $fopen("qdata.txt", "r");

      for (q=0; q<total_Q; q=q+1) begin
            $display("Q vector: %d\n", q);
            for (j=0; j<8; j=j+1) begin
                  qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
                  Q[q][j] = captured_data;
                  $display("Data: %d\n", captured_data);
            end
      end
      /////////////////////////////////


      ///// K data txt reading /////

      $display("##### K data txt reading #####");


      qk_file = $fopen("kdata.txt", "r");

      for (q=0; q<total_K; q=q+1) begin
            $display("K vector: %d\n", q);
            for (j=0; j<8; j=j+1) begin
                  qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
                  K[q][j] = captured_data;
                  $display("Data: %d\n", captured_data);
            end
      end
      /////////////////////////////////


      ///// Predicted results calculation /////

      $display("##### K data txt reading #####");


      for (k=0; k<total_K; k=k+1) begin
            $display("K#: %d", k);
            for (q=0; q<total_Q; q=q+1) begin
                  $display("Q#: %d", q);
                  pred_result[k][q] = 0;
                  for (i=0; i<8; i=i+1) begin
                        pred_result[k][q] = pred_result[k][q] + Q[q][i]*K[k][i];
                  end
                  $display("Predicted psum: %d", pred_result[k][q]);
            end
      end
      /////////////////////////////////


      #1 clk = 1;
      #1 clk = 0; reset = 0;
      #1 clk = 1;
      #1 clk = 0; i_inst = 2'b01;
      #1 clk = 1;
      for (q=0; q<total_K; q=q+1) begin
            #1 clk = 0; q_in = {K[q][7][7:0], K[q][6][7:0], K[q][5][7:0], K[q][4][7:0], K[q][3][7:0], K[q][2][7:0], K[q][1][7:0], K[q][0][7:0]};
            if (q + 1 == total_K)
                  i_inst = 2'b00;
            #1 clk = 1;
      end

      for (i = 0; i < total_K + total_Q + 5; i = i + 1) begin
            #1 clk = 0;
            #1 clk = 1;
      end

      #1 clk = 0; i_inst = 2'b10;
      #1 clk = 1;

      for (q=0; q<total_Q; q=q+1) begin
            #1 clk = 0; q_in = {Q[q][7][7:0], Q[q][6][7:0], Q[q][5][7:0], Q[q][4][7:0], Q[q][3][7:0], Q[q][2][7:0], Q[q][1][7:0], Q[q][0][7:0]};
            if (q + 1 == total_K)
                  i_inst = 2'b00;
            #1 clk = 1;
      end

      for (i = 0; i < total_K + total_Q + 5; i = i + 1) begin
            #1 clk = 0;
            #1 clk = 1;
      end

      #1 $display("Finished.");
      #1 $finish;
end

endmodule




