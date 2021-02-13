`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:57:49 02/13/2021
// Design Name:   HUB
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/HUB_PC_TB.v
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

module HUB_PC_TB;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire tx0;
	wire tx1;
	wire tx2;
	wire tx3;
	wire rx0;
	wire rx1;
	wire rx2;
	wire rx3;
	
	parameter data_len = (6+6+70)*8;

	// Instantiate the Unit Under Test (UUT)
	HUB hub_inst (
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
	
	PC #(.data_len(data_len)) pc_inst0 (
		.clk(clk), 
		.reset(reset), 
		.mac_address("000A959D6816"),
		.tx(rx0), 
		.rx(tx0)
	);
	
	PC #(.data_len(data_len)) pc_inst1 (
		.clk(clk), 
		.reset(reset), 
		.mac_address("000B846D6817"),
		.tx(rx1), 
		.rx(tx1)
	);
	
	PC #(.data_len(data_len)) pc_inst2 (
		.clk(clk), 
		.reset(reset), 
		.mac_address("00A6646D9C97"),
		.tx(rx2), 
		.rx(tx2)
	);
	
	PC #(.data_len(data_len)) pc_inst3 (
		.clk(clk), 
		.reset(reset), 
		.mac_address("000B811E6F17"),
		.tx(rx3), 
		.rx(tx3)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;

	end
	
	initial forever #5 clk=~clk;
      
endmodule

