`timescale 1ns / 1ps

//Testing ALU
module Alu_Test;
    //Inputs
    reg [7: 0] A, B;
    reg [2: 0] Sel;
    
    //Outputs
    wire [7: 0] y;
    
    //Counter
    integer i, i2;
    
    Alu uut(y,A,B,Sel);
     
     initial 
     begin
        //initialize inputs 

        for ( i = 0; i <= 255; i = i+1)
        begin
            A = i; 
            for ( i2 = 0; i2 <= 255; i2 = i2+1)
            begin
                B = i2;
                Sel = 3'b000; #100;
                Sel = 3'b001; #100;
                Sel = 3'b010; #100;
                Sel = 3'b011; #100;
                Sel = 3'b100; #100;
                Sel = 3'b101; #100;
                Sel = 3'b110; #100;
                Sel = 3'b111; #100;
                $display("------------------------------------");
            end 
        end
     end
     
     initial 
     begin
        $monitor("A = %b B = %b Sel = %b y = %b", A, B, Sel, y);
     end
           
endmodule
