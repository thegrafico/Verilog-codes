`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 11/12/2018 09:38:33 AM
// Design Name: 
// Module Name: lab6_counter_TEST
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab6_counter_TEST;

//inputs
reg clk, clr, reset, cntEn;
wire [3:0] Dout;

lab6_counter counter(clk, reset,  clr, cntEn, Dout);

initial begin
    clk= 0; clr= 0; reset = 0; cntEn = 0;#10;
    clr = 1;#100;
    reset = 1;#100;
    cntEn = 0;#100;
    clr = 0;#100;
    reset = 0;#100;
    cntEn = 1;#100;
end
  initial   forever #10 clk = ~clk; 

endmodule
