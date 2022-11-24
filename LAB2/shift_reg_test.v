`timescale 1ns/100ps
module shift_reg_test;
    reg rst_n;
	reg clk;
	reg shift_enable;
	reg[7:0] data_in;
	wire  [7:0] data_0;
	wire  [7:0] data_1;
	wire  [7:0] data_2;
	wire  [7:0] data_3;
	wire  [7:0] data_4;

    shift_register_5_slot #(8) shift_register_5_slot_m0 (.rst_n(rst_n), .clk(clk), .shift_enable(shift_enable), .data_in(data_in), .data_0(data_0), .data_1(data_1), .data_2(data_2), .data_3(data_3), .data_4(data_4));

    always #5 clk = ~clk;

    initial begin
        #0 clk=1'b0; rst_n = 1'b1;  shift_enable = 1'b0; data_in = 8'd0;
        #5 rst_n = 1'b0;  shift_enable = 1'b0; data_in = 8'd0;
        #20 rst_n = 1'b1;  shift_enable = 1'b1; data_in = 8'd1;
        #20 rst_n = 1'b1;  shift_enable = 1'b1; data_in = 8'd2;
        #20 rst_n = 1'b1;  shift_enable = 1'b1; data_in = 8'd3;
        #20 rst_n = 1'b1;  shift_enable = 1'b1; data_in = 8'd4;
        #20 rst_n = 1'b1;  shift_enable = 1'b1; data_in = 8'd5;
        #20 rst_n = 1'b1;  shift_enable = 1'b1; data_in = 8'd6;
        #20 rst_n = 1'b1;  shift_enable = 1'b1; data_in = 8'd7;
        #200 $stop;
        #10 $finish;

    end

    initial $monitor("data_0 = %d, data_1 = %d, data_2 = %d, data_3 = %d, data_4 = %d", data_0, data_1, data_2, data_3, data_4);

endmodule