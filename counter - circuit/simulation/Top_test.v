`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2018 11:31:32 AM
// Design Name: 
// Module Name: Top_test
//////////////////////////////////////////////////////////////////////////////////


module Top_test;

//inputs
reg clk, reset, start;
wire done;
wire [3:0] count;

Top_lab6 top(clk, reset, start, done, count);

initial begin
    clk = 0; reset = 1; start = 0;#10;
        
        reset= 1;#10;
        start  = 1;#10;
        reset = 0;#10;
        start = 1;#10;
//        reset = 1;#100;
//        start = 1;#10;
//        reset = 0;#10;
end

initial   forever #10 clk = ~clk; 


endmodule
