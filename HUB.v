`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:06 02/12/2021 
// Design Name: 
// Module Name:    HUB 
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
module HUB(clk, reset, tx0, rx0, tx1, rx1, tx2, rx2, tx3, rx3
    );

	parameter data_packet_bytes_count = 6 + 6 + 70;
	parameter data_size = (data_packet_bytes_count)*8;
	
	input clk, reset;
	
	input rx0, rx1, rx2, rx3;
	output tx0, tx1, tx2, tx3;

	// Port0 Connections
	wire [data_size-1:0] d_p0_w2, d_p0_w3, d_p0_w5;
	wire d_p0_w1, d_p0_w4, d_p0_w6, d_p0_w7, d_p0_w8;
	
	and(d_p0_w8, !d_p0_w6, d_p0_w7);

	// Port1 Connections
	wire [data_size-1:0] d_p1_w2, d_p1_w3, d_p1_w5;
	wire d_p1_w1, d_p1_w4, d_p1_w6, d_p1_w7, d_p1_w8;
	
	and(d_p1_w8, !d_p1_w6, d_p1_w7);
	
	// Port2 Connections
	wire [data_size-1:0] d_p2_w2, d_p2_w3, d_p2_w5;
	wire d_p2_w1, d_p2_w4, d_p2_w6, d_p2_w7, d_p2_w8;
	
	and(d_p2_w8, !d_p2_w6, d_p2_w7);
	
	// Port3 Connections
	wire [data_size-1:0] d_p3_w2, d_p3_w3, d_p3_w5;
	wire d_p3_w1, d_p3_w4, d_p3_w6, d_p3_w7, d_p3_w8;
	
	and(d_p3_w8, !d_p3_w6, d_p3_w7);

	
	// Main Distribution module (DA BAD BOI)
	Destributor #(.data_len(data_size)) distrib_inst 
						(.clk(clk), .reset(reset),
						 .din0(d_p0_w2), .din1(d_p1_w2), .din2(d_p2_w2), .din3(d_p3_w2),
						 .inv0(d_p0_w1), .inv1(d_p1_w1), .inv2(d_p2_w1), .inv3(d_p3_w1),
						 .dout0(d_p0_w3), .dout1(d_p1_w3), .dout2(d_p2_w3), .dout3(d_p3_w3),
						 .outv0(d_p0_w4), .outv1(d_p1_w4), .outv2(d_p2_w4), .outv3(d_p3_w4)
	);
	
	// Port0 modules
	Port #(.data_len(data_size)) port_inst0 (.clk(clk), .reset(reset),
															.tr_start(d_p0_w8), .din(d_p0_w5),
															.tr_free(d_p0_w7), .tx(tx0), .rec_complete(d_p0_w1),
															.dout(d_p0_w2), .rx(rx0));
	
	FIFO #(.data_size(data_size)) fifo_inst0 (.clk(clk), .reset(reset),
								.r(d_p0_w8), .w(d_p0_w4), .din(d_p0_w3),
								.is_empty(d_p0_w6), .is_full(),
								.dout(d_p0_w5));
	
	// Port1 modules
	Port #(.data_len(data_size)) port_inst1 (.clk(clk), .reset(reset),
															.tr_start(d_p1_w8), .din(d_p1_w5),
															.tr_free(d_p1_w7), .tx(tx1), .rec_complete(d_p1_w1),
															.dout(d_p1_w2), .rx(rx1));
	
	FIFO #(.data_size(data_size)) fifo_inst1 (.clk(clk), .reset(reset),
								.r(d_p1_w8), .w(d_p1_w4), .din(d_p1_w3),
								.is_empty(d_p1_w6), .is_full(),
								.dout(d_p1_w5));

	// Port2 modules
	Port #(.data_len(data_size)) port_inst2 (.clk(clk), .reset(reset),
															.tr_start(d_p2_w8), .din(d_p2_w5),
															.tr_free(d_p2_w7), .tx(tx2), .rec_complete(d_p2_w1),
															.dout(d_p2_w2), .rx(rx2));
	
	FIFO #(.data_size(data_size)) fifo_inst2 (.clk(clk), .reset(reset),
								.r(d_p2_w8), .w(d_p2_w4), .din(d_p2_w3),
								.is_empty(d_p2_w6), .is_full(),
								.dout(d_p2_w5));
	
	// Port3 modules
	Port #(.data_len(data_size)) port_inst3 (.clk(clk), .reset(reset),
															.tr_start(d_p3_w8), .din(d_p3_w5),
															.tr_free(d_p3_w7), .tx(tx3), .rec_complete(d_p3_w1),
															.dout(d_p3_w2), .rx(rx3));
	
	FIFO #(.data_size(data_size)) fifo_inst3 (.clk(clk), .reset(reset),
								.r(d_p3_w8), .w(d_p3_w4), .din(d_p3_w3),
								.is_empty(d_p3_w6), .is_full(),
								.dout(d_p3_w5));

endmodule








