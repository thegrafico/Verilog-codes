`timescale 1ns / 1ps
module Lab6_FSM(clk, reset, start, done, cntEn, cntClr);

input clk, reset, start;
output cntEn, cntClr, done;

reg done, cntClr, cntEn;
reg estado;
reg [3:0] counter;
reg [2:0] nextStage;

parameter S0 = 0; //start
parameter S1 = 1;
parameter S2 = 2;


always @(posedge clk)
    if(reset)
        estado <= S0;
    else 
      estado <= nextStage;
    
always @ (*)begin
    case(estado)
    S0:begin
        done = 0;
        cntEn = 0;
        cntClr = 1;
        counter = 3'b000;
        if(start)
            nextStage = S1;
        else
            nextStage= S0;
        end
     S1:begin
        cntClr = 0;
        cntEn  = 1;
        counter = counter + 1;
           
           if(start)
            nextStage = S1;
            else
            nextStage = S2; 
        end
       S2:begin
            done = 1;
             nextStage = S0;
          end
    endcase

end
endmodule