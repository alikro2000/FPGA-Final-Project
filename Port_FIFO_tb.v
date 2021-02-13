`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:42:59 02/13/2021
// Design Name:   Port
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/Port_FIFO_tb.v
// Project Name:  Hub_Proj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Port
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Port_FIFO_tb;

	// Inputs
	reg clk;
	reg reset;
	reg tr_start;
//	reg [7:0] din;
	reg rx;
	
	reg r;
	reg w;
	reg [7:0] din; //FIFO

	// Outputs
	wire tr_free;
	wire tx;
	wire rec_complete;
	wire [7:0] dout;
	
	wire is_empty;
	wire is_full;
//	wire [7:0] dout;



	wire [7:0] d;
	wire con;
	
	assign con = (!is_empty && tr_free);

	// Instantiate the Unit Under Test (UUT)
	Port uut (
		.clk(clk), 
		.reset(reset), 
		.tr_start(con), 
		.din(d), 
		.tr_free(tr_free), 
		.tx(tx), 
		.rec_complete(rec_complete), 
		.dout(dout), 
		.rx(rx)
	);
	
	FIFO uut2 (
		.clk(clk), 
		.reset(reset), 
		.r(con), 
		.w(w), 
		.din(din), 
		.is_empty(is_empty), 
		.is_full(is_full), 
		.dout(d)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
//		tr_start = 0;
		rx = 0;
		
		w = 0;
//		r = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
		
		w = 1;
		din = 126;
		
		#10;
		w = 1;
		din = 220;
		
		#10;
		w = 0;
		
		

	end
	
	initial forever #5 clk=~clk;
      
endmodule

