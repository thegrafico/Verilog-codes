`timescale 1ns / 1ps

module TOP(input mclk, input start, input [7:0] n, input [15:0] startaddr, output done, output [15:0] max);

wire [15:0] douta;
wire [7:0] addra;
wire activeDatapath;
wire ActiveDoneFSM;
wire reset;

//==========================FSM MODULE============================
FSM fms      (start,activeDatapath,done,mclk,ActiveDoneFSM, reset);
    
//===========================DATAPATH MODULO==================================
Datapath dpt (activeDatapath, ActiveDoneFSM , startaddr, n, mclk, reset, addra,max, douta);

//======================MEMORY CREATED BY IP CATALOG================================
blk_mem_gen_0 imem (.clka(mclk),.ena(1'b1),.addra(addra),.douta(douta)); // data out 

endmodule
