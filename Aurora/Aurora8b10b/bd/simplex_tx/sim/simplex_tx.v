//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Wed Jul  8 13:13:56 2020
//Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
//Command     : generate_target simplex_tx.bd
//Design      : simplex_tx
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "simplex_tx,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=simplex_tx,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "simplex_tx.hwdef" *) 
module simplex_tx
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DRPCLK_IN_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DRPCLK_IN_0, CLK_DOMAIN simplex_tx_drpclk_in_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input drpclk_in_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.GT_REFCLK1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.GT_REFCLK1_0, CLK_DOMAIN simplex_tx_gt_refclk1_0, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000" *) input gt_refclk1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.GT_RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.GT_RESET_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input gt_reset_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.INIT_CLK_IN_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.INIT_CLK_IN_0, CLK_DOMAIN simplex_tx_init_clk_in_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input init_clk_in_0;
  input [2:0]loopback_0;
  output pll_not_locked_out_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.POWER_DOWN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.POWER_DOWN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input power_down_0;
  input [0:15]s_axi_tx_tdata_0;
  input [0:1]s_axi_tx_tkeep_0;
  input s_axi_tx_tlast_0;
  output s_axi_tx_tready_0;
  input s_axi_tx_tvalid_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.SYS_RESET_OUT_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.SYS_RESET_OUT_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) output sys_reset_out_0;
  input tx_aligned_0;
  output tx_channel_up_0;
  output tx_hard_err_0;
  output [0:0]tx_lane_up_0;
  output tx_lock_0;
  input tx_reset_0;
  output tx_resetdone_out_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.TX_SYSTEM_RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.TX_SYSTEM_RESET_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input tx_system_reset_0;
  input tx_verify_0;
  output [0:0]txn_0;
  output [0:0]txp_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.USER_CLK_OUT_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.USER_CLK_OUT_0, CLK_DOMAIN simplex_tx_aurora_8b10b_0_0_user_clk_out, FREQ_HZ 156250000, INSERT_VIP 0, PHASE 0" *) output user_clk_out_0;

  wire aurora_8b10b_0_pll_not_locked_out;
  wire aurora_8b10b_0_s_axi_tx_tready;
  wire aurora_8b10b_0_sys_reset_out;
  wire aurora_8b10b_0_tx_channel_up;
  wire aurora_8b10b_0_tx_hard_err;
  wire [0:0]aurora_8b10b_0_tx_lane_up;
  wire aurora_8b10b_0_tx_lock;
  wire aurora_8b10b_0_tx_resetdone_out;
  wire [0:0]aurora_8b10b_0_txn;
  wire [0:0]aurora_8b10b_0_txp;
  wire aurora_8b10b_0_user_clk_out;
  wire drpclk_in_0_1;
  wire gt_refclk1_0_1;
  wire gt_reset_0_1;
  wire init_clk_in_0_1;
  wire [2:0]loopback_0_1;
  wire power_down_0_1;
  wire [0:15]s_axi_tx_tdata_0_1;
  wire [0:1]s_axi_tx_tkeep_0_1;
  wire s_axi_tx_tlast_0_1;
  wire s_axi_tx_tvalid_0_1;
  wire tx_aligned_0_1;
  wire tx_reset_0_1;
  wire tx_system_reset_0_1;
  wire tx_verify_0_1;

  assign drpclk_in_0_1 = drpclk_in_0;
  assign gt_refclk1_0_1 = gt_refclk1_0;
  assign gt_reset_0_1 = gt_reset_0;
  assign init_clk_in_0_1 = init_clk_in_0;
  assign loopback_0_1 = loopback_0[2:0];
  assign pll_not_locked_out_0 = aurora_8b10b_0_pll_not_locked_out;
  assign power_down_0_1 = power_down_0;
  assign s_axi_tx_tdata_0_1 = s_axi_tx_tdata_0[0:15];
  assign s_axi_tx_tkeep_0_1 = s_axi_tx_tkeep_0[0:1];
  assign s_axi_tx_tlast_0_1 = s_axi_tx_tlast_0;
  assign s_axi_tx_tready_0 = aurora_8b10b_0_s_axi_tx_tready;
  assign s_axi_tx_tvalid_0_1 = s_axi_tx_tvalid_0;
  assign sys_reset_out_0 = aurora_8b10b_0_sys_reset_out;
  assign tx_aligned_0_1 = tx_aligned_0;
  assign tx_channel_up_0 = aurora_8b10b_0_tx_channel_up;
  assign tx_hard_err_0 = aurora_8b10b_0_tx_hard_err;
  assign tx_lane_up_0[0] = aurora_8b10b_0_tx_lane_up;
  assign tx_lock_0 = aurora_8b10b_0_tx_lock;
  assign tx_reset_0_1 = tx_reset_0;
  assign tx_resetdone_out_0 = aurora_8b10b_0_tx_resetdone_out;
  assign tx_system_reset_0_1 = tx_system_reset_0;
  assign tx_verify_0_1 = tx_verify_0;
  assign txn_0[0] = aurora_8b10b_0_txn;
  assign txp_0[0] = aurora_8b10b_0_txp;
  assign user_clk_out_0 = aurora_8b10b_0_user_clk_out;
  simplex_tx_aurora_8b10b_0_0 aurora_8b10b_0
       (.drpclk_in(drpclk_in_0_1),
        .gt_refclk1(gt_refclk1_0_1),
        .gt_reset(gt_reset_0_1),
        .init_clk_in(init_clk_in_0_1),
        .loopback(loopback_0_1),
        .pll_not_locked_out(aurora_8b10b_0_pll_not_locked_out),
        .power_down(power_down_0_1),
        .s_axi_tx_tdata(s_axi_tx_tdata_0_1),
        .s_axi_tx_tkeep(s_axi_tx_tkeep_0_1),
        .s_axi_tx_tlast(s_axi_tx_tlast_0_1),
        .s_axi_tx_tready(aurora_8b10b_0_s_axi_tx_tready),
        .s_axi_tx_tvalid(s_axi_tx_tvalid_0_1),
        .sys_reset_out(aurora_8b10b_0_sys_reset_out),
        .tx_aligned(tx_aligned_0_1),
        .tx_channel_up(aurora_8b10b_0_tx_channel_up),
        .tx_hard_err(aurora_8b10b_0_tx_hard_err),
        .tx_lane_up(aurora_8b10b_0_tx_lane_up),
        .tx_lock(aurora_8b10b_0_tx_lock),
        .tx_reset(tx_reset_0_1),
        .tx_resetdone_out(aurora_8b10b_0_tx_resetdone_out),
        .tx_system_reset(tx_system_reset_0_1),
        .tx_verify(tx_verify_0_1),
        .txn(aurora_8b10b_0_txn),
        .txp(aurora_8b10b_0_txp),
        .user_clk_out(aurora_8b10b_0_user_clk_out));
endmodule
