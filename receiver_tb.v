`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:02:33 02/05/2021
// Design Name:   receiver
// Module Name:   G:/Alireza/University semester 5/FPGA/Final Project/Hub_Proj/receiver_tb.v
// Project Name:  Hub_Proj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: receiver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module receiver_tb;

	// Inputs
	reg clk;
	reg reset;
	reg rx;

	// Outputs
	wire rec_complete;
	wire [7:0] dout;

	// Instantiate the Unit Under Test (UUT)
	receiver uut (
		.clk(clk), 
		.reset(reset), 
		.rec_complete(rec_complete), 
		.dout(dout), 
		.rx(rx)
	);
	
	// Loop variables
	reg [2:0] i;
	reg [7:0] packet;
	reg [7:0] sfd;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		rx = 0;
		
		i = 0;
		sfd = 8'b10101011;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
		
		// sfd
		rx = 1;
		#10;
		
		rx = 1;
		#10;
		
		rx = 0;
		#10;
		
		rx = 1;
		#10;
		
		rx = 0;
		#10;
		
		rx = 1;
		#10;
		
		rx = 0;
		#10;
		
		rx = 1;
		#10;
		
//		 packet 1
		packet = 8'b10010011;
//		for (i=0;i<8;i=i+1) begin
//			#10;
//			rx = packet[i];
//		end
		
		rx = 1;
		#10;
		
		rx = 1;
		#10;
		
		rx = 0;
		#10;
		
		rx = 0;
		#10;
		
		rx = 1;
		#10;
		
		rx = 0;
		#10;
		
		rx = 0;
		#10;
		
		rx = 1;
		#10;
		
//		 end of packet 1
		
		
		// sfd
		rx = 1;
		#10;
		
		rx = 1;
		#10;
		
		rx = 0;
		#10;
		
		rx = 1;
		#10;
		
		rx = 0;
		#10;
		
		rx = 1;
		#10;
		
		rx = 0;
		#10;
		
		rx = 1;
		#10;
		
		// packet 2
//		packet = 8'b00110111;
//		for (i=0;i<8;i=i+1) begin
//			#10;
//			rx = packet[i];
//		end
		
		rx = 0;
	end
	
	initial forever #5 clk=~clk;
      
endmodule

