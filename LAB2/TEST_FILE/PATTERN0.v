
`define RTL
`ifdef RTL
	`timescale 1ns/1ps
	`define CYCLE_TIME_clk2 15
`endif
`ifdef GATE
	`timescale 1ns/1ps
	`define CYCLE_TIME_clk2 15
`endif


module PATTERN0 #(parameter DSIZE = 8)(
    // Output signals
	rst_n,
	clk2,

	//input signal
    out_valid,
	out_account,
	start_in
);

// ===============================================================
// Input & Output Declaration
// ===============================================================
output reg  clk2;
input rst_n, out_valid, start_in;
input [DSIZE-1:0] out_account;

// ===============================================================
// Parameters & Integer Declaration
// ===============================================================
integer total_cycles, seed;
integer i, j;
integer golden_step, temp_AT, temp_AC;

// ===============================================================
// Wire & Reg Declaration
// ===============================================================
reg [7:0] in_account_data [0:3999];
reg [7:0] in_A_data [0:3999];
reg [7:0] in_T_data [0:3999];
reg [7:0] answer_AT [0:3996];

// ===============================================================
// Clock
// ===============================================================
always	#(`CYCLE_TIME_clk2/2) clk2 = ~clk2;
initial	clk2 = 0;

// ===============================================================
// Initial
// ===============================================================
initial begin
	
	
	seed = 64;
	//rst_n   = 1'b1;
	force clk2 = 0;


	reset_task;
	@(negedge clk2);
	
	
	//generate answer
	for (i=0; i<4000; i=i+1) begin
		in_account_data[i]=$random(seed)%'d256;
		in_A_data[i]=$random(seed)%'d256;
		in_T_data[i]=$random(seed)%'d256;
	end
	
	for (i=0; i<3997; i=i+1) begin
		temp_AT=65536 ;
		temp_AC=267;
		for(j=i; j<i+5; j=j+1) begin
			if((in_A_data[j]*in_T_data[j])<temp_AT) begin
				temp_AT=in_A_data[j]*in_T_data[j];
				temp_AC=in_account_data[j];
			end
		end
		answer_AT[i]=temp_AC;
	end
	
	
	//check answer
	golden_step = 0;
	total_cycles = 0;
	while(golden_step<3997)begin
		check_ans;
	end
	
	
	//pass
	#(1000);
	YOU_PASS_task;
	$finish;

end 



// ===============================================================
// TASK
// ===============================================================

task reset_task ; begin
	#(10); //rst_n = 0;
	#(10);
	if(rst_n==0) begin
		if((out_valid !== 0) || (out_account !== 0)) begin
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			$display ("                                                                        FAIL!                                                               ");
			$display ("                                                  Output signal should be 0 after initial RESET at %8t                                      ",$time);
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			#(100);
			$finish ;
		end
	end
	#(10);// rst_n = 1 ;
	#(3.0);  release clk2;
end endtask


task check_ans; begin


	//check answer
	if (out_valid == 1) begin
		if ( out_account !== answer_AT[ golden_step ] ) begin
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			$display ("                                                                        FAIL!                                                               ");
			$display ("                                                                   Pattern NO.%03d                                                          ", golden_step);
			$display ("                                                              Your output ->  %d                                                     ", out_account);
			$display ("                                                            Golden output ->  %d                                         ", answer_AT[golden_step]);
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			@(negedge clk2);
			$stop;
		end
		else begin
		$display("PASS PATTERN NO.%4d", golden_step );
		golden_step=golden_step+1;
		//total_cycles = total_cycles+1;
		//@(negedge clk2);
		end
		
	end
	
	
	//check output
	if(out_valid == 0&& out_account!=0) begin
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                        FAIL!                                                               ");
		$display ("                                                                                                                                            ");
		$display ("	                                                     Output should be 0 when out valid is 0.                                               ");
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		@(negedge clk2);
		$stop;
	
	end
	
	
	//check execution latency
	if(start_in==1)begin
		total_cycles = total_cycles+1;
		if(total_cycles == 100000) begin
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			$display ("                                                                        FAIL!                                                               ");
			$display ("                                                                                                                                            ");
			$display ("                                                     The execution latency are over 100000 cycles                                           ");
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			repeat(2)@(negedge clk2);
			$stop;
		end
	
	end

	@(negedge clk2);
		
end endtask


task YOU_PASS_task; begin
	$display ("----------------------------------------------------------------------------------------------------------------------");
	$display ("                                                  Congratulations!                						             ");
	$display ("                                           You have passed all patterns!          						             ");
	$display ("                                           Your execution cycles = %5d cycles   						                 ", total_cycles);
	$display ("                                           Your clock period = %.1f ns        					                     ", `CYCLE_TIME_clk2);
	$display ("                                           Your total latency = %.1f ns         						                 ", total_cycles*`CYCLE_TIME_clk2);
	$display ("----------------------------------------------------------------------------------------------------------------------");
	$stop;
end endtask


endmodule