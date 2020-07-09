//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Tue Jul  7 23:43:23 2020
//Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
//Command     : generate_target simplex_rx_wrapper.bd
//Design      : simplex_rx_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module simplex_rx_wrapper
   (drpclk_in_0,
    frame_err_0,
    gt_refclk1_0,
    gt_reset_0,
    init_clk_in_0,
    link_reset_out_0,
    loopback_0,
    m_axi_rx_tdata_0,
    m_axi_rx_tkeep_0,
    m_axi_rx_tlast_0,
    m_axi_rx_tvalid_0,
    pll_not_locked_out_0,
    power_down_0,
    rx_aligned_0,
    rx_channel_up_0,
    rx_hard_err_0,
    rx_lane_up_0,
    rx_reset_0,
    rx_resetdone_out_0,
    rx_system_reset_0,
    rx_verify_0,
    rxn_0,
    rxp_0,
    soft_err_0,
    sys_reset_out_0,
    tx_lock_0,
    user_clk_out_0);
  input drpclk_in_0;
  output frame_err_0;
  input gt_refclk1_0;
  input gt_reset_0;
  input init_clk_in_0;
  output link_reset_out_0;
  input [2:0]loopback_0;
  output [0:15]m_axi_rx_tdata_0;
  output [0:1]m_axi_rx_tkeep_0;
  output m_axi_rx_tlast_0;
  output m_axi_rx_tvalid_0;
  output pll_not_locked_out_0;
  input power_down_0;
  output rx_aligned_0;
  output rx_channel_up_0;
  output rx_hard_err_0;
  output [0:0]rx_lane_up_0;
  output rx_reset_0;
  output rx_resetdone_out_0;
  input rx_system_reset_0;
  output rx_verify_0;
  input [0:0]rxn_0;
  input [0:0]rxp_0;
  output soft_err_0;
  output sys_reset_out_0;
  output tx_lock_0;
  output user_clk_out_0;

  wire drpclk_in_0;
  wire frame_err_0;
  wire gt_refclk1_0;
  wire gt_reset_0;
  wire init_clk_in_0;
  wire link_reset_out_0;
  wire [2:0]loopback_0;
  wire [0:15]m_axi_rx_tdata_0;
  wire [0:1]m_axi_rx_tkeep_0;
  wire m_axi_rx_tlast_0;
  wire m_axi_rx_tvalid_0;
  wire pll_not_locked_out_0;
  wire power_down_0;
  wire rx_aligned_0;
  wire rx_channel_up_0;
  wire rx_hard_err_0;
  wire [0:0]rx_lane_up_0;
  wire rx_reset_0;
  wire rx_resetdone_out_0;
  wire rx_system_reset_0;
  wire rx_verify_0;
  wire [0:0]rxn_0;
  wire [0:0]rxp_0;
  wire soft_err_0;
  wire sys_reset_out_0;
  wire tx_lock_0;
  wire user_clk_out_0;

  simplex_rx simplex_rx_i
       (.drpclk_in_0(drpclk_in_0),
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
        .rx_aligned_0(rx_aligned_0),
        .rx_channel_up_0(rx_channel_up_0),
        .rx_hard_err_0(rx_hard_err_0),
        .rx_lane_up_0(rx_lane_up_0),
        .rx_reset_0(rx_reset_0),
        .rx_resetdone_out_0(rx_resetdone_out_0),
        .rx_system_reset_0(rx_system_reset_0),
        .rx_verify_0(rx_verify_0),
        .rxn_0(rxn_0),
        .rxp_0(rxp_0),
        .soft_err_0(soft_err_0),
        .sys_reset_out_0(sys_reset_out_0),
        .tx_lock_0(tx_lock_0),
        .user_clk_out_0(user_clk_out_0));
endmodule
