`timescale 1ns / 1ps


module Comparador_FindMax(ActiveDatapath, max, douta, reset);

//activeDatapath: Viene del FSM y es el que me activa para buscar un max
//max: El valor maximo
//douta: Es el valor que me llega de memoria y lo comparo con el valor max anterior


//inputs
input ActiveDatapath, reset;
input [15:0] douta;

//outputs
output reg [15:0] max;

   
always @ (douta, reset, ActiveDatapath)
    begin
        if(reset)
           begin
            max <= 0;
           end
        else if(ActiveDatapath)
            begin
                if(max < douta)
                     max <= douta;
            end      
    end

endmodule
