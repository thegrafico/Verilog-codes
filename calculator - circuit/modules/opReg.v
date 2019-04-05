`timescale 1ns / 1ps

//Operation Register
module opReg(load, clear, clk, D, Q);
//inputs
input clear, clk, load;

//operation Code
input [2:0] D;
//output operation COde
output reg [2:0] Q;

always @ (posedge clk)
    //if clear the output will be 0
    if(clear)
        Q <= 0;
        //if load the output will be the input
    else if(load)
        Q <= D;
        
endmodule
