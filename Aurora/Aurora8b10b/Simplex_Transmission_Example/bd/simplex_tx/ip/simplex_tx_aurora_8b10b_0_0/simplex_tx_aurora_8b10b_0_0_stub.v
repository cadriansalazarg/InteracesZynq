// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Jul  7 23:11:06 2020
// Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/carlositcr/Vivado_Projects/Aurora/project_1/project_1.srcs/sources_1/bd/simplex_tx/ip/simplex_tx_aurora_8b10b_0_0/simplex_tx_aurora_8b10b_0_0_stub.v
// Design      : simplex_tx_aurora_8b10b_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module simplex_tx_aurora_8b10b_0_0(s_axi_tx_tdata, s_axi_tx_tkeep, 
  s_axi_tx_tvalid, s_axi_tx_tlast, s_axi_tx_tready, txp, txn, gt_refclk1, tx_hard_err, 
  tx_lane_up, tx_channel_up, tx_aligned, tx_verify, tx_reset, user_clk_out, sync_clk_out, 
  gt_reset, tx_system_reset, sys_reset_out, gt_reset_out, power_down, loopback, tx_lock, 
  init_clk_in, tx_resetdone_out, drpclk_in, gt0_qplllock_out, gt0_qpllrefclklost_out, 
  gt_qpllclk_quad1_out, gt_qpllrefclk_quad1_out, pll_not_locked_out)
/* synthesis syn_black_box black_box_pad_pin="s_axi_tx_tdata[0:15],s_axi_tx_tkeep[0:1],s_axi_tx_tvalid,s_axi_tx_tlast,s_axi_tx_tready,txp,txn,gt_refclk1,tx_hard_err,tx_lane_up,tx_channel_up,tx_aligned,tx_verify,tx_reset,user_clk_out,sync_clk_out,gt_reset,tx_system_reset,sys_reset_out,gt_reset_out,power_down,loopback[2:0],tx_lock,init_clk_in,tx_resetdone_out,drpclk_in,gt0_qplllock_out,gt0_qpllrefclklost_out,gt_qpllclk_quad1_out,gt_qpllrefclk_quad1_out,pll_not_locked_out" */;
  input [0:15]s_axi_tx_tdata;
  input [0:1]s_axi_tx_tkeep;
  input s_axi_tx_tvalid;
  input s_axi_tx_tlast;
  output s_axi_tx_tready;
  output txp;
  output txn;
  input gt_refclk1;
  output tx_hard_err;
  output tx_lane_up;
  output tx_channel_up;
  input tx_aligned;
  input tx_verify;
  input tx_reset;
  output user_clk_out;
  output sync_clk_out;
  input gt_reset;
  input tx_system_reset;
  output sys_reset_out;
  output gt_reset_out;
  input power_down;
  input [2:0]loopback;
  output tx_lock;
  input init_clk_in;
  output tx_resetdone_out;
  input drpclk_in;
  output gt0_qplllock_out;
  output gt0_qpllrefclklost_out;
  output gt_qpllclk_quad1_out;
  output gt_qpllrefclk_quad1_out;
  output pll_not_locked_out;
endmodule
