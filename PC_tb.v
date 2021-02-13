`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:18:39 02/13/2021
// Design Name:   PC
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/PC_tb.v
// Project Name:  Hub_Proj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [12*8-1:0] mac_address;
	reg rx;

	// Outputs
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	PC #(.data_len((6+6+70)*8)) uut (
		.clk(clk), 
		.reset(reset), 
		.mac_address(mac_address),
		.tx(tx), 
		.rx(tx)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		mac_address = "000A959D6816";
		rx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;

	end
	
	initial forever #5 clk=~clk;
      
endmodule

