`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:50:30 02/04/2021
// Design Name:   Transmitter
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/Transmitter_tb.v
// Project Name:  Hub_Proj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Transmitter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Transmitter_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] din;
	reg tr_start;

	// Outputs
	wire tr_free;
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	Transmitter uut (
		.clk(clk), 
		.reset(reset), 
		.din(din), 
		.tr_start(tr_start), 
		.tr_free(tr_free), 
		.tx(tx)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;
		din = 0;
		tr_start = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		din = 97;
		reset = 0;
		tr_start = 1;
		#10;
		tr_start = 0;
		
//		#100;
//		din = 111;

	end
	
	initial forever #5 clk=~clk;
      
endmodule

