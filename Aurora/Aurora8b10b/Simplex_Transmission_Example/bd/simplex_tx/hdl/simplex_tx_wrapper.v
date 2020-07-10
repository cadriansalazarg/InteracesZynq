//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Wed Jul  8 13:13:56 2020
//Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
//Command     : generate_target simplex_tx_wrapper.bd
//Design      : simplex_tx_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module simplex_tx_wrapper
   (drpclk_in_0,
    gt_refclk1_0,
    gt_reset_0,
    init_clk_in_0,
    loopback_0,
    pll_not_locked_out_0,
    power_down_0,
    s_axi_tx_tdata_0,
    s_axi_tx_tkeep_0,
    s_axi_tx_tlast_0,
    s_axi_tx_tready_0,
    s_axi_tx_tvalid_0,
    sys_reset_out_0,
    tx_aligned_0,
    tx_channel_up_0,
    tx_hard_err_0,
    tx_lane_up_0,
    tx_lock_0,
    tx_reset_0,
    tx_resetdone_out_0,
    tx_system_reset_0,
    tx_verify_0,
    txn_0,
    txp_0,
    user_clk_out_0);
  input drpclk_in_0;
  input gt_refclk1_0;
  input gt_reset_0;
  input init_clk_in_0;
  input [2:0]loopback_0;
  output pll_not_locked_out_0;
  input power_down_0;
  input [0:15]s_axi_tx_tdata_0;
  input [0:1]s_axi_tx_tkeep_0;
  input s_axi_tx_tlast_0;
  output s_axi_tx_tready_0;
  input s_axi_tx_tvalid_0;
  output sys_reset_out_0;
  input tx_aligned_0;
  output tx_channel_up_0;
  output tx_hard_err_0;
  output [0:0]tx_lane_up_0;
  output tx_lock_0;
  input tx_reset_0;
  output tx_resetdone_out_0;
  input tx_system_reset_0;
  input tx_verify_0;
  output [0:0]txn_0;
  output [0:0]txp_0;
  output user_clk_out_0;

  wire drpclk_in_0;
  wire gt_refclk1_0;
  wire gt_reset_0;
  wire init_clk_in_0;
  wire [2:0]loopback_0;
  wire pll_not_locked_out_0;
  wire power_down_0;
  wire [0:15]s_axi_tx_tdata_0;
  wire [0:1]s_axi_tx_tkeep_0;
  wire s_axi_tx_tlast_0;
  wire s_axi_tx_tready_0;
  wire s_axi_tx_tvalid_0;
  wire sys_reset_out_0;
  wire tx_aligned_0;
  wire tx_channel_up_0;
  wire tx_hard_err_0;
  wire [0:0]tx_lane_up_0;
  wire tx_lock_0;
  wire tx_reset_0;
  wire tx_resetdone_out_0;
  wire tx_system_reset_0;
  wire tx_verify_0;
  wire [0:0]txn_0;
  wire [0:0]txp_0;
  wire user_clk_out_0;

  simplex_tx simplex_tx_i
       (.drpclk_in_0(drpclk_in_0),
        .gt_refclk1_0(gt_refclk1_0),
        .gt_reset_0(gt_reset_0),
        .init_clk_in_0(init_clk_in_0),
        .loopback_0(loopback_0),
        .pll_not_locked_out_0(pll_not_locked_out_0),
        .power_down_0(power_down_0),
        .s_axi_tx_tdata_0(s_axi_tx_tdata_0),
        .s_axi_tx_tkeep_0(s_axi_tx_tkeep_0),
        .s_axi_tx_tlast_0(s_axi_tx_tlast_0),
        .s_axi_tx_tready_0(s_axi_tx_tready_0),
        .s_axi_tx_tvalid_0(s_axi_tx_tvalid_0),
        .sys_reset_out_0(sys_reset_out_0),
        .tx_aligned_0(tx_aligned_0),
        .tx_channel_up_0(tx_channel_up_0),
        .tx_hard_err_0(tx_hard_err_0),
        .tx_lane_up_0(tx_lane_up_0),
        .tx_lock_0(tx_lock_0),
        .tx_reset_0(tx_reset_0),
        .tx_resetdone_out_0(tx_resetdone_out_0),
        .tx_system_reset_0(tx_system_reset_0),
        .tx_verify_0(tx_verify_0),
        .txn_0(txn_0),
        .txp_0(txp_0),
        .user_clk_out_0(user_clk_out_0));
endmodule
