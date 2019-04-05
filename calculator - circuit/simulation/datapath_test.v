`timescale 1ns / 1ps

//DAtapath Testin
module datapath_test;

//inputs
reg clk, load_number, clear_number, inputRegD, inSelect, load_result, clear_result,  load_code, clear_code,
    sel_display;
    
  //input
 reg [2:0] OpCode;

//outputs
wire [15:0] finalOutput;

//instanciado el datapath
DATAPATH datapath
    (   //Input register
       load_number, clear_number, clk, inputRegD,
        //MuxAlu
         inSelect,
        
        //ACC Register
        load_result, clear_result,
        
        //Op Code
        load_code, clear_code, OpCode,
        
        //display mux
        finalOutput, sel_display
     );
  
  //values   
initial begin
    clk = 0; OpCode = 0;#100;
end

initial forever #10 clk = ~clk;

endmodule
