
`define RTL
`ifdef RTL
	`timescale 1ns/1ps
	`define CYCLE_TIME_clk1 16
`endif
`ifdef GATE
	`timescale 1ns/1ps
	`define CYCLE_TIME_clk1 10
`endif


module PATTERN #(parameter DSIZE = 8)(
    // Output signals
	rst_n,
	clk1,
	in_valid,
	in_account,
	in_A,
	in_T,
	
    // Input signals
	ready,
	start_in
);


// ===============================================================
// Input & Output Declaration
// ===============================================================
output reg rst_n, clk1, in_valid, start_in;
output reg [DSIZE-1:0] in_account,in_A,in_T;
input ready;

// ===============================================================
// Parameters & Integer Declaration
// ===============================================================
integer seed, gap, gap_cnt;
integer step_in;
integer i, j;

// ===============================================================
// Wire & Reg Declaration
// ===============================================================
reg [7:0] in_account_data [0:3999];
reg [7:0] in_A_data [0:3999];
reg [7:0] in_T_data [0:3999];

// ===============================================================
// Clock
// ===============================================================
always	#(`CYCLE_TIME_clk1/2) clk1 = ~clk1;
initial	clk1 = 0;

// ===============================================================
// Initial
// ===============================================================
initial begin
	in_valid = 1'b0;
	in_account =  'bx;
	in_A   =  'bx;
	in_T   =  'bx;
	seed = 64;
	start_in=0;
	step_in=0;
	gap_cnt=500;
	rst_n   = 1'b1;
	force clk1 = 0;

	reset_task;
	@(negedge clk1);

	//generate input
	for (i=0; i<4000; i=i+1) begin
		in_account_data[i]=$random(seed)%'d256;
		in_A_data[i]=$random(seed)%'d256;
		in_T_data[i]=$random(seed)%'d256;
	end
	
	//sent data
	gap_cnt=0;
	while(step_in<4000)begin
		input_data;
	end
	
end 

// ===============================================================
// TASK
// ===============================================================
task reset_task ; begin
	#(10); rst_n = 0;
	#(10);
		
	#(10); rst_n = 1 ;
	#(3.0); release clk1; 
end endtask


task input_data; begin

	//choice cend or not send
	if(gap_cnt>499)
		gap=1;
	else 
		gap = $urandom_range(0,1);
		
	//output signal
	if (ready == 1 ) begin
		if(gap == 1) begin
			start_in=1;
			in_valid = 1'b1;

			in_account=in_account_data[step_in];
			in_A=in_A_data[step_in];
			in_T=in_T_data[step_in];
		
			step_in=step_in+1;
		end
		else begin
			in_valid = 1'b0;
		
			in_account= 'bx;
			in_A= 'bx;
			in_T= 'bx;
			
			gap_cnt=gap_cnt+1;
			
		end
	end
	else begin
		in_valid = 1'b0;
		
		in_account= 'bx;
		in_A= 'bx;
		in_T= 'bx;
	end
	@(negedge clk1);
	
end endtask

endmodule