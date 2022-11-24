`timescale 1ns/10ps
`include "PATTERN.sv"

//`define RTL

module TESTBED;

logic [3:0] in_0;
logic [3:0] in_1;
logic [3:0] in_2;
logic [3:0] in_3;
logic [3:0] in_4;
logic [3:0] in_5;
logic [2:0] in_rule;
logic signed [9:0] out;


//initial begin
//`ifdef RTL
//	$fsdbDumpfile("LAB1.fsdb");
//	$fsdbDumpvars(0,"+mda");
//	$fsdbDumpvars();
//`endif
//`ifdef GATE
//    $sdf_annotate("LAB1.sdf", MY_LAB1);
//    $fsdbDumpfile("LAB1.fsdb");
//    $fsdbDumpvars(0,"+mda");
//    $fsdbDumpvars();
//`endif
//end


LAB1 MY_LAB1(
    .in_0(in_0),
    .in_1(in_1),
    .in_2(in_2),
    .in_3(in_3),
    .in_4(in_4),
    .in_5(in_5),
    .in_rule(in_rule),
    .out(out)
);


PATTERN My_PATTERN(
    .in_0(in_0),
    .in_1(in_1),
    .in_2(in_2),
    .in_3(in_3),
    .in_4(in_4),
    .in_5(in_5),
    .in_rule(in_rule),
    .out(out)
);


endmodule
