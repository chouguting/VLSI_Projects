// `include "AFIFO.v"

module CDC #(parameter DSIZE = 8,
			   parameter ASIZE = 4)(
	//Input Port
	rst_n,
	clk1,
    clk2,
	in_valid,
	in_account,
	in_A,
	in_T,

    //Output Port
	ready,
    out_valid ,
	out_account
); 
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------

	input	rst_n, clk1, clk2, in_valid;
	input [DSIZE-1:0] 	in_account,in_A,in_T;

	output reg	ready, out_valid;
	output reg [DSIZE-1:0] 	out_account;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------
	wire in_A_FIFO_empty, in_T_FIFO_empty, in_account_FIFO_empty;
	wire in_A_FIFO_full, in_T_FIFO_full, in_account_FIFO_full;
	wire FIFO_empty, shift_enable;
	wire ready_d, shift_reg_about_to_full;

	wire [DSIZE-1:0] in_A_FIFO_rdata, in_T_FIFO_rdata, in_account_FIFO_rdata;
	wire [DSIZE*2-1:0] calculate_result;

	wire[DSIZE*2-1:0] calculate_result_slot[0:4];
	wire[DSIZE-1:0] account_slot[0:4];
	wire[4:0] calculate_result_has_data, account_has_data;


//---------------------------------------------------------------------
//   PARAMETER
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//   DESIGN
//---------------------------------------------------------------------

	
	always @(posedge clk1 or negedge rst_n)
	begin
		if(!rst_n)
		begin
			ready <= 1'b0;
		end
		else
		begin
			ready <= ready_d;
		end
	end

	//如果FIFO都不滿，就可以寫入
	assign ready_d = !(in_A_FIFO_full || in_T_FIFO_full || in_account_FIFO_full);

	//3個AFIFO
	AFIFO in_A_FIFO (.rst_n(rst_n),.rclk(clk2),.rinc(1'b1),
					.wclk(clk1), .winc(in_valid), .wdata(in_A), .rempty(in_A_FIFO_empty),
					.rdata(in_A_FIFO_rdata),.wfull(in_A_FIFO_full));

	AFIFO in_T_FIFO (.rst_n(rst_n),.rclk(clk2),.rinc(1'b1),
					.wclk(clk1), .winc(in_valid), .wdata(in_T), .rempty(in_T_FIFO_empty),
					.rdata(in_T_FIFO_rdata),.wfull(in_T_FIFO_full));
	
	AFIFO in_account_FIFO (.rst_n(rst_n),.rclk(clk2),.rinc(1'b1),
					.wclk(clk1), .winc(in_valid), .wdata(in_account), .rempty(in_account_FIFO_empty),
					.rdata(in_account_FIFO_rdata),.wfull(in_account_FIFO_full));

	//FIFO出來後計算相乘結果
	assign calculate_result = in_A_FIFO_rdata * in_T_FIFO_rdata;			

	//如果FIFO都空了，就別再讀了
	assign FIFO_empty = in_A_FIFO_empty || in_T_FIFO_empty || in_account_FIFO_empty;



	//2個shift register
	shift_register_5_slot #(DSIZE*2) calculate_result_shift_reg (.rst_n(rst_n),.clk(clk2),
	 .shift_enable(!FIFO_empty), .data_in(calculate_result), 
	 .data_0(calculate_result_slot[0]), .data_1(calculate_result_slot[1]), 
	 .data_2(calculate_result_slot[2]), .data_3(calculate_result_slot[3]),
	  .data_4(calculate_result_slot[4]),.hasData(calculate_result_has_data));

	shift_register_5_slot #(DSIZE) in_account_FIFO_shift_reg (.rst_n(rst_n),.clk(clk2),
	 .shift_enable(!FIFO_empty), .data_in(in_account_FIFO_rdata), 
	 .data_0(account_slot[0]), .data_1(account_slot[1]), .data_2(account_slot[2]),
	  .data_3(account_slot[3]), .data_4(account_slot[4]),.hasData(account_has_data));

	//shift register 有沒有快滿
	assign shift_reg_about_to_full = calculate_result_has_data[3] && account_has_data[3];

	//比較電路
	wire[DSIZE*2-1:0] compare_result_0_1, compare_result_2_3, compare_result_0_1_2_3, compare_result_0_1_2_3_4;
	wire[2:0] compare_choice_0_1, compare_choice_2_3, compare_choice_0_1_2_3, compare_choice_0_1_2_3_4;

	assign compare_result_0_1 = calculate_result_slot[0] < calculate_result_slot[1] ? calculate_result_slot[0] : calculate_result_slot[1];
	assign compare_result_2_3 = calculate_result_slot[2] < calculate_result_slot[3] ? calculate_result_slot[2] : calculate_result_slot[3];
	assign compare_result_0_1_2_3 = compare_result_0_1 < compare_result_2_3 ? compare_result_0_1 : compare_result_2_3;
	//用不到: assign compare_result_0_1_2_3_4 = compare_result_0_1_2_3 < calculate_result_slot[4] ? compare_result_0_1_2_3 : calculate_result_slot[4];

	assign compare_choice_0_1 = calculate_result_slot[0] < calculate_result_slot[1] ? 3'd0 : 3'd1;
	assign compare_choice_2_3 = calculate_result_slot[2] < calculate_result_slot[3] ? 3'd2 : 3'd3;
	assign compare_choice_0_1_2_3 = compare_result_0_1 < compare_result_2_3 ? compare_choice_0_1 : compare_choice_2_3;
	assign compare_choice_0_1_2_3_4 = compare_result_0_1_2_3 < calculate_result_slot[4] ? compare_choice_0_1_2_3 : 3'd4;

	//控制out_valid
	always @(posedge clk2 or negedge rst_n)
	begin
		if(!rst_n)
		begin
			out_valid <= 1'b0;
		end
		else
		begin
			out_valid <= shift_reg_about_to_full && !FIFO_empty;
		end
	end


	//輸出account
	always @(*)
	begin
		if(out_valid)
		begin
			out_account <= account_slot[compare_choice_0_1_2_3_4];
		end
		else
		begin
			out_account <= 0;
		end
	end
endmodule

module shift_register_5_slot #(parameter DSIZE = 8)(
	//Input Port
	input rst_n,
	input clk,
	input shift_enable,
	input[DSIZE-1:0] data_in,
	output  [DSIZE-1:0] data_0,
	output  [DSIZE-1:0] data_1,
	output  [DSIZE-1:0] data_2,
	output  [DSIZE-1:0] data_3,
	output  [DSIZE-1:0] data_4,
	output  reg[4:0] hasData
);
	parameter ASIZE = 5;
	reg[DSIZE-1:0] data[0:4];

	assign data_0 = data[0];
	assign data_1 = data[1];
	assign data_2 = data[2];
	assign data_3 = data[3];
	assign data_4 = data[4];

	always @(posedge clk or negedge rst_n)
	begin
		if(!rst_n) 
		begin: reset_reg
			integer i;
			for(i=0;i<ASIZE;i=i+1)
				data[i] <= 0;
			hasData <= 5'b0;
		end
		else
		begin
			
			if(shift_enable)
			begin: shift_reg
				integer i;
				for(i=0;i<ASIZE-1;i=i+1)
					data[i+1] <= data[i];
				data[0] <= data_in;
				hasData <= hasData << 1 | 1'b1;
			end
		end

	end

endmodule







