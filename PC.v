`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:56 02/13/2021 
// Design Name: 
// Module Name:    PC 
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
module PC(clk, reset, mac_address, tx, rx
    );

	parameter data_len = 8;
	
	input clk, reset;
	input [12*8-1:0] mac_address;
	input rx;
	output tx;
	
	integer fin, fout, i, count;
	reg tr_started;
	reg temp_bit;

	reg [data_len-1:0] din;
	reg tr_start;
	wire tr_free, rec_complete;
	wire [data_len-1:0] dout;
	
	Port #(.data_len(data_len)) port_inst (
		.clk(clk), 
		.reset(reset), 
		.tr_start(tr_start), 
		.din(din), 
		.tr_free(tr_free), 
		.tx(tx), 
		.rec_complete(rec_complete), 
		.dout(dout), 
		.rx(rx)
	);
	
	always @ (posedge clk) begin
		if (reset) begin
			fin = $fopen({mac_address, "_input.txt"}, "r");
			fout = $fopen({mac_address, "_result.txt"}, "w");
			tr_start = 0;
			din = 0;
			count = 0;
		end
		else begin
			if (fin != 0 && tr_free && !$feof(fin)) begin
				$fscanf(fin, "%b\n", din);
				tr_start = 1;
			end
			else
				tr_start = 0;
			
			if (rec_complete) begin
				for(i=0; i<data_len; i=i+1)
					$fwrite(fout, "%b", dout[i]);
				$fwrite(fout, "\n");
			end
		end
	end

endmodule








