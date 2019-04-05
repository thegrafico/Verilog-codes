`timescale 1ns / 1ps


module FSM_Datapath_TOP(clk, reset, values, opCodeIn, S0, S1, S2, S3);
 
 //inputs
 input clk, reset;
 input  [3:0] values; //input for inputReg
 input [2:0] opCodeIn;
 
 //outputs
 output reg S0, S1, S2, S3;
// wire [15:0] outDataPath;
 wire [2:0] opCodeOut;
 wire load_number, clear_number,load_opcode,clear_opCode, sel_muxAlu, load_result, clear_result,sel_muxDisplay, S0, S1, S2, S3;

FSM fsm
    (
        clk, reset,opCodeOut,opCodeIn, load_number, clear_number,
        
        load_opcode,clear_opCode, sel_muxAlu, load_result, clear_result,
        
        sel_muxDisplay, S0, S1, S2, S3
     );
     
DATAPATH datapath
    (   //Input register
    load_number, clear_number, clk, values,
    //MuxAlu
    sel_muxAlu,
   
    //ACC Register
    load_result, clear_result,
    
    //Op Code
    load_opcode, clear_opCode, opCodeOut,
    
    //display mux
     sel_muxDisplay
    );

endmodule
