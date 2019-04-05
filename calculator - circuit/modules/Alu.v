`timescale 1ns / 1ps

//Module for ALU
module Alu (outAlu, A, B, Sel);
    
    //Input A will be 4 bits
    input [3: 0] A;
    //input B will be 16 bits becuase the ACC Register 
    input [15:0] B;
    //This is the input from OpReg
    input [2: 0] Sel;
    //output will be 16 bits because one input is 16 bits
    output [15: 0] outAlu;
    
    //register the output
    reg [15: 0] outAlu;
    
//fire only when the input A changes
always @ (A)
    begin
        case (Sel)
        3'b100: outAlu = A + B ;    //Suma 
        3'b101: outAlu = A - B ; //resta
        3'b110: outAlu = A * B; //multiplicacion
        3'b111: outAlu = B/ 3'b010; //divicion (El profesor dijo que dividamos entre 2 solamente)
        default: outAlu = 0; //if load another opReg       
        endcase
    end
    
endmodule
