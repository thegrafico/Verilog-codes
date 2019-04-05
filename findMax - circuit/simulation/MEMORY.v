`timescale 1ns / 1ps

module MEMORY;

reg mclk; 
reg [7:0] addra;
wire [15:0] douta;

blk_mem_gen_0 imem (.clka(mclk),.ena(1'b1),.addra(addra),.douta(douta)); // data out 


initial begin
    mclk = 0;addra = 0;#10;
    addra = 15;#40;
    addra = 20; #40;
    addra = 2; #40;
end
initial forever #10 mclk = ~mclk;
endmodule
