`timescale 1ns / 1ps

module addrCount_Memory_TEST;

reg mclk, reset;
reg [7:0] n;
reg [15:0] startaddr;

wire [15:0] douta, max;
wire [7:0] addra;

Datapath dp(startaddr, n, mclk, reset, addra,max);

//the memory module(CREATED FOR YOU) is instanced as follog:
blk_mem_gen_0 imem (
	.clka(mclk),
	.ena(1'b1), // read 
	.addra(addra), // memory address 
	.douta(douta)); // data out 

    
    initial begin
    mclk = 0; reset = 1; startaddr = 0; n = 2;#100;
            reset = 0;#100;
            reset = 1; startaddr = 3; n = 4;#100;
            reset = 0;#20;
    end
    
    initial forever #5 mclk = !mclk;
endmodule
