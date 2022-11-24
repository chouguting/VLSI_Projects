`timescale 1ns/10ps
`define CYCLE_TIME 15.0

module PATTERN(
    in_0,
    in_1,
    in_2,
    in_3,
    in_4,
    in_5,
    in_rule,
    out
);


output logic [3:0] in_0, in_1, in_2, in_3, in_4, in_5;
output logic [2:0] in_rule;
input signed [9:0] out;


integer seed;
integer input_file;
integer PATNUM, patcount;
integer a, b, c, d, e, f, g, h, i, j, k;


logic signed [9:0] out_ans;


logic clk;
real	CYCLE = `CYCLE_TIME;
always	#(CYCLE/2.0) clk = ~clk;
initial
    clk = 0;


initial begin

    in_0 = 4'dx;
    in_1 = 4'dx;
    in_2 = 4'dx;
    in_3 = 4'dx;
    in_4 = 4'dx;
    in_5 = 4'dx;
    in_rule = 3'dx;

	input_file  = $fopen("input.txt","r");
	@(negedge clk);
	
	a = $fscanf(input_file, "%d", PATNUM);
    for(patcount = 0; patcount < PATNUM; patcount = patcount + 1) begin
		input_data;
        repeat(1) @(negedge clk);
        check_ans;
        repeat(3) @(negedge clk);
    end
	
    pass;
    repeat(3) @(negedge clk);
    $stop;
	
end

task input_data; begin

	b = $fscanf (input_file, "%b", in_0);
	c = $fscanf (input_file, "%b", in_1);
	d = $fscanf (input_file, "%b", in_2);
	e = $fscanf (input_file, "%b", in_3);
	f = $fscanf (input_file, "%b", in_4);
	g = $fscanf (input_file, "%b", in_5);
	h = $fscanf (input_file, "%b", in_rule);
	k = $fscanf (input_file, "%b", out_ans);
	
end endtask



task check_ans;

    begin

        if(out!==out_ans) begin
            fail;
            $display("-------------------------------------------------------------------");
            $display("*                            PATTERN NO.%4d\n 	                 ",patcount);
			$display("             in_0=%d in_1=%d in_2=%d in_3=%d in_4=%d in_5=%d\n     ",in_0, in_1, in_2, in_3, in_4, in_5);
            $display("                               in_rule=%d\n 	                     ",in_rule);
			$display("*            answer should be : %d , your answer is : %d           ",out_ans, out);
            $display("-------------------------------------------------------------------");
            #(100);
            $stop ;
        end
        else
            $display ("             Pass Pattern NO.%d   \n\n\n       ", patcount);
    end
	
endtask


task fail;

    begin
        $display("\n");
        $display("\n");
        $display("        ---------------------------- ");
        $display("        --                        -- ");
        $display("        --        OOPS !          -- ");
        $display("        --                        -- ");
        $display("        --     Find the Bug ~~    -- ");
        $display("        --                        -- ");
        $display("        ---------------------------- ");
        $display("\n");
    end
	
endtask


task pass;

    begin
        $display("\n");
        $display("\n");
        $display("        ---------------------------- ");
        $display("        --                        -- ");
        $display("        --  Congratulations ~~    -- ");
        $display("        --                        -- ");
        $display("        --     LAB1 PASS !        -- ");
        $display("        --                        -- ");
        $display("        ---------------------------- ");
        $display("\n");
    end
	
endtask

endmodule
