`timescale 1ns / 1ps

//testing the Mux
module mux_Alu_Test;

//inputs
reg [3:0] outReg;
reg [15:0] outAlu;
reg inSelect;

//outputs
wire [15:0] outputMux;

//instance
mux_Alu mux (outReg, outAlu, inSelect, outputMux);


//values
initial begin 
    outReg = 0; outAlu = 0; inSelect = 0;#10;
    
     outReg = 1;#100;
     outReg = 5; outAlu = 15;#100;
     outReg = 8; outAlu = 8; #100;
     outReg = 9;#100;
     
     inSelect = 1;
     outReg = 1;#100;
     outReg = 5; outAlu = 15;#100;
     outReg = 8; outAlu = 8; #100;
     outReg = 9;#100;
    
end


endmodule
