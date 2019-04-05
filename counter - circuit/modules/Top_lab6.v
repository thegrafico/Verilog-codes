`timescale 1ns / 1ps

module Top_lab6(clk, reset, start, done, count);
input clk, reset, start;
output done;
output [3:0] count;

wire cntEn, cntClr;

Lab6_FSM fms     (clk, reset, start, done, cntEn, cntClr);
lab6_counter cnt (clk, reset,  cntClr, cntEn, count);

endmodule
