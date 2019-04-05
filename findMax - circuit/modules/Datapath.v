`timescale 1ns / 1ps

module Datapath(ActiveDatapath, ActiveDone , startAddr, N, clk, reset, addr,max, douta);

    //input 
    input [15:0] startAddr;             //donde empezamos a contar
    input [7:0] N;                      //hasta donde vamos a contar
    input reset, clk,ActiveDatapath;    //start del fms, y el reset general
    input [15:0] douta;                 //valor que nos llega de la memoria

    //output    
    output [7:0] addr;                  //la dirreccion que entra en la memoria
    output ActiveDone;                  //Esta variable es la que se comunica con el fsm
    output[15:0] max;                   //El valor maximo
   
    wire [15:0] max;
    wire [7:0] addr;                    //la dirreccion que entre en la memoria
    wire ActiveDone;                    //Esta variable es la que se comunica con el fsm

        
     //Suma la direccion en la memoria que instanciamos
    AddrCounter  addCount(startAddr,
                          N, 
                          reset,
                          addr,
                          clk,
                          ActiveDone);
    
    //Buscar el valor maximo
    Comparador_FindMax fmax(ActiveDatapath,
                             max,
                             douta,
                             reset
                             );

endmodule
