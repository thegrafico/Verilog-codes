`timescale 1ns / 1ps

module lab6_counter(clk, reset,  clr, cntEn, Dout);
input clk, clr, cntEn, reset;
output [3:0]Dout;
reg [3:0] Dout;

always @(posedge clk)
    if(reset) Dout <= 0;
    else if(clr) Dout <= 0;
    else if(cntEn) Dout <= Dout + 1;
endmodule
