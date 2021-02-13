`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:02:01 02/13/2021
// Design Name:   HUB
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/HUB_tb5.v
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

module HUB_tb5;

	// Inputs
	reg clk;
	reg reset;
	reg rx0;
	reg rx1;
	reg rx2;
	reg rx3;

	// Outputs
	wire tx0;
	wire tx1;
	wire tx2;
	wire tx3;

	// File Handlers
	integer file_input_rx0, file_input_rx1;
	reg bit_rx0, bit_rx1;
	
	integer file_output_tx0, file_output_tx1;

	// Instantiate the Unit Under Test (UUT)
	HUB uut (
		.clk(clk), 
		.reset(reset), 
		.tx0(tx0), 
		.rx0(rx0), 
		.tx1(tx1), 
		.rx1(rx1), 
		.tx2(tx2), 
		.rx2(rx2), 
		.tx3(tx3), 
		.rx3(rx3)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		rx0 = 0;
		rx1 = 0;
		rx2 = 0;
		rx3 = 0;
		
		file_input_rx0 = $fopen("tb1_input.txt", "r");
		file_input_rx1 = $fopen("tb2_input.txt", "r");
		file_output_tx0 = $fopen("tx0_output.txt", "w");
		file_output_tx1 = $fopen("tx1_output.txt", "w");

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;

	end
	
	initial forever #10 begin
		$fscanf(file_input_rx0, "%b\n", bit_rx0);
		rx0 = bit_rx0;
	end
	
	initial #20 forever #10 begin
		$fscanf(file_input_rx1, "%b\n", bit_rx1);
		rx1 = bit_rx1;
	end
	
	always @ (posedge clk) begin
		$fwrite(file_output_tx0, "%b\n", tx0);
		$fwrite(file_output_tx1, "%b\n", tx1);
	end
	
	initial forever #5 clk=~clk;
      
endmodule

