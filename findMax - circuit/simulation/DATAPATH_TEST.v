`timescale 1ns / 1ps
module DATAPATH_TEST;

reg mclk, ActiveDatapath, reset;
reg [15:0] startAddr;
reg [7:0] N;

wire[7:0] addr;
wire [15:0]max;
wire ActiveDone;


//MEMORY//
wire [15:0] douta;

blk_mem_gen_0 imem (.clka(mclk),.ena(1'b1),.addra(addr),.douta(douta)); // data out 

Datapath dp(.ActiveDatapath(ActiveDatapath),.ActiveDone(ActiveDone) ,.startAddr(startAddr), .N(N), .clk(mclk), 
            .reset(reset), .addr(addr),.max(max), .douta(douta));

initial begin
    mclk = 0; reset = 1; ActiveDatapath = 0; startAddr = 1; N = 5;#20;
    reset = 0; ActiveDatapath = 1;
end
initial forever #10 mclk = ~mclk;
endmodule
