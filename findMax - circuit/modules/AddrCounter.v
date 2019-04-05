`timescale 1ns / 1ps

//Este modulo lo que hace es aumentar la direccion de la memoria y asi obtener valores diferentes entre un rango
module AddrCounter(input [15:0]startAddr, input [7:0] N, input reset,output [7:0] addr, input clk, output done);

//startAddr: Donde empiezo a contar
//n: Hasta donde llego a contar - 1
//addr: La direccion que va a la memoria
//Done: se activa cuando terminie de contar

//La direccion que va hacia la memoria
reg [7:0] addr;

//Incrementador interno
reg [7:0]counter;

//done
reg done;
always @ (posedge clk)
    
    begin
        if(reset)
            begin
                counter <= 0;
                addr <= startAddr;
                done <= 0;
            end
        else if (counter < N - 1)
            begin
                counter <= counter + 1;
                addr <= addr + 1; 
                //Si termino de contar, Si llego al final
                if(addr + 1 == startAddr + N - 1)
                    done <= 1;
            end
            
    end

endmodule
