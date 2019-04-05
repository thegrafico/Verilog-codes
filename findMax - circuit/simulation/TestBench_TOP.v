`timescale 1ns / 1ps

module TestBench_TOP;

	// Inputs
	reg mclk;
	reg start;
	reg [7:0] n;
	reg [15:0] startaddr;

	// Outputs
	wire done;
	wire [15:0] max; //

	// Instantiate the Unit Under Test (UUT)
	TOP uut (
		.mclk(mclk), 
		.start(start), 
		.n(n), 
		.startaddr(startaddr), 
		.done(done), 
		.max(max)
	);

	initial begin
		// Initialize Inputs
		mclk = 0;start = 0;n = 0;startaddr = 0;#100;
	
		
		@(posedge mclk);
		#40 n = 2;
		startaddr = 0;
		start = 1;#40; //activar el datapath atraves del fsm
		@(posedge mclk);
		#20 start = 0;
		wait (done);
		@(posedge mclk);
		if (max != 16'h0878) 
		  $display("ERROR: Maximum incorrect. startaddr = %x, n = %d, max = %x, expected max = %x", startaddr, n, max, 16'h0878);
		else
		  $display("PASS: Maximum correct. startaddr = %x, n = %d, max = %x, expected max = %x", startaddr, n, max, 16'h0878);
		  	
   
		@(posedge mclk);
		#5 n = 4;
		startaddr = 8'h16;
		start = 1;#40;
		@(posedge mclk);
		#20 start = 0;
		wait (done);
		@(posedge mclk);
		if (max != 16'h558e) 
		  $display("ERROR: Maximum incorrect. startaddr = %x, n = %d, max = %x, expected max = %x", startaddr, n, max, 16'h558e);
		else
		  $display("PASS: Maximum correct. startaddr = %x, n = %d, max = %x, expected max = %x", startaddr, n, max, 16'h558e);
  
		@(posedge mclk);
		#5 n = 8;
		startaddr = 8'h10;
		start = 1;#40;
		@(posedge mclk);
		#20 start = 0;
		@(posedge mclk);
		if (max != 16'h4599) 
		  $display("ERROR: Maximum incorrect. startaddr = %x, n = %d, max = %x, expected max = %x", startaddr, n, max, 16'h4599);
		else
		  $display("PASS: Maximum correct. startaddr = %x, n = %d, max = %x, expected max = %x", startaddr, n, max, 16'h4599);

	end
   
	initial forever #1 mclk = ~mclk;
endmodule

