`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:39:41 09/09/2020 
// Design Name: 
// Module Name:    Aurora_ctrl 
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
module Aurora_ctrl #(parameter PACKET_SIZE = 128, TX_TDATA_SIZE = 32, COUNTER_BITS = 2, RX_TDATA_SIZE = 32)  
(init_clk,  RST, tx_reset, gt_reset, 
user_clk, s_axi_tx_tready, s_axi_tx_tlast, s_axi_tx_tvalid, s_axi_tx_tdata, d_out, empty,  rd_en,
din, wr_en, full, Error, m_axi_rx_tdata, m_axi_rx_tlast, m_axi_rx_tvalid

    );
	 
	 input init_clk, RST;
	 output tx_reset, gt_reset;
	 
	 input s_axi_tx_tready;
	 output  s_axi_tx_tlast, s_axi_tx_tvalid;	
	 output [0:TX_TDATA_SIZE-1] s_axi_tx_tdata;
	 
	 input [(PACKET_SIZE-8)-1: 0] d_out;
	 input empty;
	 output rd_en;
	 
	 output [PACKET_SIZE-1:0]  din ;
	 output wr_en;
	 input full;
	 output Error;
	 
	 input [RX_TDATA_SIZE-1:0] m_axi_rx_tdata;
	 input m_axi_rx_tlast, m_axi_rx_tvalid;
	 
	 
	 input user_clk;
	 
	 wire start;
	 
	 Aurora_init Aurora_init_module (
    .init_clk(init_clk), 
    .RST(RST), 
    .tx_reset(tx_reset),
	 .start(start),	 
    .gt_reset(gt_reset)
    );
	 
	 
	 // Transmitter instantiation 
	 transmitter #(.PACKET_SIZE(PACKET_SIZE), .TX_TDATA_SIZE(TX_TDATA_SIZE),  .COUNTER_BITS(COUNTER_BITS))   Aurora_TX (
    .user_clk(user_clk), 
    .RST(RST), 
    .start(start), 
    .s_axi_tx_tlast(s_axi_tx_tlast), 
    .s_axi_tx_tready(s_axi_tx_tready), 
    .s_axi_tx_tdata(s_axi_tx_tdata), 
    .s_axi_tx_tvalid(s_axi_tx_tvalid), 
    .d_out(d_out), 
    .rd_en(rd_en), 
    .empty(empty)
    );
	 
	 
	 // Instantiate the module
	 receiver #(.PACKET_SIZE(PACKET_SIZE), .RX_TDATA_SIZE(RX_TDATA_SIZE)) Aurora_RX (
    .user_clk(user_clk), 
    .RST(RST), 
    .start(start), 
    .din(din), 
    .wr_en(wr_en), 
    .full(full), 
    .m_axi_rx_tdata(m_axi_rx_tdata), 
    .m_axi_rx_tlast(m_axi_rx_tlast), 
    .m_axi_rx_tvalid(m_axi_rx_tvalid), 
    .Error(Error)
    );


endmodule

