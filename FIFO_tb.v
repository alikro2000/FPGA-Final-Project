`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:23 02/12/2021
// Design Name:   FIFO
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/FIFO_tb.v
// Project Name:  Hub_Proj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FIFO
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FIFO_tb;

	// Inputs
	reg clk;
	reg reset;
	reg r;
	reg w;
	reg [7:0] din;

	// Outputs
	wire is_empty;
	wire is_full;
	wire [7:0] dout;

	// Instantiate the Unit Under Test (UUT)
	FIFO uut (
		.clk(clk), 
		.reset(reset), 
		.r(r), 
		.w(w), 
		.din(din), 
		.is_empty(is_empty), 
		.is_full(is_full), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		r = 0;
		w = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
		w = 1;
		
		din = 26;
		#10;
		
		din = 33;
		#10;
		
		din = 45;
		#10;
		
		din = 112;
		#10;
		
		w = 0;
		r = 1;
		
		#10;
		#10;
		
		w = 1;
		din = 233;
		#10;
		
		w = 0;
		r = 0;
	end
	
	initial forever #5 clk=~clk;
      
endmodule

