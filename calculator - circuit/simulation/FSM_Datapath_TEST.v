`timescale 1ns / 1ps

//Simulation Module
module FSM_Datapath_TEST;

//inputs
//El clk es igual para todos, el reset solo es para el FSM
reg clk, reset;
//Lo que entra en el FSM (opCOde)
reg [2:0] opCodeIn;
//opCode
wire [2:0] opCode;
//lo que ingresa en el dataPath, (lo que ingresa el usuario)
reg [3:0] values;
//Cables que conectan el FSM con el datapath
wire ld_number, clear_number, ld_opcode ,clear_opCode, ld_result,clear_result, sel_a, sel_display ;
//ESTADOS (para mostarlos en la simulacion)
wire Stage0, Stage1, Stage2, Stage3;
//SALIDA FINAL, esta es donde vemos el valor que sale de nuestro datapath
wire [15:0] outValue;
//Instanciamos el FSM con los valores de las variables de arriba

FSM fsm 
        (
          clk, reset, opCode,opCodeIn, ld_number, clear_number,
 
          ld_opcode,clear_opCode, sel_a, ld_result, clear_result,
 
          sel_display, Stage0, Stage1, Stage2, Stage3
          );


//Todas las entradas del Datapath son Salidas del FSM
DATAPATH datapath
    (   //Input register
       ld_number, clear_number, clk, values,
        //MuxAlu
         sel_a,
        
        //ACC Register
        ld_result, clear_result,
        
        //Op Code
        ld_opcode, clear_opCode, opCode,
        
        //display mux
         sel_display, outValue
     );
     
//empazamos la simulacion
initial begin

    //----------------------------ESTADO 0-------------
     clk = 0;reset = 1;opCodeIn = 3'b000;values = 0;#100; //clear all #50;
       //apagamos el reset
       reset = 0;#10;
       //----------------------------ESTADO 0-------------
       opCodeIn = 3'b000;#100; //clear all
       //----------------------------ESTADO 1--------------------
       opCodeIn = 3'b001;values = 4'b0010;#100; // ingresamos el numero 2
       opCodeIn = 3'b010;#100; //press enter
       //----------------------------ESTADO 2----------------------- 
       opCodeIn = 3'b111;#100; //suma simbo 
       opCodeIn = 3'b010;#100;//press enter
       
   ////------------------------------ESTADO 3--------------------------
       opCodeIn = 3'b001;values = 4'b0111;#100; //ingresamos el numero 7
       opCodeIn = 3'b010;#100;//press enter
       opCodeIn = 3'b111;#100; //suma simbo
       opCodeIn = 3'b010;#100;//press enter
       
    //----------------------------ESTADO 4, es para ver si el programa sigue corriendo con datos, pueden borrar esto----------------------- 
      opCodeIn = 3'b001;values = 4'b0011;#100; // ingresamos el numbero 3
      opCodeIn = 3'b010;#100;//press enter
      opCodeIn = 3'b111;#100; //suma simbo
      opCodeIn = 3'b010;#100;//press enter

end

//run forever
initial forever #10 clk = ~clk;

endmodule
