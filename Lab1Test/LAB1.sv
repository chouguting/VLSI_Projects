module LAB1(
	input [3:0]in_0,
	input [3:0]in_1,
	input [3:0]in_2,
	input [3:0]in_3,
	input [3:0]in_4,
	input [3:0]in_5,
	input [2:0] in_rule,
	output logic signed [9:0] out
);


/////////////////
//             //
//  your code  //
//             //
/////////////////
/////////////////
//             //
//  your code  //
//             //
/////////////////

wire[3:0] c1_c6, c1_c4, c2_c4, c2_c5;
wire[3:0] c3_c5, c3_c8, c4_c6, c4_c7;
wire[3:0] c5_c7, c5_c8, c6_c11, c6_c9;
wire[3:0] c7_c9, c7_c10, c8_c10, c8_c13;
wire[3:0] c9_c11, c9_c12, c10_c12, c10_c13;
wire[3:0] c11_c14, c12_c14, c12_c15, c13_c15;

// ordering circuit
wire[3:0] order_0, order_1, order_2, order_3, order_4, order_5;
comparator_4_bits c1(.a(in_0),.b(in_1),.bigger(c1_c6),.smaller(c1_c4));
comparator_4_bits c2(.a(in_2),.b(in_3),.bigger(c2_c4),.smaller(c2_c5));
comparator_4_bits c3(.a(in_4),.b(in_5),.bigger(c3_c5),.smaller(c3_c8));
comparator_4_bits c4(.a(c1_c4),.b(c2_c4),.bigger(c4_c6),.smaller(c4_c7));
comparator_4_bits c5(.a(c2_c5),.b(c3_c5),.bigger(c5_c7),.smaller(c5_c8));
comparator_4_bits c6(.a(c1_c6),.b(c4_c6),.bigger(c6_c11),.smaller(c6_c9));
comparator_4_bits c7(.a(c4_c7),.b(c5_c7),.bigger(c7_c9),.smaller(c7_c10));
comparator_4_bits c8(.a(c5_c8),.b(c3_c8),.bigger(c8_c10),.smaller(c8_c13));
comparator_4_bits c9(.a(c6_c9),.b(c7_c9),.bigger(c9_c11),.smaller(c9_c12));
comparator_4_bits c10(.a(c7_c10),.b(c8_c10),.bigger(c10_c12),.smaller(c10_c13));
comparator_4_bits c11(.a(c6_c11),.b(c9_c11),.bigger(order_5),.smaller(c11_c14));
comparator_4_bits c12(.a(c9_c12),.b(c10_c12),.bigger(c12_c14),.smaller(c12_c15));
comparator_4_bits c13(.a(c10_c13),.b(c8_c13),.bigger(c13_c15),.smaller(order_0));
comparator_4_bits c14(.a(c11_c14),.b(c12_c14),.bigger(order_4),.smaller(order_3));
comparator_4_bits c15(.a(c12_c15),.b(c13_c15),.bigger(order_2),.smaller(order_1));



reg[3:0] a, b, c, d, e, f;

//a to f
always @(*) begin
	case(in_rule[2:1])
		2'b00: 
			begin
				a = order_0;
				b = order_1;
				c = order_2;
				d = order_3;
				e = order_4;
				f = order_5;
			end
		2'b01:
			begin
				a = order_1;
				b = order_3;
				c = order_5;
				d = order_0;
				e = order_2;
				f = order_4;
			end
		2'b10:
			begin
				a = order_0;
				b = order_2;
				c = order_4;
				d = order_5;
				e = order_3;
				f = order_1;
			end
		2'b11:
			begin
				a = order_5;
				b = order_3;
				c = order_1;
				d = order_0;
				e = order_2;
				f = order_4;
			end
		default:
			begin
				a = order_0;
				b = order_1;
				c = order_2;
				d = order_3;
				e = order_4;
				f = order_5;
			end
	endcase
end

//calculation
always@(*) begin
	case(in_rule[0])
		1'b0:
			begin
				out = (a * b) + (b * c) - (e * 4);
			end
		1'b1:
			begin
				out = (b * c) - (c * d) + (f / 2);
			end
		default:
			begin
				out = (a * b) + (b * c) - (e * 4);
			end
	endcase
end


	

endmodule


module comparator_4_bits (
    input [3:0] a, 
    input [3:0] b, 
    output [3:0] bigger, 
    output [3:0] smaller
    );

    assign bigger = (a > b) ? a : b;
    assign smaller = (a < b) ? a : b;
	 
endmodule


