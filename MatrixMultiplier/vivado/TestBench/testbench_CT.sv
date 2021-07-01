`timescale 1ns / 1ps

module testbench_CT;
 
    wire channel_up_M0;
    wire channel_up_M1;
    wire channel_up_M2;
    wire channel_up_M3;
    
    wire channel_up_S1;
    wire channel_up_S2;
    wire channel_up_S3;
    
    reg clk_200MHz_n;
    reg clk_200MHz_p;
    
    reg peripheral_reset;
     
    wire rxn_0;
    wire rxn_1;
    wire rxn_2;
    wire rxn_3;
    
    wire rxp_0;
    wire rxp_1;
    wire rxp_2;
    wire rxp_3;
    
    wire txn_0;
    wire txn_1;
    wire txn_2;
    wire txn_3;
    
    wire txp_0;
    wire txp_1;
    wire txp_2;
    wire txp_3;
   


    Master_FPGA1_wrapper Master (
    .channel_up_0(channel_up_M0),
    .channel_up_1(channel_up_M1),
    .channel_up_2(channel_up_M2),
    .channel_up_3(channel_up_M3),
    .clk_200MHz_n(clk_200MHz_n),
    .clk_200MHz_p(clk_200MHz_p),
    .peripheral_reset(peripheral_reset),
    .rxn_0(rxn_0),
    .rxn_1(rxn_1),
    .rxn_2(rxn_2),
    .rxn_3(rxn_3),
    .rxp_0(rxp_0),
    .rxp_1(rxp_1),
    .rxp_2(rxp_2),
    .rxp_3(rxp_3),
    .txn_0(txn_0),
    .txn_1(txn_1),
    .txn_2(txn_2),
    .txn_3(txn_3),
    .txp_0(txp_0),
    .txp_1(txp_1),
    .txp_2(txp_2),
    .txp_3(txp_3)
    );
    
    Slave_FPGA2_wrapper Slave_FPGA1(
    .channel_up_0(channel_up_S1),
    .clk_200MHz_n(clk_200MHz_n),
    .clk_200MHz_p(clk_200MHz_p),
    .peripheral_reset(peripheral_reset),
    .rxn_0(txn_0),
    .rxp_0(txp_0),
    .txn_0(rxn_0),
    .txp_0(rxp_0)
    );
    
    Slave_FPGA2_wrapper Slave_FPGA2(
    .channel_up_0(channel_up_S2),
    .clk_200MHz_n(clk_200MHz_n),
    .clk_200MHz_p(clk_200MHz_p),
    .peripheral_reset(peripheral_reset),
    .rxn_0(txn_1),
    .rxp_0(txp_1),
    .txn_0(rxn_1),
    .txp_0(rxp_1)
    );
    
    Slave_FPGA2_wrapper Slave_FPGA3(
    .channel_up_0(channel_up_S3),
    .clk_200MHz_n(clk_200MHz_n),
    .clk_200MHz_p(clk_200MHz_p),
    .peripheral_reset(peripheral_reset),
    .rxn_0(txn_2),
    .rxp_0(txp_2),
    .txn_0(rxn_2),
    .txp_0(rxp_2)
    );
    
    assign rxn_3 = txn_3;
    assign rxp_3 = txp_3;
    
    initial begin
        clk_200MHz_n = 0;
        clk_200MHz_p = 1;
        peripheral_reset = 1;        
        #16 peripheral_reset = 0;
        
    end
    
    always #2.5 clk_200MHz_n = ~clk_200MHz_n;
    always #2.5 clk_200MHz_p = ~clk_200MHz_p;
    
endmodule