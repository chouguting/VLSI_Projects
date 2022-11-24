`timescale 1ns/1ps
`define RTL
`include "PATTERN.v"
`include "PATTERN0.v"
`ifdef RTL
  `include "../CDC.v"
`endif
`ifdef GATE
  `include "CDC_SYN.v"
`endif 
		  	
module TESTBED;

parameter DSIZE = 8; // word size - 8 bit
parameter ASIZE = 4; // address size - 4 bit

wire clk1, clk2, in_valid, rst_n, start_in;
wire ready,out_valid;
wire [DSIZE-1:0] in_account,in_A,in_T;
wire [DSIZE-1:0]	out_account;


initial begin

  `ifdef RTL
    //$fsdbDumpfile("CDC.fsdb");
	//$fsdbDumpvars(0,"+mda");
  `endif
  `ifdef GATE
    $sdf_annotate("CDC_SYN_pt.sdf", u_CDC,,,"maximum");
    $fsdbDumpfile("CDC_SYN.fsdb");
	$fsdbDumpvars(0,"+mda"); 
  `endif


/**
ready=0;
#1 out_valid =0;
#1 out_account= 0;
#50 ready=1;
#50 ready=0;
#10 out_valid =1;out_account= 167;
#15 out_valid =0;out_account= 0;
#20 out_valid =1;out_account= 167;
#15 out_valid =0;out_account= 0;
#30 out_valid =1;out_account= 231;
#15 out_valid =0;out_account= 0;
#40 out_valid =1;out_account= 68;
#15 out_valid =0;out_account= 0;
#10 out_valid =1;out_account= 68;
#15 out_valid =0;out_account= 0;
#100 ready=1;
#50 ready=0;
#1000 ready=1;
#10 out_valid =1;out_account= 68;
#15 out_valid =0;out_account= 0;
#10 out_valid =1;out_account= 68;
#15 out_valid =0;out_account= 0;
#84000 ready=0;

#500 $stop;
**/
end



CDC u_CDC(
    .rst_n(rst_n),
    .clk1(clk1),
    .clk2(clk2),
    .in_valid(in_valid),
	.in_account(in_account),
    .in_A(in_A),
    .in_T(in_T),
    .ready(ready),
    .out_valid(out_valid),
	.out_account(out_account)
    );

PATTERN u_PATTERN(
	.rst_n(rst_n),
    .clk1(clk1),
    .in_valid(in_valid),
	.in_account(in_account),
    .in_A(in_A),
    .in_T(in_T),
    .ready(ready),
	.start_in(start_in)
    );
 
PATTERN0 u_PATTERN0(
	.rst_n(rst_n),
    .clk2(clk2),
    .out_valid(out_valid),
	.out_account(out_account),
	.start_in(start_in)
    );  
 
endmodule
