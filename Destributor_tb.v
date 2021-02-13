`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:25:19 02/11/2021
// Design Name:   Destributor
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/Destributor_tb.v
// Project Name:  Hub_Proj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Destributor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Destributor_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] din0;
	reg [7:0] din1;
	reg [7:0] din2;
	reg [7:0] din3;
	reg inv0;
	reg inv1;
	reg inv2;
	reg inv3;

	// Outputs
	wire [7:0] dout0;
	wire [7:0] dout1;
	wire [7:0] dout2;
	wire [7:0] dout3;
	wire outv0;
	wire outv1;
	wire outv2;
	wire outv3;

	// Instantiate the Unit Under Test (UUT)
	Destributor uut (
		.clk(clk), 
		.reset(reset), 
		.din0(din0), 
		.din1(din1), 
		.din2(din2), 
		.din3(din3), 
		.inv0(inv0), 
		.inv1(inv1), 
		.inv2(inv2), 
		.inv3(inv3), 
		.dout0(dout0), 
		.dout1(dout1), 
		.dout2(dout2), 
		.dout3(dout3), 
		.outv0(outv0), 
		.outv1(outv1), 
		.outv2(outv2), 
		.outv3(outv3)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		din0 = 0;
		din1 = 0;
		din2 = 0;
		din3 = 0;
		inv0 = 0;
		inv1 = 0;
		inv2 = 0;
		inv3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
		
		din0 = 112;
		inv0 = 1;
		din2 = 200;
		inv2 = 1;
		
		#10;
		inv0 = 0;
		inv2 = 0;

	end
	
	initial forever #5 clk=~clk;
      
endmodule

