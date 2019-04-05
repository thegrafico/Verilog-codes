`timescale 1ns / 1ps

//MODULE FOR Acc Register
module accReg(load, clear, clk, D, Q);
//inputs
input clear, clk, load;

//Input for accRegister = output from mux
input [15:0] D;

//output that enter on the Display and the B input of ALU
output reg [15:0] Q;

//fire on clock
always @ (posedge clk)
    //if clear the output will be 0
    if(clear)
        Q <= 0;
        //if load then the output will be the input
    else if(load)
        Q <= D;
    
endmodule
