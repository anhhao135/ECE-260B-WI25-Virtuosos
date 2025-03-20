`timescale 1ns/1ps

module core_tb;

parameter total_cycle = 8;   // how many streamed Q vectors will be processed
parameter bw = 8;            // Q & K vector bit precision
parameter bw_psum = 2*bw+4;  // partial sum bit precision
parameter pr = 8;           // how many products added in each dot product 
parameter col = 8;           // how many dot product units are equipped

integer qk_file_core1; // file handler
integer qk_scan_file_core1; // file handler
integer qk_file_core2; // file handler
integer qk_scan_file_core2; // file handler


integer  captured_data;
integer  weight [col*pr-1:0];
`define NULL 0




integer  K_core1[col-1:0][pr-1:0];
integer  Q_core1[total_cycle-1:0][pr-1:0];
integer  result_core1[total_cycle-1:0][col-1:0];
integer  sum_core1[total_cycle-1:0];
integer norm_result_core1[total_cycle-1:0][col-1:0];
reg [bw_psum*pr-1:0] predicted_results_pmem_core1 [7:0];

integer  K_core2[col-1:0][pr-1:0];
integer  Q_core2[total_cycle-1:0][pr-1:0];
integer  result_core2[total_cycle-1:0][col-1:0];
integer  sum_core2[total_cycle-1:0];
integer norm_result_core2[total_cycle-1:0][col-1:0];
reg [bw_psum*pr-1:0] predicted_results_pmem_core2 [7:0];


integer i,j,k,t,p,q,s,u,m,st,kl;


reg reset = 1;
reg clk = 0;
reg [pr*bw-1:0] mem_in_core1; 
reg [pr*bw-1:0] mem_in_core2; 
reg ofifo_rd = 0;
wire [20:0] inst; 
wire [bw_psum*col-1:0] out_core1;
wire [bw_psum*col-1:0] out_core2;

reg sfp_rd;
reg qmem_rd = 0;
reg qmem_wr = 0; 
reg kmem_rd = 0; 
reg kmem_wr = 0;
reg pmem_rd = 0; 
reg pmem_wr = 0; 
reg execute = 0;
reg load = 0;
reg norm_valid;
reg norm_start;
reg [3:0] qkmem_add = 0;
reg [3:0] pmem_add = 0;
reg exchange_sum=0;

assign inst[20]=exchange_sum;
assign inst[19]=sfp_rd;
assign inst[18]=norm_valid;
assign inst[17]=norm_start;
assign inst[16] = ofifo_rd;
assign inst[15:12] = qkmem_add;
assign inst[11:8]  = pmem_add;
assign inst[7] = execute;
assign inst[6] = load;
assign inst[5] = qmem_rd;
assign inst[4] = qmem_wr;
assign inst[3] = kmem_rd;
assign inst[2] = kmem_wr;
assign inst[1] = pmem_rd;
assign inst[0] = pmem_wr;



reg [bw_psum-1:0] temp5b;
reg [bw_psum+3:0] temp_sum;
reg [bw_psum*col-1:0] temp16b;



dual_core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) DUT (
      .reset(reset),
      .clk(clk), 
      .mem_in_core1(mem_in_core1), 
      .mem_in_core2(mem_in_core2), 
      .inst_core1(inst),
      .inst_core2(inst),      
      .out_core1(out_core1),
      .out_core2(out_core2)
);


initial begin 

  $dumpfile("core_tb.vcd");
  $dumpvars(0,core_tb);



///// Q data txt reading core1 /////

$display("##### Q data txt reading #####");
qk_file_core1 = $fopen("qdata_core1.txt", "r");

for (q=0; q<total_cycle; q=q+1) begin
  $display("Q vector core1: %d\n", q);
  for (j=0; j<pr; j=j+1) begin
    qk_scan_file_core1 = $fscanf(qk_file_core1, "%d\n", captured_data);
    Q_core1[q][j] = captured_data;
    $display("Data core1: %d\n", captured_data);
  end
end

///// Q data txt reading core2 /////

$display("##### Q data txt reading #####");
qk_file_core2 = $fopen("qdata_core2.txt", "r");

for (q=0; q<total_cycle; q=q+1) begin
  $display("Q vector core2: %d\n", q);
  for (j=0; j<pr; j=j+1) begin
    qk_scan_file_core2 = $fscanf(qk_file_core2, "%d\n", captured_data);
    Q_core2[q][j] = captured_data;
    $display("Data core2: %d\n", captured_data);
  end
end

/////////////////////////////////


///// K data txt reading core1 /////

$display("##### K data txt reading #####");
qk_file_core1 = $fopen("kdata_core1.txt", "r");

for (q=0; q<col; q=q+1) begin
  $display("K vector core1: %d\n", q);
  for (j=0; j<pr; j=j+1) begin
    qk_scan_file_core1 = $fscanf(qk_file_core1, "%d\n", captured_data);
    K_core1[q][j] = captured_data;
    $display("Data core1: %d\n", captured_data);
  end
end

///// K data txt reading core2 /////

$display("##### K data txt reading #####");
qk_file_core2 = $fopen("kdata_core2.txt", "r");

for (q=0; q<col; q=q+1) begin
  $display("K vector core2: %d\n", q);
  for (j=0; j<pr; j=j+1) begin
    qk_scan_file_core2 = $fscanf(qk_file_core2, "%d\n", captured_data);
    K_core2[q][j] = captured_data;
    $display("Data core2: %d\n", captured_data);
  end
end

/////////////////////////////////




/////////////// Estimated result printing /////////////////


$display("##### Estimated multiplication result #####");

  for (t=0; t<total_cycle; t=t+1) begin
     for (q=0; q<col; q=q+1) begin
       result_core1[t][q]=0;
       result_core2[t][q]=0;
     end
     sum_core1[t]=0;
     sum_core2[t]=0;
  end

  for (t=0; t<total_cycle; t=t+1) begin
    $display("Q#: %d", t);
    for (q=0; q<col; q=q+1) begin
      $display("K#: %d", q);
      for (k=0; k<pr; k=k+1) begin
        result_core1[t][q] = result_core1[t][q] + Q_core1[t][k] * K_core1[q][k];
        result_core2[t][q] = result_core2[t][q] + Q_core2[t][k] * K_core2[q][k];	

      end
      sum_core1[t]=sum_core1[t]+result_core1[t][q];
      sum_core2[t]=sum_core2[t]+result_core2[t][q];      
      //$display("Predicted psum: %d", result[t][q]);
    end
      //$display("predicted result sum %d",sum[t]);
      if (sum_core1[t]<0)
      begin
	      sum_core1[t]=sum_core1[t]-2*sum_core1[t];
      end      
      if (sum_core2[t]<0)
      begin
	      sum_core2[t]=sum_core2[t]-2*sum_core2[t];
      end      

     for (kl=0;kl<col;kl++)
      begin
	    result_core1[t][kl]=result_core1[t][kl]*(256)/(sum_core1[t]+sum_core2[t]);
	    $display("post division prediction core1 %d",result_core1[t][kl]);
	    result_core2[t][kl]=result_core2[t][kl]*(256)/(sum_core1[t]+sum_core2[t]);
	    $display("post division prediction core2 %d",result_core2[t][kl]);

      end
    predicted_results_pmem_core1 [t] = {result_core1[t][7][bw_psum-1:0], result_core1[t][6][bw_psum-1:0], result_core1[t][5][bw_psum-1:0], result_core1[t][4][bw_psum-1:0], result_core1[t][3][bw_psum-1:0], result_core1[t][2][bw_psum-1:0], result_core1[t][1][bw_psum-1:0], result_core1[t][0][bw_psum-1:0]};
    predicted_results_pmem_core2 [t] = {result_core2[t][7][bw_psum-1:0], result_core2[t][6][bw_psum-1:0], result_core2[t][5][bw_psum-1:0], result_core2[t][4][bw_psum-1:0], result_core2[t][3][bw_psum-1:0], result_core2[t][2][bw_psum-1:0], result_core2[t][1][bw_psum-1:0], result_core2[t][0][bw_psum-1:0]};
    $display("Predicted psum vector core1: %h", predicted_results_pmem_core1 [t]);
    $display("Predicted psum vector core2: %h", predicted_results_pmem_core2 [t]);      
  end
  
//////////////////////////////////////////////

#0.5 clk = 0;
#0.5 clk = 1;
#0.5 clk = 0;
#0.5 clk = 1;
#0.5 clk = 0;
#0.5 clk = 1;
#0.5 clk = 0; reset = 0;
#0.5 clk = 1;
exchange_sum=0;


///// Qmem writing  /////

$display("##### Qmem writing  #####");

for (q=0; q<total_cycle; q=q+1) begin

  #0.5 clk = 1'b0;  
  qmem_wr = 1;  if (q>0) qkmem_add = qkmem_add + 1; 
  
  mem_in_core1[1*bw-1:0*bw] = Q_core1[q][0];
  mem_in_core1[2*bw-1:1*bw] = Q_core1[q][1];
  mem_in_core1[3*bw-1:2*bw] = Q_core1[q][2];
  mem_in_core1[4*bw-1:3*bw] = Q_core1[q][3];
  mem_in_core1[5*bw-1:4*bw] = Q_core1[q][4];
  mem_in_core1[6*bw-1:5*bw] = Q_core1[q][5];
  mem_in_core1[7*bw-1:6*bw] = Q_core1[q][6];
  mem_in_core1[8*bw-1:7*bw] = Q_core1[q][7];

  mem_in_core2[1*bw-1:0*bw] = Q_core2[q][0];
  mem_in_core2[2*bw-1:1*bw] = Q_core2[q][1];
  mem_in_core2[3*bw-1:2*bw] = Q_core2[q][2];
  mem_in_core2[4*bw-1:3*bw] = Q_core2[q][3];
  mem_in_core2[5*bw-1:4*bw] = Q_core2[q][4];
  mem_in_core2[6*bw-1:5*bw] = Q_core2[q][5];
  mem_in_core2[7*bw-1:6*bw] = Q_core2[q][6];
  mem_in_core2[8*bw-1:7*bw] = Q_core2[q][7];
 

  #0.5 clk = 1'b1;  

end


#0.5 clk = 1'b0;  
qmem_wr = 0; 
qkmem_add = 0;
norm_start=0;
sfp_rd=0;
#0.5 clk = 1'b1;  
#0.5 clk = 1'b0;  
#0.5 clk = 1'b1;  
#0.5 clk = 1'b0;  
#0.5 clk = 1'b1;  
///////////////////////////////////////////





///// Kmem writing  /////

$display("##### Kmem writing #####");

  for (q=0; q<col; q=q+1) begin

    #0.5 clk = 1'b0;  
    kmem_wr = 1; if (q>0) qkmem_add = qkmem_add + 1; 
    
    mem_in_core1[1*bw-1:0*bw] = K_core1[q][0];
    mem_in_core1[2*bw-1:1*bw] = K_core1[q][1];
    mem_in_core1[3*bw-1:2*bw] = K_core1[q][2];
    mem_in_core1[4*bw-1:3*bw] = K_core1[q][3];
    mem_in_core1[5*bw-1:4*bw] = K_core1[q][4];
    mem_in_core1[6*bw-1:5*bw] = K_core1[q][5];
    mem_in_core1[7*bw-1:6*bw] = K_core1[q][6];
    mem_in_core1[8*bw-1:7*bw] = K_core1[q][7];

    mem_in_core2[1*bw-1:0*bw] = K_core2[q][0];
    mem_in_core2[2*bw-1:1*bw] = K_core2[q][1];
    mem_in_core2[3*bw-1:2*bw] = K_core2[q][2];
    mem_in_core2[4*bw-1:3*bw] = K_core2[q][3];
    mem_in_core2[5*bw-1:4*bw] = K_core2[q][4];
    mem_in_core2[6*bw-1:5*bw] = K_core2[q][5];
    mem_in_core2[7*bw-1:6*bw] = K_core2[q][6];
    mem_in_core2[8*bw-1:7*bw] = K_core2[q][7];


    #0.5 clk = 1'b1;  

  end

  #0.5 clk = 1'b0;  
  kmem_wr = 0;  
  qkmem_add = 0;
  #0.5 clk = 1'b1;  
///////////////////////////////////////////



  for (q=0; q<2; q=q+1) begin
    #0.5 clk = 1'b0;  
    #0.5 clk = 1'b1;   
  end






/////  K data loading  /////
$display("##### K data loading to processor #####");

  for (q=0; q<col; q=q+1) begin
    #0.5 clk = 1'b0;  
    load = 1; 
    kmem_rd = 1;
    #0.5 clk = 1'b1;
    qkmem_add = qkmem_add + 1;  
  end

  #0.5 clk = 1'b0;  
  kmem_rd = 0; qkmem_add = 0;
  #0.5 clk = 1'b1;  

  #0.5 clk = 1'b0;   
  load = 0;
  #0.5 clk = 1'b1;  

///////////////////////////////////////////

 for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
 end







///// execution  /////
$display("##### execute #####");

  for (q=0; q<total_cycle; q=q+1) begin
    #0.5 clk = 1'b0;  
    execute = 1; 
    qmem_rd = 1;

    if (q>0) begin
       qkmem_add = qkmem_add + 1;
    end

    #0.5 clk = 1'b1;  
  end

  #0.5 clk = 1'b0;  
  qmem_rd = 0; qkmem_add = 0; execute = 0;
  #0.5 clk = 1'b1;  


///////////////////////////////////////////

 for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
 end




////////////// output fifo rd and wb to psum mem ///////////////////

$display("##### move ofifo to pmem #####");

  for (q=0; q<total_cycle; q=q+1) begin
    #0.5 clk = 1'b0;  
    ofifo_rd = 1; 
    pmem_wr = 1; 

    if (q>0) begin
       pmem_add = pmem_add + 1;
    end

    #0.5 clk = 1'b1;  
  end

  #0.5 clk = 1'b0;  
  pmem_wr = 0; pmem_add = 0; ofifo_rd = 0;
  #0.5 clk = 1'b1;  

///////////////////////////////////////////
//////sfp/////////////////////////////////
#0.5 clk =1'b0;
norm_start=1;
norm_valid=0;
pmem_add=0;
#0.5 clk =1'b1;
for (q=0;q<total_cycle;q=q+1)
begin
	#0.5 clk=1'b0;
	#0.5 clk=1'b1;
	if(q>0) begin
		pmem_add=pmem_add+1;
	end
	#0.5 clk=1'b0;
	#0.5 clk=1'b1;
	pmem_wr=0;	
	pmem_rd=1;
	#0.5 clk=1'b0;
	#0.5 clk=1'b1;
	norm_valid=1;
	#0.5 clk=1'b1;
	#0.5 clk=1'b0;
	exchange_sum=1;
	for (st=0;st<18;st=st+1)
	begin
		#0.5 clk =1'b0;
		#0.5 clk=1'b1;
	end
	exchange_sum=0;
	norm_valid=0;
end
pmem_rd=0;
sfp_rd=1;
pmem_add=0;
pmem_wr=1;
for (q=0;q<total_cycle;q=q+1)
begin
	if(q>0) begin
		pmem_add=pmem_add+1;
	end
	#0.5 clk=1'b0;
	#0.5 clk=1'b1;
end
pmem_add=0;
pmem_wr=0;
////////////// output fifo rd and wb to psum mem ///////////////////

$display("##### compare pmem results to predicted #####");

  for (q=0; q<total_cycle+1; q=q+1) begin
    #0.5 clk = 1'b0;   
    pmem_rd = 1; 

    if (q>0) begin
       pmem_add = pmem_add + 1;
    end

    #0.5 clk = 1'b1; 
    if (q>0) begin

    	$display("core1 Pmem result at address %d: %h", pmem_add-1, out_core1);
	if (out_core1 == predicted_results_pmem_core1[q-1]) begin
        	$display("Result matched predicted!");
	end

	else begin
		$display("Result is incorrect!");
	end
    end
    if (q>0) begin

    	$display("core2 Pmem result at address %d: %h", pmem_add-1, out_core2);
	if (out_core2 == predicted_results_pmem_core2[q-1]) begin
        	$display("Result matched predicted!");
	end

	else begin
		$display("Result is incorrect!");
	end
    end

  end

  #0.5 clk = 1'b0;  
  pmem_rd = 0; pmem_add = 0;
  #0.5 clk = 1'b1;  
///////////////////////////////////////////
#10 $finish;
end
endmodule
