`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:47 02/04/2021 
// Design Name: 
// Module Name:    receiver 
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
module receiver(clk, reset, rec_complete, dout, rx
    );
	 
	parameter data_pack_len = 8;
	
	input clk;
	input reset;
	input rx;
	
	output reg rec_complete;
	output reg [data_pack_len-1:0] dout;
	
	reg [1:0] state;
	parameter [1:0] state_idle = 0, state_detect_sfd = 1, state_rec_data = 2;
	
	parameter sfd_len_limit = 8;
	parameter [7:0] sfd = 8'b11010101; //10101011
	
	reg [15:0] counter;
	
	
	always @ (posedge clk) begin
		if (reset) begin
			state <= state_idle;
		end
		else
			case (state)
				state_idle: begin
					if (rx == sfd[0]) state <= state_detect_sfd;
				end
				
				state_detect_sfd: begin
					if (rx != sfd[counter]) state <= state_idle;
					else if (counter == sfd_len_limit-1) begin
						state <= state_rec_data;
//						counter <= 0;
					end
				end
				
				state_rec_data: begin
					if (counter == data_pack_len-1) begin
						state <= state_idle;
//						rec_complete <= 1;
					end
				end
				
				default: ;
			endcase
	end
	
	
	always @ (posedge clk) begin
		if (reset) begin 
			counter <= 0;
			rec_complete <= 0;
		end
		else begin
			case (state)
					state_idle: begin
						rec_complete <= 0;
						counter <= 1;
					end
					
					state_detect_sfd: begin
						rec_complete <= 0;
						if (counter < sfd_len_limit-1)
							counter <= counter + 1;
						else
							counter <= 0;
					end
					
					state_rec_data: begin
						dout[counter] <= rx;
						counter <= counter + 1;
						
						if (counter == data_pack_len-1)
							rec_complete <= 1;
					end
			endcase
		end
	end
	

endmodule
