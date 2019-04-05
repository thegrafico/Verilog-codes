`timescale 1ns / 1ps
//activa y desactiva el datapath
module FSM(start, ActiveDapapath,done, clka, ActiveDoneSignal, reset);
//control the inputs
input start, clka;
input ActiveDoneSignal;

output reg ActiveDapapath, done, reset;


//---------------------------VARIABLES HACER LOS ESTADOS------------------------------
//para guardar los estados
reg [2:0]stage;


//STAGES
parameter S0 = 0;//Cuando esta encendidp
parameter S1 = 1;//Cuando esta apagado
parameter S2 = 2; //Estatico, es decir, luego de un estado siempre vuelve a este y este es el que determina el siguiente estado
//--------------------------------------------------------------------------

//Fire on Clk
always @(posedge clka)
    begin
        //si se preciona el reset, ira al primer estado
        if(start)
            stage = S0;
            //si no seguira en el loop de los estados
        else
             stage = S1;
        
    end
    
always @ (*)begin

    case(stage)
        //START PRENDIDO
         S0:begin
            ActiveDapapath <= start;
            reset <= 0;
            stage = S2;
          
         end
         //START APAGADO
         S1:begin
             reset <= 1;
             ActiveDapapath  <= 0;
             stage = S2;
         end
         //Estado de verificacion
         S2:begin
            if(ActiveDoneSignal)
                 done = 1;
              else 
                 done = 0; 
                 
                 
            if(start)
                stage = S0;
            else
                stage = S1;
         end
     endcase
    end
endmodule