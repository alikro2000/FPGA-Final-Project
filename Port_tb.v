`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:54:48 02/05/2021
// Design Name:   Port
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/Port_tb.v
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

module Port_tb;

	// Inputs
	reg clk;
	reg reset;
	reg tr_start1;
	reg tr_start2;
	reg [7:0] din1;
	reg [7:0] din2;

	// Outputs
	wire tr_free1;
	wire tr_free2;
	wire rec_complete1;
	wire rec_complete2;
	wire [7:0] dout1;
	wire [7:0] dout2;
	
	// Common
	wire x1;
	wire x2;

	// Instantiate the Unit Under Test (UUT)
	Port uut1 (
		.clk(clk), 
		.reset(reset), 
		.tr_start(tr_start1), 
		.din(din1), 
		.tr_free(tr_free1), 
		.tx(x1), 
		.rec_complete(rec_complete1), 
		.dout(dout1), 
		.rx(x2)
	);
	
	Port uut2 (
		.clk(clk), 
		.reset(reset), 
		.tr_start(tr_start2), 
		.din(din2), 
		.tr_free(tr_free2), 
		.tx(x2), 
		.rec_complete(rec_complete2), 
		.dout(dout2), 
		.rx(x1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		tr_start1 = 0;
		tr_start2 = 0;
		din1 = 8'b01000111;
		din2 = 8'b10000001;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
		
		tr_start1 = 1;
		
		#80;
		tr_start1 = 0;
		tr_start2 = 1;
		
		#10;
		tr_start2 = 0;

	end
	
	always @ (posedge rec_complete1)
		$display(dout1);
		
	always @ (posedge rec_complete2)
		$display(dout2);
	
	initial forever #5 clk=~clk;
      
endmodule

