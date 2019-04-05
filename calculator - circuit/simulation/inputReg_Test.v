`timescale 1ns / 1ps

//TESTIN input Reg
module inputReg_Test;

//inputs
reg clear, load, clk;
reg [3:0] D;

//outpus
wire [3:0] Q;

//instancia
inputRegister inReg(load, clear, clk, D, Q);


initial begin
clk = 0; clear = 1; load = 0; D = 0; #100;

    clear = 0; load = 1;#100;
    D = 3'b000;#100;
    D = 3'b001;#100;
    D = 3'b010;#100;
    D = 3'b011;#100;
    D = 3'b100;#100;
    D = 3'b101;#100;
    D = 3'b110;#100;
    D = 3'b111;#100;
    D = 3'b000;#100;
    D = 3'b101;#100;
end

//run forever to change the clock
initial forever #10 clk = ~clk;

endmodule
