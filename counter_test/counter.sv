module counter(
	input clk,
	input rst,
	input en,
	output reg[4:0] out_count
);

	// always@(posedge clk or negedge rst)
	// begin
	// 	if(!rst)
	// 	begin
	// 		out_count<=0;
	// 	end
	// 	else
	// 	begin
	// 		if(en==1'b1)
	// 			out_count <= out_count + 5'd1;
	// 		else
	// 			out_count <= out_count;
	// 	end
	// end

	//count to five and stop
	always@(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			out_count<=0;
		end
		else
		begin
			if(out_count==5'd5)
				out_count <= out_count;
			else
				out_count <= out_count + 5'd1;
		end
	end

endmodule