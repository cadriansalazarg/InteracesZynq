// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Jul  7 23:44:38 2020
// Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/carlositcr/Vivado_Projects/Aurora/project_1/project_1.srcs/sources_1/bd/simplex_rx/ip/simplex_rx_aurora_8b10b_0_0/simplex_rx_aurora_8b10b_0_0_stub.v
// Design      : simplex_rx_aurora_8b10b_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module simplex_rx_aurora_8b10b_0_0(m_axi_rx_tdata, m_axi_rx_tkeep, 
  m_axi_rx_tvalid, m_axi_rx_tlast, rxp, rxn, gt_refclk1, frame_err, rx_hard_err, soft_err, 
  rx_lane_up, rx_channel_up, rx_aligned, rx_verify, rx_reset, user_clk_out, sync_clk_out, 
  gt_reset, rx_system_reset, sys_reset_out, gt_reset_out, power_down, loopback, tx_lock, 
  init_clk_in, rx_resetdone_out, link_reset_out, drpclk_in, gt0_qplllock_out, 
  gt0_qpllrefclklost_out, gt_qpllclk_quad1_out, gt_qpllrefclk_quad1_out, 
  pll_not_locked_out)
/* synthesis syn_black_box black_box_pad_pin="m_axi_rx_tdata[0:15],m_axi_rx_tkeep[0:1],m_axi_rx_tvalid,m_axi_rx_tlast,rxp,rxn,gt_refclk1,frame_err,rx_hard_err,soft_err,rx_lane_up,rx_channel_up,rx_aligned,rx_verify,rx_reset,user_clk_out,sync_clk_out,gt_reset,rx_system_reset,sys_reset_out,gt_reset_out,power_down,loopback[2:0],tx_lock,init_clk_in,rx_resetdone_out,link_reset_out,drpclk_in,gt0_qplllock_out,gt0_qpllrefclklost_out,gt_qpllclk_quad1_out,gt_qpllrefclk_quad1_out,pll_not_locked_out" */;
  output [0:15]m_axi_rx_tdata;
  output [0:1]m_axi_rx_tkeep;
  output m_axi_rx_tvalid;
  output m_axi_rx_tlast;
  input rxp;
  input rxn;
  input gt_refclk1;
  output frame_err;
  output rx_hard_err;
  output soft_err;
  output rx_lane_up;
  output rx_channel_up;
  output rx_aligned;
  output rx_verify;
  output rx_reset;
  output user_clk_out;
  output sync_clk_out;
  input gt_reset;
  input rx_system_reset;
  output sys_reset_out;
  output gt_reset_out;
  input power_down;
  input [2:0]loopback;
  output tx_lock;
  input init_clk_in;
  output rx_resetdone_out;
  output link_reset_out;
  input drpclk_in;
  output gt0_qplllock_out;
  output gt0_qpllrefclklost_out;
  output gt_qpllclk_quad1_out;
  output gt_qpllrefclk_quad1_out;
  output pll_not_locked_out;
endmodule
