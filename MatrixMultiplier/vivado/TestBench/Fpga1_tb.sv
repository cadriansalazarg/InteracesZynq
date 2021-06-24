`timescale 1ns / 1ps

module Fpga1_tb;
    // Outputs
    wire channel_up_0;
    wire channel_up_1;
    
    wire [0:0]txn_0;
    wire [0:0]txp_0;
    wire [0:0]txn_1;
    wire [0:0]txp_1;
    
    // Inputs
    reg clk_200MHz_n;
    reg clk_200MHz_p;
    reg peripheral_reset;
    
    wire [0:0]rxn_0;
    wire [0:0]rxp_0;
    wire [0:0]rxn_1;
    wire [0:0]rxp_1;
    
    FPGA1_design_wrapper uut (
    .channel_up_0(channel_up_0),
    .channel_up_1(channel_up_1),
    .clk_200MHz_n(clk_200MHz_n),
    .clk_200MHz_p(clk_200MHz_p),
    .peripheral_reset(peripheral_reset),
    .rxn_0(rxn_0),
    .rxn_1(rxn_1),
    .rxp_0(rxp_0),
    .rxp_1(rxp_1),
    .txn_0(txn_0),
    .txn_1(txn_1),
    .txp_0(txp_0),
    .txp_1(txp_1)
    );
    
    initial begin
        clk_200MHz_n = 0;
        clk_200MHz_p = 1;
        peripheral_reset = 1;
        
        #1000 peripheral_reset = 0;
    end
    
    initial forever #2.5 clk_200MHz_n = ~clk_200MHz_n;
    initial forever #2.5 clk_200MHz_p = ~clk_200MHz_p;
    
    assign rxn_0 = txn_0;
    assign rxp_0 = txp_0;
    
    
    
endmodule
