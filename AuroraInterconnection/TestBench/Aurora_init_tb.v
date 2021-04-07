`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 11:09:30 PM
// Design Name: 
// Module Name: Aurora_init_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Aurora_init_tb;
    // inputs
    reg init_clk;
    reg RST;
    reg channel_up;
    
    // outputs
    wire reset_Aurora;
    wire gt_reset;
    wire reset_TX_RX_Block;

    Aurora_init uut (
        .init_clk(init_clk), 
        .RST(RST), 
        .channel_up(channel_up), 
        .reset_Aurora(reset_Aurora), 
        .gt_reset(gt_reset), 
        .reset_TX_RX_Block(reset_TX_RX_Block)
    );
    
    initial begin
        init_clk = 0;
        RST = 0;
        channel_up = 0;
        
        #40 RST = 1;
        #400 RST = 0;
        
        #6000 channel_up = 1;

    end
    
    initial forever #4 init_clk = ~init_clk;


endmodule
