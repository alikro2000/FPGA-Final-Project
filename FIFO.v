`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:32 02/12/2021 
// Design Name: 
// Module Name:    FIFO 
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
module FIFO(clk, reset, r, w, din, is_empty, is_full, dout
    );
	
	parameter data_size = 8;
	parameter depth = 8;
	
	input clk, reset;
	input r, w;
	input [data_size-1:0] din;
	
	output is_empty;
	output is_full;
	output reg [data_size-1:0] dout;
	
	reg [data_size-1:0] memory [0:depth-1];
	reg [7:0] left, right, i, count;
	
	always @ (posedge clk) begin
		if (reset) begin
			for (i=0; i<depth; i=i+1)
				memory[i] = 0;
			left = 0;
			right = 0;
			count = 0;
			dout = 0;
		end
		else begin
			if (w && !is_full) begin
				memory[right] = din;
				if (right == depth - 1)
					right = 0;
				else
					right = right + 1;
				count = count + 1;
			end
			if (r && !is_empty) begin
				dout = memory[left];
				if (left == depth - 1)
					left = 0;
				else
					left = left + 1;
				count = count - 1;
			end
		end
	end

	assign is_empty = (count==0) ? 1 : 0;
	assign is_full = (count==depth) ? 1 : 0;

endmodule
