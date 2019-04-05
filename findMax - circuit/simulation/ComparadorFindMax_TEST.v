`timescale 1ns / 1ps


module ComparadorFindMax_TEST;

//inputs
reg startFromFSM, reset;
reg [15:0] douta;

//outputs
wire [15:0] max;



Comparador_FindMax fMax(startFromFSM, max, douta, max,reset);


initial begin
    reset = 1;startFromFSM = 0;douta = 0;#50;
    startFromFSM = 1;reset = 0; #20;
    douta = 1;#50;
    douta = 5;#50;
    douta = 4;#50;
    douta = 6;#50;
    douta = 5;#50;
    douta = 16'h0878 ;#50;
end
endmodule
