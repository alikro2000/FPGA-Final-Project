`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:09:47 02/13/2021
// Design Name:   HUB
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/HUB_tb2.v
// Project Name:  Hub_Proj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HUB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HUB_tb2;

	// Inputs
	reg clk;
	reg reset;
	reg rx0;
	reg rx1;

	// Outputs
	wire tx0;
	wire tx1;

	// Instantiate the Unit Under Test (UUT)
	HUB uut (
		.clk(clk), 
		.reset(reset), 
		.tx0(tx0), 
		.rx0(rx0), 
		.tx1(tx1), 
		.rx1(rx1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		rx0 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
		
		// Receive the first data packet via Port0
		// receive sfd
		rx0 = 1;
		#10;
		
		rx0 = 0;
		#10;
		
		rx0 = 1;
		#10;
		
		rx0 = 0;
		#10;
		
		rx0 = 1;
		#10;
		
		rx0 = 0;
		#10;
		
		rx0 = 1;
		#20;
		
		// Receive data 11110000.
		
		rx0 = 0;
		#40;
		
		rx0 = 1;
		#40;
		
		// End receive on Port0
		rx0 = 0;
		
		// Receive another data packet via Port1
		// receive sfd
		rx1 = 1;
		#10;
		
		rx1 = 0;
		#10;
		
		rx1 = 1;
		#10;
		
		rx1 = 0;
		#10;
		
		rx1 = 1;
		#10;
		
		rx1 = 0;
		#10;
		
		rx1 = 1;
		#20;
		
		// Receive data 11001100.
		
		rx1 = 0;
		#20;
		
		rx1 = 1;
		#20;
		
		rx1 = 0;
		#20;
		
		rx1 = 1;
		#20;
		
		// End receive on Port1
		rx1 = 0;
	end

	initial forever #5 clk=~clk;
      
endmodule

