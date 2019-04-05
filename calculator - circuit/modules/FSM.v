`timescale 1ns / 1ps

//Module for ASM, Puedes cabiar el orden de estas variables. 
module FSM
    (
        clk, reset, opCodeOut,opCodeIn, load_number, clear_number,
       
        load_opcode,clear_opCode, sel_muxAlu, load_result, clear_result,
       
        sel_muxDisplay, Stage0, Stage1, Stage2, Stage3
     );

//inputs
input clk, reset;

//OpCode que entra al FSM
input [2:0] opCodeIn;

//outputs
output reg load_number, clear_number, load_opcode, load_result, clear_result, sel_muxAlu, sel_muxDisplay, clear_opCode;

//Operation Code que usa el dataPath, esto es lo que el dataPath Recibe
output reg [2:0] opCodeOut;

//Registros para las Salidas
output reg Stage0,Stage1,Stage2,Stage3;

//para guardar los estados
reg [2:0]stage;

//para asignar los estados
reg [2:0] nextStage;

//Para guardar los estados
parameter S0 = 0; 
parameter S1 = 1; 
parameter S2 = 2; 
parameter S3 = 3; 


//Fire on Clk
always @(posedge clk)
    //si se preciona el reset, ira al primer estado
    if(reset)
        stage = S0;
        //si no seguira en el loop de los estados
    else
    stage = nextStage;
      
always @ (*)begin

    //Si el opCode in cambia, el OpCodeOut tambien, pero son lo mismo.
   opCodeOut = opCodeIn;
   
   //EVALUAMOS LOS ESTADOS
    case(stage)
    //--------------------------------------STAGE 0----------------------------------
    S0:begin
        //para visualizar ne que estados estamos
        Stage0 = 1; Stage1 = 0; Stage2 = 0; Stage3 = 0;
        
        //init todo en 0
        load_number <= 0;
        clear_number <= 0;
        load_opcode <= 0;
        load_result <= 0;
        clear_result <= 0;
        sel_muxAlu <= 0;
        sel_muxDisplay <= 0;
        clear_opCode <= 0;
        
        //if no op_code is no press se queda en el mismo estado
        if(opCodeOut == 3'b000)
             nextStage <= S0; 
        //if user press a number
        else if(opCodeOut == 3'b001) 
            begin
                //load the number enter
                load_number <= 1;
                   //go to the next stage
                nextStage = S1;
                //close the Stage 0 (Apagamos la visualizacion de este estado
                Stage0 = 0;                        
            end
        end
            
        //------------------STAGE 1------------------------------
        S1:begin
     
            //display the current state
            Stage1 <= 1;

            //display the value enter (Si el este esta en 0 va a display lo que el usuario ingrese)
            sel_muxDisplay <= 0;
            
            //if user press enter cargarmos el numero en memorio (input register)
            if(opCodeOut == 3'b010);
            begin
                load_number = 0; //load the new number into input reg
                load_result = 1; //cargamos el numero dentro de AccRegister
            end        
            //si el usuario preciona un simbolo   
                if(opCodeOut >= 3'b100)
                 begin
                    load_result <= 0; //va a dejar de cargar dentro de ACC register
                    sel_muxAlu <= 1; //El multiplexer al lado del ALU va a cargar lo que salga del ALu
                    load_opcode <= 1; //Cargamos el opCode dentro del Multiplexer
                    nextStage = S2; //vamos al siguiente estado
                    Stage1 <= 0; // apagamos la visualizacion de este estado (S1)
                 end
          
           
        end
        //--------------------STAGE 2------------------------------
       S2:begin
            
            //prendemos la visualizacion 
            Stage2 <= 1;
            
            //display value of accRegister
            sel_muxDisplay <= 1;
            
            //if user press enter
            if(opCodeOut == 3'b010);   
                load_opcode = 0; //apagamos lo que entra en el OpCode
             
             //si el usuario presiona un numbero
              if(opCodeOut == 3'b001)
                 begin
                   load_number <= 1; //cargamos ese numero dentro de input Register
                    sel_muxAlu = 1; //el mux Del ALu se queda en 1, (va a cargar lo que tenga el mux dentro de ACC Register
                    clear_number = 1;#15; //limpiamos el numero que se vaya a precionar mientra lo cargamos
                    clear_number = 0; //apagamos el clear
                    nextStage = S3; //ir al estado 3
                    Stage2 <= 0; //apaga la visualizacion de este estado
                 end
            
        end 
        //----------------------------STAGE 3-----------------------------------------
       S3:begin
            
            //turn on this stage
            Stage3 <= 1;
            
            //display the input reg
            sel_muxDisplay <= 0;
            
           //if user press enter
           if(opCodeOut == 3'b010)
              begin
                load_number = 0; //dejamos de carga el numero              
                load_result = 1; // cargamos el numero dentro de AccRegister
              end
               //if user press a simbol
               else if(opCodeOut >= 3'b100)
                begin
                   load_opcode <= 1; //cargamos el codigo dentro de OpReg
                   load_result = 0; // apagamos que el accRegister guarde numeros
                   nextStage = S2; //vamos al siguiente estado
                   Stage3 <= 0; // Apagamos la vizualizacion de este estado
                end
          end
           
        endcase 
    end
endmodule
