`timescale 1ns / 1ps


//datapath TOP MODUE
module DATAPATH
    (   //Input register
       load_number, clear_number, clk, inputRegD,
        //MuxAlu
         inSelect,
        
        //ACC Register
        load_result, clear_result,
        
        //Op Code
        load_code, clear_code, OpCode,
        
        //display mux
        sel_display, outValue
     );

//----------input Reg-------------
input load_number, clear_number, clk;
input [3:0] inputRegD;
wire [3:0] outInputReg;
//------------------MuxAlu---------------
input inSelect;
wire [15:0] outMuxAlu;
//-----------------ACC Register-------------
input load_result;
input clear_result;
wire [15:0] outaccReg;
//-------------Operation Code-------------------------
 input load_code;
 input clear_code;
 input [2:0] OpCode;
 wire [2:0] outCode;
//-----------Mux Display------------------------
input sel_display;
output [15:0] outValue;


//-------------------ALu-------------------------------------
wire [15:0] outAlu;

//inputRegister
inputRegister  inReg    (load_number, clear_number, clk, inputRegD, outInputReg);

//Mux Alu
mux_Alu        muxAlu   (outInputReg, outAlu, inSelect, outMuxAlu); 

//ACC REgister
accReg         acc_reg  (load_result, clear_result, clk, outMuxAlu, outaccReg);

//Operation Register
opReg           opreg   (load_code, clear_code, clk, OpCode, outCode);

//Alu
Alu             alu     (outAlu,outInputReg,outaccReg,outCode);

//Mux Display
mux_Display  mDisplay   (outInputReg, outaccReg, sel_display, outValue);

endmodule

