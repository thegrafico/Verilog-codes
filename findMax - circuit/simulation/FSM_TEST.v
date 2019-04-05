`timescale 1ns / 1ps


module FSM_TEST;

reg clk,start, ControlSignalIn ;

wire controlSignalOut, done;


FSM fsmFSM(start, controlSignalOut, done, clk, ControlSignalIn);



//empazamos la simulacion
initial begin

    //----------------------------ESTADO 0-------------
    clk = 0;start = 0; ControlSignalIn = 0;#100;
    start = 1;#100;
    ControlSignalIn = 1;start = 0; #100;

end

//run forever
initial forever #10 clk = ~clk;

endmodule
