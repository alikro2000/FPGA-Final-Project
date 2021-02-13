`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:07:30 02/05/2021
// Design Name:   Transmitter
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/UART_tb.v
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

module UART_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] din;
	reg tr_start;

	// Outputs
	wire tr_free;
	
	wire rec_complete;
	wire [7:0] dout;
	
	// Common
	wire x;

	// Instantiate the Unit Under Test (UUT)
	Transmitter trns_inst (
		.clk(clk), 
		.reset(reset), 
		.din(din), 
		.tr_start(tr_start), 
		.tr_free(tr_free), 
		.tx(x)
	);
	
	receiver rec_inst (
		.clk(clk), 
		.reset(reset), 
		.rec_complete(rec_complete), 
		.dout(dout), 
		.rx(x)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		din = 0;
		tr_start = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
		din = 8'b00010101;
		tr_start = 1;
		
		#10;
		tr_start = 0;

	end
	
	always @ (posedge rec_complete)
		$display(dout);
   
	initial forever #5 clk=~clk;
   
endmodule

