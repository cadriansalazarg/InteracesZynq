`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2020 02:58:58 PM
// Design Name: 
// Module Name: transmitter
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


module transmitter(
        s_axi_tx_tdata_0,
        s_axi_tx_tkeep_0,
        s_axi_tx_tlast_0,
        s_axi_tx_tready_0,
        s_axi_tx_tvalid_0,
        txn_0,
        txp_0,
        drpclk_in_tx,
        init_clk_in_tx,
        gt_refclk1_tx,
        user_clk_out_tx,
        gt_reset_tx,
        tx_system_reset_0,
        tx_aligned_0,
        tx_verify_0,
        tx_reset_0,
        tx_channel_up,
        tx_hard_err,
        pll_not_locked_out_tx,
        tx_lane_up,
        tx_resetdone_out_0,
        tx_lock_tx,
        sys_reset_out_tx,
        loopback_tx,
        power_down_tx
    );
    
    // AXI RX Interface
    input [0:15]s_axi_tx_tdata_0;
    input [0:1]s_axi_tx_tkeep_0;
    input s_axi_tx_tlast_0;
    output s_axi_tx_tready_0;
    input s_axi_tx_tvalid_0;
    
    output [0:0]txn_0;
    output [0:0]txp_0;
    
    // Clocks
    input drpclk_in_tx;
    input init_clk_in_tx;
    input gt_refclk1_tx;
    output user_clk_out_tx;
    
    // Reset
    input gt_reset_tx;
    input tx_system_reset_0;
    
    // Simplex Sideband Signals 
    input tx_aligned_0;
    input tx_verify_0;
    input tx_reset_0; 
    
    // Status
    output reg tx_channel_up;
    output reg tx_hard_err;
    output pll_not_locked_out_tx;
    output reg tx_lane_up;
    output tx_resetdone_out_0;
    output tx_lock_tx;
    output sys_reset_out_tx;
    
    // Control
    input [2:0] loopback_tx;
    input power_down_tx;
    
    wire drpclk_in_0;
    wire init_clk_in_0;
    wire gt_refclk1_0;
    wire user_clk_out_0;
    wire gt_reset_0;
    wire pll_not_locked_out_0;
    wire tx_lock_0;
    wire sys_reset_out_0;
    wire [2:0] loopback_0;
    wire power_down_0;
    
    wire tx_hard_err_0;
    wire tx_lane_up_0;
    wire tx_channel_up_0;
    
    reg aligned_signal_i;
    reg verify_signal_i;
    reg reset_signal_i;
    
    
    simplex_tx simplex_tx_i(
        // AXI TX Interface
        .s_axi_tx_tdata_0(s_axi_tx_tdata_0),
        .s_axi_tx_tkeep_0(s_axi_tx_tkeep_0),
        .s_axi_tx_tlast_0(s_axi_tx_tlast_0),
        .s_axi_tx_tready_0(s_axi_tx_tready_0),
        .s_axi_tx_tvalid_0(s_axi_tx_tvalid_0),
        .txn_0(txn_0),
        .txp_0(txp_0),
        
        // Clocks
        .drpclk_in_0(drpclk_in_0),
        .init_clk_in_0(init_clk_in_0),
        .gt_refclk1_0(gt_refclk1_0),  
        .user_clk_out_0(user_clk_out_0), 
        
        // Resets
        .gt_reset_0(gt_reset_0),
        .tx_system_reset_0(tx_system_reset_0),
        
        // Simplex Sideband Signals 
        .tx_aligned_0(aligned_signal_i),
        .tx_verify_0(verify_signal_i),
        .tx_reset_0(reset_signal_i),
        
        //Status
        .tx_channel_up_0(tx_channel_up_0),
        .tx_hard_err_0(tx_hard_err_0),
        .pll_not_locked_out_0(pll_not_locked_out_0),
        .tx_lane_up_0(tx_lane_up_0),
        .tx_resetdone_out_0(tx_resetdone_out_0),
        .tx_lock_0(tx_lock_0),
        .sys_reset_out_0(sys_reset_out_0),
             
         // Control
        .loopback_0(loopback_0),
        .power_down_0(power_down_0)
    );
      
      
    // ___________________________  Renaming ___________________________________________
    assign drpclk_in_0 = drpclk_in_tx;
    assign init_clk_in_0 = init_clk_in_tx;
    assign gt_refclk1_0 = gt_refclk1_tx;
    assign user_clk_out_tx = user_clk_out_0;
    
    assign gt_reset_0 = gt_reset_tx;
    
    assign pll_not_locked_out_tx = pll_not_locked_out_0;
    assign tx_lock_tx = tx_lock_0;
    assign sys_reset_out_tx = sys_reset_out_0;
    assign loopback_0 = loopback_tx;
    assign power_down_0 = power_down_tx;  
        
    //____________________________Register User I/O___________________________________

    // Register User Outputs from core.
    always @(posedge user_clk_out_0)
    begin
        tx_hard_err       <=  tx_hard_err_0;
        tx_lane_up          <=  tx_lane_up_0;
        tx_channel_up       <=  tx_channel_up_0;
    end

    always @(posedge user_clk_out_0) begin
        aligned_signal_i <= tx_aligned_0;
        verify_signal_i  <= tx_verify_0;
        reset_signal_i   <= tx_reset_0;
    end
        
endmodule
