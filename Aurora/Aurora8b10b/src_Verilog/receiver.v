`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2020 12:55:06 AM
// Design Name: 
// Module Name: receiver
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


module receiver(
    m_axi_rx_tdata_0,
    m_axi_rx_tkeep_0,
    m_axi_rx_tlast_0,
    m_axi_rx_tvalid_0,
    rxn_0,
    rxp_0,
    drpclk_in_rx,
    init_clk_in_rx,
    gt_refclk1_rx,
    user_clk_out_rx,
    gt_reset_rx,
    rx_system_reset_0,
    rx_aligned_0,
    rx_verify_0,
    rx_reset_0,
    rx_channel_up,
    rx_hard_err,
    frame_err_rx,
    pll_not_locked_out_rx,
    rx_lane_up,
    rx_resetdone_out_0,
    soft_err_rx,
    tx_lock_rx,
    sys_reset_out_rx,
    link_reset_out_rx,
    loopback_rx,
    power_down_rx
    );
    
    // AXI RX Interface
    output [0:15]m_axi_rx_tdata_0;
    output [0:1]m_axi_rx_tkeep_0;
    output m_axi_rx_tlast_0;
    output m_axi_rx_tvalid_0;
    
    input [0:0]rxn_0;
    input [0:0]rxp_0;
    
    // Clocks
    input drpclk_in_rx;
    input init_clk_in_rx;
    input gt_refclk1_rx;
    output user_clk_out_rx;
    
    // Reset
    input gt_reset_rx;
    input rx_system_reset_0;
    
    // Simplex Sideband Signals 
    output rx_aligned_0;
    output rx_verify_0;
    output rx_reset_0;
    
    // Status
    output reg rx_channel_up;
    output reg rx_hard_err;
    output reg frame_err_rx;
    output pll_not_locked_out_rx;
    output reg [0:0]rx_lane_up;
    output rx_resetdone_out_0;
    output reg soft_err_rx;
    output tx_lock_rx;
    output sys_reset_out_rx;
    output link_reset_out_rx;
    
    // Control  
    input [2:0]loopback_rx;
    input power_down_rx;
    
    wire drpclk_in_0;
    wire init_clk_in_0;
    wire gt_refclk1_0;
    wire user_clk_out_0;
    wire gt_reset_0;
    wire soft_err_0;
    wire frame_err_0;
    wire pll_not_locked_out_0;
    wire tx_lock_0;
    wire sys_reset_out_0;
    wire link_reset_out_0;
    wire [2:0]loopback_0;
    wire power_down_0;
    
    wire rx_hard_err_0;
    wire rx_lane_up_0;
    wire rx_channel_up_0;
    
    wire aligned_signal;
    wire verify_signal;
    wire reset_signal;
    
    reg [0:3] verify_signal_extend;
    reg [0:3] aligned_signal_extend;
    reg [0:3] reset_signal_extend;
    
           
    simplex_rx simplex_rx_i(
        .drpclk_in_0(drpclk_in_0),
        .frame_err_0(frame_err_0),
        .gt_refclk1_0(gt_refclk1_0),
        .gt_reset_0(gt_reset_0),
        .init_clk_in_0(init_clk_in_0),
        .link_reset_out_0(link_reset_out_0),
        .loopback_0(loopback_0),
        .m_axi_rx_tdata_0(m_axi_rx_tdata_0),
        .m_axi_rx_tkeep_0(m_axi_rx_tkeep_0),
        .m_axi_rx_tlast_0(m_axi_rx_tlast_0),
        .m_axi_rx_tvalid_0(m_axi_rx_tvalid_0),
        .pll_not_locked_out_0(pll_not_locked_out_0),
        .power_down_0(power_down_0),
        .rx_aligned_0(aligned_signal),
        .rx_channel_up_0(rx_channel_up_0),
        .rx_hard_err_0(rx_hard_err_0),
        .rx_lane_up_0(rx_lane_up_0),
        .rx_reset_0(reset_signal),
        .rx_resetdone_out_0(rx_resetdone_out_0),
        .rx_system_reset_0(rx_system_reset_0),
        .rx_verify_0(verify_signal),
        .rxn_0(rxn_0),
        .rxp_0(rxp_0),
        .soft_err_0(soft_err_0),
        .sys_reset_out_0(sys_reset_out_0),
        .tx_lock_0(tx_lock_0),
        .user_clk_out_0(user_clk_out_0)
    );
    
    
    // ___________________________  Renaming ___________________________________________
    assign drpclk_in_0 = drpclk_in_rx;
    assign init_clk_in_0 = init_clk_in_rx;
    assign gt_refclk1_0 = gt_refclk1_rx;
    assign user_clk_out_rx = user_clk_out_0;
    
    assign gt_reset_0 = gt_reset_rx;
    
    assign pll_not_locked_out_rx = pll_not_locked_out_0;
    assign tx_lock_rx = tx_lock_0;
    assign sys_reset_out_rx = sys_reset_out_0;
    assign link_reset_out_rx = link_reset_out_0;
    assign loopback_0 = loopback_rx;
    assign power_down_0 = power_down_rx;
    
    // Initialising the simplex sideband aligned signal to ensure that it starts-up at 0
    initial aligned_signal_extend = 4'd0;
       
    // extending aligned simplex sideband signal
    always @(posedge user_clk_out_0)
        aligned_signal_extend    <=  {aligned_signal_extend[1:3],aligned_signal};

    assign  rx_aligned_0 =   |aligned_signal_extend;
    
    // Initialising the simplex sideband verify signal to ensure that it starts-up at 0
    initial verify_signal_extend = 4'd0;

    // extending verify simplex sideband signal
    always @(posedge user_clk_out_0)
        verify_signal_extend    <=  {verify_signal_extend[1:3],verify_signal};


    assign  rx_verify_0 =   |verify_signal_extend;

    // Initialising the simplex sideband reset signal to ensure that it starts-up at 0
    initial reset_signal_extend = 4'd0;

    // extending reset simplex sideband signal
    always @(posedge user_clk_out_0)
        reset_signal_extend    <=  {reset_signal_extend[1:3],reset_signal};


    assign  rx_reset_0 =   |reset_signal_extend;
        
    // Register User Outputs from core.
    always @(posedge user_clk_out_0) begin
        rx_hard_err <= rx_hard_err_0;
        soft_err_rx <= soft_err_0;
        frame_err_rx <= frame_err_0;
        rx_lane_up <= rx_lane_up_0;
        rx_channel_up <=  rx_channel_up_0;
    end

endmodule