`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:34 02/04/2021 
// Design Name: 
// Module Name:    Destributor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Destributor(clk, reset,
						 din0, din1, din2, din3,
						 inv0, inv1, inv2, inv3,
						 dout0, dout1, dout2, dout3,
						 outv0, outv1, outv2, outv3
    );

	parameter data_len = 8;

	input clk, reset;
	input [data_len-1:0] din0, din1, din2, din3;
	input inv0, inv1, inv2, inv3;
	
	output reg [data_len-1:0] dout0, dout1, dout2, dout3;
	output reg outv0, outv1, outv2, outv3;
	
	parameter [1:0] s0 = 0, s1 = 1, s2 = 2, s3 = 3;
	reg [1:0] state;
	
	reg [data_len-1:0] memory [0:3];
	reg memory_valid [0:3];
	reg [2:0] i, j;
	
	always @ (posedge clk) begin
		// Update current memory status
		if (inv0) begin
			memory[0] = din0;
			memory_valid[0] = 1;
		end
		if (inv1)begin
			memory[1] = din1;
			memory_valid[1] = 1;
		end
		if (inv2)begin
			memory[2] = din2;
			memory_valid[2] = 1;
		end
		if (inv3)begin
			memory[3] = din3;
			memory_valid[3] = 1;
		end
		
		// Turn all previous output validations off
		outv0 = 0;
		outv1 = 0;
		outv2 = 0;
		outv3 = 0;

		// Manage the state machine and other stuff.
		if (reset) begin
			for (j=0; j<4; j=j+1) begin
				memory[j] = 0;
				memory_valid[j] = 0;
			end
			
			dout0 = 0;
			dout1 = 0;
			dout2 = 0;
			dout3 = 0;
			
			outv0 = 0;
			outv1 = 0;
			outv2 = 0;
			outv3 = 0;
			
			state = s0;
		end
		else begin
			case (state)
				s0: begin
					if (memory_valid[0]) begin
						dout1 = memory[0];
						outv1 = 1;
						
						dout2 = memory[0];
						outv2 = 1;
						
						dout3 = memory[0];
						outv3 = 1;
					end
					
					memory_valid[0] = 0;
//					outv0 <= 0;
				end
				
				s1: begin
					if (memory_valid[1]) begin
						dout0 = memory[1];
						outv0 = 1;
						
						dout2 = memory[1];
						outv2 = 1;
						
						dout3 = memory[1];
						outv3 = 1;
					end
					
					memory_valid[1] = 0;
//					outv1 <= 0;
				end
				
				s2: begin
					if (memory_valid[2]) begin
						dout0 = memory[2];
						outv0 = 1;
						
						dout1 = memory[2];
						outv1 = 1;
						
						dout3 = memory[2];
						outv3 = 1;
					end
					
					memory_valid[2] = 0;
//					outv2 <= 0;
				end
				
				s3: begin
					if (memory_valid[3]) begin
						dout0 = memory[3];
						outv0 = 1;
						
						dout1 = memory[3];
						outv1 = 1;
						
						dout2 = memory[3];
						outv2 = 1;
					end
					
					memory_valid[3] = 0;
//					outv3 <= 0;
				end
			endcase
		
		state = state + 1;
		end
	end
	
endmodule
