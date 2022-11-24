`timescale 1ns/100ps

module FIFO_TESTBENCH;
    reg rst_n, rclk, rinc, wclk, winc;
	reg[7:0] wdata;

    wire rempty, rdata;
    //Output Port (write)
    wire[7:0] wfull;

    FIFO fifo(rst_n, rclk, rinc, wclk, winc, wdata, rempty, rdata, wfull);

    

    initial begin
        
    end


    
endmodule