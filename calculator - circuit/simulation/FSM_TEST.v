`timescale 1ns / 1ps

//TEsting the FSM 
module FSM_TEST;
//inputs
reg clk, reset;
reg [2:0] opCodeIn;

//outputs
wire load_number, clear_number, load_opcode, load_result, clear_result, sel_muxAlu, sel_muxDisplay, clear_opCode;
wire [2:0] opCodeOut;

//ESTADOS OUT
wire E0, E1, E2, E3;

//Instance the FSM
FSM fsm (clk, reset,opCodeOut, opCodeIn, load_number, clear_number,
         load_opcode,clear_opCode, sel_muxAlu, load_result, clear_result,
          sel_muxDisplay,E0, E1, E2, E3 );


//init variables
initial begin
    clk = 0;reset = 1;opCodeIn = 3'b000;#100; //clear all #50;
    
    reset = 0;#10;
    opCodeIn = 3'b000;#100; //clear all
    opCodeIn = 3'b001;#100 //load numbee
    opCodeIn = 3'b010;#100 //user press enter
    opCodeIn = 3'b001;#100; //load numbeer
    opCodeIn = 3'b100;#100; //load signo
    opCodeIn = 3'b010;#100 //user press enter
    opCodeIn = 3'b001;#100; //load numbeer
    opCodeIn = 3'b010;#100 //user press enter
    opCodeIn = 3'b101;#100; //load signo
 
    
    //me quede testing the alu mux
end

//run forever
initial forever #10 clk = ~clk;

endmodule
