//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Tue Jul  7 23:43:22 2020
//Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
//Command     : generate_target simplex_rx.bd
//Design      : simplex_rx
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "simplex_rx,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=simplex_rx,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "simplex_rx.hwdef" *) 
module simplex_rx
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DRPCLK_IN_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DRPCLK_IN_0, CLK_DOMAIN simplex_rx_drpclk_in_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input drpclk_in_0;
  output frame_err_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.GT_REFCLK1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.GT_REFCLK1_0, CLK_DOMAIN simplex_rx_gt_refclk1_0, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000" *) input gt_refclk1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.GT_RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.GT_RESET_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input gt_reset_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.INIT_CLK_IN_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.INIT_CLK_IN_0, CLK_DOMAIN simplex_rx_init_clk_in_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input init_clk_in_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.LINK_RESET_OUT_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.LINK_RESET_OUT_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) output link_reset_out_0;
  input [2:0]loopback_0;
  output [0:15]m_axi_rx_tdata_0;
  output [0:1]m_axi_rx_tkeep_0;
  output m_axi_rx_tlast_0;
  output m_axi_rx_tvalid_0;
  output pll_not_locked_out_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.POWER_DOWN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.POWER_DOWN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input power_down_0;
  output rx_aligned_0;
  output rx_channel_up_0;
  output rx_hard_err_0;
  output [0:0]rx_lane_up_0;
  output rx_reset_0;
  output rx_resetdone_out_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RX_SYSTEM_RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RX_SYSTEM_RESET_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rx_system_reset_0;
  output rx_verify_0;
  input [0:0]rxn_0;
  input [0:0]rxp_0;
  output soft_err_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.SYS_RESET_OUT_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.SYS_RESET_OUT_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) output sys_reset_out_0;
  output tx_lock_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.USER_CLK_OUT_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.USER_CLK_OUT_0, CLK_DOMAIN simplex_rx_aurora_8b10b_0_0_user_clk_out, FREQ_HZ 156250000, INSERT_VIP 0, PHASE 0" *) output user_clk_out_0;

  wire aurora_8b10b_0_frame_err;
  wire aurora_8b10b_0_link_reset_out;
  wire [0:15]aurora_8b10b_0_m_axi_rx_tdata;
  wire [0:1]aurora_8b10b_0_m_axi_rx_tkeep;
  wire aurora_8b10b_0_m_axi_rx_tlast;
  wire aurora_8b10b_0_m_axi_rx_tvalid;
  wire aurora_8b10b_0_pll_not_locked_out;
  wire aurora_8b10b_0_rx_aligned;
  wire aurora_8b10b_0_rx_channel_up;
  wire aurora_8b10b_0_rx_hard_err;
  wire [0:0]aurora_8b10b_0_rx_lane_up;
  wire aurora_8b10b_0_rx_reset;
  wire aurora_8b10b_0_rx_resetdone_out;
  wire aurora_8b10b_0_rx_verify;
  wire aurora_8b10b_0_soft_err;
  wire aurora_8b10b_0_sys_reset_out;
  wire aurora_8b10b_0_tx_lock;
  wire aurora_8b10b_0_user_clk_out;
  wire drpclk_in_0_1;
  wire gt_refclk1_0_1;
  wire gt_reset_0_1;
  wire init_clk_in_0_1;
  wire [2:0]loopback_0_1;
  wire power_down_0_1;
  wire rx_system_reset_0_1;
  wire [0:0]rxn_0_1;
  wire [0:0]rxp_0_1;

  assign drpclk_in_0_1 = drpclk_in_0;
  assign frame_err_0 = aurora_8b10b_0_frame_err;
  assign gt_refclk1_0_1 = gt_refclk1_0;
  assign gt_reset_0_1 = gt_reset_0;
  assign init_clk_in_0_1 = init_clk_in_0;
  assign link_reset_out_0 = aurora_8b10b_0_link_reset_out;
  assign loopback_0_1 = loopback_0[2:0];
  assign m_axi_rx_tdata_0[0:15] = aurora_8b10b_0_m_axi_rx_tdata;
  assign m_axi_rx_tkeep_0[0:1] = aurora_8b10b_0_m_axi_rx_tkeep;
  assign m_axi_rx_tlast_0 = aurora_8b10b_0_m_axi_rx_tlast;
  assign m_axi_rx_tvalid_0 = aurora_8b10b_0_m_axi_rx_tvalid;
  assign pll_not_locked_out_0 = aurora_8b10b_0_pll_not_locked_out;
  assign power_down_0_1 = power_down_0;
  assign rx_aligned_0 = aurora_8b10b_0_rx_aligned;
  assign rx_channel_up_0 = aurora_8b10b_0_rx_channel_up;
  assign rx_hard_err_0 = aurora_8b10b_0_rx_hard_err;
  assign rx_lane_up_0[0] = aurora_8b10b_0_rx_lane_up;
  assign rx_reset_0 = aurora_8b10b_0_rx_reset;
  assign rx_resetdone_out_0 = aurora_8b10b_0_rx_resetdone_out;
  assign rx_system_reset_0_1 = rx_system_reset_0;
  assign rx_verify_0 = aurora_8b10b_0_rx_verify;
  assign rxn_0_1 = rxn_0[0];
  assign rxp_0_1 = rxp_0[0];
  assign soft_err_0 = aurora_8b10b_0_soft_err;
  assign sys_reset_out_0 = aurora_8b10b_0_sys_reset_out;
  assign tx_lock_0 = aurora_8b10b_0_tx_lock;
  assign user_clk_out_0 = aurora_8b10b_0_user_clk_out;
  simplex_rx_aurora_8b10b_0_0 aurora_8b10b_0
       (.drpclk_in(drpclk_in_0_1),
        .frame_err(aurora_8b10b_0_frame_err),
        .gt_refclk1(gt_refclk1_0_1),
        .gt_reset(gt_reset_0_1),
        .init_clk_in(init_clk_in_0_1),
        .link_reset_out(aurora_8b10b_0_link_reset_out),
        .loopback(loopback_0_1),
        .m_axi_rx_tdata(aurora_8b10b_0_m_axi_rx_tdata),
        .m_axi_rx_tkeep(aurora_8b10b_0_m_axi_rx_tkeep),
        .m_axi_rx_tlast(aurora_8b10b_0_m_axi_rx_tlast),
        .m_axi_rx_tvalid(aurora_8b10b_0_m_axi_rx_tvalid),
        .pll_not_locked_out(aurora_8b10b_0_pll_not_locked_out),
        .power_down(power_down_0_1),
        .rx_aligned(aurora_8b10b_0_rx_aligned),
        .rx_channel_up(aurora_8b10b_0_rx_channel_up),
        .rx_hard_err(aurora_8b10b_0_rx_hard_err),
        .rx_lane_up(aurora_8b10b_0_rx_lane_up),
        .rx_reset(aurora_8b10b_0_rx_reset),
        .rx_resetdone_out(aurora_8b10b_0_rx_resetdone_out),
        .rx_system_reset(rx_system_reset_0_1),
        .rx_verify(aurora_8b10b_0_rx_verify),
        .rxn(rxn_0_1),
        .rxp(rxp_0_1),
        .soft_err(aurora_8b10b_0_soft_err),
        .sys_reset_out(aurora_8b10b_0_sys_reset_out),
        .tx_lock(aurora_8b10b_0_tx_lock),
        .user_clk_out(aurora_8b10b_0_user_clk_out));
endmodule
