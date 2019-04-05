`timescale 1ns / 1ps

//Module for inpug Register
module inputRegister(load, clear, clk, D, Q);

//inputs
input clear, clk, load;
input [3:0] D;

//outputs
output reg [3:0] Q;

//Fired on CLK
always @ (posedge clk)
       //if clear is on, them output is 0
    if(clear)
        Q <= 0;
        //if Load is on, then the output will be the input
    else if(load)
        Q <= D;
    
endmodule
