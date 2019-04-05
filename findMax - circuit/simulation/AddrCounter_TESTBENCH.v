`timescale 1ns / 1ps


module AddrCounter_TESTBENCH;

    reg clk, reset;
    reg [15:0] startAddr;
    reg [7:0] N;
    wire [7:0] addr;
    wire done;
    
    AddrCounter utt (startAddr, N, reset,addr, clk, done);
    
    
    initial begin
        clk = 0; reset = 1; startAddr = 8; N = 5;#100;
        reset = 0;#100;
        reset = 1; startAddr = 10; N = 2;#100;
        reset = 0;#20;
    end
    
    initial forever #5 clk = !clk;
endmodule
