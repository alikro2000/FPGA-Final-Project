`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:19 02/04/2021 
// Design Name: 
// Module Name:    Transmitter 
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
module Transmitter(clk, reset, din, tr_start, tr_free, tx
    );
	
	parameter data_len = 8;
	
	input clk;
	input reset;
	input tr_start;
	
	input [data_len-1:0] din;
	
	reg [data_len-1:0] data;
	
	output reg tr_free;
	output reg tx;
	
	reg [1:0] state;
	parameter [1:0] state_idle = 0, state_get_data = 3, state_sfd = 1, state_data_tr = 2;
	
	parameter sfd_len_limit = 8;
	parameter [7:0] sfd = 8'b11010101;
	
	reg [15:0] counter;
	
	always @ (posedge clk) begin
		if (reset) begin
			state <= state_idle;
		end
		else begin
			case (state)
				state_idle: begin
					if (tr_start) begin
//						state <= state_get_data;
						state <= state_sfd;
//						data <= din;
					end
				end
				
				state_get_data: begin
					state <= state_sfd;
				end
				
				state_sfd: begin
					if (counter == sfd_len_limit-1) begin
						state <= state_data_tr;
//						counter <= 0;
					end
				end
				
				state_data_tr: begin
					if (counter == data_len-1) begin
						state <= state_idle;
//						counter <= 0;
//						tr_free <= 1;
					end
				end
				default: ;
			endcase
		end
	end


	always @ (posedge clk) begin
		if (reset) begin
			counter <= 0;
			tr_free <= 1;
			tx <= 0;
		end
		else begin
			case (state)
				state_idle: begin
					data <= din;					
					counter <= 0;
					tx <= 0;
					if (tr_start) begin
						tr_free <= 0;
					end
					else
						tr_free <= 1;
				end
				
				state_get_data: begin
					data <= din;					
				end
				
				state_sfd: begin
					tr_free <= 0;
					tx <= sfd[counter];
					counter <= counter + 1;
					
					if (counter == sfd_len_limit-1)
						counter <= 0;
				end
				
				state_data_tr: begin
					tx <= data[counter];
					counter <= counter + 1;
				end
			endcase
		end
	end

endmodule
