`timescale 1ns / 1ps

module lab6_FSM_TEST;

reg clk, reset, start; //input
wire done, cntEn, cntClr; // output

Lab6_FSM FMS(clk, reset, start, done, cntEn, cntClr);

initial begin
    clk = 0; reset= 1; start = 0;#10;
      reset = 1;#10;
      start= 1;#10;
      reset = 0;#10;
end

  initial   forever #10 clk = ~clk; 

endmodule
