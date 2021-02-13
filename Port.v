`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:25 02/05/2021 
// Design Name: 
// Module Name:    Port 
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
module Port(clk, reset, tr_start, din, tr_free, tx, rec_complete, dout, rx
    );
	 
	parameter data_len = 8;
	
	input clk;
	input reset;
	input tr_start;
	input [data_len-1:0] din;
	input rx;
	
	output tr_free;
	output tx;
	output rec_complete;
	output [data_len-1:0] dout;
	
	Transmitter #(.data_len(data_len)) trns_inst (.clk(clk), .reset(reset), .din(din), .tr_start(tr_start), .tr_free(tr_free), .tx(tx));
	
	
	receiver #(.data_pack_len(data_len)) rec_inst (.clk(clk), .reset(reset), .rec_complete(rec_complete), .dout(dout), .rx(rx));


endmodule
