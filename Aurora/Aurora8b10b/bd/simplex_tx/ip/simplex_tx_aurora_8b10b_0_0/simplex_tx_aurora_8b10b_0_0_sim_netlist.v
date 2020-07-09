// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Jul  7 23:11:06 2020
// Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/carlositcr/Vivado_Projects/Aurora/project_1/project_1.srcs/sources_1/bd/simplex_tx/ip/simplex_tx_aurora_8b10b_0_0/simplex_tx_aurora_8b10b_0_0_sim_netlist.v
// Design      : simplex_tx_aurora_8b10b_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module simplex_tx_aurora_8b10b_0_0
   (s_axi_tx_tdata,
    s_axi_tx_tkeep,
    s_axi_tx_tvalid,
    s_axi_tx_tlast,
    s_axi_tx_tready,
    txp,
    txn,
    gt_refclk1,
    tx_hard_err,
    tx_lane_up,
    tx_channel_up,
    tx_aligned,
    tx_verify,
    tx_reset,
    user_clk_out,
    sync_clk_out,
    gt_reset,
    tx_system_reset,
    sys_reset_out,
    gt_reset_out,
    power_down,
    loopback,
    tx_lock,
    init_clk_in,
    tx_resetdone_out,
    drpclk_in,
    gt0_qplllock_out,
    gt0_qpllrefclklost_out,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    pll_not_locked_out);
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

  wire drpclk_in;
  wire gt0_qplllock_out;
  wire gt0_qpllrefclklost_out;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_reset;
  wire gt_reset_out;
  wire init_clk_in;
  wire [2:0]loopback;
  wire pll_not_locked_out;
  wire power_down;
  wire [0:15]s_axi_tx_tdata;
  wire [0:1]s_axi_tx_tkeep;
  wire s_axi_tx_tlast;
  wire s_axi_tx_tready;
  wire s_axi_tx_tvalid;
  wire sync_clk_out;
  wire sys_reset_out;
  wire tx_aligned;
  wire tx_channel_up;
  wire tx_hard_err;
  wire tx_lane_up;
  wire tx_lock;
  wire tx_reset;
  wire tx_resetdone_out;
  wire tx_system_reset;
  wire tx_verify;
  wire txn;
  wire txp;
  wire user_clk_out;
  wire NLW_inst_drprdy_out_UNCONNECTED;
  wire [15:0]NLW_inst_drpdo_out_UNCONNECTED;

  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_support inst
       (.drpaddr_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drpclk_in(drpclk_in),
        .drpdi_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drpdo_out(NLW_inst_drpdo_out_UNCONNECTED[15:0]),
        .drpen_in(1'b0),
        .drprdy_out(NLW_inst_drprdy_out_UNCONNECTED),
        .drpwe_in(1'b0),
        .gt0_qplllock_out(gt0_qplllock_out),
        .gt0_qpllrefclklost_out(gt0_qpllrefclklost_out),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .gt_reset(gt_reset),
        .gt_reset_out(gt_reset_out),
        .init_clk_in(init_clk_in),
        .loopback(loopback),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .s_axi_tx_tdata(s_axi_tx_tdata),
        .s_axi_tx_tkeep(s_axi_tx_tkeep),
        .s_axi_tx_tlast(s_axi_tx_tlast),
        .s_axi_tx_tready(s_axi_tx_tready),
        .s_axi_tx_tvalid(s_axi_tx_tvalid),
        .sync_clk_out(sync_clk_out),
        .sys_reset_out(sys_reset_out),
        .tx_aligned(tx_aligned),
        .tx_channel_up(tx_channel_up),
        .tx_hard_err(tx_hard_err),
        .tx_lane_up(tx_lane_up),
        .tx_lock(tx_lock),
        .tx_reset(tx_reset),
        .tx_resetdone_out(tx_resetdone_out),
        .tx_system_reset(tx_system_reset),
        .tx_verify(tx_verify),
        .txn(txn),
        .txp(txp),
        .user_clk_out(user_clk_out));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_AXI_TO_LL" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_AXI_TO_LL
   (new_pkt_r_reg_0,
    new_pkt_r,
    new_pkt_r_reg_1);
  output new_pkt_r_reg_0;
  input new_pkt_r;
  input new_pkt_r_reg_1;

  wire new_pkt_r;
  wire new_pkt_r_reg_0;
  wire new_pkt_r_reg_1;

  FDRE new_pkt_r_reg
       (.C(new_pkt_r_reg_1),
        .CE(1'b1),
        .D(new_pkt_r),
        .Q(new_pkt_r_reg_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_CLOCK_MODULE" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_CLOCK_MODULE
   (init_clk_in,
    tx_out_clk_i);
  output init_clk_in;
  input tx_out_clk_i;

  wire init_clk_in;
  wire tx_out_clk_i;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG user_clk_buf_i
       (.I(tx_out_clk_i),
        .O(init_clk_in));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_GT_WRAPPER" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_GT_WRAPPER
   (tx_resetdone_out,
    in0,
    drprdy_out,
    txn,
    txp,
    tx_out_clk_i,
    drpdo_out,
    pll_not_locked_out,
    ENABLE_ERR_DETECT_reg,
    s_level_out_d6_reg,
    init_clk_in,
    drpclk_in,
    drpen_in,
    drpwe_in,
    gt_refclk1,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    p_level_in_d1_cdc_from_reg,
    power_down,
    drpdi_in,
    loopback,
    TXDATA,
    TXCHARISK,
    drpaddr_in,
    \init_wait_count_reg[0] ,
    ENABLE_ERR_DETECT);
  output tx_resetdone_out;
  output in0;
  output drprdy_out;
  output txn;
  output txp;
  output tx_out_clk_i;
  output [15:0]drpdo_out;
  output pll_not_locked_out;
  output ENABLE_ERR_DETECT_reg;
  output s_level_out_d6_reg;
  input init_clk_in;
  input drpclk_in;
  input drpen_in;
  input drpwe_in;
  input gt_refclk1;
  input gt_qpllclk_quad1_out;
  input gt_qpllrefclk_quad1_out;
  input p_level_in_d1_cdc_from_reg;
  input power_down;
  input [15:0]drpdi_in;
  input [2:0]loopback;
  input [15:0]TXDATA;
  input [1:0]TXCHARISK;
  input [8:0]drpaddr_in;
  input \init_wait_count_reg[0] ;
  input ENABLE_ERR_DETECT;

  wire ENABLE_ERR_DETECT;
  wire ENABLE_ERR_DETECT_reg;
  wire [1:0]TXCHARISK;
  wire [15:0]TXDATA;
  wire cpll_reset_i;
  wire [8:0]drpaddr_in;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdo_out;
  wire drpen_in;
  wire drprdy_out;
  wire drpwe_in;
  wire \gt0_simplex_tx_aurora_8b10b_0_0_i/ack_flag ;
  wire gt0_txresetdone_r3_reg_srl3_n_0;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_tx_reset_i;
  wire gt_txresetfsm_i_n_4;
  wire gt_txuserrdy_i;
  wire in0;
  wire init_clk_in;
  wire \init_wait_count_reg[0] ;
  wire [2:0]loopback;
  wire p_level_in_d1_cdc_from_reg;
  wire pll_not_locked_out;
  wire power_down;
  wire s_level_out_d6_reg;
  wire simplex_tx_aurora_8b10b_0_0_multi_gt_i_n_5;
  wire tx_out_clk_i;
  wire tx_resetdone_out;
  wire txfsm_txresetdone_r;
  wire txn;
  wire txp;

  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/gt0_txresetdone_r3_reg_srl3 " *) 
  SRL16E gt0_txresetdone_r3_reg_srl3
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(p_level_in_d1_cdc_from_reg),
        .D(simplex_tx_aurora_8b10b_0_0_multi_gt_i_n_5),
        .Q(gt0_txresetdone_r3_reg_srl3_n_0));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_tx_startup_fsm gt_txresetfsm_i
       (.CPLL_RESET_reg_0(gt_txresetfsm_i_n_4),
        .ack_flag(\gt0_simplex_tx_aurora_8b10b_0_0_i/ack_flag ),
        .cpll_reset_i(cpll_reset_i),
        .gt_tx_reset_i(gt_tx_reset_i),
        .gt_txuserrdy_i(gt_txuserrdy_i),
        .in0(in0),
        .init_clk_in(init_clk_in),
        .\init_wait_count_reg[0]_0 (\init_wait_count_reg[0] ),
        .s_level_out_d6_reg(s_level_out_d6_reg),
        .s_level_out_d6_reg_0(p_level_in_d1_cdc_from_reg),
        .tx_resetdone_out(tx_resetdone_out),
        .txfsm_txresetdone_r(txfsm_txresetdone_r));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_1 gtrxreset_cdc_sync
       (.init_clk_in(init_clk_in),
        .p_level_in_d1_cdc_from_reg_0(p_level_in_d1_cdc_from_reg));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_multi_gt simplex_tx_aurora_8b10b_0_0_multi_gt_i
       (.ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .ENABLE_ERR_DETECT_reg(ENABLE_ERR_DETECT_reg),
        .TXCHARISK(TXCHARISK),
        .TXDATA(TXDATA),
        .ack_flag(\gt0_simplex_tx_aurora_8b10b_0_0_i/ack_flag ),
        .cpll_reset_i(cpll_reset_i),
        .drpaddr_in(drpaddr_in),
        .drpclk_in(drpclk_in),
        .drpdi_in(drpdi_in),
        .drpdo_out(drpdo_out),
        .drpen_in(drpen_in),
        .drprdy_out(drprdy_out),
        .drpwe_in(drpwe_in),
        .flag2_reg(gt_txresetfsm_i_n_4),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .gt_tx_reset_i(gt_tx_reset_i),
        .gt_txuserrdy_i(gt_txuserrdy_i),
        .in0(in0),
        .init_clk_in(init_clk_in),
        .init_clk_in_0(simplex_tx_aurora_8b10b_0_0_multi_gt_i_n_5),
        .loopback(loopback),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg(p_level_in_d1_cdc_from_reg),
        .tx_out_clk_i(tx_out_clk_i),
        .txn(txn),
        .txp(txp));
  FDRE txfsm_txresetdone_r_reg
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(gt0_txresetdone_r3_reg_srl3_n_0),
        .Q(txfsm_txresetdone_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_IDLE_AND_VER_GEN" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_IDLE_AND_VER_GEN
   (D,
    gen_a_i,
    gen_k_flop_0_i_0,
    gen_r_flop_0_i_0,
    tx_system_reset_c,
    prev_cycle_gen_ver_r_reg_0,
    gen_ver_i,
    tx_reset,
    SR);
  output [1:0]D;
  output gen_a_i;
  output [1:0]gen_k_flop_0_i_0;
  output [1:0]gen_r_flop_0_i_0;
  input tx_system_reset_c;
  input prev_cycle_gen_ver_r_reg_0;
  input gen_ver_i;
  input tx_reset;
  input [0:0]SR;

  wire [1:0]D;
  wire [0:0]SR;
  wire \downcounter_r[0]_i_1_n_0 ;
  wire \downcounter_r[1]_i_1_n_0 ;
  wire \downcounter_r[2]_i_1_n_0 ;
  wire \downcounter_r[3]_i_1_n_0 ;
  wire \downcounter_r_reg_n_0_[0] ;
  wire \downcounter_r_reg_n_0_[1] ;
  wire \downcounter_r_reg_n_0_[2] ;
  wire \downcounter_r_reg_n_0_[3] ;
  wire gen_a_flop_c;
  wire gen_a_i;
  wire [1:0]gen_k_flop_0_i_0;
  wire gen_k_flop_c_0;
  wire gen_k_flop_c_1;
  wire [1:0]gen_r_flop_0_i_0;
  wire gen_r_flop_c_0;
  wire gen_r_flop_c_1;
  wire gen_v_flop_c_0;
  wire gen_ver_i;
  wire gen_ver_word_1_r;
  wire gen_ver_word_2_r_reg_n_0;
  wire insert_ver_c;
  wire lfsr_last_flop_r;
  wire \lfsr_shift_register_r_reg[2]_srl3_n_0 ;
  wire lfsr_taps_c;
  wire lfsr_taps_r;
  wire prev_cycle_gen_ver_r;
  wire prev_cycle_gen_ver_r_reg_0;
  wire recycle_gen_ver_c;
  wire tx_reset;
  wire tx_system_reset_c;
  wire ver_counter_r_1;

  LUT6 #(
    .INIT(64'h1010101010101001)) 
    \downcounter_r[0]_i_1 
       (.I0(tx_reset),
        .I1(SR),
        .I2(\downcounter_r_reg_n_0_[0] ),
        .I3(\downcounter_r_reg_n_0_[1] ),
        .I4(\downcounter_r_reg_n_0_[2] ),
        .I5(\downcounter_r_reg_n_0_[3] ),
        .O(\downcounter_r[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E1E1E1E0)) 
    \downcounter_r[1]_i_1 
       (.I0(\downcounter_r_reg_n_0_[2] ),
        .I1(\downcounter_r_reg_n_0_[3] ),
        .I2(\downcounter_r_reg_n_0_[1] ),
        .I3(lfsr_taps_r),
        .I4(\downcounter_r_reg_n_0_[0] ),
        .I5(tx_system_reset_c),
        .O(\downcounter_r[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF0000000000FE)) 
    \downcounter_r[2]_i_1 
       (.I0(\downcounter_r_reg_n_0_[0] ),
        .I1(\downcounter_r_reg_n_0_[1] ),
        .I2(gen_k_flop_c_0),
        .I3(tx_system_reset_c),
        .I4(\downcounter_r_reg_n_0_[2] ),
        .I5(\downcounter_r_reg_n_0_[3] ),
        .O(\downcounter_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1111111111111110)) 
    \downcounter_r[3]_i_1 
       (.I0(\downcounter_r_reg_n_0_[3] ),
        .I1(tx_system_reset_c),
        .I2(\downcounter_r_reg_n_0_[1] ),
        .I3(\downcounter_r_reg_n_0_[0] ),
        .I4(\downcounter_r_reg_n_0_[2] ),
        .I5(lfsr_last_flop_r),
        .O(\downcounter_r[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \downcounter_r_reg[0] 
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(\downcounter_r[0]_i_1_n_0 ),
        .Q(\downcounter_r_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \downcounter_r_reg[1] 
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(\downcounter_r[1]_i_1_n_0 ),
        .Q(\downcounter_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \downcounter_r_reg[2] 
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(\downcounter_r[2]_i_1_n_0 ),
        .Q(\downcounter_r_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \downcounter_r_reg[3] 
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(\downcounter_r[3]_i_1_n_0 ),
        .Q(\downcounter_r_reg_n_0_[3] ),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    gen_a_flop_0_i
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(gen_a_flop_c),
        .Q(gen_a_i),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000001)) 
    gen_a_flop_0_i_i_1
       (.I0(\downcounter_r_reg_n_0_[3] ),
        .I1(\downcounter_r_reg_n_0_[2] ),
        .I2(\downcounter_r_reg_n_0_[1] ),
        .I3(\downcounter_r_reg_n_0_[0] ),
        .I4(gen_ver_word_1_r),
        .O(gen_a_flop_c));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    gen_k_flop_0_i
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(gen_k_flop_c_1),
        .Q(gen_k_flop_0_i_0[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAAAAA8)) 
    gen_k_flop_0_i_i_1
       (.I0(lfsr_taps_r),
        .I1(\downcounter_r_reg_n_0_[0] ),
        .I2(\downcounter_r_reg_n_0_[1] ),
        .I3(\downcounter_r_reg_n_0_[2] ),
        .I4(\downcounter_r_reg_n_0_[3] ),
        .I5(gen_ver_word_1_r),
        .O(gen_k_flop_c_1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    gen_k_flop_1_i
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(gen_k_flop_c_0),
        .Q(gen_k_flop_0_i_0[0]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    gen_r_flop_0_i
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(gen_r_flop_c_1),
        .Q(gen_r_flop_0_i_0[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h1111111111111110)) 
    gen_r_flop_0_i_i_1
       (.I0(lfsr_taps_r),
        .I1(gen_ver_word_1_r),
        .I2(\downcounter_r_reg_n_0_[3] ),
        .I3(\downcounter_r_reg_n_0_[2] ),
        .I4(\downcounter_r_reg_n_0_[1] ),
        .I5(\downcounter_r_reg_n_0_[0] ),
        .O(gen_r_flop_c_1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    gen_r_flop_1_i
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(gen_r_flop_c_0),
        .Q(gen_r_flop_0_i_0[0]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    gen_r_flop_1_i_i_1
       (.I0(gen_k_flop_c_0),
        .O(gen_r_flop_c_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    gen_v_flop_0_i
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(recycle_gen_ver_c),
        .Q(D[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    gen_v_flop_0_i_i_1
       (.I0(gen_ver_word_2_r_reg_n_0),
        .I1(gen_ver_i),
        .O(recycle_gen_ver_c));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    gen_v_flop_1_i
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(gen_v_flop_c_0),
        .Q(D[0]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hC8)) 
    gen_v_flop_1_i_i_1
       (.I0(gen_ver_word_1_r),
        .I1(gen_ver_i),
        .I2(gen_ver_word_2_r_reg_n_0),
        .O(gen_v_flop_c_0));
  FDRE gen_ver_word_2_r_reg
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(gen_ver_word_1_r),
        .Q(gen_ver_word_2_r_reg_n_0),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    lfsr_last_flop_i
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(gen_k_flop_c_0),
        .Q(lfsr_last_flop_r),
        .R(tx_system_reset_c));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/idle_and_ver_gen_i/lfsr_shift_register_r_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/idle_and_ver_gen_i/lfsr_shift_register_r_reg[2]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \lfsr_shift_register_r_reg[2]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(prev_cycle_gen_ver_r_reg_0),
        .D(lfsr_taps_r),
        .Q(\lfsr_shift_register_r_reg[2]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \lfsr_shift_register_r_reg[3] 
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(\lfsr_shift_register_r_reg[2]_srl3_n_0 ),
        .Q(gen_k_flop_c_0),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    lfsr_taps_i
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(lfsr_taps_c),
        .Q(lfsr_taps_r),
        .R(tx_system_reset_c));
  LUT2 #(
    .INIT(4'h9)) 
    lfsr_taps_i_i_1
       (.I0(lfsr_last_flop_r),
        .I1(gen_k_flop_c_0),
        .O(lfsr_taps_c));
  FDRE prev_cycle_gen_ver_r_reg
       (.C(prev_cycle_gen_ver_r_reg_0),
        .CE(1'b1),
        .D(gen_ver_i),
        .Q(prev_cycle_gen_ver_r),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "SRL16" *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/idle_and_ver_gen_i/ver_counter_0_i " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    ver_counter_0_i
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(prev_cycle_gen_ver_r_reg_0),
        .D(insert_ver_c),
        .Q(ver_counter_r_1));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hC4)) 
    ver_counter_0_i_i_1
       (.I0(prev_cycle_gen_ver_r),
        .I1(gen_ver_i),
        .I2(gen_ver_word_2_r_reg_n_0),
        .O(insert_ver_c));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "SRL16" *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/idle_and_ver_gen_i/ver_counter_1_i " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    ver_counter_1_i
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(prev_cycle_gen_ver_r_reg_0),
        .D(ver_counter_r_1),
        .Q(gen_ver_word_1_r));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_RESET_LOGIC" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_RESET_LOGIC
   (SR,
    wait_for_lane_up_r0,
    new_pkt_r,
    tx_system_reset_c,
    system_reset_i,
    init_clk_in,
    s_level_out_d6_reg,
    in0,
    gt_txresetdone_r2_reg_0,
    tx_reset,
    reset_channel_i,
    tx_channel_up,
    s_axi_tx_tlast,
    s_axi_tx_tvalid,
    tx_dst_rdy,
    new_pkt_r_reg);
  output [0:0]SR;
  output wait_for_lane_up_r0;
  output new_pkt_r;
  output tx_system_reset_c;
  input system_reset_i;
  input init_clk_in;
  input s_level_out_d6_reg;
  input in0;
  input gt_txresetdone_r2_reg_0;
  input tx_reset;
  input reset_channel_i;
  input tx_channel_up;
  input s_axi_tx_tlast;
  input s_axi_tx_tvalid;
  input tx_dst_rdy;
  input new_pkt_r_reg;

  wire [0:0]SR;
  wire SYSTEM_RESET0_n_0;
  wire gt_txresetdone_r;
  wire gt_txresetdone_r2;
  wire gt_txresetdone_r2_reg_0;
  wire gt_txresetdone_r3;
  wire in0;
  wire init_clk_in;
  wire link_reset_sync;
  wire new_pkt_r;
  wire new_pkt_r_reg;
  wire reset_channel_i;
  wire s_axi_tx_tlast;
  wire s_axi_tx_tvalid;
  wire s_level_out_d6_reg;
  wire system_reset_i;
  wire tx_channel_up;
  wire tx_dst_rdy;
  wire tx_lock_comb_r;
  wire tx_lock_sync;
  wire tx_reset;
  wire tx_system_reset_c;
  wire wait_for_lane_up_r0;

  LUT4 #(
    .INIT(16'hFFDF)) 
    SYSTEM_RESET0
       (.I0(tx_lock_sync),
        .I1(system_reset_i),
        .I2(gt_txresetdone_r3),
        .I3(link_reset_sync),
        .O(SYSTEM_RESET0_n_0));
  FDRE SYSTEM_RESET_reg
       (.C(s_level_out_d6_reg),
        .CE(1'b1),
        .D(SYSTEM_RESET0_n_0),
        .Q(SR),
        .R(1'b0));
  FDCE gt_txresetdone_r2_reg
       (.C(s_level_out_d6_reg),
        .CE(1'b1),
        .CLR(gt_txresetdone_r2_reg_0),
        .D(gt_txresetdone_r),
        .Q(gt_txresetdone_r2));
  FDRE gt_txresetdone_r3_reg
       (.C(s_level_out_d6_reg),
        .CE(1'b1),
        .D(gt_txresetdone_r2),
        .Q(gt_txresetdone_r3),
        .R(1'b0));
  FDCE gt_txresetdone_r_reg
       (.C(s_level_out_d6_reg),
        .CE(1'b1),
        .CLR(gt_txresetdone_r2_reg_0),
        .D(1'b1),
        .Q(gt_txresetdone_r));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    lfsr_last_flop_i_i_1
       (.I0(tx_reset),
        .I1(SR),
        .O(tx_system_reset_c));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_9 link_reset_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(link_reset_sync),
        .s_level_out_d6_reg_0(s_level_out_d6_reg));
  LUT6 #(
    .INIT(64'h4444044400000400)) 
    new_pkt_r_i_1
       (.I0(tx_system_reset_c),
        .I1(tx_channel_up),
        .I2(s_axi_tx_tlast),
        .I3(s_axi_tx_tvalid),
        .I4(tx_dst_rdy),
        .I5(new_pkt_r_reg),
        .O(new_pkt_r));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_10 tx_lock_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(tx_lock_sync),
        .s_level_out_d6_reg_0(s_level_out_d6_reg),
        .tx_lock_comb_r(tx_lock_comb_r));
  FDRE tx_lock_comb_r_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(in0),
        .Q(tx_lock_comb_r),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    wait_for_lane_up_r_i_1
       (.I0(SR),
        .I1(tx_reset),
        .I2(reset_channel_i),
        .O(wait_for_lane_up_r0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE
   (Q,
    SR,
    \prepare_count_r_reg[9]_0 );
  output Q;
  input [0:0]SR;
  input \prepare_count_r_reg[9]_0 ;

  wire DO_CC0_n_0;
  wire DO_CC_i_1_n_0;
  wire Q;
  wire [0:0]SR;
  wire \cc_count_r_reg_n_0_[5] ;
  wire cc_idle_count_done_c;
  wire count_13d_flop_r_reg_r_n_0;
  wire \count_13d_srl_r_reg[10]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0 ;
  wire \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0 ;
  wire \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0 ;
  wire count_13d_srl_r_reg_gate_n_0;
  wire count_13d_srl_r_reg_r_0_n_0;
  wire count_13d_srl_r_reg_r_1_n_0;
  wire count_13d_srl_r_reg_r_2_n_0;
  wire count_13d_srl_r_reg_r_3_n_0;
  wire count_13d_srl_r_reg_r_4_n_0;
  wire count_13d_srl_r_reg_r_5_n_0;
  wire count_13d_srl_r_reg_r_6_n_0;
  wire count_13d_srl_r_reg_r_7_n_0;
  wire count_13d_srl_r_reg_r_8_n_0;
  wire count_13d_srl_r_reg_r_9_n_0;
  wire count_13d_srl_r_reg_r_n_0;
  wire count_16d_flop_r;
  wire count_16d_flop_r_i_1_n_0;
  wire count_16d_srl_r0;
  wire \count_16d_srl_r_reg_n_0_[0] ;
  wire \count_16d_srl_r_reg_n_0_[10] ;
  wire \count_16d_srl_r_reg_n_0_[11] ;
  wire \count_16d_srl_r_reg_n_0_[12] ;
  wire \count_16d_srl_r_reg_n_0_[13] ;
  wire \count_16d_srl_r_reg_n_0_[14] ;
  wire \count_16d_srl_r_reg_n_0_[1] ;
  wire \count_16d_srl_r_reg_n_0_[2] ;
  wire \count_16d_srl_r_reg_n_0_[3] ;
  wire \count_16d_srl_r_reg_n_0_[4] ;
  wire \count_16d_srl_r_reg_n_0_[5] ;
  wire \count_16d_srl_r_reg_n_0_[6] ;
  wire \count_16d_srl_r_reg_n_0_[7] ;
  wire \count_16d_srl_r_reg_n_0_[8] ;
  wire \count_16d_srl_r_reg_n_0_[9] ;
  wire count_24d_flop_r;
  wire count_24d_flop_r_i_1_n_0;
  wire count_24d_srl_r0;
  wire \count_24d_srl_r_reg_n_0_[0] ;
  wire \count_24d_srl_r_reg_n_0_[10] ;
  wire \count_24d_srl_r_reg_n_0_[11] ;
  wire \count_24d_srl_r_reg_n_0_[12] ;
  wire \count_24d_srl_r_reg_n_0_[13] ;
  wire \count_24d_srl_r_reg_n_0_[14] ;
  wire \count_24d_srl_r_reg_n_0_[15] ;
  wire \count_24d_srl_r_reg_n_0_[16] ;
  wire \count_24d_srl_r_reg_n_0_[17] ;
  wire \count_24d_srl_r_reg_n_0_[18] ;
  wire \count_24d_srl_r_reg_n_0_[19] ;
  wire \count_24d_srl_r_reg_n_0_[1] ;
  wire \count_24d_srl_r_reg_n_0_[20] ;
  wire \count_24d_srl_r_reg_n_0_[21] ;
  wire \count_24d_srl_r_reg_n_0_[22] ;
  wire \count_24d_srl_r_reg_n_0_[2] ;
  wire \count_24d_srl_r_reg_n_0_[3] ;
  wire \count_24d_srl_r_reg_n_0_[4] ;
  wire \count_24d_srl_r_reg_n_0_[5] ;
  wire \count_24d_srl_r_reg_n_0_[6] ;
  wire \count_24d_srl_r_reg_n_0_[7] ;
  wire \count_24d_srl_r_reg_n_0_[8] ;
  wire \count_24d_srl_r_reg_n_0_[9] ;
  wire [4:0]p_2_in;
  wire [5:5]p_3_out;
  wire \prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_n_0 ;
  wire \prepare_count_r_reg[8]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6_n_0 ;
  wire \prepare_count_r_reg[9]_0 ;
  wire prepare_count_r_reg_gate_n_0;
  wire reset_r;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    DO_CC0
       (.I0(p_2_in[0]),
        .I1(\cc_count_r_reg_n_0_[5] ),
        .I2(p_2_in[3]),
        .I3(p_2_in[4]),
        .I4(p_2_in[1]),
        .I5(p_2_in[2]),
        .O(DO_CC0_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    DO_CC_i_1
       (.I0(DO_CC0_n_0),
        .I1(p_3_out),
        .I2(reset_r),
        .O(DO_CC_i_1_n_0));
  FDRE DO_CC_reg
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(DO_CC_i_1_n_0),
        .Q(Q),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cc_count_r_reg[0] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(p_3_out),
        .Q(p_2_in[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cc_count_r_reg[1] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(p_2_in[4]),
        .Q(p_2_in[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cc_count_r_reg[2] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(p_2_in[3]),
        .Q(p_2_in[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cc_count_r_reg[3] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(p_2_in[2]),
        .Q(p_2_in[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cc_count_r_reg[4] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(p_2_in[1]),
        .Q(p_2_in[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cc_count_r_reg[5] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(p_2_in[0]),
        .Q(\cc_count_r_reg_n_0_[5] ),
        .R(SR));
  FDRE count_13d_flop_r_reg_r
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(1'b1),
        .Q(count_13d_flop_r_reg_r_n_0),
        .R(SR));
  FDRE \count_13d_srl_r_reg[10]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(\count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0 ),
        .Q(\count_13d_srl_r_reg[10]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0 ),
        .R(1'b0));
  FDRE \count_13d_srl_r_reg[11] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_gate_n_0),
        .Q(count_16d_srl_r0),
        .R(SR));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/standard_cc_module_i/count_13d_srl_r_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/standard_cc_module_i/count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8 " *) 
  SRL16E \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(\prepare_count_r_reg[9]_0 ),
        .D(\count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0 ),
        .Q(\count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1 
       (.I0(count_16d_srl_r0),
        .I1(reset_r),
        .O(\count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    count_13d_srl_r_reg_gate
       (.I0(\count_13d_srl_r_reg[10]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0 ),
        .I1(count_13d_srl_r_reg_r_9_n_0),
        .O(count_13d_srl_r_reg_gate_n_0));
  FDRE count_13d_srl_r_reg_r
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_flop_r_reg_r_n_0),
        .Q(count_13d_srl_r_reg_r_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_0
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_n_0),
        .Q(count_13d_srl_r_reg_r_0_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_1
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_0_n_0),
        .Q(count_13d_srl_r_reg_r_1_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_2
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_1_n_0),
        .Q(count_13d_srl_r_reg_r_2_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_3
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_2_n_0),
        .Q(count_13d_srl_r_reg_r_3_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_4
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_3_n_0),
        .Q(count_13d_srl_r_reg_r_4_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_5
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_4_n_0),
        .Q(count_13d_srl_r_reg_r_5_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_6
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_5_n_0),
        .Q(count_13d_srl_r_reg_r_6_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_7
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_6_n_0),
        .Q(count_13d_srl_r_reg_r_7_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_8
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_7_n_0),
        .Q(count_13d_srl_r_reg_r_8_n_0),
        .R(SR));
  FDRE count_13d_srl_r_reg_r_9
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_13d_srl_r_reg_r_8_n_0),
        .Q(count_13d_srl_r_reg_r_9_n_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFBF8)) 
    count_16d_flop_r_i_1
       (.I0(\count_16d_srl_r_reg_n_0_[14] ),
        .I1(count_16d_srl_r0),
        .I2(reset_r),
        .I3(count_16d_flop_r),
        .O(count_16d_flop_r_i_1_n_0));
  FDRE count_16d_flop_r_reg
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_16d_flop_r_i_1_n_0),
        .Q(count_16d_flop_r),
        .R(SR));
  FDRE \count_16d_srl_r_reg[0] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(count_16d_flop_r),
        .Q(\count_16d_srl_r_reg_n_0_[0] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[10] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[9] ),
        .Q(\count_16d_srl_r_reg_n_0_[10] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[11] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[10] ),
        .Q(\count_16d_srl_r_reg_n_0_[11] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[12] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[11] ),
        .Q(\count_16d_srl_r_reg_n_0_[12] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[13] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[12] ),
        .Q(\count_16d_srl_r_reg_n_0_[13] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[14] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[13] ),
        .Q(\count_16d_srl_r_reg_n_0_[14] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[1] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[0] ),
        .Q(\count_16d_srl_r_reg_n_0_[1] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[2] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[1] ),
        .Q(\count_16d_srl_r_reg_n_0_[2] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[3] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[2] ),
        .Q(\count_16d_srl_r_reg_n_0_[3] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[4] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[3] ),
        .Q(\count_16d_srl_r_reg_n_0_[4] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[5] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[4] ),
        .Q(\count_16d_srl_r_reg_n_0_[5] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[6] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[5] ),
        .Q(\count_16d_srl_r_reg_n_0_[6] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[7] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[6] ),
        .Q(\count_16d_srl_r_reg_n_0_[7] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[8] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[7] ),
        .Q(\count_16d_srl_r_reg_n_0_[8] ),
        .R(SR));
  FDRE \count_16d_srl_r_reg[9] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_16d_srl_r0),
        .D(\count_16d_srl_r_reg_n_0_[8] ),
        .Q(\count_16d_srl_r_reg_n_0_[9] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFFBFFF80)) 
    count_24d_flop_r_i_1
       (.I0(\count_24d_srl_r_reg_n_0_[22] ),
        .I1(count_16d_srl_r0),
        .I2(\count_16d_srl_r_reg_n_0_[14] ),
        .I3(reset_r),
        .I4(count_24d_flop_r),
        .O(count_24d_flop_r_i_1_n_0));
  FDRE count_24d_flop_r_reg
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(count_24d_flop_r_i_1_n_0),
        .Q(count_24d_flop_r),
        .R(SR));
  LUT2 #(
    .INIT(4'h8)) 
    \count_24d_srl_r[0]_i_1 
       (.I0(count_16d_srl_r0),
        .I1(\count_16d_srl_r_reg_n_0_[14] ),
        .O(count_24d_srl_r0));
  FDRE \count_24d_srl_r_reg[0] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(count_24d_flop_r),
        .Q(\count_24d_srl_r_reg_n_0_[0] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[10] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[9] ),
        .Q(\count_24d_srl_r_reg_n_0_[10] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[11] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[10] ),
        .Q(\count_24d_srl_r_reg_n_0_[11] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[12] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[11] ),
        .Q(\count_24d_srl_r_reg_n_0_[12] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[13] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[12] ),
        .Q(\count_24d_srl_r_reg_n_0_[13] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[14] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[13] ),
        .Q(\count_24d_srl_r_reg_n_0_[14] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[15] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[14] ),
        .Q(\count_24d_srl_r_reg_n_0_[15] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[16] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[15] ),
        .Q(\count_24d_srl_r_reg_n_0_[16] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[17] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[16] ),
        .Q(\count_24d_srl_r_reg_n_0_[17] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[18] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[17] ),
        .Q(\count_24d_srl_r_reg_n_0_[18] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[19] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[18] ),
        .Q(\count_24d_srl_r_reg_n_0_[19] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[1] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[0] ),
        .Q(\count_24d_srl_r_reg_n_0_[1] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[20] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[19] ),
        .Q(\count_24d_srl_r_reg_n_0_[20] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[21] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[20] ),
        .Q(\count_24d_srl_r_reg_n_0_[21] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[22] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[21] ),
        .Q(\count_24d_srl_r_reg_n_0_[22] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[2] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[1] ),
        .Q(\count_24d_srl_r_reg_n_0_[2] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[3] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[2] ),
        .Q(\count_24d_srl_r_reg_n_0_[3] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[4] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[3] ),
        .Q(\count_24d_srl_r_reg_n_0_[4] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[5] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[4] ),
        .Q(\count_24d_srl_r_reg_n_0_[5] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[6] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[5] ),
        .Q(\count_24d_srl_r_reg_n_0_[6] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[7] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[6] ),
        .Q(\count_24d_srl_r_reg_n_0_[7] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[8] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[7] ),
        .Q(\count_24d_srl_r_reg_n_0_[8] ),
        .R(SR));
  FDRE \count_24d_srl_r_reg[9] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(count_24d_srl_r0),
        .D(\count_24d_srl_r_reg_n_0_[8] ),
        .Q(\count_24d_srl_r_reg_n_0_[9] ),
        .R(SR));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/standard_cc_module_i/prepare_count_r_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/standard_cc_module_i/prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(\prepare_count_r_reg[9]_0 ),
        .D(cc_idle_count_done_c),
        .Q(\prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_i_1 
       (.I0(count_16d_srl_r0),
        .I1(\count_16d_srl_r_reg_n_0_[14] ),
        .I2(\count_24d_srl_r_reg_n_0_[22] ),
        .O(cc_idle_count_done_c));
  FDRE \prepare_count_r_reg[8]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(\prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_n_0 ),
        .Q(\prepare_count_r_reg[8]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6_n_0 ),
        .R(1'b0));
  FDRE \prepare_count_r_reg[9] 
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(prepare_count_r_reg_gate_n_0),
        .Q(p_3_out),
        .R(SR));
  LUT2 #(
    .INIT(4'h8)) 
    prepare_count_r_reg_gate
       (.I0(\prepare_count_r_reg[8]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6_n_0 ),
        .I1(count_13d_srl_r_reg_r_6_n_0),
        .O(prepare_count_r_reg_gate_n_0));
  FDRE reset_r_reg
       (.C(\prepare_count_r_reg[9]_0 ),
        .CE(1'b1),
        .D(SR),
        .Q(reset_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC
   (gt_reset_out,
    system_reset_i,
    init_clk_in,
    CLK,
    D,
    \debounce_gt_rst_r_reg[0]_0 );
  output gt_reset_out;
  output system_reset_i;
  input init_clk_in;
  input CLK;
  input [0:0]D;
  input [0:0]\debounce_gt_rst_r_reg[0]_0 ;

  wire CLK;
  wire [0:0]D;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [0:3]debounce_gt_rst_r;
  wire [0:0]\debounce_gt_rst_r_reg[0]_0 ;
  wire gt_reset_out;
  wire gt_rst_r0_n_0;
  wire gt_rst_sync;
  wire init_clk_in;
  wire [0:3]reset_debounce_r;
  wire reset_debounce_r20_n_0;
  wire system_reset_i;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    \debounce_gt_rst_r_reg[0] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\debounce_gt_rst_r_reg[0]_0 ),
        .Q(debounce_gt_rst_r[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    \debounce_gt_rst_r_reg[1] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(debounce_gt_rst_r[0]),
        .Q(debounce_gt_rst_r[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    \debounce_gt_rst_r_reg[2] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(debounce_gt_rst_r[1]),
        .Q(debounce_gt_rst_r[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    \debounce_gt_rst_r_reg[3] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(debounce_gt_rst_r[2]),
        .Q(debounce_gt_rst_r[3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h8000)) 
    gt_rst_r0
       (.I0(debounce_gt_rst_r[2]),
        .I1(debounce_gt_rst_r[3]),
        .I2(debounce_gt_rst_r[0]),
        .I3(debounce_gt_rst_r[1]),
        .O(gt_rst_r0_n_0));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0 gt_rst_r_cdc_sync
       (.AS(gt_rst_sync),
        .CLK(CLK),
        .gt_reset_out(gt_reset_out),
        .init_clk_in(init_clk_in));
  FDRE gt_rst_r_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(gt_rst_r0_n_0),
        .Q(gt_reset_out),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h8000)) 
    reset_debounce_r20
       (.I0(reset_debounce_r[2]),
        .I1(reset_debounce_r[3]),
        .I2(reset_debounce_r[0]),
        .I3(reset_debounce_r[1]),
        .O(reset_debounce_r20_n_0));
  FDRE #(
    .INIT(1'b1)) 
    reset_debounce_r2_reg
       (.C(CLK),
        .CE(1'b1),
        .D(reset_debounce_r20_n_0),
        .Q(system_reset_i),
        .R(1'b0));
  FDPE #(
    .INIT(1'b0)) 
    \reset_debounce_r_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(D),
        .PRE(gt_rst_sync),
        .Q(reset_debounce_r[0]));
  FDPE #(
    .INIT(1'b0)) 
    \reset_debounce_r_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(reset_debounce_r[0]),
        .PRE(gt_rst_sync),
        .Q(reset_debounce_r[1]));
  FDPE #(
    .INIT(1'b0)) 
    \reset_debounce_r_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(reset_debounce_r[1]),
        .PRE(gt_rst_sync),
        .Q(reset_debounce_r[2]));
  FDPE #(
    .INIT(1'b0)) 
    \reset_debounce_r_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(reset_debounce_r[2]),
        .PRE(gt_rst_sync),
        .Q(reset_debounce_r[3]));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_SYM_GEN" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SYM_GEN
   (TXCHARISK,
    TXDATA,
    GEN_PAD,
    gen_a_r_reg_0,
    TX_PE_DATA_V,
    gen_k_fsm_r_reg_0,
    gen_cc_i,
    GEN_ECP,
    GEN_SCP,
    gen_a_i,
    D,
    \gen_v_r_reg[0]_0 ,
    \gen_r_r_reg[0]_0 ,
    \gen_k_r_reg[0]_0 ,
    Q);
  output [1:0]TXCHARISK;
  output [15:0]TXDATA;
  input GEN_PAD;
  input gen_a_r_reg_0;
  input TX_PE_DATA_V;
  input gen_k_fsm_r_reg_0;
  input gen_cc_i;
  input GEN_ECP;
  input GEN_SCP;
  input gen_a_i;
  input [1:0]D;
  input [1:0]\gen_v_r_reg[0]_0 ;
  input [1:0]\gen_r_r_reg[0]_0 ;
  input [1:0]\gen_k_r_reg[0]_0 ;
  input [15:0]Q;

  wire [1:0]D;
  wire GEN_ECP;
  wire GEN_PAD;
  wire GEN_SCP;
  wire [15:0]Q;
  wire [1:0]TXCHARISK;
  wire [15:0]TXDATA;
  wire \TX_CHAR_IS_K[0]_i_1_n_0 ;
  wire TX_CHAR_IS_K_reg04_out;
  wire \TX_DATA[0]_i_1_n_0 ;
  wire \TX_DATA[10]_i_1_n_0 ;
  wire \TX_DATA[11]_i_1_n_0 ;
  wire \TX_DATA[12]_i_1_n_0 ;
  wire \TX_DATA[12]_i_2_n_0 ;
  wire \TX_DATA[13]_i_1_n_0 ;
  wire \TX_DATA[13]_i_2_n_0 ;
  wire \TX_DATA[13]_i_3_n_0 ;
  wire \TX_DATA[14]_i_1_n_0 ;
  wire \TX_DATA[14]_i_2_n_0 ;
  wire \TX_DATA[14]_i_3_n_0 ;
  wire \TX_DATA[14]_i_4_n_0 ;
  wire \TX_DATA[15]_i_1_n_0 ;
  wire \TX_DATA[15]_i_2_n_0 ;
  wire \TX_DATA[15]_i_3_n_0 ;
  wire \TX_DATA[15]_i_4_n_0 ;
  wire \TX_DATA[15]_i_5_n_0 ;
  wire \TX_DATA[15]_i_6_n_0 ;
  wire \TX_DATA[1]_i_1_n_0 ;
  wire \TX_DATA[2]_i_1_n_0 ;
  wire \TX_DATA[3]_i_1_n_0 ;
  wire \TX_DATA[4]_i_1_n_0 ;
  wire \TX_DATA[4]_i_2_n_0 ;
  wire \TX_DATA[5]_i_1_n_0 ;
  wire \TX_DATA[6]_i_1_n_0 ;
  wire \TX_DATA[6]_i_2_n_0 ;
  wire \TX_DATA[7]_i_2_n_0 ;
  wire \TX_DATA[7]_i_3_n_0 ;
  wire \TX_DATA[7]_i_4_n_0 ;
  wire \TX_DATA[7]_i_5_n_0 ;
  wire \TX_DATA[8]_i_1_n_0 ;
  wire \TX_DATA[9]_i_1_n_0 ;
  wire TX_DATA_reg0;
  wire TX_PE_DATA_V;
  wire [7:0]data0;
  wire gen_a_i;
  wire gen_a_r;
  wire gen_a_r_reg_0;
  wire gen_cc_i;
  wire gen_cc_r;
  wire gen_ecp_r;
  wire gen_k_fsm_r;
  wire gen_k_fsm_r_reg_0;
  wire [1:0]\gen_k_r_reg[0]_0 ;
  wire \gen_k_r_reg_n_0_[1] ;
  wire gen_pad_r;
  wire [1:0]\gen_r_r_reg[0]_0 ;
  wire \gen_r_r_reg_n_0_[1] ;
  wire gen_scp_r;
  wire \gen_sp_data_r_reg_n_0_[1] ;
  wire [1:0]\gen_v_r_reg[0]_0 ;
  wire p_0_in;
  wire p_0_in1_in;
  wire p_0_in4_in;
  wire p_2_in;
  wire p_3_in;
  wire \tx_pe_data_r_reg_n_0_[10] ;
  wire \tx_pe_data_r_reg_n_0_[11] ;
  wire \tx_pe_data_r_reg_n_0_[12] ;
  wire \tx_pe_data_r_reg_n_0_[13] ;
  wire \tx_pe_data_r_reg_n_0_[14] ;
  wire \tx_pe_data_r_reg_n_0_[15] ;
  wire \tx_pe_data_r_reg_n_0_[8] ;
  wire \tx_pe_data_r_reg_n_0_[9] ;
  wire tx_pe_data_v_r;

  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hAAAAAEAF)) 
    \TX_CHAR_IS_K[0]_i_1 
       (.I0(gen_cc_r),
        .I1(gen_pad_r),
        .I2(\gen_sp_data_r_reg_n_0_[1] ),
        .I3(tx_pe_data_v_r),
        .I4(p_3_in),
        .O(\TX_CHAR_IS_K[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hAAAB)) 
    \TX_CHAR_IS_K[1]_i_1 
       (.I0(gen_cc_r),
        .I1(p_2_in),
        .I2(p_0_in1_in),
        .I3(tx_pe_data_v_r),
        .O(TX_CHAR_IS_K_reg04_out));
  FDRE #(
    .INIT(1'b0)) 
    \TX_CHAR_IS_K_reg[0] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(\TX_CHAR_IS_K[0]_i_1_n_0 ),
        .Q(TXCHARISK[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TX_CHAR_IS_K_reg[1] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(TX_CHAR_IS_K_reg04_out),
        .Q(TXCHARISK[0]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAEAAAEAAFFAAAA)) 
    \TX_DATA[0]_i_1 
       (.I0(gen_scp_r),
        .I1(\tx_pe_data_r_reg_n_0_[15] ),
        .I2(gen_pad_r),
        .I3(gen_ecp_r),
        .I4(gen_cc_r),
        .I5(tx_pe_data_v_r),
        .O(\TX_DATA[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \TX_DATA[10]_i_1 
       (.I0(tx_pe_data_v_r),
        .I1(data0[2]),
        .I2(\TX_DATA[12]_i_2_n_0 ),
        .O(\TX_DATA[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEFFEEFEEEFFEEFF)) 
    \TX_DATA[11]_i_1 
       (.I0(gen_ecp_r),
        .I1(gen_scp_r),
        .I2(data0[3]),
        .I3(gen_cc_r),
        .I4(gen_k_fsm_r),
        .I5(tx_pe_data_v_r),
        .O(\TX_DATA[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \TX_DATA[12]_i_1 
       (.I0(tx_pe_data_v_r),
        .I1(data0[4]),
        .I2(\TX_DATA[12]_i_2_n_0 ),
        .O(\TX_DATA[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF5554)) 
    \TX_DATA[12]_i_2 
       (.I0(\TX_DATA[15]_i_4_n_0 ),
        .I1(p_0_in4_in),
        .I2(gen_a_r),
        .I3(p_0_in),
        .I4(\TX_DATA[15]_i_3_n_0 ),
        .O(\TX_DATA[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFE0)) 
    \TX_DATA[13]_i_1 
       (.I0(p_0_in4_in),
        .I1(gen_a_r),
        .I2(\TX_DATA[13]_i_2_n_0 ),
        .I3(\TX_DATA[13]_i_3_n_0 ),
        .I4(\TX_DATA[15]_i_6_n_0 ),
        .O(\TX_DATA[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \TX_DATA[13]_i_2 
       (.I0(tx_pe_data_v_r),
        .I1(p_0_in1_in),
        .I2(gen_scp_r),
        .O(\TX_DATA[13]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h0000F011)) 
    \TX_DATA[13]_i_3 
       (.I0(p_0_in),
        .I1(p_0_in1_in),
        .I2(data0[5]),
        .I3(tx_pe_data_v_r),
        .I4(gen_scp_r),
        .O(\TX_DATA[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFBAAA)) 
    \TX_DATA[14]_i_1 
       (.I0(\TX_DATA[14]_i_2_n_0 ),
        .I1(gen_k_fsm_r),
        .I2(tx_pe_data_v_r),
        .I3(data0[6]),
        .I4(\TX_DATA[14]_i_3_n_0 ),
        .I5(\TX_DATA[14]_i_4_n_0 ),
        .O(\TX_DATA[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1110111011101111)) 
    \TX_DATA[14]_i_2 
       (.I0(gen_k_fsm_r),
        .I1(tx_pe_data_v_r),
        .I2(gen_a_r),
        .I3(p_2_in),
        .I4(p_0_in4_in),
        .I5(p_0_in),
        .O(\TX_DATA[14]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \TX_DATA[14]_i_3 
       (.I0(gen_ecp_r),
        .I1(gen_scp_r),
        .O(\TX_DATA[14]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFF02)) 
    \TX_DATA[14]_i_4 
       (.I0(p_0_in1_in),
        .I1(tx_pe_data_v_r),
        .I2(gen_k_fsm_r),
        .I3(gen_cc_r),
        .O(\TX_DATA[14]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \TX_DATA[15]_i_1 
       (.I0(\TX_DATA[15]_i_3_n_0 ),
        .I1(\TX_DATA[15]_i_4_n_0 ),
        .I2(p_0_in),
        .I3(gen_a_r),
        .I4(p_0_in4_in),
        .O(\TX_DATA[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFBAAA)) 
    \TX_DATA[15]_i_2 
       (.I0(\TX_DATA[15]_i_5_n_0 ),
        .I1(gen_scp_r),
        .I2(tx_pe_data_v_r),
        .I3(data0[7]),
        .I4(\TX_DATA[15]_i_6_n_0 ),
        .O(\TX_DATA[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \TX_DATA[15]_i_3 
       (.I0(gen_cc_r),
        .I1(gen_k_fsm_r),
        .I2(gen_scp_r),
        .I3(gen_ecp_r),
        .O(\TX_DATA[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \TX_DATA[15]_i_4 
       (.I0(tx_pe_data_v_r),
        .I1(p_0_in1_in),
        .I2(p_2_in),
        .O(\TX_DATA[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000045)) 
    \TX_DATA[15]_i_5 
       (.I0(gen_a_r),
        .I1(p_0_in4_in),
        .I2(p_0_in),
        .I3(gen_scp_r),
        .I4(p_0_in1_in),
        .I5(tx_pe_data_v_r),
        .O(\TX_DATA[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h8F8F8F8F8F8F8F88)) 
    \TX_DATA[15]_i_6 
       (.I0(p_2_in),
        .I1(\TX_DATA[13]_i_2_n_0 ),
        .I2(gen_scp_r),
        .I3(gen_cc_r),
        .I4(gen_k_fsm_r),
        .I5(gen_ecp_r),
        .O(\TX_DATA[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hCFCCFFFFCFCCEEEE)) 
    \TX_DATA[1]_i_1 
       (.I0(gen_cc_r),
        .I1(\TX_DATA[14]_i_3_n_0 ),
        .I2(gen_pad_r),
        .I3(\tx_pe_data_r_reg_n_0_[14] ),
        .I4(tx_pe_data_v_r),
        .I5(\gen_sp_data_r_reg_n_0_[1] ),
        .O(\TX_DATA[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF0000FFE4)) 
    \TX_DATA[2]_i_1 
       (.I0(tx_pe_data_v_r),
        .I1(gen_cc_r),
        .I2(\tx_pe_data_r_reg_n_0_[13] ),
        .I3(\TX_DATA[4]_i_2_n_0 ),
        .I4(gen_scp_r),
        .I5(gen_ecp_r),
        .O(\TX_DATA[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF5FFFCFFF5)) 
    \TX_DATA[3]_i_1 
       (.I0(gen_cc_r),
        .I1(\tx_pe_data_r_reg_n_0_[12] ),
        .I2(gen_ecp_r),
        .I3(gen_scp_r),
        .I4(tx_pe_data_v_r),
        .I5(gen_pad_r),
        .O(\TX_DATA[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFAFFFE)) 
    \TX_DATA[4]_i_1 
       (.I0(\TX_DATA[4]_i_2_n_0 ),
        .I1(gen_cc_r),
        .I2(gen_scp_r),
        .I3(gen_ecp_r),
        .I4(tx_pe_data_v_r),
        .I5(\tx_pe_data_r_reg_n_0_[11] ),
        .O(\TX_DATA[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF000011101110)) 
    \TX_DATA[4]_i_2 
       (.I0(p_3_in),
        .I1(\gen_sp_data_r_reg_n_0_[1] ),
        .I2(\gen_k_r_reg_n_0_[1] ),
        .I3(\gen_r_r_reg_n_0_[1] ),
        .I4(gen_pad_r),
        .I5(tx_pe_data_v_r),
        .O(\TX_DATA[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \TX_DATA[5]_i_1 
       (.I0(\tx_pe_data_r_reg_n_0_[10] ),
        .I1(tx_pe_data_v_r),
        .I2(gen_pad_r),
        .I3(\TX_DATA[7]_i_4_n_0 ),
        .O(\TX_DATA[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0E0E0E0F)) 
    \TX_DATA[6]_i_1 
       (.I0(p_3_in),
        .I1(\gen_sp_data_r_reg_n_0_[1] ),
        .I2(tx_pe_data_v_r),
        .I3(\gen_r_r_reg_n_0_[1] ),
        .I4(\gen_k_r_reg_n_0_[1] ),
        .I5(\TX_DATA[6]_i_2_n_0 ),
        .O(\TX_DATA[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFF2FFF2FFFFFFF0)) 
    \TX_DATA[6]_i_2 
       (.I0(\tx_pe_data_r_reg_n_0_[9] ),
        .I1(gen_pad_r),
        .I2(gen_ecp_r),
        .I3(gen_scp_r),
        .I4(gen_cc_r),
        .I5(tx_pe_data_v_r),
        .O(\TX_DATA[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \TX_DATA[7]_i_1 
       (.I0(\gen_k_r_reg_n_0_[1] ),
        .I1(\gen_r_r_reg_n_0_[1] ),
        .I2(gen_cc_r),
        .I3(gen_scp_r),
        .I4(gen_ecp_r),
        .I5(\TX_DATA[7]_i_3_n_0 ),
        .O(TX_DATA_reg0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hFAEA)) 
    \TX_DATA[7]_i_2 
       (.I0(\TX_DATA[7]_i_4_n_0 ),
        .I1(gen_pad_r),
        .I2(tx_pe_data_v_r),
        .I3(\tx_pe_data_r_reg_n_0_[8] ),
        .O(\TX_DATA[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \TX_DATA[7]_i_3 
       (.I0(p_3_in),
        .I1(tx_pe_data_v_r),
        .I2(\gen_sp_data_r_reg_n_0_[1] ),
        .O(\TX_DATA[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF11111101)) 
    \TX_DATA[7]_i_4 
       (.I0(\gen_sp_data_r_reg_n_0_[1] ),
        .I1(tx_pe_data_v_r),
        .I2(\gen_r_r_reg_n_0_[1] ),
        .I3(p_3_in),
        .I4(\gen_k_r_reg_n_0_[1] ),
        .I5(\TX_DATA[7]_i_5_n_0 ),
        .O(\TX_DATA[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFFF4)) 
    \TX_DATA[7]_i_5 
       (.I0(tx_pe_data_v_r),
        .I1(gen_cc_r),
        .I2(gen_scp_r),
        .I3(gen_ecp_r),
        .O(\TX_DATA[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EFEEEEEE)) 
    \TX_DATA[8]_i_1 
       (.I0(gen_ecp_r),
        .I1(gen_cc_r),
        .I2(gen_k_fsm_r),
        .I3(tx_pe_data_v_r),
        .I4(data0[0]),
        .I5(gen_scp_r),
        .O(\TX_DATA[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3333333300002230)) 
    \TX_DATA[9]_i_1 
       (.I0(data0[1]),
        .I1(\TX_DATA[14]_i_3_n_0 ),
        .I2(p_0_in1_in),
        .I3(tx_pe_data_v_r),
        .I4(gen_k_fsm_r),
        .I5(gen_cc_r),
        .O(\TX_DATA[9]_i_1_n_0 ));
  FDRE \TX_DATA_reg[0] 
       (.C(gen_a_r_reg_0),
        .CE(TX_DATA_reg0),
        .D(\TX_DATA[0]_i_1_n_0 ),
        .Q(TXDATA[8]),
        .R(1'b0));
  FDRE \TX_DATA_reg[10] 
       (.C(gen_a_r_reg_0),
        .CE(\TX_DATA[15]_i_1_n_0 ),
        .D(\TX_DATA[10]_i_1_n_0 ),
        .Q(TXDATA[2]),
        .R(1'b0));
  FDRE \TX_DATA_reg[11] 
       (.C(gen_a_r_reg_0),
        .CE(\TX_DATA[15]_i_1_n_0 ),
        .D(\TX_DATA[11]_i_1_n_0 ),
        .Q(TXDATA[3]),
        .R(1'b0));
  FDRE \TX_DATA_reg[12] 
       (.C(gen_a_r_reg_0),
        .CE(\TX_DATA[15]_i_1_n_0 ),
        .D(\TX_DATA[12]_i_1_n_0 ),
        .Q(TXDATA[4]),
        .R(1'b0));
  FDRE \TX_DATA_reg[13] 
       (.C(gen_a_r_reg_0),
        .CE(\TX_DATA[15]_i_1_n_0 ),
        .D(\TX_DATA[13]_i_1_n_0 ),
        .Q(TXDATA[5]),
        .R(1'b0));
  FDRE \TX_DATA_reg[14] 
       (.C(gen_a_r_reg_0),
        .CE(\TX_DATA[15]_i_1_n_0 ),
        .D(\TX_DATA[14]_i_1_n_0 ),
        .Q(TXDATA[6]),
        .R(1'b0));
  FDRE \TX_DATA_reg[15] 
       (.C(gen_a_r_reg_0),
        .CE(\TX_DATA[15]_i_1_n_0 ),
        .D(\TX_DATA[15]_i_2_n_0 ),
        .Q(TXDATA[7]),
        .R(1'b0));
  FDRE \TX_DATA_reg[1] 
       (.C(gen_a_r_reg_0),
        .CE(TX_DATA_reg0),
        .D(\TX_DATA[1]_i_1_n_0 ),
        .Q(TXDATA[9]),
        .R(1'b0));
  FDRE \TX_DATA_reg[2] 
       (.C(gen_a_r_reg_0),
        .CE(TX_DATA_reg0),
        .D(\TX_DATA[2]_i_1_n_0 ),
        .Q(TXDATA[10]),
        .R(1'b0));
  FDRE \TX_DATA_reg[3] 
       (.C(gen_a_r_reg_0),
        .CE(TX_DATA_reg0),
        .D(\TX_DATA[3]_i_1_n_0 ),
        .Q(TXDATA[11]),
        .R(1'b0));
  FDRE \TX_DATA_reg[4] 
       (.C(gen_a_r_reg_0),
        .CE(TX_DATA_reg0),
        .D(\TX_DATA[4]_i_1_n_0 ),
        .Q(TXDATA[12]),
        .R(1'b0));
  FDRE \TX_DATA_reg[5] 
       (.C(gen_a_r_reg_0),
        .CE(TX_DATA_reg0),
        .D(\TX_DATA[5]_i_1_n_0 ),
        .Q(TXDATA[13]),
        .R(1'b0));
  FDRE \TX_DATA_reg[6] 
       (.C(gen_a_r_reg_0),
        .CE(TX_DATA_reg0),
        .D(\TX_DATA[6]_i_1_n_0 ),
        .Q(TXDATA[14]),
        .R(1'b0));
  FDRE \TX_DATA_reg[7] 
       (.C(gen_a_r_reg_0),
        .CE(TX_DATA_reg0),
        .D(\TX_DATA[7]_i_2_n_0 ),
        .Q(TXDATA[15]),
        .R(1'b0));
  FDRE \TX_DATA_reg[8] 
       (.C(gen_a_r_reg_0),
        .CE(\TX_DATA[15]_i_1_n_0 ),
        .D(\TX_DATA[8]_i_1_n_0 ),
        .Q(TXDATA[0]),
        .R(1'b0));
  FDRE \TX_DATA_reg[9] 
       (.C(gen_a_r_reg_0),
        .CE(\TX_DATA[15]_i_1_n_0 ),
        .D(\TX_DATA[9]_i_1_n_0 ),
        .Q(TXDATA[1]),
        .R(1'b0));
  FDRE gen_a_r_reg
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(gen_a_i),
        .Q(gen_a_r),
        .R(1'b0));
  FDRE gen_cc_r_reg
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(gen_cc_i),
        .Q(gen_cc_r),
        .R(1'b0));
  FDRE gen_ecp_r_reg
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(GEN_ECP),
        .Q(gen_ecp_r),
        .R(1'b0));
  FDRE gen_k_fsm_r_reg
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(gen_k_fsm_r_reg_0),
        .Q(gen_k_fsm_r),
        .R(1'b0));
  FDRE \gen_k_r_reg[0] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(\gen_k_r_reg[0]_0 [1]),
        .Q(p_0_in4_in),
        .R(1'b0));
  FDRE \gen_k_r_reg[1] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(\gen_k_r_reg[0]_0 [0]),
        .Q(\gen_k_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE gen_pad_r_reg
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(GEN_PAD),
        .Q(gen_pad_r),
        .R(1'b0));
  FDRE \gen_r_r_reg[0] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(\gen_r_r_reg[0]_0 [1]),
        .Q(p_0_in),
        .R(1'b0));
  FDRE \gen_r_r_reg[1] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(\gen_r_r_reg[0]_0 [0]),
        .Q(\gen_r_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE gen_scp_r_reg
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(GEN_SCP),
        .Q(gen_scp_r),
        .R(1'b0));
  FDRE \gen_sp_data_r_reg[0] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(D[1]),
        .Q(p_0_in1_in),
        .R(1'b0));
  FDRE \gen_sp_data_r_reg[1] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(D[0]),
        .Q(\gen_sp_data_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \gen_v_r_reg[0] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(\gen_v_r_reg[0]_0 [1]),
        .Q(p_2_in),
        .R(1'b0));
  FDRE \gen_v_r_reg[1] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(\gen_v_r_reg[0]_0 [0]),
        .Q(p_3_in),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[0] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[15]),
        .Q(data0[7]),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[10] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[5]),
        .Q(\tx_pe_data_r_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[11] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[4]),
        .Q(\tx_pe_data_r_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[12] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[3]),
        .Q(\tx_pe_data_r_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[13] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[2]),
        .Q(\tx_pe_data_r_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[14] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[1]),
        .Q(\tx_pe_data_r_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[15] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[0]),
        .Q(\tx_pe_data_r_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[1] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[14]),
        .Q(data0[6]),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[2] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[13]),
        .Q(data0[5]),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[3] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[12]),
        .Q(data0[4]),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[4] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[11]),
        .Q(data0[3]),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[5] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[10]),
        .Q(data0[2]),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[6] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[9]),
        .Q(data0[1]),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[7] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[8]),
        .Q(data0[0]),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[8] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[7]),
        .Q(\tx_pe_data_r_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[9] 
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(Q[6]),
        .Q(\tx_pe_data_r_reg_n_0_[9] ),
        .R(1'b0));
  FDRE tx_pe_data_v_r_reg
       (.C(gen_a_r_reg_0),
        .CE(1'b1),
        .D(TX_PE_DATA_V),
        .Q(tx_pe_data_v_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5
   (tx_lane_up,
    TXCHARISK,
    ENABLE_ERR_DETECT,
    hard_err_reset_i,
    hard_err_flop_r_reg,
    TXDATA,
    tx_reset_lanes_i,
    \counter1_r_reg[0] ,
    SS,
    tx_aligned,
    GEN_PAD,
    TX_PE_DATA_V,
    gen_cc_i,
    GEN_ECP,
    GEN_SCP,
    gen_a_i,
    hard_err_flop_r_reg_0,
    D,
    \gen_r_r_reg[0] ,
    \gen_k_r_reg[0] ,
    Q);
  output tx_lane_up;
  output [1:0]TXCHARISK;
  output ENABLE_ERR_DETECT;
  output hard_err_reset_i;
  output hard_err_flop_r_reg;
  output [15:0]TXDATA;
  input tx_reset_lanes_i;
  input \counter1_r_reg[0] ;
  input [0:0]SS;
  input tx_aligned;
  input GEN_PAD;
  input TX_PE_DATA_V;
  input gen_cc_i;
  input GEN_ECP;
  input GEN_SCP;
  input gen_a_i;
  input hard_err_flop_r_reg_0;
  input [1:0]D;
  input [1:0]\gen_r_r_reg[0] ;
  input [1:0]\gen_k_r_reg[0] ;
  input [15:0]Q;

  wire [1:0]D;
  wire ENABLE_ERR_DETECT;
  wire GEN_ECP;
  wire GEN_PAD;
  wire GEN_SCP;
  wire [15:0]Q;
  wire [0:0]SS;
  wire [1:0]TXCHARISK;
  wire [15:0]TXDATA;
  wire TX_PE_DATA_V;
  wire \counter1_r_reg[0] ;
  wire gen_a_i;
  wire gen_cc_i;
  wire [1:0]\gen_k_r_reg[0] ;
  wire [1:0]\gen_r_r_reg[0] ;
  wire hard_err_flop_r_reg;
  wire hard_err_flop_r_reg_0;
  wire hard_err_reset_i;
  wire send_sp_c;
  wire tx_aligned;
  wire tx_lane_init_sm_simplex_i_n_2;
  wire tx_lane_init_sm_simplex_i_n_3;
  wire tx_lane_up;
  wire tx_reset_lanes_i;

  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SYM_GEN sym_gen_i
       (.D({tx_lane_init_sm_simplex_i_n_3,send_sp_c}),
        .GEN_ECP(GEN_ECP),
        .GEN_PAD(GEN_PAD),
        .GEN_SCP(GEN_SCP),
        .Q(Q),
        .TXCHARISK(TXCHARISK),
        .TXDATA(TXDATA),
        .TX_PE_DATA_V(TX_PE_DATA_V),
        .gen_a_i(gen_a_i),
        .gen_a_r_reg_0(\counter1_r_reg[0] ),
        .gen_cc_i(gen_cc_i),
        .gen_k_fsm_r_reg_0(tx_lane_init_sm_simplex_i_n_2),
        .\gen_k_r_reg[0]_0 (\gen_k_r_reg[0] ),
        .\gen_r_r_reg[0]_0 (\gen_r_r_reg[0] ),
        .\gen_v_r_reg[0]_0 (D));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_ERR_DETECT_SIMPLEX tx_err_detect_simplex_i
       (.ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .hard_err_flop_r_reg_0(hard_err_flop_r_reg),
        .hard_err_flop_r_reg_1(hard_err_flop_r_reg_0),
        .hard_err_flop_r_reg_2(\counter1_r_reg[0] ),
        .hard_err_reset_i(hard_err_reset_i));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LANE_INIT_SM_SIMPLEX tx_lane_init_sm_simplex_i
       (.D({tx_lane_init_sm_simplex_i_n_3,send_sp_c}),
        .ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .SS(SS),
        .\counter1_r_reg[0]_0 (\counter1_r_reg[0] ),
        .odd_word_r_reg_0(tx_lane_init_sm_simplex_i_n_2),
        .tx_aligned(tx_aligned),
        .tx_lane_up(tx_lane_up),
        .tx_reset_lanes_i(tx_reset_lanes_i));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_ERR_DETECT_SIMPLEX" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_ERR_DETECT_SIMPLEX
   (reset_channel_i,
    tx_hard_err,
    tx_lane_up,
    lane_up_r_reg_0,
    CHANNEL_HARD_ERR_reg_0,
    power_down);
  output reset_channel_i;
  output tx_hard_err;
  input tx_lane_up;
  input lane_up_r_reg_0;
  input CHANNEL_HARD_ERR_reg_0;
  input power_down;

  wire CHANNEL_HARD_ERR_reg_0;
  wire RESET_CHANNEL_i_1_n_0;
  wire hard_err_r_reg_srl2_n_0;
  wire lane_up_r;
  wire lane_up_r_reg_0;
  wire power_down;
  wire reset_channel_i;
  wire tx_hard_err;
  wire tx_lane_up;

  FDRE #(
    .INIT(1'b1)) 
    CHANNEL_HARD_ERR_reg
       (.C(lane_up_r_reg_0),
        .CE(1'b1),
        .D(hard_err_r_reg_srl2_n_0),
        .Q(tx_hard_err),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hB)) 
    RESET_CHANNEL_i_1
       (.I0(power_down),
        .I1(lane_up_r),
        .O(RESET_CHANNEL_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    RESET_CHANNEL_reg
       (.C(lane_up_r_reg_0),
        .CE(1'b1),
        .D(RESET_CHANNEL_i_1_n_0),
        .Q(reset_channel_i),
        .R(1'b0));
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/tx_channel_err_detect_simplex_i/hard_err_r_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    hard_err_r_reg_srl2
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(lane_up_r_reg_0),
        .D(CHANNEL_HARD_ERR_reg_0),
        .Q(hard_err_r_reg_srl2_n_0));
  FDRE lane_up_r_reg
       (.C(lane_up_r_reg_0),
        .CE(1'b1),
        .D(tx_lane_up),
        .Q(lane_up_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_INIT_SM_SIMPLEX" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_INIT_SM_SIMPLEX
   (tx_channel_up,
    tx_reset_lanes_i,
    gen_ver_i,
    SS,
    tx_channel_up_i_0,
    \free_count_r_reg[14]_0 ,
    tx_verify,
    wait_for_lane_up_r0,
    hard_err_reset_i,
    tx_reset,
    SR,
    reset_channel_i);
  output tx_channel_up;
  output tx_reset_lanes_i;
  output gen_ver_i;
  output [0:0]SS;
  output tx_channel_up_i_0;
  input \free_count_r_reg[14]_0 ;
  input tx_verify;
  input wait_for_lane_up_r0;
  input hard_err_reset_i;
  input tx_reset;
  input [0:0]SR;
  input reset_channel_i;

  wire [0:0]SR;
  wire [0:0]SS;
  wire \free_count_r[10]_i_2_n_0 ;
  wire \free_count_r[10]_i_3_n_0 ;
  wire \free_count_r[10]_i_4_n_0 ;
  wire \free_count_r[10]_i_5_n_0 ;
  wire \free_count_r[14]_i_2_n_0 ;
  wire \free_count_r[14]_i_3_n_0 ;
  wire \free_count_r[14]_i_4_n_0 ;
  wire \free_count_r[14]_i_5_n_0 ;
  wire \free_count_r[2]_i_2_n_0 ;
  wire \free_count_r[2]_i_3_n_0 ;
  wire \free_count_r[2]_i_4_n_0 ;
  wire \free_count_r[6]_i_2_n_0 ;
  wire \free_count_r[6]_i_3_n_0 ;
  wire \free_count_r[6]_i_4_n_0 ;
  wire \free_count_r[6]_i_5_n_0 ;
  wire [0:14]free_count_r_reg;
  wire \free_count_r_reg[10]_i_1_n_0 ;
  wire \free_count_r_reg[10]_i_1_n_1 ;
  wire \free_count_r_reg[10]_i_1_n_2 ;
  wire \free_count_r_reg[10]_i_1_n_3 ;
  wire \free_count_r_reg[10]_i_1_n_4 ;
  wire \free_count_r_reg[10]_i_1_n_5 ;
  wire \free_count_r_reg[10]_i_1_n_6 ;
  wire \free_count_r_reg[10]_i_1_n_7 ;
  wire \free_count_r_reg[14]_0 ;
  wire \free_count_r_reg[14]_i_1_n_0 ;
  wire \free_count_r_reg[14]_i_1_n_1 ;
  wire \free_count_r_reg[14]_i_1_n_2 ;
  wire \free_count_r_reg[14]_i_1_n_3 ;
  wire \free_count_r_reg[14]_i_1_n_4 ;
  wire \free_count_r_reg[14]_i_1_n_5 ;
  wire \free_count_r_reg[14]_i_1_n_6 ;
  wire \free_count_r_reg[14]_i_1_n_7 ;
  wire \free_count_r_reg[2]_i_1_n_2 ;
  wire \free_count_r_reg[2]_i_1_n_3 ;
  wire \free_count_r_reg[2]_i_1_n_5 ;
  wire \free_count_r_reg[2]_i_1_n_6 ;
  wire \free_count_r_reg[2]_i_1_n_7 ;
  wire \free_count_r_reg[6]_i_1_n_0 ;
  wire \free_count_r_reg[6]_i_1_n_1 ;
  wire \free_count_r_reg[6]_i_1_n_2 ;
  wire \free_count_r_reg[6]_i_1_n_3 ;
  wire \free_count_r_reg[6]_i_1_n_4 ;
  wire \free_count_r_reg[6]_i_1_n_5 ;
  wire \free_count_r_reg[6]_i_1_n_6 ;
  wire \free_count_r_reg[6]_i_1_n_7 ;
  wire gen_ver_i;
  wire hard_err_reset_i;
  wire next_ready_c;
  wire next_verify_c;
  wire ready_r;
  wire ready_r2;
  wire reset_channel_i;
  wire reset_lanes_c;
  wire tx_channel_up;
  wire tx_channel_up_i_0;
  wire tx_reset;
  wire tx_reset_lanes_i;
  wire tx_verify;
  wire tx_verify_r;
  wire verify_watchdog_r0;
  wire \verify_watchdog_r_reg[14]_srl15_i_2_n_0 ;
  wire \verify_watchdog_r_reg[14]_srl15_i_3_n_0 ;
  wire \verify_watchdog_r_reg[14]_srl15_n_0 ;
  wire \verify_watchdog_r_reg_n_0_[15] ;
  wire wait_for_lane_up_r;
  wire wait_for_lane_up_r0;
  wire [3:2]\NLW_free_count_r_reg[2]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_free_count_r_reg[2]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    GEN_ECP_i_1
       (.I0(tx_channel_up),
        .O(tx_channel_up_i_0));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[10]_i_2 
       (.I0(free_count_r_reg[7]),
        .O(\free_count_r[10]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[10]_i_3 
       (.I0(free_count_r_reg[8]),
        .O(\free_count_r[10]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[10]_i_4 
       (.I0(free_count_r_reg[9]),
        .O(\free_count_r[10]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[10]_i_5 
       (.I0(free_count_r_reg[10]),
        .O(\free_count_r[10]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[14]_i_2 
       (.I0(free_count_r_reg[11]),
        .O(\free_count_r[14]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[14]_i_3 
       (.I0(free_count_r_reg[12]),
        .O(\free_count_r[14]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[14]_i_4 
       (.I0(free_count_r_reg[13]),
        .O(\free_count_r[14]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[14]_i_5 
       (.I0(free_count_r_reg[14]),
        .O(\free_count_r[14]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[2]_i_2 
       (.I0(free_count_r_reg[0]),
        .O(\free_count_r[2]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[2]_i_3 
       (.I0(free_count_r_reg[1]),
        .O(\free_count_r[2]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[2]_i_4 
       (.I0(free_count_r_reg[2]),
        .O(\free_count_r[2]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[6]_i_2 
       (.I0(free_count_r_reg[3]),
        .O(\free_count_r[6]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[6]_i_3 
       (.I0(free_count_r_reg[4]),
        .O(\free_count_r[6]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[6]_i_4 
       (.I0(free_count_r_reg[5]),
        .O(\free_count_r[6]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[6]_i_5 
       (.I0(free_count_r_reg[6]),
        .O(\free_count_r[6]_i_5_n_0 ));
  FDSE \free_count_r_reg[0] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[2]_i_1_n_5 ),
        .Q(free_count_r_reg[0]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[10] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[10]_i_1_n_7 ),
        .Q(free_count_r_reg[10]),
        .S(wait_for_lane_up_r0));
  CARRY4 \free_count_r_reg[10]_i_1 
       (.CI(\free_count_r_reg[14]_i_1_n_0 ),
        .CO({\free_count_r_reg[10]_i_1_n_0 ,\free_count_r_reg[10]_i_1_n_1 ,\free_count_r_reg[10]_i_1_n_2 ,\free_count_r_reg[10]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\free_count_r_reg[10]_i_1_n_4 ,\free_count_r_reg[10]_i_1_n_5 ,\free_count_r_reg[10]_i_1_n_6 ,\free_count_r_reg[10]_i_1_n_7 }),
        .S({\free_count_r[10]_i_2_n_0 ,\free_count_r[10]_i_3_n_0 ,\free_count_r[10]_i_4_n_0 ,\free_count_r[10]_i_5_n_0 }));
  FDSE \free_count_r_reg[11] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[14]_i_1_n_4 ),
        .Q(free_count_r_reg[11]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[12] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[14]_i_1_n_5 ),
        .Q(free_count_r_reg[12]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[13] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[14]_i_1_n_6 ),
        .Q(free_count_r_reg[13]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[14] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[14]_i_1_n_7 ),
        .Q(free_count_r_reg[14]),
        .S(wait_for_lane_up_r0));
  CARRY4 \free_count_r_reg[14]_i_1 
       (.CI(1'b0),
        .CO({\free_count_r_reg[14]_i_1_n_0 ,\free_count_r_reg[14]_i_1_n_1 ,\free_count_r_reg[14]_i_1_n_2 ,\free_count_r_reg[14]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\free_count_r_reg[14]_i_1_n_4 ,\free_count_r_reg[14]_i_1_n_5 ,\free_count_r_reg[14]_i_1_n_6 ,\free_count_r_reg[14]_i_1_n_7 }),
        .S({\free_count_r[14]_i_2_n_0 ,\free_count_r[14]_i_3_n_0 ,\free_count_r[14]_i_4_n_0 ,\free_count_r[14]_i_5_n_0 }));
  FDSE \free_count_r_reg[1] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[2]_i_1_n_6 ),
        .Q(free_count_r_reg[1]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[2] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[2]_i_1_n_7 ),
        .Q(free_count_r_reg[2]),
        .S(wait_for_lane_up_r0));
  CARRY4 \free_count_r_reg[2]_i_1 
       (.CI(\free_count_r_reg[6]_i_1_n_0 ),
        .CO({\NLW_free_count_r_reg[2]_i_1_CO_UNCONNECTED [3:2],\free_count_r_reg[2]_i_1_n_2 ,\free_count_r_reg[2]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b1,1'b1}),
        .O({\NLW_free_count_r_reg[2]_i_1_O_UNCONNECTED [3],\free_count_r_reg[2]_i_1_n_5 ,\free_count_r_reg[2]_i_1_n_6 ,\free_count_r_reg[2]_i_1_n_7 }),
        .S({1'b0,\free_count_r[2]_i_2_n_0 ,\free_count_r[2]_i_3_n_0 ,\free_count_r[2]_i_4_n_0 }));
  FDSE \free_count_r_reg[3] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[6]_i_1_n_4 ),
        .Q(free_count_r_reg[3]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[4] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[6]_i_1_n_5 ),
        .Q(free_count_r_reg[4]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[5] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[6]_i_1_n_6 ),
        .Q(free_count_r_reg[5]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[6] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[6]_i_1_n_7 ),
        .Q(free_count_r_reg[6]),
        .S(wait_for_lane_up_r0));
  CARRY4 \free_count_r_reg[6]_i_1 
       (.CI(\free_count_r_reg[10]_i_1_n_0 ),
        .CO({\free_count_r_reg[6]_i_1_n_0 ,\free_count_r_reg[6]_i_1_n_1 ,\free_count_r_reg[6]_i_1_n_2 ,\free_count_r_reg[6]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\free_count_r_reg[6]_i_1_n_4 ,\free_count_r_reg[6]_i_1_n_5 ,\free_count_r_reg[6]_i_1_n_6 ,\free_count_r_reg[6]_i_1_n_7 }),
        .S({\free_count_r[6]_i_2_n_0 ,\free_count_r[6]_i_3_n_0 ,\free_count_r[6]_i_4_n_0 ,\free_count_r[6]_i_5_n_0 }));
  FDSE \free_count_r_reg[7] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[10]_i_1_n_4 ),
        .Q(free_count_r_reg[7]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[8] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[10]_i_1_n_5 ),
        .Q(free_count_r_reg[8]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[9] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[10]_i_1_n_6 ),
        .Q(free_count_r_reg[9]),
        .S(wait_for_lane_up_r0));
  FDRE ready_r2_reg
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(ready_r),
        .Q(ready_r2),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    ready_r_i_1__0
       (.I0(gen_ver_i),
        .I1(tx_verify_r),
        .I2(ready_r),
        .O(next_ready_c));
  FDRE ready_r_reg
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(next_ready_c),
        .Q(ready_r),
        .R(wait_for_lane_up_r0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b1)) 
    reset_lanes_flop_i
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(reset_lanes_c),
        .Q(tx_reset_lanes_i),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFEEFEEEFEEEFE)) 
    reset_lanes_flop_i_i_1
       (.I0(tx_reset),
        .I1(SR),
        .I2(reset_channel_i),
        .I3(wait_for_lane_up_r),
        .I4(gen_ver_i),
        .I5(\verify_watchdog_r_reg_n_0_[15] ),
        .O(reset_lanes_c));
  LUT2 #(
    .INIT(4'hE)) 
    rst_r_i_1
       (.I0(tx_reset_lanes_i),
        .I1(hard_err_reset_i),
        .O(SS));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    tx_channel_up_i
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(ready_r2),
        .Q(tx_channel_up),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    tx_verify_r_reg
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(tx_verify),
        .Q(tx_verify_r),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    verify_r_i_1
       (.I0(tx_verify_r),
        .I1(gen_ver_i),
        .I2(wait_for_lane_up_r),
        .O(next_verify_c));
  FDRE verify_r_reg
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(next_verify_c),
        .Q(gen_ver_i),
        .R(wait_for_lane_up_r0));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/tx_channel_init_sm_simplex_i/verify_watchdog_r_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/tx_channel_init_sm_simplex_i/verify_watchdog_r_reg[14]_srl15 " *) 
  SRL16E \verify_watchdog_r_reg[14]_srl15 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b1),
        .CE(verify_watchdog_r0),
        .CLK(\free_count_r_reg[14]_0 ),
        .D(gen_ver_i),
        .Q(\verify_watchdog_r_reg[14]_srl15_n_0 ));
  LUT6 #(
    .INIT(64'h00020000FFFFFFFF)) 
    \verify_watchdog_r_reg[14]_srl15_i_1 
       (.I0(\verify_watchdog_r_reg[14]_srl15_i_2_n_0 ),
        .I1(free_count_r_reg[14]),
        .I2(free_count_r_reg[13]),
        .I3(free_count_r_reg[12]),
        .I4(\verify_watchdog_r_reg[14]_srl15_i_3_n_0 ),
        .I5(gen_ver_i),
        .O(verify_watchdog_r0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \verify_watchdog_r_reg[14]_srl15_i_2 
       (.I0(free_count_r_reg[9]),
        .I1(free_count_r_reg[8]),
        .I2(free_count_r_reg[11]),
        .I3(free_count_r_reg[10]),
        .I4(free_count_r_reg[6]),
        .I5(free_count_r_reg[7]),
        .O(\verify_watchdog_r_reg[14]_srl15_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \verify_watchdog_r_reg[14]_srl15_i_3 
       (.I0(free_count_r_reg[3]),
        .I1(free_count_r_reg[2]),
        .I2(free_count_r_reg[5]),
        .I3(free_count_r_reg[4]),
        .I4(free_count_r_reg[0]),
        .I5(free_count_r_reg[1]),
        .O(\verify_watchdog_r_reg[14]_srl15_i_3_n_0 ));
  FDRE \verify_watchdog_r_reg[15] 
       (.C(\free_count_r_reg[14]_0 ),
        .CE(verify_watchdog_r0),
        .D(\verify_watchdog_r_reg[14]_srl15_n_0 ),
        .Q(\verify_watchdog_r_reg_n_0_[15] ),
        .R(1'b0));
  FDRE wait_for_lane_up_r_reg
       (.C(\free_count_r_reg[14]_0 ),
        .CE(1'b1),
        .D(wait_for_lane_up_r0),
        .Q(wait_for_lane_up_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_TX_ERR_DETECT_SIMPLEX" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_ERR_DETECT_SIMPLEX
   (hard_err_reset_i,
    hard_err_flop_r_reg_0,
    hard_err_flop_r_reg_1,
    hard_err_flop_r_reg_2,
    ENABLE_ERR_DETECT);
  output hard_err_reset_i;
  output hard_err_flop_r_reg_0;
  input hard_err_flop_r_reg_1;
  input hard_err_flop_r_reg_2;
  input ENABLE_ERR_DETECT;

  wire ENABLE_ERR_DETECT;
  wire hard_err_flop_r_reg_0;
  wire hard_err_flop_r_reg_1;
  wire hard_err_flop_r_reg_2;
  wire hard_err_reset_i;

  FDRE hard_err_flop_r_reg
       (.C(hard_err_flop_r_reg_2),
        .CE(1'b1),
        .D(hard_err_flop_r_reg_1),
        .Q(hard_err_reset_i),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    hard_err_r_reg_srl2_i_1
       (.I0(hard_err_reset_i),
        .I1(ENABLE_ERR_DETECT),
        .O(hard_err_flop_r_reg_0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX
   (tx_channel_up,
    tx_reset_lanes_i,
    D,
    gen_a_i,
    gen_k_flop_0_i,
    gen_r_flop_0_i,
    reset_channel_i,
    tx_hard_err,
    SS,
    tx_channel_up_i,
    \free_count_r_reg[14] ,
    tx_system_reset_c,
    tx_verify,
    wait_for_lane_up_r0,
    tx_lane_up,
    CHANNEL_HARD_ERR_reg,
    power_down,
    hard_err_reset_i,
    tx_reset,
    SR);
  output tx_channel_up;
  output tx_reset_lanes_i;
  output [1:0]D;
  output gen_a_i;
  output [1:0]gen_k_flop_0_i;
  output [1:0]gen_r_flop_0_i;
  output reset_channel_i;
  output tx_hard_err;
  output [0:0]SS;
  output tx_channel_up_i;
  input \free_count_r_reg[14] ;
  input tx_system_reset_c;
  input tx_verify;
  input wait_for_lane_up_r0;
  input tx_lane_up;
  input CHANNEL_HARD_ERR_reg;
  input power_down;
  input hard_err_reset_i;
  input tx_reset;
  input [0:0]SR;

  wire CHANNEL_HARD_ERR_reg;
  wire [1:0]D;
  wire [0:0]SR;
  wire [0:0]SS;
  wire \free_count_r_reg[14] ;
  wire gen_a_i;
  wire [1:0]gen_k_flop_0_i;
  wire [1:0]gen_r_flop_0_i;
  wire gen_ver_i;
  wire hard_err_reset_i;
  wire power_down;
  wire reset_channel_i;
  wire tx_channel_up;
  wire tx_channel_up_i;
  wire tx_hard_err;
  wire tx_lane_up;
  wire tx_reset;
  wire tx_reset_lanes_i;
  wire tx_system_reset_c;
  wire tx_verify;
  wire wait_for_lane_up_r0;

  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_IDLE_AND_VER_GEN idle_and_ver_gen_i
       (.D(D),
        .SR(SR),
        .gen_a_i(gen_a_i),
        .gen_k_flop_0_i_0(gen_k_flop_0_i),
        .gen_r_flop_0_i_0(gen_r_flop_0_i),
        .gen_ver_i(gen_ver_i),
        .prev_cycle_gen_ver_r_reg_0(\free_count_r_reg[14] ),
        .tx_reset(tx_reset),
        .tx_system_reset_c(tx_system_reset_c));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_ERR_DETECT_SIMPLEX tx_channel_err_detect_simplex_i
       (.CHANNEL_HARD_ERR_reg_0(CHANNEL_HARD_ERR_reg),
        .lane_up_r_reg_0(\free_count_r_reg[14] ),
        .power_down(power_down),
        .reset_channel_i(reset_channel_i),
        .tx_hard_err(tx_hard_err),
        .tx_lane_up(tx_lane_up));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_INIT_SM_SIMPLEX tx_channel_init_sm_simplex_i
       (.SR(SR),
        .SS(SS),
        .\free_count_r_reg[14]_0 (\free_count_r_reg[14] ),
        .gen_ver_i(gen_ver_i),
        .hard_err_reset_i(hard_err_reset_i),
        .reset_channel_i(reset_channel_i),
        .tx_channel_up(tx_channel_up),
        .tx_channel_up_i_0(tx_channel_up_i),
        .tx_reset(tx_reset),
        .tx_reset_lanes_i(tx_reset_lanes_i),
        .tx_verify(tx_verify),
        .wait_for_lane_up_r0(wait_for_lane_up_r0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_TX_LANE_INIT_SM_SIMPLEX" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LANE_INIT_SM_SIMPLEX
   (tx_lane_up,
    ENABLE_ERR_DETECT,
    odd_word_r_reg_0,
    D,
    tx_reset_lanes_i,
    \counter1_r_reg[0]_0 ,
    SS,
    tx_aligned);
  output tx_lane_up;
  output ENABLE_ERR_DETECT;
  output odd_word_r_reg_0;
  output [1:0]D;
  input tx_reset_lanes_i;
  input \counter1_r_reg[0]_0 ;
  input [0:0]SS;
  input tx_aligned;

  wire [1:0]D;
  wire ENABLE_ERR_DETECT;
  wire [0:0]SS;
  wire align_r;
  wire count_8d_done_r;
  wire \counter1_r_reg[0]_0 ;
  wire \counter1_r_reg_n_0_[1] ;
  wire \counter1_r_reg_n_0_[2] ;
  wire \counter1_r_reg_n_0_[3] ;
  wire gtp_tx_reset_i;
  wire next_align_c;
  wire next_ready_c;
  wire next_rst_c;
  wire odd_word_r;
  wire odd_word_r_i_1_n_0;
  wire odd_word_r_reg_0;
  wire [3:0]p_0_in__1;
  wire ready_r;
  wire tx_aligned;
  wire tx_aligned_r;
  wire tx_lane_up;
  wire tx_reset_lanes_i;

  FDRE ENABLE_ERR_DETECT_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(ready_r),
        .Q(ENABLE_ERR_DETECT),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hF444)) 
    align_r_i_1
       (.I0(tx_aligned_r),
        .I1(align_r),
        .I2(count_8d_done_r),
        .I3(gtp_tx_reset_i),
        .O(next_align_c));
  FDRE align_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(next_align_c),
        .Q(align_r),
        .R(SS));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter1_r[0]_i_1 
       (.I0(\counter1_r_reg_n_0_[1] ),
        .I1(\counter1_r_reg_n_0_[3] ),
        .I2(\counter1_r_reg_n_0_[2] ),
        .I3(count_8d_done_r),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter1_r[1]_i_1 
       (.I0(\counter1_r_reg_n_0_[2] ),
        .I1(\counter1_r_reg_n_0_[3] ),
        .I2(\counter1_r_reg_n_0_[1] ),
        .O(p_0_in__1[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \counter1_r[2]_i_1 
       (.I0(\counter1_r_reg_n_0_[3] ),
        .I1(\counter1_r_reg_n_0_[2] ),
        .O(p_0_in__1[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \counter1_r[3]_i_1 
       (.I0(\counter1_r_reg_n_0_[3] ),
        .O(p_0_in__1[0]));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[0] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_0_in__1[3]),
        .Q(count_8d_done_r),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[1] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_0_in__1[2]),
        .Q(\counter1_r_reg_n_0_[1] ),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[2] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_0_in__1[1]),
        .Q(\counter1_r_reg_n_0_[2] ),
        .R(SS));
  FDSE #(
    .INIT(1'b1)) 
    \counter1_r_reg[3] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_0_in__1[0]),
        .Q(\counter1_r_reg_n_0_[3] ),
        .S(SS));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    gen_k_fsm_r_i_1
       (.I0(odd_word_r),
        .I1(ready_r),
        .O(odd_word_r_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \gen_sp_data_r[0]_i_1 
       (.I0(odd_word_r),
        .I1(ready_r),
        .O(D[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \gen_sp_data_r[1]_i_1 
       (.I0(ready_r),
        .O(D[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    lane_up_flop_i
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(ready_r),
        .Q(tx_lane_up),
        .R(tx_reset_lanes_i));
  LUT1 #(
    .INIT(2'h1)) 
    odd_word_r_i_1
       (.I0(odd_word_r),
        .O(odd_word_r_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    odd_word_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(odd_word_r_i_1_n_0),
        .Q(odd_word_r),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    ready_r_i_1
       (.I0(tx_aligned_r),
        .I1(align_r),
        .I2(ready_r),
        .O(next_ready_c));
  FDRE ready_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(next_ready_c),
        .Q(ready_r),
        .R(SS));
  LUT2 #(
    .INIT(4'h2)) 
    rst_r_i_2
       (.I0(gtp_tx_reset_i),
        .I1(count_8d_done_r),
        .O(next_rst_c));
  FDSE rst_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(next_rst_c),
        .Q(gtp_tx_reset_i),
        .S(SS));
  FDRE #(
    .INIT(1'b1)) 
    tx_aligned_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(tx_aligned),
        .Q(tx_aligned_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_TX_LL" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL
   (gen_cc_i,
    GEN_PAD,
    TX_PE_DATA_V,
    GEN_ECP,
    GEN_SCP,
    tx_dst_rdy,
    s_axi_tx_tready,
    \TX_PE_DATA_reg[0] ,
    gen_pad_r_reg,
    in_frame_r_reg,
    Q,
    storage_pad_r_reg,
    s_axi_tx_tlast,
    s_axi_tx_tvalid,
    s_axi_tx_tkeep,
    s_axi_tx_tdata);
  output gen_cc_i;
  output GEN_PAD;
  output TX_PE_DATA_V;
  output GEN_ECP;
  output GEN_SCP;
  output tx_dst_rdy;
  output s_axi_tx_tready;
  output [15:0]\TX_PE_DATA_reg[0] ;
  input gen_pad_r_reg;
  input in_frame_r_reg;
  input Q;
  input storage_pad_r_reg;
  input s_axi_tx_tlast;
  input s_axi_tx_tvalid;
  input [0:1]s_axi_tx_tkeep;
  input [0:15]s_axi_tx_tdata;

  wire GEN_ECP;
  wire GEN_PAD;
  wire GEN_SCP;
  wire Q;
  wire TX_PE_DATA_V;
  wire [15:0]\TX_PE_DATA_reg[0] ;
  wire do_cc_r;
  wire gen_cc_i;
  wire gen_pad_r_reg;
  wire in_frame_r_reg;
  wire pdu_ok_c;
  wire [0:15]s_axi_tx_tdata;
  wire [0:1]s_axi_tx_tkeep;
  wire s_axi_tx_tlast;
  wire s_axi_tx_tready;
  wire s_axi_tx_tvalid;
  wire storage_pad_r_reg;
  wire tx_dst_rdy;
  wire tx_ll_control_i_n_6;
  wire tx_ll_control_i_n_8;
  wire tx_ll_datapath_i_n_2;

  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_CONTROL tx_ll_control_i
       (.E(pdu_ok_c),
        .GEN_ECP(GEN_ECP),
        .GEN_SCP(GEN_SCP),
        .Q(Q),
        .TX_DST_RDY_N_reg_0(tx_dst_rdy),
        .data_r_reg_0(in_frame_r_reg),
        .do_cc_r(do_cc_r),
        .gen_cc_i(gen_cc_i),
        .in_frame_r_reg(tx_ll_datapath_i_n_2),
        .new_pkt_r_reg(tx_ll_control_i_n_6),
        .s_axi_tx_tlast(s_axi_tx_tlast),
        .s_axi_tx_tready(s_axi_tx_tready),
        .s_axi_tx_tvalid(s_axi_tx_tvalid),
        .s_axi_tx_tvalid_0(tx_ll_control_i_n_8),
        .sof_data_eof_1_r_reg_0(storage_pad_r_reg),
        .sof_r_reg_0(gen_pad_r_reg));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_DATAPATH tx_ll_datapath_i
       (.E(pdu_ok_c),
        .GEN_PAD(GEN_PAD),
        .TX_PE_DATA_V(TX_PE_DATA_V),
        .\TX_PE_DATA_reg[0]_0 (\TX_PE_DATA_reg[0] ),
        .do_cc_r(do_cc_r),
        .gen_pad_r_reg_0(gen_pad_r_reg),
        .in_frame_r_reg_0(tx_ll_datapath_i_n_2),
        .in_frame_r_reg_1(in_frame_r_reg),
        .in_frame_r_reg_2(tx_ll_control_i_n_6),
        .s_axi_tx_tdata(s_axi_tx_tdata),
        .s_axi_tx_tkeep(s_axi_tx_tkeep),
        .s_axi_tx_tvalid(s_axi_tx_tvalid),
        .storage_pad_r_reg_0(storage_pad_r_reg),
        .storage_pad_r_reg_1(tx_ll_control_i_n_8),
        .tx_dst_rdy(tx_dst_rdy));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_TX_LL_CONTROL" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_CONTROL
   (gen_cc_i,
    do_cc_r,
    GEN_ECP,
    GEN_SCP,
    TX_DST_RDY_N_reg_0,
    E,
    new_pkt_r_reg,
    s_axi_tx_tready,
    s_axi_tx_tvalid_0,
    sof_r_reg_0,
    data_r_reg_0,
    Q,
    sof_data_eof_1_r_reg_0,
    s_axi_tx_tlast,
    s_axi_tx_tvalid,
    in_frame_r_reg);
  output gen_cc_i;
  output do_cc_r;
  output GEN_ECP;
  output GEN_SCP;
  output TX_DST_RDY_N_reg_0;
  output [0:0]E;
  output new_pkt_r_reg;
  output s_axi_tx_tready;
  output s_axi_tx_tvalid_0;
  input sof_r_reg_0;
  input data_r_reg_0;
  input Q;
  input sof_data_eof_1_r_reg_0;
  input s_axi_tx_tlast;
  input s_axi_tx_tvalid;
  input in_frame_r_reg;

  wire [0:0]E;
  wire GEN_ECP;
  wire GEN_ECP0;
  wire GEN_SCP;
  wire GEN_SCP0;
  wire Q;
  wire TX_DST_RDY_N_i_2_n_0;
  wire TX_DST_RDY_N_i_3_n_0;
  wire TX_DST_RDY_N_reg_0;
  wire data_eof_1_r;
  wire data_eof_2_r;
  wire data_eof_3_r;
  wire data_r;
  wire data_r_reg_0;
  wire do_cc_r;
  wire gen_cc_i;
  wire idle_r;
  wire in_frame_r_reg;
  wire new_pkt_r_reg;
  wire next_data_c;
  wire next_data_eof_1_c;
  wire next_idle_c;
  wire next_sof_c;
  wire next_sof_data_eof_1_c;
  wire s_axi_tx_tlast;
  wire s_axi_tx_tready;
  wire s_axi_tx_tvalid;
  wire s_axi_tx_tvalid_0;
  wire sof_data_eof_1_r;
  wire sof_data_eof_1_r_reg_0;
  wire sof_data_eof_2_r;
  wire sof_data_eof_3_r;
  wire sof_r;
  wire sof_r_i_2_n_0;
  wire sof_r_reg_0;
  wire tx_dst_rdy_n_c;

  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    GEN_ECP_i_2
       (.I0(data_eof_3_r),
        .I1(sof_data_eof_3_r),
        .I2(do_cc_r),
        .O(GEN_ECP0));
  FDRE GEN_ECP_reg
       (.C(sof_r_reg_0),
        .CE(1'b1),
        .D(GEN_ECP0),
        .Q(GEN_ECP),
        .R(data_r_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h32)) 
    GEN_SCP_i_1
       (.I0(sof_data_eof_1_r),
        .I1(do_cc_r),
        .I2(sof_r),
        .O(GEN_SCP0));
  FDRE GEN_SCP_reg
       (.C(sof_r_reg_0),
        .CE(1'b1),
        .D(GEN_SCP0),
        .Q(GEN_SCP),
        .R(data_r_reg_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
    TX_DST_RDY_N_i_1
       (.I0(Q),
        .I1(data_eof_1_r),
        .I2(do_cc_r),
        .I3(sof_data_eof_2_r),
        .I4(sof_data_eof_1_r),
        .I5(TX_DST_RDY_N_i_2_n_0),
        .O(tx_dst_rdy_n_c));
  LUT6 #(
    .INIT(64'hAAAAAAAA0000FF30)) 
    TX_DST_RDY_N_i_2
       (.I0(data_eof_2_r),
        .I1(sof_data_eof_1_r_reg_0),
        .I2(sof_r_i_2_n_0),
        .I3(TX_DST_RDY_N_i_3_n_0),
        .I4(s_axi_tx_tvalid_0),
        .I5(do_cc_r),
        .O(TX_DST_RDY_N_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    TX_DST_RDY_N_i_3
       (.I0(sof_r),
        .I1(data_r),
        .O(TX_DST_RDY_N_i_3_n_0));
  FDSE TX_DST_RDY_N_reg
       (.C(sof_r_reg_0),
        .CE(1'b1),
        .D(tx_dst_rdy_n_c),
        .Q(TX_DST_RDY_N_reg_0),
        .S(data_r_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h00E00000)) 
    data_eof_1_r_i_1
       (.I0(data_r),
        .I1(sof_r),
        .I2(s_axi_tx_tlast),
        .I3(TX_DST_RDY_N_reg_0),
        .I4(s_axi_tx_tvalid),
        .O(next_data_eof_1_c));
  FDRE data_eof_1_r_reg
       (.C(sof_r_reg_0),
        .CE(E),
        .D(next_data_eof_1_c),
        .Q(data_eof_1_r),
        .R(data_r_reg_0));
  FDRE data_eof_2_r_reg
       (.C(sof_r_reg_0),
        .CE(E),
        .D(data_eof_1_r),
        .Q(data_eof_2_r),
        .R(data_r_reg_0));
  FDRE data_eof_3_r_reg
       (.C(sof_r_reg_0),
        .CE(E),
        .D(data_eof_2_r),
        .Q(data_eof_3_r),
        .R(data_r_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'hEE0EEEEE)) 
    data_r_i_1
       (.I0(data_r),
        .I1(sof_r),
        .I2(s_axi_tx_tlast),
        .I3(TX_DST_RDY_N_reg_0),
        .I4(s_axi_tx_tvalid),
        .O(next_data_c));
  FDRE data_r_reg
       (.C(sof_r_reg_0),
        .CE(E),
        .D(next_data_c),
        .Q(data_r),
        .R(data_r_reg_0));
  FDRE do_cc_r_reg
       (.C(sof_r_reg_0),
        .CE(1'b1),
        .D(Q),
        .Q(do_cc_r),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    gen_cc_flop_0_i
       (.C(sof_r_reg_0),
        .CE(1'b1),
        .D(do_cc_r),
        .Q(gen_cc_i),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hEFEFEFEFEFEFEF00)) 
    idle_r_i_1
       (.I0(sof_data_eof_1_r_reg_0),
        .I1(TX_DST_RDY_N_reg_0),
        .I2(s_axi_tx_tvalid),
        .I3(idle_r),
        .I4(sof_data_eof_3_r),
        .I5(data_eof_3_r),
        .O(next_idle_c));
  FDSE idle_r_reg
       (.C(sof_r_reg_0),
        .CE(E),
        .D(next_idle_c),
        .Q(idle_r),
        .S(data_r_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'hF3FF0100)) 
    in_frame_r_i_1
       (.I0(sof_data_eof_1_r_reg_0),
        .I1(s_axi_tx_tlast),
        .I2(TX_DST_RDY_N_reg_0),
        .I3(s_axi_tx_tvalid),
        .I4(in_frame_r_reg),
        .O(new_pkt_r_reg));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT1 #(
    .INIT(2'h1)) 
    s_axi_tx_tready_INST_0
       (.I0(TX_DST_RDY_N_reg_0),
        .O(s_axi_tx_tready));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h11111110)) 
    sof_data_eof_1_r_i_1
       (.I0(sof_data_eof_1_r_reg_0),
        .I1(s_axi_tx_tvalid_0),
        .I2(idle_r),
        .I3(sof_data_eof_3_r),
        .I4(data_eof_3_r),
        .O(next_sof_data_eof_1_c));
  FDRE sof_data_eof_1_r_reg
       (.C(sof_r_reg_0),
        .CE(E),
        .D(next_sof_data_eof_1_c),
        .Q(sof_data_eof_1_r),
        .R(data_r_reg_0));
  FDRE sof_data_eof_2_r_reg
       (.C(sof_r_reg_0),
        .CE(E),
        .D(sof_data_eof_1_r),
        .Q(sof_data_eof_2_r),
        .R(data_r_reg_0));
  FDRE sof_data_eof_3_r_reg
       (.C(sof_r_reg_0),
        .CE(E),
        .D(sof_data_eof_2_r),
        .Q(sof_data_eof_3_r),
        .R(data_r_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h00040000)) 
    sof_r_i_1
       (.I0(s_axi_tx_tlast),
        .I1(s_axi_tx_tvalid),
        .I2(TX_DST_RDY_N_reg_0),
        .I3(sof_data_eof_1_r_reg_0),
        .I4(sof_r_i_2_n_0),
        .O(next_sof_c));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    sof_r_i_2
       (.I0(data_eof_3_r),
        .I1(sof_data_eof_3_r),
        .I2(idle_r),
        .O(sof_r_i_2_n_0));
  FDRE sof_r_reg
       (.C(sof_r_reg_0),
        .CE(E),
        .D(next_sof_c),
        .Q(sof_r),
        .R(data_r_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    storage_pad_r_i_2
       (.I0(s_axi_tx_tvalid),
        .I1(TX_DST_RDY_N_reg_0),
        .I2(s_axi_tx_tlast),
        .O(s_axi_tx_tvalid_0));
  LUT1 #(
    .INIT(2'h1)) 
    \storage_r[0]_i_1 
       (.I0(do_cc_r),
        .O(E));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_TX_LL_DATAPATH" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_DATAPATH
   (GEN_PAD,
    TX_PE_DATA_V,
    in_frame_r_reg_0,
    \TX_PE_DATA_reg[0]_0 ,
    gen_pad_r_reg_0,
    E,
    in_frame_r_reg_1,
    in_frame_r_reg_2,
    do_cc_r,
    storage_pad_r_reg_0,
    s_axi_tx_tvalid,
    tx_dst_rdy,
    s_axi_tx_tkeep,
    storage_pad_r_reg_1,
    s_axi_tx_tdata);
  output GEN_PAD;
  output TX_PE_DATA_V;
  output in_frame_r_reg_0;
  output [15:0]\TX_PE_DATA_reg[0]_0 ;
  input gen_pad_r_reg_0;
  input [0:0]E;
  input in_frame_r_reg_1;
  input in_frame_r_reg_2;
  input do_cc_r;
  input storage_pad_r_reg_0;
  input s_axi_tx_tvalid;
  input tx_dst_rdy;
  input [0:1]s_axi_tx_tkeep;
  input storage_pad_r_reg_1;
  input [0:15]s_axi_tx_tdata;

  wire [0:0]E;
  wire GEN_PAD;
  wire GEN_PAD_i_1_n_0;
  wire TX_PE_DATA_V;
  wire TX_PE_DATA_V_i_1_n_0;
  wire [15:0]\TX_PE_DATA_reg[0]_0 ;
  wire do_cc_r;
  wire gen_pad_r;
  wire gen_pad_r_reg_0;
  wire in_frame_c;
  wire in_frame_r_reg_0;
  wire in_frame_r_reg_1;
  wire in_frame_r_reg_2;
  wire [0:15]s_axi_tx_tdata;
  wire [0:1]s_axi_tx_tkeep;
  wire s_axi_tx_tvalid;
  wire storage_pad_r;
  wire storage_pad_r0;
  wire storage_pad_r_reg_0;
  wire storage_pad_r_reg_1;
  wire [0:15]storage_r;
  wire storage_v_r;
  wire tx_dst_rdy;
  wire \tx_pe_data_r_reg_n_0_[0] ;
  wire \tx_pe_data_r_reg_n_0_[10] ;
  wire \tx_pe_data_r_reg_n_0_[11] ;
  wire \tx_pe_data_r_reg_n_0_[12] ;
  wire \tx_pe_data_r_reg_n_0_[13] ;
  wire \tx_pe_data_r_reg_n_0_[14] ;
  wire \tx_pe_data_r_reg_n_0_[15] ;
  wire \tx_pe_data_r_reg_n_0_[1] ;
  wire \tx_pe_data_r_reg_n_0_[2] ;
  wire \tx_pe_data_r_reg_n_0_[3] ;
  wire \tx_pe_data_r_reg_n_0_[4] ;
  wire \tx_pe_data_r_reg_n_0_[5] ;
  wire \tx_pe_data_r_reg_n_0_[6] ;
  wire \tx_pe_data_r_reg_n_0_[7] ;
  wire \tx_pe_data_r_reg_n_0_[8] ;
  wire \tx_pe_data_r_reg_n_0_[9] ;
  wire tx_pe_data_v_r;

  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    GEN_PAD_i_1
       (.I0(gen_pad_r),
        .I1(do_cc_r),
        .O(GEN_PAD_i_1_n_0));
  FDRE GEN_PAD_reg
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(GEN_PAD_i_1_n_0),
        .Q(GEN_PAD),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TX_PE_DATA_V_i_1
       (.I0(tx_pe_data_v_r),
        .I1(do_cc_r),
        .O(TX_PE_DATA_V_i_1_n_0));
  FDRE TX_PE_DATA_V_reg
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(TX_PE_DATA_V_i_1_n_0),
        .Q(TX_PE_DATA_V),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[0] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[0] ),
        .Q(\TX_PE_DATA_reg[0]_0 [15]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[10] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[10] ),
        .Q(\TX_PE_DATA_reg[0]_0 [5]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[11] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[11] ),
        .Q(\TX_PE_DATA_reg[0]_0 [4]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[12] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[12] ),
        .Q(\TX_PE_DATA_reg[0]_0 [3]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[13] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[13] ),
        .Q(\TX_PE_DATA_reg[0]_0 [2]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[14] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[14] ),
        .Q(\TX_PE_DATA_reg[0]_0 [1]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[15] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[15] ),
        .Q(\TX_PE_DATA_reg[0]_0 [0]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[1] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[1] ),
        .Q(\TX_PE_DATA_reg[0]_0 [14]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[2] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[2] ),
        .Q(\TX_PE_DATA_reg[0]_0 [13]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[3] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[3] ),
        .Q(\TX_PE_DATA_reg[0]_0 [12]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[4] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[4] ),
        .Q(\TX_PE_DATA_reg[0]_0 [11]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[5] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[5] ),
        .Q(\TX_PE_DATA_reg[0]_0 [10]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[6] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[6] ),
        .Q(\TX_PE_DATA_reg[0]_0 [9]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[7] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[7] ),
        .Q(\TX_PE_DATA_reg[0]_0 [8]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[8] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[8] ),
        .Q(\TX_PE_DATA_reg[0]_0 [7]),
        .R(1'b0));
  FDRE \TX_PE_DATA_reg[9] 
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(\tx_pe_data_r_reg_n_0_[9] ),
        .Q(\TX_PE_DATA_reg[0]_0 [6]),
        .R(1'b0));
  FDRE gen_pad_r_reg
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_pad_r),
        .Q(gen_pad_r),
        .R(1'b0));
  FDRE in_frame_r_reg
       (.C(gen_pad_r_reg_0),
        .CE(1'b1),
        .D(in_frame_r_reg_2),
        .Q(in_frame_r_reg_0),
        .R(in_frame_r_reg_1));
  LUT5 #(
    .INIT(32'h000000B0)) 
    storage_pad_r_i_1
       (.I0(in_frame_r_reg_0),
        .I1(storage_pad_r_reg_0),
        .I2(s_axi_tx_tkeep[0]),
        .I3(s_axi_tx_tkeep[1]),
        .I4(storage_pad_r_reg_1),
        .O(storage_pad_r0));
  FDRE storage_pad_r_reg
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_pad_r0),
        .Q(storage_pad_r),
        .R(1'b0));
  FDRE \storage_r_reg[0] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[0]),
        .Q(storage_r[0]),
        .R(1'b0));
  FDRE \storage_r_reg[10] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[10]),
        .Q(storage_r[10]),
        .R(1'b0));
  FDRE \storage_r_reg[11] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[11]),
        .Q(storage_r[11]),
        .R(1'b0));
  FDRE \storage_r_reg[12] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[12]),
        .Q(storage_r[12]),
        .R(1'b0));
  FDRE \storage_r_reg[13] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[13]),
        .Q(storage_r[13]),
        .R(1'b0));
  FDRE \storage_r_reg[14] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[14]),
        .Q(storage_r[14]),
        .R(1'b0));
  FDRE \storage_r_reg[15] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[15]),
        .Q(storage_r[15]),
        .R(1'b0));
  FDRE \storage_r_reg[1] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[1]),
        .Q(storage_r[1]),
        .R(1'b0));
  FDRE \storage_r_reg[2] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[2]),
        .Q(storage_r[2]),
        .R(1'b0));
  FDRE \storage_r_reg[3] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[3]),
        .Q(storage_r[3]),
        .R(1'b0));
  FDRE \storage_r_reg[4] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[4]),
        .Q(storage_r[4]),
        .R(1'b0));
  FDRE \storage_r_reg[5] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[5]),
        .Q(storage_r[5]),
        .R(1'b0));
  FDRE \storage_r_reg[6] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[6]),
        .Q(storage_r[6]),
        .R(1'b0));
  FDRE \storage_r_reg[7] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[7]),
        .Q(storage_r[7]),
        .R(1'b0));
  FDRE \storage_r_reg[8] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[8]),
        .Q(storage_r[8]),
        .R(1'b0));
  FDRE \storage_r_reg[9] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(s_axi_tx_tdata[9]),
        .Q(storage_r[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h00D0)) 
    storage_v_r_i_1
       (.I0(storage_pad_r_reg_0),
        .I1(in_frame_r_reg_0),
        .I2(s_axi_tx_tvalid),
        .I3(tx_dst_rdy),
        .O(in_frame_c));
  FDRE storage_v_r_reg
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(in_frame_c),
        .Q(storage_v_r),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[0] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[0]),
        .Q(\tx_pe_data_r_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[10] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[10]),
        .Q(\tx_pe_data_r_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[11] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[11]),
        .Q(\tx_pe_data_r_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[12] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[12]),
        .Q(\tx_pe_data_r_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[13] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[13]),
        .Q(\tx_pe_data_r_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[14] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[14]),
        .Q(\tx_pe_data_r_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[15] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[15]),
        .Q(\tx_pe_data_r_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[1] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[1]),
        .Q(\tx_pe_data_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[2] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[2]),
        .Q(\tx_pe_data_r_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[3] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[3]),
        .Q(\tx_pe_data_r_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[4] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[4]),
        .Q(\tx_pe_data_r_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[5] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[5]),
        .Q(\tx_pe_data_r_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[6] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[6]),
        .Q(\tx_pe_data_r_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[7] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[7]),
        .Q(\tx_pe_data_r_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[8] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[8]),
        .Q(\tx_pe_data_r_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \tx_pe_data_r_reg[9] 
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_r[9]),
        .Q(\tx_pe_data_r_reg_n_0_[9] ),
        .R(1'b0));
  FDRE tx_pe_data_v_r_reg
       (.C(gen_pad_r_reg_0),
        .CE(E),
        .D(storage_v_r),
        .Q(tx_pe_data_v_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync
   (D,
    gt_reset,
    init_clk_in);
  output [0:0]D;
  input gt_reset;
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  assign D[0] = s_level_out_d6;
  assign p_level_in_int = gt_reset;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(p_level_in_d1_cdc_from));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_0
   (D,
    tx_system_reset,
    s_level_out_d6_reg_0);
  output [0:0]D;
  input tx_system_reset;
  input s_level_out_d6_reg_0;

  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  assign D[0] = s_level_out_d6;
  assign p_level_in_int = tx_system_reset;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(p_level_in_d1_cdc_from));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_3
   (\FSM_sequential_tx_state_reg[0] ,
    E,
    in0,
    init_clk_in,
    Q,
    reset_time_out,
    txresetdone_s3,
    \FSM_sequential_tx_state_reg[0]_0 ,
    \FSM_sequential_tx_state_reg[0]_1 ,
    \FSM_sequential_tx_state_reg[0]_2 ,
    \FSM_sequential_tx_state_reg[0]_3 ,
    \FSM_sequential_tx_state_reg[0]_4 ,
    \FSM_sequential_tx_state_reg[0]_5 ,
    mmcm_lock_reclocked);
  output \FSM_sequential_tx_state_reg[0] ;
  output [0:0]E;
  input in0;
  input init_clk_in;
  input [3:0]Q;
  input reset_time_out;
  input txresetdone_s3;
  input \FSM_sequential_tx_state_reg[0]_0 ;
  input \FSM_sequential_tx_state_reg[0]_1 ;
  input \FSM_sequential_tx_state_reg[0]_2 ;
  input \FSM_sequential_tx_state_reg[0]_3 ;
  input \FSM_sequential_tx_state_reg[0]_4 ;
  input \FSM_sequential_tx_state_reg[0]_5 ;
  input mmcm_lock_reclocked;

  wire [0:0]E;
  wire \FSM_sequential_tx_state[3]_i_3_n_0 ;
  wire \FSM_sequential_tx_state_reg[0] ;
  wire \FSM_sequential_tx_state_reg[0]_0 ;
  wire \FSM_sequential_tx_state_reg[0]_1 ;
  wire \FSM_sequential_tx_state_reg[0]_2 ;
  wire \FSM_sequential_tx_state_reg[0]_3 ;
  wire \FSM_sequential_tx_state_reg[0]_4 ;
  wire \FSM_sequential_tx_state_reg[0]_5 ;
  wire [3:0]Q;
  wire init_clk_in;
  wire mmcm_lock_reclocked;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  wire reset_time_out;
  wire reset_time_out_0;
  wire reset_time_out_i_3_n_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;
  wire txresetdone_s3;

  assign p_level_in_int = in0;
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFEE)) 
    \FSM_sequential_tx_state[3]_i_1 
       (.I0(\FSM_sequential_tx_state[3]_i_3_n_0 ),
        .I1(\FSM_sequential_tx_state_reg[0]_0 ),
        .I2(\FSM_sequential_tx_state_reg[0]_1 ),
        .I3(\FSM_sequential_tx_state_reg[0]_2 ),
        .I4(\FSM_sequential_tx_state_reg[0]_3 ),
        .I5(\FSM_sequential_tx_state_reg[0]_4 ),
        .O(E));
  LUT6 #(
    .INIT(64'h0000404000000400)) 
    \FSM_sequential_tx_state[3]_i_3 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(s_level_out_d6),
        .I3(\FSM_sequential_tx_state_reg[0]_5 ),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(\FSM_sequential_tx_state[3]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(p_level_in_d1_cdc_from));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  LUT6 #(
    .INIT(64'hFBFBFBAA080808AA)) 
    reset_time_out_i_1
       (.I0(reset_time_out_0),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(reset_time_out),
        .O(\FSM_sequential_tx_state_reg[0] ));
  LUT6 #(
    .INIT(64'hBAAAAAFFBAAAAAAA)) 
    reset_time_out_i_2
       (.I0(reset_time_out_i_3_n_0),
        .I1(Q[3]),
        .I2(txresetdone_s3),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(reset_time_out_0));
  LUT6 #(
    .INIT(64'h0075007500FF0075)) 
    reset_time_out_i_3
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(s_level_out_d6),
        .I3(Q[3]),
        .I4(mmcm_lock_reclocked),
        .I5(Q[1]),
        .O(reset_time_out_i_3_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_4
   (mmcm_lock_reclocked_reg,
    SR,
    init_clk_in,
    mmcm_lock_reclocked,
    mmcm_lock_reclocked_reg_0);
  output mmcm_lock_reclocked_reg;
  output [0:0]SR;
  input init_clk_in;
  input mmcm_lock_reclocked;
  input mmcm_lock_reclocked_reg_0;

  wire [0:0]SR;
  wire init_clk_in;
  wire mmcm_lock_reclocked;
  wire mmcm_lock_reclocked_reg;
  wire mmcm_lock_reclocked_reg_0;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_20
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(p_level_in_d1_cdc_from));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \mmcm_lock_count[9]_i_1 
       (.I0(s_level_out_d6),
        .O(SR));
  LUT3 #(
    .INIT(8'hE0)) 
    mmcm_lock_reclocked_i_1
       (.I0(mmcm_lock_reclocked),
        .I1(mmcm_lock_reclocked_reg_0),
        .I2(s_level_out_d6),
        .O(mmcm_lock_reclocked_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_5
   (init_clk_in);
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_20
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(p_level_in_d1_cdc_from));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0
   (AS,
    gt_reset_out,
    init_clk_in,
    CLK);
  output [0:0]AS;
  input gt_reset_out;
  input init_clk_in;
  input CLK;

  wire CLK;
  wire gt_reset_out;
  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  assign AS[0] = s_level_out_d6;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(p_level_in_d1_cdc_from),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(gt_reset_out),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(CLK),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(CLK),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(CLK),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(CLK),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(CLK),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(CLK),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_1
   (p_level_in_d1_cdc_from_reg_0,
    init_clk_in);
  input p_level_in_d1_cdc_from_reg_0;
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_d1_cdc_from_reg_0;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(p_level_in_d1_cdc_from),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(p_level_in_d1_cdc_from_reg_0),
        .CE(1'b1),
        .D(1'b0),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_10
   (out,
    tx_lock_comb_r,
    init_clk_in,
    s_level_out_d6_reg_0);
  output out;
  input tx_lock_comb_r;
  input init_clk_in;
  input s_level_out_d6_reg_0;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;
  wire tx_lock_comb_r;

  assign out = s_level_out_d6;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(p_level_in_d1_cdc_from),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(tx_lock_comb_r),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_2
   (out,
    txfsm_txresetdone_r,
    p_level_in_d1_cdc_from_reg_0,
    init_clk_in);
  output out;
  input txfsm_txresetdone_r;
  input p_level_in_d1_cdc_from_reg_0;
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_d1_cdc_from_reg_0;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;
  wire txfsm_txresetdone_r;

  assign out = s_level_out_d6;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(p_level_in_d1_cdc_from),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(p_level_in_d1_cdc_from_reg_0),
        .CE(1'b1),
        .D(txfsm_txresetdone_r),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_6
   (out,
    run_phase_alignment_int,
    init_clk_in,
    s_level_out_d6_reg_0);
  output out;
  input run_phase_alignment_int;
  input init_clk_in;
  input s_level_out_d6_reg_0;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  wire run_phase_alignment_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  assign out = s_level_out_d6;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(p_level_in_d1_cdc_from),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(run_phase_alignment_int),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_7
   (out,
    time_out_wait_bypass,
    p_level_in_d1_cdc_from_reg_0,
    init_clk_in);
  output out;
  input time_out_wait_bypass;
  input p_level_in_d1_cdc_from_reg_0;
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_d1_cdc_from_reg_0;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;
  wire time_out_wait_bypass;

  assign out = s_level_out_d6;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(p_level_in_d1_cdc_from),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(p_level_in_d1_cdc_from_reg_0),
        .CE(1'b1),
        .D(time_out_wait_bypass),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_8
   (tx_resetdone_out,
    s_level_out_d6_reg_0,
    tx_fsm_reset_done_int,
    init_clk_in,
    s_level_out_d6_reg_1);
  output tx_resetdone_out;
  output s_level_out_d6_reg_0;
  input tx_fsm_reset_done_int;
  input init_clk_in;
  input s_level_out_d6_reg_1;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  wire s_level_out_d6_reg_1;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;
  wire tx_fsm_reset_done_int;

  assign tx_resetdone_out = s_level_out_d6;
  LUT1 #(
    .INIT(2'h1)) 
    gt_txresetdone_r_i_1
       (.I0(s_level_out_d6),
        .O(s_level_out_d6_reg_0));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(p_level_in_d1_cdc_from),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(tx_fsm_reset_done_int),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_1),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_1),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(s_level_out_d6_reg_1),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(s_level_out_d6_reg_1),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(s_level_out_d6_reg_1),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(s_level_out_d6_reg_1),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_9
   (out,
    init_clk_in,
    s_level_out_d6_reg_0);
  output out;
  input init_clk_in;
  input s_level_out_d6_reg_0;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  assign out = s_level_out_d6;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(p_level_in_d1_cdc_from),
        .O(p_level_in_int));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(s_level_out_bus_d2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(s_level_out_bus_d3[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(s_level_out_bus_d3[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(s_level_out_bus_d4[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(s_level_out_bus_d4[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(s_level_out_bus_d5[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(s_level_out_bus_d5[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(s_level_out_bus_d6[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(s_level_out_bus_d6[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(s_out_d2));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(s_out_d3));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(s_out_d4));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(s_out_d5));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(s_out_d6));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(s_out_d7));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to),
        .Q(s_level_out_d2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d3_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d4_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d3),
        .Q(s_level_out_d4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d5_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d4),
        .Q(s_level_out_d5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d6_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d5),
        .Q(s_level_out_d6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_core" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_core
   (tx_lane_up,
    tx_resetdone_out,
    in0,
    drprdy_out,
    txn,
    txp,
    tx_out_clk_i,
    drpdo_out,
    tx_channel_up,
    SYSTEM_RESET_reg,
    tx_hard_err,
    pll_not_locked_out,
    s_axi_tx_tready,
    system_reset_i,
    gen_pad_r_reg,
    init_clk_in,
    drpclk_in,
    drpen_in,
    drpwe_in,
    gt_refclk1,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    power_down,
    drpdi_in,
    loopback,
    drpaddr_in,
    tx_aligned,
    tx_verify,
    \init_wait_count_reg[0] ,
    s_axi_tx_tlast,
    s_axi_tx_tvalid,
    s_axi_tx_tdata,
    tx_reset,
    s_axi_tx_tkeep);
  output tx_lane_up;
  output tx_resetdone_out;
  output in0;
  output drprdy_out;
  output txn;
  output txp;
  output tx_out_clk_i;
  output [15:0]drpdo_out;
  output tx_channel_up;
  output SYSTEM_RESET_reg;
  output tx_hard_err;
  output pll_not_locked_out;
  output s_axi_tx_tready;
  input system_reset_i;
  input gen_pad_r_reg;
  input init_clk_in;
  input drpclk_in;
  input drpen_in;
  input drpwe_in;
  input gt_refclk1;
  input gt_qpllclk_quad1_out;
  input gt_qpllrefclk_quad1_out;
  input power_down;
  input [15:0]drpdi_in;
  input [2:0]loopback;
  input [8:0]drpaddr_in;
  input tx_aligned;
  input tx_verify;
  input \init_wait_count_reg[0] ;
  input s_axi_tx_tlast;
  input s_axi_tx_tvalid;
  input [0:15]s_axi_tx_tdata;
  input tx_reset;
  input [0:1]s_axi_tx_tkeep;

  wire ENABLE_ERR_DETECT;
  wire GEN_ECP;
  wire GEN_PAD;
  wire GEN_SCP;
  wire SYSTEM_RESET_reg;
  wire [0:15]TX_PE_DATA;
  wire TX_PE_DATA_V;
  wire axi_to_ll_pdu_i_n_0;
  wire do_cc_i;
  wire [8:0]drpaddr_in;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdo_out;
  wire drpen_in;
  wire drprdy_out;
  wire drpwe_in;
  wire gen_a_i;
  wire gen_cc_i;
  wire [0:1]gen_k_i;
  wire gen_pad_r_reg;
  wire [0:1]gen_r_i;
  wire [0:1]gen_v_i;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_wrapper_i_n_23;
  wire gt_wrapper_i_n_24;
  wire hard_err_reset_i;
  wire in0;
  wire init_clk_in;
  wire \init_wait_count_reg[0] ;
  wire [2:0]loopback;
  wire new_pkt_r;
  wire pll_not_locked_out;
  wire power_down;
  wire reset_channel_i;
  wire [0:15]s_axi_tx_tdata;
  wire [0:1]s_axi_tx_tkeep;
  wire s_axi_tx_tlast;
  wire s_axi_tx_tready;
  wire s_axi_tx_tvalid;
  wire system_reset_i;
  wire tx_aligned;
  wire tx_aurora_lane_simplex_v5_0_i_n_5;
  wire \tx_channel_init_sm_simplex_i/wait_for_lane_up_r0 ;
  wire tx_channel_up;
  wire [1:0]tx_char_is_k_i;
  wire [15:0]tx_data_i;
  wire tx_dst_rdy;
  wire tx_global_logic_simplex_i_n_12;
  wire tx_hard_err;
  wire \tx_lane_init_sm_simplex_i/ready_r_reg0 ;
  wire tx_lane_up;
  wire tx_out_clk_i;
  wire tx_reset;
  wire tx_reset_lanes_i;
  wire tx_resetdone_out;
  wire tx_system_reset_c;
  wire tx_verify;
  wire txn;
  wire txp;

  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_AXI_TO_LL axi_to_ll_pdu_i
       (.new_pkt_r(new_pkt_r),
        .new_pkt_r_reg_0(axi_to_ll_pdu_i_n_0),
        .new_pkt_r_reg_1(gen_pad_r_reg));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_RESET_LOGIC core_reset_logic_i
       (.SR(SYSTEM_RESET_reg),
        .gt_txresetdone_r2_reg_0(gt_wrapper_i_n_24),
        .in0(in0),
        .init_clk_in(init_clk_in),
        .new_pkt_r(new_pkt_r),
        .new_pkt_r_reg(axi_to_ll_pdu_i_n_0),
        .reset_channel_i(reset_channel_i),
        .s_axi_tx_tlast(s_axi_tx_tlast),
        .s_axi_tx_tvalid(s_axi_tx_tvalid),
        .s_level_out_d6_reg(gen_pad_r_reg),
        .system_reset_i(system_reset_i),
        .tx_channel_up(tx_channel_up),
        .tx_dst_rdy(tx_dst_rdy),
        .tx_reset(tx_reset),
        .tx_system_reset_c(tx_system_reset_c),
        .wait_for_lane_up_r0(\tx_channel_init_sm_simplex_i/wait_for_lane_up_r0 ));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_GT_WRAPPER gt_wrapper_i
       (.ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .ENABLE_ERR_DETECT_reg(gt_wrapper_i_n_23),
        .TXCHARISK(tx_char_is_k_i),
        .TXDATA(tx_data_i),
        .drpaddr_in(drpaddr_in),
        .drpclk_in(drpclk_in),
        .drpdi_in(drpdi_in),
        .drpdo_out(drpdo_out),
        .drpen_in(drpen_in),
        .drprdy_out(drprdy_out),
        .drpwe_in(drpwe_in),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .in0(in0),
        .init_clk_in(init_clk_in),
        .\init_wait_count_reg[0] (\init_wait_count_reg[0] ),
        .loopback(loopback),
        .p_level_in_d1_cdc_from_reg(gen_pad_r_reg),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .s_level_out_d6_reg(gt_wrapper_i_n_24),
        .tx_out_clk_i(tx_out_clk_i),
        .tx_resetdone_out(tx_resetdone_out),
        .txn(txn),
        .txp(txp));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE standard_cc_module_i
       (.Q(do_cc_i),
        .SR(SYSTEM_RESET_reg),
        .\prepare_count_r_reg[9]_0 (gen_pad_r_reg));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5 tx_aurora_lane_simplex_v5_0_i
       (.D({gen_v_i[0],gen_v_i[1]}),
        .ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .GEN_ECP(GEN_ECP),
        .GEN_PAD(GEN_PAD),
        .GEN_SCP(GEN_SCP),
        .Q({TX_PE_DATA[0],TX_PE_DATA[1],TX_PE_DATA[2],TX_PE_DATA[3],TX_PE_DATA[4],TX_PE_DATA[5],TX_PE_DATA[6],TX_PE_DATA[7],TX_PE_DATA[8],TX_PE_DATA[9],TX_PE_DATA[10],TX_PE_DATA[11],TX_PE_DATA[12],TX_PE_DATA[13],TX_PE_DATA[14],TX_PE_DATA[15]}),
        .SS(\tx_lane_init_sm_simplex_i/ready_r_reg0 ),
        .TXCHARISK(tx_char_is_k_i),
        .TXDATA(tx_data_i),
        .TX_PE_DATA_V(TX_PE_DATA_V),
        .\counter1_r_reg[0] (gen_pad_r_reg),
        .gen_a_i(gen_a_i),
        .gen_cc_i(gen_cc_i),
        .\gen_k_r_reg[0] ({gen_k_i[0],gen_k_i[1]}),
        .\gen_r_r_reg[0] ({gen_r_i[0],gen_r_i[1]}),
        .hard_err_flop_r_reg(tx_aurora_lane_simplex_v5_0_i_n_5),
        .hard_err_flop_r_reg_0(gt_wrapper_i_n_23),
        .hard_err_reset_i(hard_err_reset_i),
        .tx_aligned(tx_aligned),
        .tx_lane_up(tx_lane_up),
        .tx_reset_lanes_i(tx_reset_lanes_i));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX tx_global_logic_simplex_i
       (.CHANNEL_HARD_ERR_reg(tx_aurora_lane_simplex_v5_0_i_n_5),
        .D({gen_v_i[0],gen_v_i[1]}),
        .SR(SYSTEM_RESET_reg),
        .SS(\tx_lane_init_sm_simplex_i/ready_r_reg0 ),
        .\free_count_r_reg[14] (gen_pad_r_reg),
        .gen_a_i(gen_a_i),
        .gen_k_flop_0_i({gen_k_i[0],gen_k_i[1]}),
        .gen_r_flop_0_i({gen_r_i[0],gen_r_i[1]}),
        .hard_err_reset_i(hard_err_reset_i),
        .power_down(power_down),
        .reset_channel_i(reset_channel_i),
        .tx_channel_up(tx_channel_up),
        .tx_channel_up_i(tx_global_logic_simplex_i_n_12),
        .tx_hard_err(tx_hard_err),
        .tx_lane_up(tx_lane_up),
        .tx_reset(tx_reset),
        .tx_reset_lanes_i(tx_reset_lanes_i),
        .tx_system_reset_c(tx_system_reset_c),
        .tx_verify(tx_verify),
        .wait_for_lane_up_r0(\tx_channel_init_sm_simplex_i/wait_for_lane_up_r0 ));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL tx_ll_i
       (.GEN_ECP(GEN_ECP),
        .GEN_PAD(GEN_PAD),
        .GEN_SCP(GEN_SCP),
        .Q(do_cc_i),
        .TX_PE_DATA_V(TX_PE_DATA_V),
        .\TX_PE_DATA_reg[0] ({TX_PE_DATA[0],TX_PE_DATA[1],TX_PE_DATA[2],TX_PE_DATA[3],TX_PE_DATA[4],TX_PE_DATA[5],TX_PE_DATA[6],TX_PE_DATA[7],TX_PE_DATA[8],TX_PE_DATA[9],TX_PE_DATA[10],TX_PE_DATA[11],TX_PE_DATA[12],TX_PE_DATA[13],TX_PE_DATA[14],TX_PE_DATA[15]}),
        .gen_cc_i(gen_cc_i),
        .gen_pad_r_reg(gen_pad_r_reg),
        .in_frame_r_reg(tx_global_logic_simplex_i_n_12),
        .s_axi_tx_tdata(s_axi_tx_tdata),
        .s_axi_tx_tkeep(s_axi_tx_tkeep),
        .s_axi_tx_tlast(s_axi_tx_tlast),
        .s_axi_tx_tready(s_axi_tx_tready),
        .s_axi_tx_tvalid(s_axi_tx_tvalid),
        .storage_pad_r_reg(axi_to_ll_pdu_i_n_0),
        .tx_dst_rdy(tx_dst_rdy));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_gt" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt
   (in0,
    drprdy_out,
    txn,
    txp,
    tx_out_clk_i,
    init_clk_in_0,
    drpdo_out,
    ack_flag,
    pll_not_locked_out,
    ENABLE_ERR_DETECT_reg,
    init_clk_in,
    drpclk_in,
    drpen_in,
    drpwe_in,
    gt_refclk1,
    gt_tx_reset_i,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg,
    power_down,
    gt_txuserrdy_i,
    drpdi_in,
    loopback,
    TXDATA,
    TXCHARISK,
    drpaddr_in,
    flag2_reg_0,
    cpll_reset_i,
    ENABLE_ERR_DETECT);
  output in0;
  output drprdy_out;
  output txn;
  output txp;
  output tx_out_clk_i;
  output init_clk_in_0;
  output [15:0]drpdo_out;
  output ack_flag;
  output pll_not_locked_out;
  output ENABLE_ERR_DETECT_reg;
  input init_clk_in;
  input drpclk_in;
  input drpen_in;
  input drpwe_in;
  input gt_refclk1;
  input gt_tx_reset_i;
  input gt_qpllclk_quad1_out;
  input gt_qpllrefclk_quad1_out;
  input s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg;
  input power_down;
  input gt_txuserrdy_i;
  input [15:0]drpdi_in;
  input [2:0]loopback;
  input [15:0]TXDATA;
  input [1:0]TXCHARISK;
  input [8:0]drpaddr_in;
  input flag2_reg_0;
  input cpll_reset_i;
  input ENABLE_ERR_DETECT;

  wire ENABLE_ERR_DETECT;
  wire ENABLE_ERR_DETECT_reg;
  wire [1:0]TXCHARISK;
  wire [15:0]TXDATA;
  wire ack_flag;
  wire ack_flag_i_1_n_0;
  wire ack_sync1;
  wire ack_sync2;
  wire ack_sync3;
  wire ack_sync4;
  wire ack_sync5;
  wire ack_sync6;
  wire cpll_pd_i;
  wire cpll_reset_i;
  wire cpll_reset_i_0;
  wire \cpllpd_wait_reg[31]_srl32_n_1 ;
  wire \cpllpd_wait_reg[63]_srl32_n_1 ;
  wire \cpllpd_wait_reg[94]_srl31_n_0 ;
  wire cpllreset_ovrd_i;
  wire \cpllreset_wait_reg[126]_srl31_n_0 ;
  wire \cpllreset_wait_reg[31]_srl32_n_1 ;
  wire \cpllreset_wait_reg[63]_srl32_n_1 ;
  wire \cpllreset_wait_reg[95]_srl32_n_1 ;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync6;
  wire [8:0]drpaddr_in;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdo_out;
  wire drpen_in;
  wire drprdy_out;
  wire drpwe_in;
  wire flag;
  wire flag2;
  wire flag2_reg_0;
  wire flag_i_1_n_0;
  wire gt_pllrefclklost_i;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_tx_reset_i;
  wire gt_txuserrdy_i;
  wire gtxe2_i_n_0;
  wire gtxe2_i_n_10;
  wire gtxe2_i_n_11;
  wire gtxe2_i_n_154;
  wire gtxe2_i_n_155;
  wire gtxe2_i_n_156;
  wire gtxe2_i_n_157;
  wire gtxe2_i_n_158;
  wire gtxe2_i_n_159;
  wire gtxe2_i_n_16;
  wire gtxe2_i_n_160;
  wire gtxe2_i_n_161;
  wire gtxe2_i_n_162;
  wire gtxe2_i_n_163;
  wire gtxe2_i_n_164;
  wire gtxe2_i_n_165;
  wire gtxe2_i_n_166;
  wire gtxe2_i_n_167;
  wire gtxe2_i_n_168;
  wire gtxe2_i_n_169;
  wire gtxe2_i_n_170;
  wire gtxe2_i_n_171;
  wire gtxe2_i_n_172;
  wire gtxe2_i_n_173;
  wire gtxe2_i_n_174;
  wire gtxe2_i_n_175;
  wire gtxe2_i_n_176;
  wire gtxe2_i_n_177;
  wire gtxe2_i_n_178;
  wire gtxe2_i_n_179;
  wire gtxe2_i_n_180;
  wire gtxe2_i_n_181;
  wire gtxe2_i_n_182;
  wire gtxe2_i_n_183;
  wire gtxe2_i_n_184;
  wire gtxe2_i_n_191;
  wire gtxe2_i_n_192;
  wire gtxe2_i_n_199;
  wire gtxe2_i_n_200;
  wire gtxe2_i_n_207;
  wire gtxe2_i_n_208;
  wire gtxe2_i_n_215;
  wire gtxe2_i_n_216;
  wire gtxe2_i_n_23;
  wire gtxe2_i_n_265;
  wire gtxe2_i_n_268;
  wire gtxe2_i_n_27;
  wire gtxe2_i_n_31;
  wire gtxe2_i_n_313;
  wire gtxe2_i_n_38;
  wire gtxe2_i_n_39;
  wire gtxe2_i_n_4;
  wire gtxe2_i_n_78;
  wire gtxe2_i_n_79;
  wire gtxe2_i_n_81;
  wire gtxe2_i_n_82;
  wire gtxe2_i_n_83;
  wire gtxe2_i_n_84;
  wire gtxe2_i_n_9;
  wire in0;
  wire init_clk_in;
  wire init_clk_in_0;
  wire [2:0]loopback;
  wire pll_not_locked_out;
  wire power_down;
  wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg;
  wire tx_buf_err_i;
  wire tx_out_clk_i;
  wire txn;
  wire txp;
  wire \NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED ;
  wire NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED;
  wire NLW_gtxe2_i_PHYSTATUS_UNCONNECTED;
  wire NLW_gtxe2_i_RXCHANBONDSEQ_UNCONNECTED;
  wire NLW_gtxe2_i_RXCHANISALIGNED_UNCONNECTED;
  wire NLW_gtxe2_i_RXCHANREALIGN_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXDATAVALID_UNCONNECTED;
  wire NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXELECIDLE_UNCONNECTED;
  wire NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED;
  wire NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED;
  wire NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXQPISENN_UNCONNECTED;
  wire NLW_gtxe2_i_RXQPISENP_UNCONNECTED;
  wire NLW_gtxe2_i_RXRATEDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED;
  wire NLW_gtxe2_i_RXVALID_UNCONNECTED;
  wire NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED;
  wire NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED;
  wire NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXQPISENN_UNCONNECTED;
  wire NLW_gtxe2_i_TXQPISENP_UNCONNECTED;
  wire NLW_gtxe2_i_TXRATEDONE_UNCONNECTED;
  wire [15:0]NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED;
  wire [7:2]NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED;
  wire [7:2]NLW_gtxe2_i_RXCHARISK_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXCHBONDO_UNCONNECTED;
  wire [63:16]NLW_gtxe2_i_RXDATA_UNCONNECTED;
  wire [7:2]NLW_gtxe2_i_RXDISPERR_UNCONNECTED;
  wire [2:0]NLW_gtxe2_i_RXHEADER_UNCONNECTED;
  wire [7:2]NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED;
  wire [2:0]NLW_gtxe2_i_RXSTATUS_UNCONNECTED;
  wire [9:0]NLW_gtxe2_i_TSTOUT_UNCONNECTED;

  LUT4 #(
    .INIT(16'hFF90)) 
    ack_flag_i_1
       (.I0(ack_sync6),
        .I1(ack_sync5),
        .I2(ack_flag),
        .I3(flag2),
        .O(ack_flag_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_flag_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(ack_flag_i_1_n_0),
        .Q(ack_flag),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    ack_sync_reg1
       (.C(init_clk_in),
        .CE(1'b1),
        .D(data_sync6),
        .Q(ack_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    ack_sync_reg2
       (.C(init_clk_in),
        .CE(1'b1),
        .D(ack_sync1),
        .Q(ack_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    ack_sync_reg3
       (.C(init_clk_in),
        .CE(1'b1),
        .D(ack_sync2),
        .Q(ack_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    ack_sync_reg4
       (.C(init_clk_in),
        .CE(1'b1),
        .D(ack_sync3),
        .Q(ack_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    ack_sync_reg5
       (.C(init_clk_in),
        .CE(1'b1),
        .D(ack_sync4),
        .Q(ack_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    ack_sync_reg6
       (.C(init_clk_in),
        .CE(1'b1),
        .D(ack_sync5),
        .Q(ack_sync6),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hF6)) 
    cpll_reset_i__0
       (.I0(data_sync5),
        .I1(data_sync6),
        .I2(cpllreset_ovrd_i),
        .O(cpll_reset_i_0));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg[31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'hFFFFFFFF)) 
    \cpllpd_wait_reg[31]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(1'b0),
        .Q(\NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllpd_wait_reg[31]_srl32_n_1 ));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg[63]_srl32 " *) 
  SRLC32E #(
    .INIT(32'hFFFFFFFF)) 
    \cpllpd_wait_reg[63]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(\cpllpd_wait_reg[31]_srl32_n_1 ),
        .Q(\NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllpd_wait_reg[63]_srl32_n_1 ));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg[94]_srl31 " *) 
  SRLC32E #(
    .INIT(32'h7FFFFFFF)) 
    \cpllpd_wait_reg[94]_srl31 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b0}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(\cpllpd_wait_reg[63]_srl32_n_1 ),
        .Q(\cpllpd_wait_reg[94]_srl31_n_0 ),
        .Q31(\NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \cpllpd_wait_reg[95] 
       (.C(gt_refclk1),
        .CE(1'b1),
        .D(\cpllpd_wait_reg[94]_srl31_n_0 ),
        .Q(cpll_pd_i),
        .R(1'b0));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg[126]_srl31 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[126]_srl31 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b0}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(\cpllreset_wait_reg[95]_srl32_n_1 ),
        .Q(\cpllreset_wait_reg[126]_srl31_n_0 ),
        .Q31(\NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \cpllreset_wait_reg[127] 
       (.C(gt_refclk1),
        .CE(1'b1),
        .D(\cpllreset_wait_reg[126]_srl31_n_0 ),
        .Q(cpllreset_ovrd_i),
        .R(1'b0));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg[31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h000000FF)) 
    \cpllreset_wait_reg[31]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(1'b0),
        .Q(\NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[31]_srl32_n_1 ));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg[63]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[63]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(\cpllreset_wait_reg[31]_srl32_n_1 ),
        .Q(\NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[63]_srl32_n_1 ));
  (* srl_bus_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg[95]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[95]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(\cpllreset_wait_reg[63]_srl32_n_1 ),
        .Q(\NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[95]_srl32_n_1 ));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(gt_refclk1),
        .CE(1'b1),
        .D(flag),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(gt_refclk1),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(gt_refclk1),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(gt_refclk1),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(gt_refclk1),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(gt_refclk1),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_sync6),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    flag2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(flag2_reg_0),
        .Q(flag2),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB4)) 
    flag_i_1
       (.I0(ack_flag),
        .I1(cpll_reset_i),
        .I2(flag),
        .O(flag_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    flag_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(flag_i_1_n_0),
        .Q(flag),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  GTXE2_CHANNEL #(
    .ALIGN_COMMA_DOUBLE("FALSE"),
    .ALIGN_COMMA_ENABLE(10'b1111111111),
    .ALIGN_COMMA_WORD(2),
    .ALIGN_MCOMMA_DET("TRUE"),
    .ALIGN_MCOMMA_VALUE(10'b1010000011),
    .ALIGN_PCOMMA_DET("TRUE"),
    .ALIGN_PCOMMA_VALUE(10'b0101111100),
    .CBCC_DATA_SOURCE_SEL("DECODED"),
    .CHAN_BOND_KEEP_ALIGN("FALSE"),
    .CHAN_BOND_MAX_SKEW(7),
    .CHAN_BOND_SEQ_1_1(10'b0101111100),
    .CHAN_BOND_SEQ_1_2(10'b0000000000),
    .CHAN_BOND_SEQ_1_3(10'b0000000000),
    .CHAN_BOND_SEQ_1_4(10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE(4'b0001),
    .CHAN_BOND_SEQ_2_1(10'b0000000000),
    .CHAN_BOND_SEQ_2_2(10'b0000000000),
    .CHAN_BOND_SEQ_2_3(10'b0000000000),
    .CHAN_BOND_SEQ_2_4(10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE(4'b0000),
    .CHAN_BOND_SEQ_2_USE("FALSE"),
    .CHAN_BOND_SEQ_LEN(1),
    .CLK_CORRECT_USE("TRUE"),
    .CLK_COR_KEEP_IDLE("FALSE"),
    .CLK_COR_MAX_LAT(17),
    .CLK_COR_MIN_LAT(12),
    .CLK_COR_PRECEDENCE("TRUE"),
    .CLK_COR_REPEAT_WAIT(0),
    .CLK_COR_SEQ_1_1(10'b0111110111),
    .CLK_COR_SEQ_1_2(10'b0111110111),
    .CLK_COR_SEQ_1_3(10'b0100000000),
    .CLK_COR_SEQ_1_4(10'b0100000000),
    .CLK_COR_SEQ_1_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_1(10'b0100000000),
    .CLK_COR_SEQ_2_2(10'b0100000000),
    .CLK_COR_SEQ_2_3(10'b0100000000),
    .CLK_COR_SEQ_2_4(10'b0100000000),
    .CLK_COR_SEQ_2_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_USE("FALSE"),
    .CLK_COR_SEQ_LEN(2),
    .CPLL_CFG(24'hBC07DC),
    .CPLL_FBDIV(5),
    .CPLL_FBDIV_45(5),
    .CPLL_INIT_CFG(24'h00001E),
    .CPLL_LOCK_CFG(16'h01E8),
    .CPLL_REFCLK_DIV(1),
    .DEC_MCOMMA_DETECT("TRUE"),
    .DEC_PCOMMA_DETECT("TRUE"),
    .DEC_VALID_COMMA_ONLY("FALSE"),
    .DMONITOR_CFG(24'h000A00),
    .ES_CONTROL(6'b000000),
    .ES_ERRDET_EN("FALSE"),
    .ES_EYE_SCAN_EN("TRUE"),
    .ES_HORZ_OFFSET(12'h000),
    .ES_PMA_CFG(10'b0000000000),
    .ES_PRESCALE(5'b00000),
    .ES_QUALIFIER(80'h00000000000000000000),
    .ES_QUAL_MASK(80'h00000000000000000000),
    .ES_SDATA_MASK(80'h00000000000000000000),
    .ES_VERT_OFFSET(9'b000000000),
    .FTS_DESKEW_SEQ_ENABLE(4'b1111),
    .FTS_LANE_DESKEW_CFG(4'b1111),
    .FTS_LANE_DESKEW_EN("FALSE"),
    .GEARBOX_MODE(3'b000),
    .IS_CPLLLOCKDETCLK_INVERTED(1'b0),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_RXUSRCLK2_INVERTED(1'b0),
    .IS_RXUSRCLK_INVERTED(1'b0),
    .IS_TXPHDLYTSTCLK_INVERTED(1'b0),
    .IS_TXUSRCLK2_INVERTED(1'b0),
    .IS_TXUSRCLK_INVERTED(1'b0),
    .OUTREFCLK_SEL_INV(2'b11),
    .PCS_PCIE_EN("FALSE"),
    .PCS_RSVD_ATTR(48'h000000000000),
    .PD_TRANS_TIME_FROM_P2(12'h03C),
    .PD_TRANS_TIME_NONE_P2(8'h19),
    .PD_TRANS_TIME_TO_P2(8'h64),
    .PMA_RSV(32'h00018480),
    .PMA_RSV2(16'h2050),
    .PMA_RSV3(2'b00),
    .PMA_RSV4(32'h00000000),
    .RXBUFRESET_TIME(5'b00001),
    .RXBUF_ADDR_MODE("FULL"),
    .RXBUF_EIDLE_HI_CNT(4'b1000),
    .RXBUF_EIDLE_LO_CNT(4'b0000),
    .RXBUF_EN("TRUE"),
    .RXBUF_RESET_ON_CB_CHANGE("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN("FALSE"),
    .RXBUF_RESET_ON_EIDLE("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .RXBUF_THRESH_OVFLW(61),
    .RXBUF_THRESH_OVRD("FALSE"),
    .RXBUF_THRESH_UNDFLW(4),
    .RXCDRFREQRESET_TIME(5'b00001),
    .RXCDRPHRESET_TIME(5'b00001),
    .RXCDR_CFG(72'h03000023FF40200020),
    .RXCDR_FR_RESET_ON_EIDLE(1'b0),
    .RXCDR_HOLD_DURING_EIDLE(1'b0),
    .RXCDR_LOCK_CFG(6'b010101),
    .RXCDR_PH_RESET_ON_EIDLE(1'b0),
    .RXDFELPMRESET_TIME(7'b0001111),
    .RXDLY_CFG(16'h001F),
    .RXDLY_LCFG(9'h030),
    .RXDLY_TAP_CFG(16'h0000),
    .RXGEARBOX_EN("FALSE"),
    .RXISCANRESET_TIME(5'b00001),
    .RXLPM_HF_CFG(14'b00000011110000),
    .RXLPM_LF_CFG(14'b00000011110000),
    .RXOOB_CFG(7'b0000110),
    .RXOUT_DIV(2),
    .RXPCSRESET_TIME(5'b00001),
    .RXPHDLY_CFG(24'h084020),
    .RXPH_CFG(24'h000000),
    .RXPH_MONITOR_SEL(5'b00000),
    .RXPMARESET_TIME(5'b00011),
    .RXPRBS_ERR_LOOPBACK(1'b0),
    .RXSLIDE_AUTO_WAIT(7),
    .RXSLIDE_MODE("OFF"),
    .RX_BIAS_CFG(12'b000000000100),
    .RX_BUFFER_CFG(6'b000000),
    .RX_CLK25_DIV(5),
    .RX_CLKMUX_PD(1'b1),
    .RX_CM_SEL(2'b11),
    .RX_CM_TRIM(3'b010),
    .RX_DATA_WIDTH(20),
    .RX_DDI_SEL(6'b000000),
    .RX_DEBUG_CFG(12'b000000000000),
    .RX_DEFER_RESET_BUF_EN("TRUE"),
    .RX_DFE_GAIN_CFG(23'h020FEA),
    .RX_DFE_H2_CFG(12'b000000000000),
    .RX_DFE_H3_CFG(12'b000001000000),
    .RX_DFE_H4_CFG(11'b00011110000),
    .RX_DFE_H5_CFG(11'b00011100000),
    .RX_DFE_KL_CFG(13'b0000011111110),
    .RX_DFE_KL_CFG2(32'h301148AC),
    .RX_DFE_LPM_CFG(16'h0954),
    .RX_DFE_LPM_HOLD_DURING_EIDLE(1'b0),
    .RX_DFE_UT_CFG(17'b10001111000000000),
    .RX_DFE_VP_CFG(17'b00011111100000011),
    .RX_DFE_XYD_CFG(13'b0000000000000),
    .RX_DISPERR_SEQ_MATCH("TRUE"),
    .RX_INT_DATAWIDTH(0),
    .RX_OS_CFG(13'b0000010000000),
    .RX_SIG_VALID_DLY(10),
    .RX_XCLK_SEL("RXREC"),
    .SAS_MAX_COM(64),
    .SAS_MIN_COM(36),
    .SATA_BURST_SEQ_LEN(4'b0101),
    .SATA_BURST_VAL(3'b100),
    .SATA_CPLL_CFG("VCO_3000MHZ"),
    .SATA_EIDLE_VAL(3'b100),
    .SATA_MAX_BURST(8),
    .SATA_MAX_INIT(21),
    .SATA_MAX_WAKE(7),
    .SATA_MIN_BURST(4),
    .SATA_MIN_INIT(12),
    .SATA_MIN_WAKE(4),
    .SHOW_REALIGN_COMMA("TRUE"),
    .SIM_CPLLREFCLK_SEL(3'b001),
    .SIM_RECEIVER_DETECT_PASS("TRUE"),
    .SIM_RESET_SPEEDUP("TRUE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL("X"),
    .SIM_VERSION("4.0"),
    .TERM_RCAL_CFG(5'b10000),
    .TERM_RCAL_OVRD(1'b0),
    .TRANS_TIME_RATE(8'h0E),
    .TST_RSV(32'h00000000),
    .TXBUF_EN("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .TXDLY_CFG(16'h001F),
    .TXDLY_LCFG(9'h030),
    .TXDLY_TAP_CFG(16'h0000),
    .TXGEARBOX_EN("FALSE"),
    .TXOUT_DIV(2),
    .TXPCSRESET_TIME(5'b00001),
    .TXPHDLY_CFG(24'h084020),
    .TXPH_CFG(16'h0780),
    .TXPH_MONITOR_SEL(5'b00000),
    .TXPMARESET_TIME(5'b00001),
    .TX_CLK25_DIV(5),
    .TX_CLKMUX_PD(1'b1),
    .TX_DATA_WIDTH(20),
    .TX_DEEMPH0(5'b00000),
    .TX_DEEMPH1(5'b00000),
    .TX_DRIVE_MODE("DIRECT"),
    .TX_EIDLE_ASSERT_DELAY(3'b110),
    .TX_EIDLE_DEASSERT_DELAY(3'b100),
    .TX_INT_DATAWIDTH(0),
    .TX_LOOPBACK_DRIVE_HIZ("FALSE"),
    .TX_MAINCURSOR_SEL(1'b0),
    .TX_MARGIN_FULL_0(7'b1001110),
    .TX_MARGIN_FULL_1(7'b1001001),
    .TX_MARGIN_FULL_2(7'b1000101),
    .TX_MARGIN_FULL_3(7'b1000010),
    .TX_MARGIN_FULL_4(7'b1000000),
    .TX_MARGIN_LOW_0(7'b1000110),
    .TX_MARGIN_LOW_1(7'b1000100),
    .TX_MARGIN_LOW_2(7'b1000010),
    .TX_MARGIN_LOW_3(7'b1000000),
    .TX_MARGIN_LOW_4(7'b1000000),
    .TX_PREDRIVER_MODE(1'b0),
    .TX_QPI_STATUS_EN(1'b0),
    .TX_RXDETECT_CFG(14'h1832),
    .TX_RXDETECT_REF(3'b100),
    .TX_XCLK_SEL("TXOUT"),
    .UCODEER_CLR(1'b0)) 
    gtxe2_i
       (.CFGRESET(1'b0),
        .CLKRSVD({1'b0,1'b0,1'b0,1'b0}),
        .CPLLFBCLKLOST(gtxe2_i_n_0),
        .CPLLLOCK(in0),
        .CPLLLOCKDETCLK(init_clk_in),
        .CPLLLOCKEN(1'b1),
        .CPLLPD(cpll_pd_i),
        .CPLLREFCLKLOST(gt_pllrefclklost_i),
        .CPLLREFCLKSEL({1'b0,1'b0,1'b1}),
        .CPLLRESET(cpll_reset_i_0),
        .DMONITOROUT({gtxe2_i_n_177,gtxe2_i_n_178,gtxe2_i_n_179,gtxe2_i_n_180,gtxe2_i_n_181,gtxe2_i_n_182,gtxe2_i_n_183,gtxe2_i_n_184}),
        .DRPADDR(drpaddr_in),
        .DRPCLK(drpclk_in),
        .DRPDI(drpdi_in),
        .DRPDO(drpdo_out),
        .DRPEN(drpen_in),
        .DRPRDY(drprdy_out),
        .DRPWE(drpwe_in),
        .EYESCANDATAERROR(gtxe2_i_n_4),
        .EYESCANMODE(1'b0),
        .EYESCANRESET(1'b0),
        .EYESCANTRIGGER(1'b0),
        .GTGREFCLK(1'b0),
        .GTNORTHREFCLK0(1'b0),
        .GTNORTHREFCLK1(1'b0),
        .GTREFCLK0(gt_refclk1),
        .GTREFCLK1(1'b0),
        .GTREFCLKMONITOR(NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED),
        .GTRESETSEL(1'b0),
        .GTRSVD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .GTRXRESET(1'b0),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .GTTXRESET(gt_tx_reset_i),
        .GTXRXN(1'b0),
        .GTXRXP(1'b0),
        .GTXTXN(txn),
        .GTXTXP(txp),
        .LOOPBACK(loopback),
        .PCSRSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDOUT(NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED[15:0]),
        .PHYSTATUS(NLW_gtxe2_i_PHYSTATUS_UNCONNECTED),
        .PMARSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PMARSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLCLK(gt_qpllclk_quad1_out),
        .QPLLREFCLK(gt_qpllrefclk_quad1_out),
        .RESETOVRD(1'b0),
        .RX8B10BEN(1'b1),
        .RXBUFRESET(1'b0),
        .RXBUFSTATUS({gtxe2_i_n_82,gtxe2_i_n_83,gtxe2_i_n_84}),
        .RXBYTEISALIGNED(gtxe2_i_n_9),
        .RXBYTEREALIGN(gtxe2_i_n_10),
        .RXCDRFREQRESET(1'b0),
        .RXCDRHOLD(1'b0),
        .RXCDRLOCK(gtxe2_i_n_11),
        .RXCDROVRDEN(1'b0),
        .RXCDRRESET(1'b0),
        .RXCDRRESETRSV(1'b0),
        .RXCHANBONDSEQ(NLW_gtxe2_i_RXCHANBONDSEQ_UNCONNECTED),
        .RXCHANISALIGNED(NLW_gtxe2_i_RXCHANISALIGNED_UNCONNECTED),
        .RXCHANREALIGN(NLW_gtxe2_i_RXCHANREALIGN_UNCONNECTED),
        .RXCHARISCOMMA({NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED[7:2],gtxe2_i_n_191,gtxe2_i_n_192}),
        .RXCHARISK({NLW_gtxe2_i_RXCHARISK_UNCONNECTED[7:2],gtxe2_i_n_199,gtxe2_i_n_200}),
        .RXCHBONDEN(1'b0),
        .RXCHBONDI({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXCHBONDLEVEL({1'b0,1'b0,1'b0}),
        .RXCHBONDMASTER(1'b0),
        .RXCHBONDO(NLW_gtxe2_i_RXCHBONDO_UNCONNECTED[4:0]),
        .RXCHBONDSLAVE(1'b0),
        .RXCLKCORCNT({gtxe2_i_n_78,gtxe2_i_n_79}),
        .RXCOMINITDET(NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED),
        .RXCOMMADET(gtxe2_i_n_16),
        .RXCOMMADETEN(1'b1),
        .RXCOMSASDET(NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED),
        .RXCOMWAKEDET(NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED),
        .RXDATA({NLW_gtxe2_i_RXDATA_UNCONNECTED[63:16],gtxe2_i_n_154,gtxe2_i_n_155,gtxe2_i_n_156,gtxe2_i_n_157,gtxe2_i_n_158,gtxe2_i_n_159,gtxe2_i_n_160,gtxe2_i_n_161,gtxe2_i_n_162,gtxe2_i_n_163,gtxe2_i_n_164,gtxe2_i_n_165,gtxe2_i_n_166,gtxe2_i_n_167,gtxe2_i_n_168,gtxe2_i_n_169}),
        .RXDATAVALID(NLW_gtxe2_i_RXDATAVALID_UNCONNECTED),
        .RXDDIEN(1'b0),
        .RXDFEAGCHOLD(gtxe2_i_n_265),
        .RXDFEAGCOVRDEN(1'b0),
        .RXDFECM1EN(1'b0),
        .RXDFELFHOLD(gtxe2_i_n_268),
        .RXDFELFOVRDEN(1'b1),
        .RXDFELPMRESET(1'b0),
        .RXDFETAP2HOLD(1'b0),
        .RXDFETAP2OVRDEN(1'b0),
        .RXDFETAP3HOLD(1'b0),
        .RXDFETAP3OVRDEN(1'b0),
        .RXDFETAP4HOLD(1'b0),
        .RXDFETAP4OVRDEN(1'b0),
        .RXDFETAP5HOLD(1'b0),
        .RXDFETAP5OVRDEN(1'b0),
        .RXDFEUTHOLD(1'b0),
        .RXDFEUTOVRDEN(1'b0),
        .RXDFEVPHOLD(1'b0),
        .RXDFEVPOVRDEN(1'b0),
        .RXDFEVSEN(1'b0),
        .RXDFEXYDEN(1'b1),
        .RXDFEXYDHOLD(1'b0),
        .RXDFEXYDOVRDEN(1'b0),
        .RXDISPERR({NLW_gtxe2_i_RXDISPERR_UNCONNECTED[7:2],gtxe2_i_n_207,gtxe2_i_n_208}),
        .RXDLYBYPASS(1'b1),
        .RXDLYEN(1'b0),
        .RXDLYOVRDEN(1'b0),
        .RXDLYSRESET(1'b0),
        .RXDLYSRESETDONE(NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED),
        .RXELECIDLE(NLW_gtxe2_i_RXELECIDLE_UNCONNECTED),
        .RXELECIDLEMODE({1'b1,1'b1}),
        .RXGEARBOXSLIP(1'b0),
        .RXHEADER(NLW_gtxe2_i_RXHEADER_UNCONNECTED[2:0]),
        .RXHEADERVALID(NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED),
        .RXLPMEN(1'b0),
        .RXLPMHFHOLD(1'b0),
        .RXLPMHFOVRDEN(1'b0),
        .RXLPMLFHOLD(1'b0),
        .RXLPMLFKLOVRDEN(1'b0),
        .RXMCOMMAALIGNEN(1'b0),
        .RXMONITOROUT({gtxe2_i_n_170,gtxe2_i_n_171,gtxe2_i_n_172,gtxe2_i_n_173,gtxe2_i_n_174,gtxe2_i_n_175,gtxe2_i_n_176}),
        .RXMONITORSEL({1'b0,1'b0}),
        .RXNOTINTABLE({NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED[7:2],gtxe2_i_n_215,gtxe2_i_n_216}),
        .RXOOBRESET(1'b0),
        .RXOSHOLD(1'b0),
        .RXOSOVRDEN(1'b0),
        .RXOUTCLK(gtxe2_i_n_23),
        .RXOUTCLKFABRIC(NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED),
        .RXOUTCLKPCS(NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED),
        .RXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .RXPCOMMAALIGNEN(1'b0),
        .RXPCSRESET(1'b0),
        .RXPD({power_down,power_down}),
        .RXPHALIGN(1'b0),
        .RXPHALIGNDONE(NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED),
        .RXPHALIGNEN(1'b0),
        .RXPHDLYPD(1'b0),
        .RXPHDLYRESET(1'b0),
        .RXPHMONITOR(NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED[4:0]),
        .RXPHOVRDEN(1'b0),
        .RXPHSLIPMONITOR(NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED[4:0]),
        .RXPMARESET(1'b0),
        .RXPOLARITY(1'b0),
        .RXPRBSCNTRESET(1'b0),
        .RXPRBSERR(gtxe2_i_n_27),
        .RXPRBSSEL({1'b0,1'b0,1'b0}),
        .RXQPIEN(1'b0),
        .RXQPISENN(NLW_gtxe2_i_RXQPISENN_UNCONNECTED),
        .RXQPISENP(NLW_gtxe2_i_RXQPISENP_UNCONNECTED),
        .RXRATE({1'b0,1'b0,1'b0}),
        .RXRATEDONE(NLW_gtxe2_i_RXRATEDONE_UNCONNECTED),
        .RXRESETDONE(gtxe2_i_n_31),
        .RXSLIDE(1'b0),
        .RXSTARTOFSEQ(NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED),
        .RXSTATUS(NLW_gtxe2_i_RXSTATUS_UNCONNECTED[2:0]),
        .RXSYSCLKSEL({1'b0,1'b0}),
        .RXUSERRDY(gtxe2_i_n_313),
        .RXUSRCLK(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg),
        .RXUSRCLK2(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg),
        .RXVALID(NLW_gtxe2_i_RXVALID_UNCONNECTED),
        .SETERRSTATUS(1'b0),
        .TSTIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .TSTOUT(NLW_gtxe2_i_TSTOUT_UNCONNECTED[9:0]),
        .TX8B10BBYPASS({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX8B10BEN(1'b1),
        .TXBUFDIFFCTRL({1'b1,1'b0,1'b0}),
        .TXBUFSTATUS({tx_buf_err_i,gtxe2_i_n_81}),
        .TXCHARDISPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARDISPVAL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARISK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,TXCHARISK}),
        .TXCOMFINISH(NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED),
        .TXCOMINIT(1'b0),
        .TXCOMSAS(1'b0),
        .TXCOMWAKE(1'b0),
        .TXDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,TXDATA}),
        .TXDEEMPH(1'b0),
        .TXDETECTRX(1'b0),
        .TXDIFFCTRL({1'b1,1'b0,1'b0,1'b0}),
        .TXDIFFPD(1'b0),
        .TXDLYBYPASS(1'b1),
        .TXDLYEN(1'b0),
        .TXDLYHOLD(1'b0),
        .TXDLYOVRDEN(1'b0),
        .TXDLYSRESET(1'b0),
        .TXDLYSRESETDONE(NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED),
        .TXDLYUPDOWN(1'b0),
        .TXELECIDLE(power_down),
        .TXGEARBOXREADY(NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED),
        .TXHEADER({1'b0,1'b0,1'b0}),
        .TXINHIBIT(1'b0),
        .TXMAINCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXMARGIN({1'b0,1'b0,1'b0}),
        .TXOUTCLK(tx_out_clk_i),
        .TXOUTCLKFABRIC(gtxe2_i_n_38),
        .TXOUTCLKPCS(gtxe2_i_n_39),
        .TXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .TXPCSRESET(1'b0),
        .TXPD({power_down,power_down}),
        .TXPDELECIDLEMODE(1'b0),
        .TXPHALIGN(1'b0),
        .TXPHALIGNDONE(NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED),
        .TXPHALIGNEN(1'b0),
        .TXPHDLYPD(1'b0),
        .TXPHDLYRESET(1'b0),
        .TXPHDLYTSTCLK(1'b0),
        .TXPHINIT(1'b0),
        .TXPHINITDONE(NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED),
        .TXPHOVRDEN(1'b0),
        .TXPISOPD(1'b0),
        .TXPMARESET(1'b0),
        .TXPOLARITY(1'b0),
        .TXPOSTCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPOSTCURSORINV(1'b0),
        .TXPRBSFORCEERR(1'b0),
        .TXPRBSSEL({1'b0,1'b0,1'b0}),
        .TXPRECURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPRECURSORINV(1'b0),
        .TXQPIBIASEN(1'b0),
        .TXQPISENN(NLW_gtxe2_i_TXQPISENN_UNCONNECTED),
        .TXQPISENP(NLW_gtxe2_i_TXQPISENP_UNCONNECTED),
        .TXQPISTRONGPDOWN(1'b0),
        .TXQPIWEAKPUP(1'b0),
        .TXRATE({1'b0,1'b0,1'b0}),
        .TXRATEDONE(NLW_gtxe2_i_TXRATEDONE_UNCONNECTED),
        .TXRESETDONE(init_clk_in_0),
        .TXSEQUENCE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXSTARTSEQ(1'b0),
        .TXSWING(1'b0),
        .TXSYSCLKSEL({1'b0,1'b0}),
        .TXUSERRDY(gt_txuserrdy_i),
        .TXUSRCLK(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg),
        .TXUSRCLK2(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg));
  LUT2 #(
    .INIT(4'h8)) 
    hard_err_flop_r_i_1
       (.I0(tx_buf_err_i),
        .I1(ENABLE_ERR_DETECT),
        .O(ENABLE_ERR_DETECT_reg));
  LUT1 #(
    .INIT(2'h1)) 
    pll_not_locked_out_INST_0
       (.I0(in0),
        .O(pll_not_locked_out));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_gt_common_wrapper" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt_common_wrapper
   (gt0_qplllock_out,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    gt0_qpllrefclklost_out,
    gt_refclk1,
    init_clk_in);
  output gt0_qplllock_out;
  output gt_qpllclk_quad1_out;
  output gt_qpllrefclk_quad1_out;
  output gt0_qpllrefclklost_out;
  input gt_refclk1;
  input init_clk_in;

  wire gt0_qplllock_out;
  wire gt0_qpllrefclklost_out;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire init_clk_in;
  wire NLW_gtxe2_common_i_DRPRDY_UNCONNECTED;
  wire NLW_gtxe2_common_i_QPLLFBCLKLOST_UNCONNECTED;
  wire NLW_gtxe2_common_i_REFCLKOUTMONITOR_UNCONNECTED;
  wire [15:0]NLW_gtxe2_common_i_DRPDO_UNCONNECTED;
  wire [7:0]NLW_gtxe2_common_i_QPLLDMONITOR_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  GTXE2_COMMON #(
    .BIAS_CFG(64'h0000040000001000),
    .COMMON_CFG(32'h00000000),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_QPLLLOCKDETCLK_INVERTED(1'b0),
    .QPLL_CFG(27'h06801C1),
    .QPLL_CLKOUT_CFG(4'b0000),
    .QPLL_COARSE_FREQ_OVRD(6'b010000),
    .QPLL_COARSE_FREQ_OVRD_EN(1'b0),
    .QPLL_CP(10'b0000011111),
    .QPLL_CP_MONITOR_EN(1'b0),
    .QPLL_DMONITOR_SEL(1'b0),
    .QPLL_FBDIV(10'b0010000000),
    .QPLL_FBDIV_MONITOR_EN(1'b0),
    .QPLL_FBDIV_RATIO(1'b1),
    .QPLL_INIT_CFG(24'h000006),
    .QPLL_LOCK_CFG(16'h21E8),
    .QPLL_LPF(4'b1111),
    .QPLL_REFCLK_DIV(1),
    .SIM_QPLLREFCLK_SEL(3'b001),
    .SIM_RESET_SPEEDUP("FALSE"),
    .SIM_VERSION("4.0")) 
    gtxe2_common_i
       (.BGBYPASSB(1'b1),
        .BGMONITORENB(1'b1),
        .BGPDB(1'b1),
        .BGRCALOVRD({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DRPADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DRPCLK(1'b0),
        .DRPDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DRPDO(NLW_gtxe2_common_i_DRPDO_UNCONNECTED[15:0]),
        .DRPEN(1'b0),
        .DRPRDY(NLW_gtxe2_common_i_DRPRDY_UNCONNECTED),
        .DRPWE(1'b0),
        .GTGREFCLK(1'b0),
        .GTNORTHREFCLK0(1'b0),
        .GTNORTHREFCLK1(1'b0),
        .GTREFCLK0(gt_refclk1),
        .GTREFCLK1(1'b0),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .PMARSVD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLDMONITOR(NLW_gtxe2_common_i_QPLLDMONITOR_UNCONNECTED[7:0]),
        .QPLLFBCLKLOST(NLW_gtxe2_common_i_QPLLFBCLKLOST_UNCONNECTED),
        .QPLLLOCK(gt0_qplllock_out),
        .QPLLLOCKDETCLK(init_clk_in),
        .QPLLLOCKEN(1'b1),
        .QPLLOUTCLK(gt_qpllclk_quad1_out),
        .QPLLOUTREFCLK(gt_qpllrefclk_quad1_out),
        .QPLLOUTRESET(1'b0),
        .QPLLPD(1'b1),
        .QPLLREFCLKLOST(gt0_qpllrefclklost_out),
        .QPLLREFCLKSEL({1'b0,1'b0,1'b1}),
        .QPLLRESET(1'b0),
        .QPLLRSVD1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLRSVD2({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .RCALENB(1'b1),
        .REFCLKOUTMONITOR(NLW_gtxe2_common_i_REFCLKOUTMONITOR_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_multi_gt" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_multi_gt
   (in0,
    drprdy_out,
    txn,
    txp,
    tx_out_clk_i,
    init_clk_in_0,
    drpdo_out,
    ack_flag,
    pll_not_locked_out,
    ENABLE_ERR_DETECT_reg,
    init_clk_in,
    drpclk_in,
    drpen_in,
    drpwe_in,
    gt_refclk1,
    gt_tx_reset_i,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg,
    power_down,
    gt_txuserrdy_i,
    drpdi_in,
    loopback,
    TXDATA,
    TXCHARISK,
    drpaddr_in,
    flag2_reg,
    cpll_reset_i,
    ENABLE_ERR_DETECT);
  output in0;
  output drprdy_out;
  output txn;
  output txp;
  output tx_out_clk_i;
  output init_clk_in_0;
  output [15:0]drpdo_out;
  output ack_flag;
  output pll_not_locked_out;
  output ENABLE_ERR_DETECT_reg;
  input init_clk_in;
  input drpclk_in;
  input drpen_in;
  input drpwe_in;
  input gt_refclk1;
  input gt_tx_reset_i;
  input gt_qpllclk_quad1_out;
  input gt_qpllrefclk_quad1_out;
  input s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg;
  input power_down;
  input gt_txuserrdy_i;
  input [15:0]drpdi_in;
  input [2:0]loopback;
  input [15:0]TXDATA;
  input [1:0]TXCHARISK;
  input [8:0]drpaddr_in;
  input flag2_reg;
  input cpll_reset_i;
  input ENABLE_ERR_DETECT;

  wire ENABLE_ERR_DETECT;
  wire ENABLE_ERR_DETECT_reg;
  wire [1:0]TXCHARISK;
  wire [15:0]TXDATA;
  wire ack_flag;
  wire cpll_reset_i;
  wire [8:0]drpaddr_in;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdo_out;
  wire drpen_in;
  wire drprdy_out;
  wire drpwe_in;
  wire flag2_reg;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_tx_reset_i;
  wire gt_txuserrdy_i;
  wire in0;
  wire init_clk_in;
  wire init_clk_in_0;
  wire [2:0]loopback;
  wire pll_not_locked_out;
  wire power_down;
  wire s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg;
  wire tx_out_clk_i;
  wire txn;
  wire txp;

  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt gt0_simplex_tx_aurora_8b10b_0_0_i
       (.ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .ENABLE_ERR_DETECT_reg(ENABLE_ERR_DETECT_reg),
        .TXCHARISK(TXCHARISK),
        .TXDATA(TXDATA),
        .ack_flag(ack_flag),
        .cpll_reset_i(cpll_reset_i),
        .drpaddr_in(drpaddr_in),
        .drpclk_in(drpclk_in),
        .drpdi_in(drpdi_in),
        .drpdo_out(drpdo_out),
        .drpen_in(drpen_in),
        .drprdy_out(drprdy_out),
        .drpwe_in(drpwe_in),
        .flag2_reg_0(flag2_reg),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .gt_tx_reset_i(gt_tx_reset_i),
        .gt_txuserrdy_i(gt_txuserrdy_i),
        .in0(in0),
        .init_clk_in(init_clk_in),
        .init_clk_in_0(init_clk_in_0),
        .loopback(loopback),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg(s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg),
        .tx_out_clk_i(tx_out_clk_i),
        .txn(txn),
        .txp(txp));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_support" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_support
   (s_axi_tx_tdata,
    s_axi_tx_tkeep,
    s_axi_tx_tvalid,
    s_axi_tx_tlast,
    s_axi_tx_tready,
    txp,
    txn,
    gt_refclk1,
    tx_hard_err,
    tx_lane_up,
    tx_channel_up,
    tx_aligned,
    tx_verify,
    tx_reset,
    user_clk_out,
    sync_clk_out,
    gt_reset,
    tx_system_reset,
    power_down,
    loopback,
    tx_lock,
    init_clk_in,
    tx_resetdone_out,
    sys_reset_out,
    gt_reset_out,
    drpclk_in,
    drpaddr_in,
    drpen_in,
    drpdi_in,
    drprdy_out,
    drpdo_out,
    drpwe_in,
    gt0_qplllock_out,
    gt0_qpllrefclklost_out,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    pll_not_locked_out);
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
  input power_down;
  input [2:0]loopback;
  output tx_lock;
  input init_clk_in;
  output tx_resetdone_out;
  output sys_reset_out;
  output gt_reset_out;
  input drpclk_in;
  input [8:0]drpaddr_in;
  input drpen_in;
  input [15:0]drpdi_in;
  output drprdy_out;
  output [15:0]drpdo_out;
  input drpwe_in;
  output gt0_qplllock_out;
  output gt0_qpllrefclklost_out;
  output gt_qpllclk_quad1_out;
  output gt_qpllrefclk_quad1_out;
  output pll_not_locked_out;

  wire [8:0]drpaddr_in;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdo_out;
  wire drpen_in;
  wire drprdy_out;
  wire drpwe_in;
  wire gt0_qplllock_out;
  wire gt0_qpllrefclklost_out;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_reset;
  wire gt_reset_out;
  wire gt_reset_sync_init_clk;
  wire init_clk_in;
  wire [2:0]loopback;
  wire pll_not_locked_out;
  wire power_down;
  wire reset_sync_user_clk;
  wire [0:15]s_axi_tx_tdata;
  wire [0:1]s_axi_tx_tkeep;
  wire s_axi_tx_tlast;
  wire s_axi_tx_tready;
  wire s_axi_tx_tvalid;
  wire sys_reset_out;
  wire system_reset_i;
  wire tx_aligned;
  wire tx_channel_up;
  wire tx_hard_err;
  wire tx_lane_up;
  wire tx_lock;
  wire tx_out_clk_i;
  wire tx_reset;
  wire tx_resetdone_out;
  wire tx_system_reset;
  wire tx_verify;
  wire txn;
  wire txp;
  wire user_clk_out;

  assign sync_clk_out = user_clk_out;
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_CLOCK_MODULE clock_module_i
       (.init_clk_in(user_clk_out),
        .tx_out_clk_i(tx_out_clk_i));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt_common_wrapper gt_common_support
       (.gt0_qplllock_out(gt0_qplllock_out),
        .gt0_qpllrefclklost_out(gt0_qpllrefclklost_out),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .init_clk_in(init_clk_in));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync gt_reset_cdc_sync
       (.D(gt_reset_sync_init_clk),
        .gt_reset(gt_reset),
        .init_clk_in(init_clk_in));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_0 reset_sync_user_clk_cdc_sync
       (.D(reset_sync_user_clk),
        .s_level_out_d6_reg_0(user_clk_out),
        .tx_system_reset(tx_system_reset));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_core simplex_tx_aurora_8b10b_0_0_core_i
       (.SYSTEM_RESET_reg(sys_reset_out),
        .drpaddr_in(drpaddr_in),
        .drpclk_in(drpclk_in),
        .drpdi_in(drpdi_in),
        .drpdo_out(drpdo_out),
        .drpen_in(drpen_in),
        .drprdy_out(drprdy_out),
        .drpwe_in(drpwe_in),
        .gen_pad_r_reg(user_clk_out),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .in0(tx_lock),
        .init_clk_in(init_clk_in),
        .\init_wait_count_reg[0] (gt_reset_out),
        .loopback(loopback),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .s_axi_tx_tdata(s_axi_tx_tdata),
        .s_axi_tx_tkeep(s_axi_tx_tkeep),
        .s_axi_tx_tlast(s_axi_tx_tlast),
        .s_axi_tx_tready(s_axi_tx_tready),
        .s_axi_tx_tvalid(s_axi_tx_tvalid),
        .system_reset_i(system_reset_i),
        .tx_aligned(tx_aligned),
        .tx_channel_up(tx_channel_up),
        .tx_hard_err(tx_hard_err),
        .tx_lane_up(tx_lane_up),
        .tx_out_clk_i(tx_out_clk_i),
        .tx_reset(tx_reset),
        .tx_resetdone_out(tx_resetdone_out),
        .tx_verify(tx_verify),
        .txn(txn),
        .txp(txp));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC support_reset_logic_i
       (.CLK(user_clk_out),
        .D(reset_sync_user_clk),
        .\debounce_gt_rst_r_reg[0]_0 (gt_reset_sync_init_clk),
        .gt_reset_out(gt_reset_out),
        .init_clk_in(init_clk_in),
        .system_reset_i(system_reset_i));
endmodule

(* ORIG_REF_NAME = "simplex_tx_aurora_8b10b_0_0_tx_startup_fsm" *) 
module simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_tx_startup_fsm
   (tx_resetdone_out,
    gt_tx_reset_i,
    cpll_reset_i,
    gt_txuserrdy_i,
    CPLL_RESET_reg_0,
    s_level_out_d6_reg,
    in0,
    init_clk_in,
    s_level_out_d6_reg_0,
    txfsm_txresetdone_r,
    \init_wait_count_reg[0]_0 ,
    ack_flag);
  output tx_resetdone_out;
  output gt_tx_reset_i;
  output cpll_reset_i;
  output gt_txuserrdy_i;
  output CPLL_RESET_reg_0;
  output s_level_out_d6_reg;
  input in0;
  input init_clk_in;
  input s_level_out_d6_reg_0;
  input txfsm_txresetdone_r;
  input \init_wait_count_reg[0]_0 ;
  input ack_flag;

  wire CPLL_RESET_i_1_n_0;
  wire CPLL_RESET_reg_0;
  wire \FSM_sequential_tx_state[0]_i_1_n_0 ;
  wire \FSM_sequential_tx_state[1]_i_1_n_0 ;
  wire \FSM_sequential_tx_state[2]_i_1_n_0 ;
  wire \FSM_sequential_tx_state[2]_i_2_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_10_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_11_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_12_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_13_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_14_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_2_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_4_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_5_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_6_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_7_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_8_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_9_n_0 ;
  wire TXUSERRDY_i_1_n_0;
  wire ack_flag;
  wire clear;
  wire cpll_reset_i;
  wire gt_tx_reset_i;
  wire gt_txuserrdy_i;
  wire gttxreset_i_i_1_n_0;
  wire in0;
  wire init_clk_in;
  wire init_wait_count;
  wire \init_wait_count[0]_i_1_n_0 ;
  wire \init_wait_count[6]_i_2_n_0 ;
  wire \init_wait_count[7]_i_3_n_0 ;
  wire \init_wait_count_reg[0]_0 ;
  wire [7:0]init_wait_count_reg__0;
  wire init_wait_done_i_1_n_0;
  wire init_wait_done_reg_n_0;
  wire \mmcm_lock_count[2]_i_1_n_0 ;
  wire \mmcm_lock_count[3]_i_1_n_0 ;
  wire \mmcm_lock_count[4]_i_1_n_0 ;
  wire \mmcm_lock_count[5]_i_1_n_0 ;
  wire \mmcm_lock_count[6]_i_1_n_0 ;
  wire \mmcm_lock_count[7]_i_1_n_0 ;
  wire \mmcm_lock_count[8]_i_1_n_0 ;
  wire \mmcm_lock_count[9]_i_2_n_0 ;
  wire \mmcm_lock_count[9]_i_3_n_0 ;
  wire \mmcm_lock_count[9]_i_4_n_0 ;
  wire [9:0]mmcm_lock_count_reg__0;
  wire mmcm_lock_reclocked;
  wire mmcm_lock_reclocked_i_2_n_0;
  wire [7:1]p_0_in;
  wire [1:0]p_0_in__0;
  wire pll_reset_asserted_i_1_n_0;
  wire pll_reset_asserted_reg_n_0;
  wire reset_time_out;
  wire run_phase_alignment_int;
  wire run_phase_alignment_int_i_1_n_0;
  wire run_phase_alignment_int_s2;
  wire run_phase_alignment_int_s3;
  wire s_level_out_d6_reg;
  wire s_level_out_d6_reg_0;
  wire sel;
  wire sync_cplllock_cdc_sync_n_0;
  wire sync_cplllock_cdc_sync_n_1;
  wire sync_mmcm_lock_reclocked_cdc_sync_n_0;
  wire sync_mmcm_lock_reclocked_cdc_sync_n_1;
  wire time_out_2ms_i_1_n_0;
  wire time_out_2ms_i_2_n_0;
  wire time_out_2ms_reg_n_0;
  wire time_out_500us_i_1_n_0;
  wire time_out_500us_i_2_n_0;
  wire time_out_500us_reg_n_0;
  wire time_out_counter;
  wire \time_out_counter[0]_i_3_n_0 ;
  wire \time_out_counter[0]_i_4_n_0 ;
  wire \time_out_counter[0]_i_5_n_0 ;
  wire \time_out_counter[0]_i_6_n_0 ;
  wire \time_out_counter[0]_i_7_n_0 ;
  wire \time_out_counter[0]_i_8_n_0 ;
  wire [17:0]time_out_counter_reg;
  wire \time_out_counter_reg[0]_i_2_n_0 ;
  wire \time_out_counter_reg[0]_i_2_n_1 ;
  wire \time_out_counter_reg[0]_i_2_n_2 ;
  wire \time_out_counter_reg[0]_i_2_n_3 ;
  wire \time_out_counter_reg[0]_i_2_n_4 ;
  wire \time_out_counter_reg[0]_i_2_n_5 ;
  wire \time_out_counter_reg[0]_i_2_n_6 ;
  wire \time_out_counter_reg[0]_i_2_n_7 ;
  wire \time_out_counter_reg[12]_i_1_n_0 ;
  wire \time_out_counter_reg[12]_i_1_n_1 ;
  wire \time_out_counter_reg[12]_i_1_n_2 ;
  wire \time_out_counter_reg[12]_i_1_n_3 ;
  wire \time_out_counter_reg[12]_i_1_n_4 ;
  wire \time_out_counter_reg[12]_i_1_n_5 ;
  wire \time_out_counter_reg[12]_i_1_n_6 ;
  wire \time_out_counter_reg[12]_i_1_n_7 ;
  wire \time_out_counter_reg[16]_i_1_n_3 ;
  wire \time_out_counter_reg[16]_i_1_n_6 ;
  wire \time_out_counter_reg[16]_i_1_n_7 ;
  wire \time_out_counter_reg[4]_i_1_n_0 ;
  wire \time_out_counter_reg[4]_i_1_n_1 ;
  wire \time_out_counter_reg[4]_i_1_n_2 ;
  wire \time_out_counter_reg[4]_i_1_n_3 ;
  wire \time_out_counter_reg[4]_i_1_n_4 ;
  wire \time_out_counter_reg[4]_i_1_n_5 ;
  wire \time_out_counter_reg[4]_i_1_n_6 ;
  wire \time_out_counter_reg[4]_i_1_n_7 ;
  wire \time_out_counter_reg[8]_i_1_n_0 ;
  wire \time_out_counter_reg[8]_i_1_n_1 ;
  wire \time_out_counter_reg[8]_i_1_n_2 ;
  wire \time_out_counter_reg[8]_i_1_n_3 ;
  wire \time_out_counter_reg[8]_i_1_n_4 ;
  wire \time_out_counter_reg[8]_i_1_n_5 ;
  wire \time_out_counter_reg[8]_i_1_n_6 ;
  wire \time_out_counter_reg[8]_i_1_n_7 ;
  wire time_out_wait_bypass;
  wire time_out_wait_bypass_i_1_n_0;
  wire time_out_wait_bypass_s2;
  wire time_out_wait_bypass_s3;
  wire time_tlock_max_i_1_n_0;
  wire time_tlock_max_i_2_n_0;
  wire time_tlock_max_i_3_n_0;
  wire time_tlock_max_reg_n_0;
  wire tx_fsm_reset_done_int;
  wire tx_fsm_reset_done_int_i_1_n_0;
  wire tx_fsm_reset_done_int_s3;
  wire tx_resetdone_out;
  wire [3:0]tx_state;
  wire txfsm_txresetdone_r;
  wire txresetdone_s2;
  wire txresetdone_s3;
  wire \wait_bypass_count[0]_i_2_n_0 ;
  wire \wait_bypass_count[0]_i_4_n_0 ;
  wire \wait_bypass_count[0]_i_5_n_0 ;
  wire \wait_bypass_count[0]_i_6_n_0 ;
  wire \wait_bypass_count[0]_i_7_n_0 ;
  wire \wait_bypass_count[0]_i_8_n_0 ;
  wire \wait_bypass_count[0]_i_9_n_0 ;
  wire [16:0]wait_bypass_count_reg;
  wire \wait_bypass_count_reg[0]_i_3_n_0 ;
  wire \wait_bypass_count_reg[0]_i_3_n_1 ;
  wire \wait_bypass_count_reg[0]_i_3_n_2 ;
  wire \wait_bypass_count_reg[0]_i_3_n_3 ;
  wire \wait_bypass_count_reg[0]_i_3_n_4 ;
  wire \wait_bypass_count_reg[0]_i_3_n_5 ;
  wire \wait_bypass_count_reg[0]_i_3_n_6 ;
  wire \wait_bypass_count_reg[0]_i_3_n_7 ;
  wire \wait_bypass_count_reg[12]_i_1_n_0 ;
  wire \wait_bypass_count_reg[12]_i_1_n_1 ;
  wire \wait_bypass_count_reg[12]_i_1_n_2 ;
  wire \wait_bypass_count_reg[12]_i_1_n_3 ;
  wire \wait_bypass_count_reg[12]_i_1_n_4 ;
  wire \wait_bypass_count_reg[12]_i_1_n_5 ;
  wire \wait_bypass_count_reg[12]_i_1_n_6 ;
  wire \wait_bypass_count_reg[12]_i_1_n_7 ;
  wire \wait_bypass_count_reg[16]_i_1_n_7 ;
  wire \wait_bypass_count_reg[4]_i_1_n_0 ;
  wire \wait_bypass_count_reg[4]_i_1_n_1 ;
  wire \wait_bypass_count_reg[4]_i_1_n_2 ;
  wire \wait_bypass_count_reg[4]_i_1_n_3 ;
  wire \wait_bypass_count_reg[4]_i_1_n_4 ;
  wire \wait_bypass_count_reg[4]_i_1_n_5 ;
  wire \wait_bypass_count_reg[4]_i_1_n_6 ;
  wire \wait_bypass_count_reg[4]_i_1_n_7 ;
  wire \wait_bypass_count_reg[8]_i_1_n_0 ;
  wire \wait_bypass_count_reg[8]_i_1_n_1 ;
  wire \wait_bypass_count_reg[8]_i_1_n_2 ;
  wire \wait_bypass_count_reg[8]_i_1_n_3 ;
  wire \wait_bypass_count_reg[8]_i_1_n_4 ;
  wire \wait_bypass_count_reg[8]_i_1_n_5 ;
  wire \wait_bypass_count_reg[8]_i_1_n_6 ;
  wire \wait_bypass_count_reg[8]_i_1_n_7 ;
  wire \wait_time_cnt[0]_i_1_n_0 ;
  wire \wait_time_cnt[0]_i_4_n_0 ;
  wire \wait_time_cnt[0]_i_5_n_0 ;
  wire \wait_time_cnt[0]_i_6_n_0 ;
  wire \wait_time_cnt[0]_i_7_n_0 ;
  wire \wait_time_cnt[0]_i_8_n_0 ;
  wire \wait_time_cnt[0]_i_9_n_0 ;
  wire \wait_time_cnt[12]_i_2_n_0 ;
  wire \wait_time_cnt[12]_i_3_n_0 ;
  wire \wait_time_cnt[12]_i_4_n_0 ;
  wire \wait_time_cnt[12]_i_5_n_0 ;
  wire \wait_time_cnt[4]_i_2_n_0 ;
  wire \wait_time_cnt[4]_i_3_n_0 ;
  wire \wait_time_cnt[4]_i_4_n_0 ;
  wire \wait_time_cnt[4]_i_5_n_0 ;
  wire \wait_time_cnt[8]_i_2_n_0 ;
  wire \wait_time_cnt[8]_i_3_n_0 ;
  wire \wait_time_cnt[8]_i_4_n_0 ;
  wire \wait_time_cnt[8]_i_5_n_0 ;
  wire [15:0]wait_time_cnt_reg;
  wire \wait_time_cnt_reg[0]_i_3_n_0 ;
  wire \wait_time_cnt_reg[0]_i_3_n_1 ;
  wire \wait_time_cnt_reg[0]_i_3_n_2 ;
  wire \wait_time_cnt_reg[0]_i_3_n_3 ;
  wire \wait_time_cnt_reg[0]_i_3_n_4 ;
  wire \wait_time_cnt_reg[0]_i_3_n_5 ;
  wire \wait_time_cnt_reg[0]_i_3_n_6 ;
  wire \wait_time_cnt_reg[0]_i_3_n_7 ;
  wire \wait_time_cnt_reg[12]_i_1_n_1 ;
  wire \wait_time_cnt_reg[12]_i_1_n_2 ;
  wire \wait_time_cnt_reg[12]_i_1_n_3 ;
  wire \wait_time_cnt_reg[12]_i_1_n_4 ;
  wire \wait_time_cnt_reg[12]_i_1_n_5 ;
  wire \wait_time_cnt_reg[12]_i_1_n_6 ;
  wire \wait_time_cnt_reg[12]_i_1_n_7 ;
  wire \wait_time_cnt_reg[4]_i_1_n_0 ;
  wire \wait_time_cnt_reg[4]_i_1_n_1 ;
  wire \wait_time_cnt_reg[4]_i_1_n_2 ;
  wire \wait_time_cnt_reg[4]_i_1_n_3 ;
  wire \wait_time_cnt_reg[4]_i_1_n_4 ;
  wire \wait_time_cnt_reg[4]_i_1_n_5 ;
  wire \wait_time_cnt_reg[4]_i_1_n_6 ;
  wire \wait_time_cnt_reg[4]_i_1_n_7 ;
  wire \wait_time_cnt_reg[8]_i_1_n_0 ;
  wire \wait_time_cnt_reg[8]_i_1_n_1 ;
  wire \wait_time_cnt_reg[8]_i_1_n_2 ;
  wire \wait_time_cnt_reg[8]_i_1_n_3 ;
  wire \wait_time_cnt_reg[8]_i_1_n_4 ;
  wire \wait_time_cnt_reg[8]_i_1_n_5 ;
  wire \wait_time_cnt_reg[8]_i_1_n_6 ;
  wire \wait_time_cnt_reg[8]_i_1_n_7 ;
  wire [3:1]\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFF700000004)) 
    CPLL_RESET_i_1
       (.I0(pll_reset_asserted_reg_n_0),
        .I1(tx_state[0]),
        .I2(tx_state[3]),
        .I3(tx_state[2]),
        .I4(tx_state[1]),
        .I5(cpll_reset_i),
        .O(CPLL_RESET_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    CPLL_RESET_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(CPLL_RESET_i_1_n_0),
        .Q(cpll_reset_i),
        .R(\init_wait_count_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hEFEFEFEFEFFFEFEF)) 
    \FSM_sequential_tx_state[0]_i_1 
       (.I0(\FSM_sequential_tx_state[3]_i_6_n_0 ),
        .I1(tx_state[3]),
        .I2(tx_state[0]),
        .I3(\FSM_sequential_tx_state[2]_i_2_n_0 ),
        .I4(tx_state[2]),
        .I5(tx_state[1]),
        .O(\FSM_sequential_tx_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h11441104)) 
    \FSM_sequential_tx_state[1]_i_1 
       (.I0(tx_state[3]),
        .I1(tx_state[0]),
        .I2(tx_state[2]),
        .I3(tx_state[1]),
        .I4(\FSM_sequential_tx_state[2]_i_2_n_0 ),
        .O(\FSM_sequential_tx_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h003400F0000400F0)) 
    \FSM_sequential_tx_state[2]_i_1 
       (.I0(time_out_2ms_reg_n_0),
        .I1(tx_state[1]),
        .I2(tx_state[2]),
        .I3(tx_state[3]),
        .I4(tx_state[0]),
        .I5(\FSM_sequential_tx_state[2]_i_2_n_0 ),
        .O(\FSM_sequential_tx_state[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \FSM_sequential_tx_state[2]_i_2 
       (.I0(time_tlock_max_reg_n_0),
        .I1(reset_time_out),
        .I2(mmcm_lock_reclocked),
        .O(\FSM_sequential_tx_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_tx_state[3]_i_10 
       (.I0(reset_time_out),
        .I1(time_tlock_max_reg_n_0),
        .O(\FSM_sequential_tx_state[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_sequential_tx_state[3]_i_11 
       (.I0(wait_time_cnt_reg[6]),
        .I1(wait_time_cnt_reg[7]),
        .I2(wait_time_cnt_reg[4]),
        .I3(wait_time_cnt_reg[5]),
        .I4(wait_time_cnt_reg[9]),
        .I5(wait_time_cnt_reg[8]),
        .O(\FSM_sequential_tx_state[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_sequential_tx_state[3]_i_12 
       (.I0(wait_time_cnt_reg[12]),
        .I1(wait_time_cnt_reg[13]),
        .I2(wait_time_cnt_reg[10]),
        .I3(wait_time_cnt_reg[11]),
        .I4(wait_time_cnt_reg[15]),
        .I5(wait_time_cnt_reg[14]),
        .O(\FSM_sequential_tx_state[3]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_tx_state[3]_i_13 
       (.I0(wait_time_cnt_reg[1]),
        .I1(wait_time_cnt_reg[0]),
        .I2(wait_time_cnt_reg[3]),
        .I3(wait_time_cnt_reg[2]),
        .O(\FSM_sequential_tx_state[3]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_tx_state[3]_i_14 
       (.I0(tx_state[1]),
        .I1(tx_state[2]),
        .O(\FSM_sequential_tx_state[3]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h5555555500F30000)) 
    \FSM_sequential_tx_state[3]_i_2 
       (.I0(time_out_wait_bypass_s3),
        .I1(time_out_500us_reg_n_0),
        .I2(reset_time_out),
        .I3(\FSM_sequential_tx_state[3]_i_9_n_0 ),
        .I4(tx_state[0]),
        .I5(tx_state[3]),
        .O(\FSM_sequential_tx_state[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0F0000000B0B0000)) 
    \FSM_sequential_tx_state[3]_i_4 
       (.I0(mmcm_lock_reclocked),
        .I1(\FSM_sequential_tx_state[3]_i_10_n_0 ),
        .I2(\FSM_sequential_tx_state[3]_i_5_n_0 ),
        .I3(txresetdone_s3),
        .I4(tx_state[2]),
        .I5(tx_state[1]),
        .O(\FSM_sequential_tx_state[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_tx_state[3]_i_5 
       (.I0(tx_state[3]),
        .I1(tx_state[0]),
        .O(\FSM_sequential_tx_state[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h2020F000)) 
    \FSM_sequential_tx_state[3]_i_6 
       (.I0(time_out_500us_reg_n_0),
        .I1(reset_time_out),
        .I2(tx_state[1]),
        .I3(time_out_2ms_reg_n_0),
        .I4(tx_state[2]),
        .O(\FSM_sequential_tx_state[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \FSM_sequential_tx_state[3]_i_7 
       (.I0(\FSM_sequential_tx_state[3]_i_11_n_0 ),
        .I1(\FSM_sequential_tx_state[3]_i_12_n_0 ),
        .I2(\FSM_sequential_tx_state[3]_i_13_n_0 ),
        .I3(tx_state[3]),
        .I4(tx_state[0]),
        .I5(\FSM_sequential_tx_state[3]_i_14_n_0 ),
        .O(\FSM_sequential_tx_state[3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h01010100)) 
    \FSM_sequential_tx_state[3]_i_8 
       (.I0(tx_state[0]),
        .I1(tx_state[1]),
        .I2(tx_state[2]),
        .I3(tx_state[3]),
        .I4(init_wait_done_reg_n_0),
        .O(\FSM_sequential_tx_state[3]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_tx_state[3]_i_9 
       (.I0(tx_state[1]),
        .I1(tx_state[2]),
        .O(\FSM_sequential_tx_state[3]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_tx_state_reg[0] 
       (.C(init_clk_in),
        .CE(sync_cplllock_cdc_sync_n_1),
        .D(\FSM_sequential_tx_state[0]_i_1_n_0 ),
        .Q(tx_state[0]),
        .R(\init_wait_count_reg[0]_0 ));
  (* FSM_ENCODED_STATES = "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_tx_state_reg[1] 
       (.C(init_clk_in),
        .CE(sync_cplllock_cdc_sync_n_1),
        .D(\FSM_sequential_tx_state[1]_i_1_n_0 ),
        .Q(tx_state[1]),
        .R(\init_wait_count_reg[0]_0 ));
  (* FSM_ENCODED_STATES = "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_tx_state_reg[2] 
       (.C(init_clk_in),
        .CE(sync_cplllock_cdc_sync_n_1),
        .D(\FSM_sequential_tx_state[2]_i_1_n_0 ),
        .Q(tx_state[2]),
        .R(\init_wait_count_reg[0]_0 ));
  (* FSM_ENCODED_STATES = "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_tx_state_reg[3] 
       (.C(init_clk_in),
        .CE(sync_cplllock_cdc_sync_n_1),
        .D(\FSM_sequential_tx_state[3]_i_2_n_0 ),
        .Q(tx_state[3]),
        .R(\init_wait_count_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hFFFD2000)) 
    TXUSERRDY_i_1
       (.I0(tx_state[0]),
        .I1(tx_state[3]),
        .I2(tx_state[2]),
        .I3(tx_state[1]),
        .I4(gt_txuserrdy_i),
        .O(TXUSERRDY_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    TXUSERRDY_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(TXUSERRDY_i_1_n_0),
        .Q(gt_txuserrdy_i),
        .R(\init_wait_count_reg[0]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    flag2_i_1
       (.I0(cpll_reset_i),
        .I1(ack_flag),
        .O(CPLL_RESET_reg_0));
  LUT5 #(
    .INIT(32'hFFEF0100)) 
    gttxreset_i_i_1
       (.I0(tx_state[3]),
        .I1(tx_state[1]),
        .I2(tx_state[2]),
        .I3(tx_state[0]),
        .I4(gt_tx_reset_i),
        .O(gttxreset_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gttxreset_i_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(gttxreset_i_i_1_n_0),
        .Q(gt_tx_reset_i),
        .R(\init_wait_count_reg[0]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \init_wait_count[0]_i_1 
       (.I0(init_wait_count_reg__0[0]),
        .O(\init_wait_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \init_wait_count[1]_i_1 
       (.I0(init_wait_count_reg__0[0]),
        .I1(init_wait_count_reg__0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \init_wait_count[2]_i_1 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \init_wait_count[3]_i_1 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \init_wait_count[4]_i_1 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[3]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[1]),
        .I4(init_wait_count_reg__0[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \init_wait_count[5]_i_1 
       (.I0(init_wait_count_reg__0[3]),
        .I1(init_wait_count_reg__0[2]),
        .I2(init_wait_count_reg__0[4]),
        .I3(init_wait_count_reg__0[0]),
        .I4(init_wait_count_reg__0[1]),
        .I5(init_wait_count_reg__0[5]),
        .O(p_0_in[5]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \init_wait_count[6]_i_1 
       (.I0(init_wait_count_reg__0[4]),
        .I1(init_wait_count_reg__0[2]),
        .I2(init_wait_count_reg__0[3]),
        .I3(init_wait_count_reg__0[5]),
        .I4(\init_wait_count[6]_i_2_n_0 ),
        .I5(init_wait_count_reg__0[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \init_wait_count[6]_i_2 
       (.I0(init_wait_count_reg__0[0]),
        .I1(init_wait_count_reg__0[1]),
        .O(\init_wait_count[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \init_wait_count[7]_i_1 
       (.I0(init_wait_count_reg__0[6]),
        .I1(init_wait_count_reg__0[7]),
        .I2(init_wait_count_reg__0[0]),
        .I3(\init_wait_count[7]_i_3_n_0 ),
        .I4(init_wait_count_reg__0[1]),
        .O(init_wait_count));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    \init_wait_count[7]_i_2 
       (.I0(\init_wait_count[7]_i_3_n_0 ),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[6]),
        .I4(init_wait_count_reg__0[7]),
        .O(p_0_in[7]));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \init_wait_count[7]_i_3 
       (.I0(init_wait_count_reg__0[4]),
        .I1(init_wait_count_reg__0[2]),
        .I2(init_wait_count_reg__0[3]),
        .I3(init_wait_count_reg__0[5]),
        .O(\init_wait_count[7]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[0] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(\init_wait_count_reg[0]_0 ),
        .D(\init_wait_count[0]_i_1_n_0 ),
        .Q(init_wait_count_reg__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[1] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(\init_wait_count_reg[0]_0 ),
        .D(p_0_in[1]),
        .Q(init_wait_count_reg__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[2] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(\init_wait_count_reg[0]_0 ),
        .D(p_0_in[2]),
        .Q(init_wait_count_reg__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[3] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(\init_wait_count_reg[0]_0 ),
        .D(p_0_in[3]),
        .Q(init_wait_count_reg__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[4] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(\init_wait_count_reg[0]_0 ),
        .D(p_0_in[4]),
        .Q(init_wait_count_reg__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[5] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(\init_wait_count_reg[0]_0 ),
        .D(p_0_in[5]),
        .Q(init_wait_count_reg__0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[6] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(\init_wait_count_reg[0]_0 ),
        .D(p_0_in[6]),
        .Q(init_wait_count_reg__0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[7] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(\init_wait_count_reg[0]_0 ),
        .D(p_0_in[7]),
        .Q(init_wait_count_reg__0[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000001)) 
    init_wait_done_i_1
       (.I0(\init_wait_count[7]_i_3_n_0 ),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[7]),
        .I4(init_wait_count_reg__0[6]),
        .I5(init_wait_done_reg_n_0),
        .O(init_wait_done_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    init_wait_done_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .CLR(\init_wait_count_reg[0]_0 ),
        .D(init_wait_done_i_1_n_0),
        .Q(init_wait_done_reg_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \mmcm_lock_count[0]_i_1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mmcm_lock_count[1]_i_1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \mmcm_lock_count[2]_i_1 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .O(\mmcm_lock_count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \mmcm_lock_count[3]_i_1 
       (.I0(mmcm_lock_count_reg__0[2]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[1]),
        .I3(mmcm_lock_count_reg__0[3]),
        .O(\mmcm_lock_count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \mmcm_lock_count[4]_i_1 
       (.I0(mmcm_lock_count_reg__0[3]),
        .I1(mmcm_lock_count_reg__0[1]),
        .I2(mmcm_lock_count_reg__0[0]),
        .I3(mmcm_lock_count_reg__0[2]),
        .I4(mmcm_lock_count_reg__0[4]),
        .O(\mmcm_lock_count[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \mmcm_lock_count[5]_i_1 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[2]),
        .I2(mmcm_lock_count_reg__0[0]),
        .I3(mmcm_lock_count_reg__0[1]),
        .I4(mmcm_lock_count_reg__0[3]),
        .I5(mmcm_lock_count_reg__0[5]),
        .O(\mmcm_lock_count[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \mmcm_lock_count[6]_i_1 
       (.I0(\mmcm_lock_count[9]_i_4_n_0 ),
        .I1(mmcm_lock_count_reg__0[6]),
        .O(\mmcm_lock_count[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \mmcm_lock_count[7]_i_1 
       (.I0(mmcm_lock_count_reg__0[6]),
        .I1(\mmcm_lock_count[9]_i_4_n_0 ),
        .I2(mmcm_lock_count_reg__0[7]),
        .O(\mmcm_lock_count[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \mmcm_lock_count[8]_i_1 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\mmcm_lock_count[9]_i_4_n_0 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .O(\mmcm_lock_count[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hDFFFFFFF)) 
    \mmcm_lock_count[9]_i_2 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\mmcm_lock_count[9]_i_4_n_0 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(\mmcm_lock_count[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hF7FF0800)) 
    \mmcm_lock_count[9]_i_3 
       (.I0(mmcm_lock_count_reg__0[8]),
        .I1(mmcm_lock_count_reg__0[6]),
        .I2(\mmcm_lock_count[9]_i_4_n_0 ),
        .I3(mmcm_lock_count_reg__0[7]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(\mmcm_lock_count[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \mmcm_lock_count[9]_i_4 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[2]),
        .I2(mmcm_lock_count_reg__0[0]),
        .I3(mmcm_lock_count_reg__0[1]),
        .I4(mmcm_lock_count_reg__0[3]),
        .I5(mmcm_lock_count_reg__0[5]),
        .O(\mmcm_lock_count[9]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[0] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(p_0_in__0[0]),
        .Q(mmcm_lock_count_reg__0[0]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[1] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(p_0_in__0[1]),
        .Q(mmcm_lock_count_reg__0[1]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[2] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(\mmcm_lock_count[2]_i_1_n_0 ),
        .Q(mmcm_lock_count_reg__0[2]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[3] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(\mmcm_lock_count[3]_i_1_n_0 ),
        .Q(mmcm_lock_count_reg__0[3]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[4] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(\mmcm_lock_count[4]_i_1_n_0 ),
        .Q(mmcm_lock_count_reg__0[4]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[5] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(\mmcm_lock_count[5]_i_1_n_0 ),
        .Q(mmcm_lock_count_reg__0[5]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[6] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(\mmcm_lock_count[6]_i_1_n_0 ),
        .Q(mmcm_lock_count_reg__0[6]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[7] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(\mmcm_lock_count[7]_i_1_n_0 ),
        .Q(mmcm_lock_count_reg__0[7]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[8] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(\mmcm_lock_count[8]_i_1_n_0 ),
        .Q(mmcm_lock_count_reg__0[8]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[9] 
       (.C(init_clk_in),
        .CE(\mmcm_lock_count[9]_i_2_n_0 ),
        .D(\mmcm_lock_count[9]_i_3_n_0 ),
        .Q(mmcm_lock_count_reg__0[9]),
        .R(sync_mmcm_lock_reclocked_cdc_sync_n_1));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    mmcm_lock_reclocked_i_2
       (.I0(mmcm_lock_count_reg__0[9]),
        .I1(mmcm_lock_count_reg__0[8]),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(\mmcm_lock_count[9]_i_4_n_0 ),
        .I4(mmcm_lock_count_reg__0[7]),
        .O(mmcm_lock_reclocked_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    mmcm_lock_reclocked_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(sync_mmcm_lock_reclocked_cdc_sync_n_0),
        .Q(mmcm_lock_reclocked),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hCCCCCC5C)) 
    pll_reset_asserted_i_1
       (.I0(tx_state[1]),
        .I1(pll_reset_asserted_reg_n_0),
        .I2(tx_state[0]),
        .I3(tx_state[3]),
        .I4(tx_state[2]),
        .O(pll_reset_asserted_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pll_reset_asserted_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(pll_reset_asserted_i_1_n_0),
        .Q(pll_reset_asserted_reg_n_0),
        .R(\init_wait_count_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    reset_time_out_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(sync_cplllock_cdc_sync_n_0),
        .Q(reset_time_out),
        .R(\init_wait_count_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hFFFB0002)) 
    run_phase_alignment_int_i_1
       (.I0(tx_state[3]),
        .I1(tx_state[0]),
        .I2(tx_state[2]),
        .I3(tx_state[1]),
        .I4(run_phase_alignment_int),
        .O(run_phase_alignment_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    run_phase_alignment_int_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(run_phase_alignment_int_i_1_n_0),
        .Q(run_phase_alignment_int),
        .R(\init_wait_count_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    run_phase_alignment_int_s3_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(run_phase_alignment_int_s2),
        .Q(run_phase_alignment_int_s3),
        .R(1'b0));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_2 sync_TXRESETDONE_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(txresetdone_s2),
        .p_level_in_d1_cdc_from_reg_0(s_level_out_d6_reg_0),
        .txfsm_txresetdone_r(txfsm_txresetdone_r));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_3 sync_cplllock_cdc_sync
       (.E(sync_cplllock_cdc_sync_n_1),
        .\FSM_sequential_tx_state_reg[0] (sync_cplllock_cdc_sync_n_0),
        .\FSM_sequential_tx_state_reg[0]_0 (\FSM_sequential_tx_state[3]_i_4_n_0 ),
        .\FSM_sequential_tx_state_reg[0]_1 (\FSM_sequential_tx_state[3]_i_5_n_0 ),
        .\FSM_sequential_tx_state_reg[0]_2 (\FSM_sequential_tx_state[3]_i_6_n_0 ),
        .\FSM_sequential_tx_state_reg[0]_3 (\FSM_sequential_tx_state[3]_i_7_n_0 ),
        .\FSM_sequential_tx_state_reg[0]_4 (\FSM_sequential_tx_state[3]_i_8_n_0 ),
        .\FSM_sequential_tx_state_reg[0]_5 (pll_reset_asserted_reg_n_0),
        .Q(tx_state),
        .in0(in0),
        .init_clk_in(init_clk_in),
        .mmcm_lock_reclocked(mmcm_lock_reclocked),
        .reset_time_out(reset_time_out),
        .txresetdone_s3(txresetdone_s3));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_4 sync_mmcm_lock_reclocked_cdc_sync
       (.SR(sync_mmcm_lock_reclocked_cdc_sync_n_1),
        .init_clk_in(init_clk_in),
        .mmcm_lock_reclocked(mmcm_lock_reclocked),
        .mmcm_lock_reclocked_reg(sync_mmcm_lock_reclocked_cdc_sync_n_0),
        .mmcm_lock_reclocked_reg_0(mmcm_lock_reclocked_i_2_n_0));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_5 sync_qplllock_cdc_sync
       (.init_clk_in(init_clk_in));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_6 sync_run_phase_alignment_int_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(run_phase_alignment_int_s2),
        .run_phase_alignment_int(run_phase_alignment_int),
        .s_level_out_d6_reg_0(s_level_out_d6_reg_0));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_7 sync_time_out_wait_bypass_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(time_out_wait_bypass_s2),
        .p_level_in_d1_cdc_from_reg_0(s_level_out_d6_reg_0),
        .time_out_wait_bypass(time_out_wait_bypass));
  simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_8 sync_tx_fsm_reset_done_int_cdc_sync
       (.init_clk_in(init_clk_in),
        .s_level_out_d6_reg_0(s_level_out_d6_reg),
        .s_level_out_d6_reg_1(s_level_out_d6_reg_0),
        .tx_fsm_reset_done_int(tx_fsm_reset_done_int),
        .tx_resetdone_out(tx_resetdone_out));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h00AE)) 
    time_out_2ms_i_1
       (.I0(time_out_2ms_reg_n_0),
        .I1(time_out_2ms_i_2_n_0),
        .I2(\time_out_counter[0]_i_3_n_0 ),
        .I3(reset_time_out),
        .O(time_out_2ms_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    time_out_2ms_i_2
       (.I0(time_out_counter_reg[16]),
        .I1(time_out_counter_reg[17]),
        .I2(time_out_counter_reg[9]),
        .I3(time_out_counter_reg[11]),
        .I4(time_out_counter_reg[4]),
        .I5(\time_out_counter[0]_i_4_n_0 ),
        .O(time_out_2ms_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_2ms_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(time_out_2ms_i_1_n_0),
        .Q(time_out_2ms_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000AAAAEAAA)) 
    time_out_500us_i_1
       (.I0(time_out_500us_reg_n_0),
        .I1(time_out_500us_i_2_n_0),
        .I2(time_out_counter_reg[4]),
        .I3(time_out_counter_reg[9]),
        .I4(\time_out_counter[0]_i_3_n_0 ),
        .I5(reset_time_out),
        .O(time_out_500us_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    time_out_500us_i_2
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[11]),
        .I4(time_out_counter_reg[17]),
        .I5(time_out_counter_reg[16]),
        .O(time_out_500us_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_500us_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(time_out_500us_i_1_n_0),
        .Q(time_out_500us_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFBFFFF)) 
    \time_out_counter[0]_i_1 
       (.I0(\time_out_counter[0]_i_3_n_0 ),
        .I1(time_out_counter_reg[11]),
        .I2(\time_out_counter[0]_i_4_n_0 ),
        .I3(time_out_counter_reg[9]),
        .I4(\time_out_counter[0]_i_5_n_0 ),
        .I5(time_out_counter_reg[4]),
        .O(time_out_counter));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \time_out_counter[0]_i_3 
       (.I0(time_out_counter_reg[6]),
        .I1(time_out_counter_reg[13]),
        .I2(\time_out_counter[0]_i_7_n_0 ),
        .I3(\time_out_counter[0]_i_8_n_0 ),
        .O(\time_out_counter[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hEF)) 
    \time_out_counter[0]_i_4 
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[10]),
        .O(\time_out_counter[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \time_out_counter[0]_i_5 
       (.I0(time_out_counter_reg[16]),
        .I1(time_out_counter_reg[17]),
        .O(\time_out_counter[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \time_out_counter[0]_i_6 
       (.I0(time_out_counter_reg[0]),
        .O(\time_out_counter[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \time_out_counter[0]_i_7 
       (.I0(time_out_counter_reg[7]),
        .I1(time_out_counter_reg[5]),
        .I2(time_out_counter_reg[8]),
        .I3(time_out_counter_reg[12]),
        .O(\time_out_counter[0]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \time_out_counter[0]_i_8 
       (.I0(time_out_counter_reg[1]),
        .I1(time_out_counter_reg[0]),
        .I2(time_out_counter_reg[3]),
        .I3(time_out_counter_reg[2]),
        .O(\time_out_counter[0]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[0] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2_n_7 ),
        .Q(time_out_counter_reg[0]),
        .R(reset_time_out));
  CARRY4 \time_out_counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\time_out_counter_reg[0]_i_2_n_0 ,\time_out_counter_reg[0]_i_2_n_1 ,\time_out_counter_reg[0]_i_2_n_2 ,\time_out_counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\time_out_counter_reg[0]_i_2_n_4 ,\time_out_counter_reg[0]_i_2_n_5 ,\time_out_counter_reg[0]_i_2_n_6 ,\time_out_counter_reg[0]_i_2_n_7 }),
        .S({time_out_counter_reg[3:1],\time_out_counter[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[10] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1_n_5 ),
        .Q(time_out_counter_reg[10]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[11] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1_n_4 ),
        .Q(time_out_counter_reg[11]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[12] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1_n_7 ),
        .Q(time_out_counter_reg[12]),
        .R(reset_time_out));
  CARRY4 \time_out_counter_reg[12]_i_1 
       (.CI(\time_out_counter_reg[8]_i_1_n_0 ),
        .CO({\time_out_counter_reg[12]_i_1_n_0 ,\time_out_counter_reg[12]_i_1_n_1 ,\time_out_counter_reg[12]_i_1_n_2 ,\time_out_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\time_out_counter_reg[12]_i_1_n_4 ,\time_out_counter_reg[12]_i_1_n_5 ,\time_out_counter_reg[12]_i_1_n_6 ,\time_out_counter_reg[12]_i_1_n_7 }),
        .S(time_out_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[13] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1_n_6 ),
        .Q(time_out_counter_reg[13]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[14] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1_n_5 ),
        .Q(time_out_counter_reg[14]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[15] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1_n_4 ),
        .Q(time_out_counter_reg[15]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[16] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[16]_i_1_n_7 ),
        .Q(time_out_counter_reg[16]),
        .R(reset_time_out));
  CARRY4 \time_out_counter_reg[16]_i_1 
       (.CI(\time_out_counter_reg[12]_i_1_n_0 ),
        .CO({\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED [3:1],\time_out_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED [3:2],\time_out_counter_reg[16]_i_1_n_6 ,\time_out_counter_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,time_out_counter_reg[17:16]}));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[17] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[16]_i_1_n_6 ),
        .Q(time_out_counter_reg[17]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[1] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2_n_6 ),
        .Q(time_out_counter_reg[1]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[2] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2_n_5 ),
        .Q(time_out_counter_reg[2]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[3] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2_n_4 ),
        .Q(time_out_counter_reg[3]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[4] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1_n_7 ),
        .Q(time_out_counter_reg[4]),
        .R(reset_time_out));
  CARRY4 \time_out_counter_reg[4]_i_1 
       (.CI(\time_out_counter_reg[0]_i_2_n_0 ),
        .CO({\time_out_counter_reg[4]_i_1_n_0 ,\time_out_counter_reg[4]_i_1_n_1 ,\time_out_counter_reg[4]_i_1_n_2 ,\time_out_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\time_out_counter_reg[4]_i_1_n_4 ,\time_out_counter_reg[4]_i_1_n_5 ,\time_out_counter_reg[4]_i_1_n_6 ,\time_out_counter_reg[4]_i_1_n_7 }),
        .S(time_out_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[5] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1_n_6 ),
        .Q(time_out_counter_reg[5]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[6] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1_n_5 ),
        .Q(time_out_counter_reg[6]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[7] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1_n_4 ),
        .Q(time_out_counter_reg[7]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[8] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1_n_7 ),
        .Q(time_out_counter_reg[8]),
        .R(reset_time_out));
  CARRY4 \time_out_counter_reg[8]_i_1 
       (.CI(\time_out_counter_reg[4]_i_1_n_0 ),
        .CO({\time_out_counter_reg[8]_i_1_n_0 ,\time_out_counter_reg[8]_i_1_n_1 ,\time_out_counter_reg[8]_i_1_n_2 ,\time_out_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\time_out_counter_reg[8]_i_1_n_4 ,\time_out_counter_reg[8]_i_1_n_5 ,\time_out_counter_reg[8]_i_1_n_6 ,\time_out_counter_reg[8]_i_1_n_7 }),
        .S(time_out_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[9] 
       (.C(init_clk_in),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1_n_6 ),
        .Q(time_out_counter_reg[9]),
        .R(reset_time_out));
  LUT4 #(
    .INIT(16'hAB00)) 
    time_out_wait_bypass_i_1
       (.I0(time_out_wait_bypass),
        .I1(\wait_bypass_count[0]_i_4_n_0 ),
        .I2(tx_fsm_reset_done_int_s3),
        .I3(run_phase_alignment_int_s3),
        .O(time_out_wait_bypass_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_wait_bypass_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(time_out_wait_bypass_i_1_n_0),
        .Q(time_out_wait_bypass),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_wait_bypass_s3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(time_out_wait_bypass_s2),
        .Q(time_out_wait_bypass_s3),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000AABAAAAA)) 
    time_tlock_max_i_1
       (.I0(time_tlock_max_reg_n_0),
        .I1(time_tlock_max_i_2_n_0),
        .I2(time_out_counter_reg[4]),
        .I3(\time_out_counter[0]_i_4_n_0 ),
        .I4(time_tlock_max_i_3_n_0),
        .I5(reset_time_out),
        .O(time_tlock_max_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    time_tlock_max_i_2
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[3]),
        .I2(time_out_counter_reg[0]),
        .I3(time_out_counter_reg[1]),
        .I4(\time_out_counter[0]_i_7_n_0 ),
        .O(time_tlock_max_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    time_tlock_max_i_3
       (.I0(time_out_counter_reg[13]),
        .I1(time_out_counter_reg[11]),
        .I2(time_out_counter_reg[9]),
        .I3(time_out_counter_reg[6]),
        .I4(time_out_counter_reg[17]),
        .I5(time_out_counter_reg[16]),
        .O(time_tlock_max_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_tlock_max_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(time_tlock_max_i_1_n_0),
        .Q(time_tlock_max_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFF1000)) 
    tx_fsm_reset_done_int_i_1
       (.I0(tx_state[1]),
        .I1(tx_state[2]),
        .I2(tx_state[0]),
        .I3(tx_state[3]),
        .I4(tx_fsm_reset_done_int),
        .O(tx_fsm_reset_done_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tx_fsm_reset_done_int_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(tx_fsm_reset_done_int_i_1_n_0),
        .Q(tx_fsm_reset_done_int),
        .R(\init_wait_count_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    tx_fsm_reset_done_int_s3_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(tx_resetdone_out),
        .Q(tx_fsm_reset_done_int_s3),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    txresetdone_s3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(txresetdone_s2),
        .Q(txresetdone_s3),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_bypass_count[0]_i_1 
       (.I0(run_phase_alignment_int_s3),
        .O(clear));
  LUT2 #(
    .INIT(4'h2)) 
    \wait_bypass_count[0]_i_2 
       (.I0(\wait_bypass_count[0]_i_4_n_0 ),
        .I1(tx_fsm_reset_done_int_s3),
        .O(\wait_bypass_count[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_bypass_count[0]_i_4 
       (.I0(\wait_bypass_count[0]_i_6_n_0 ),
        .I1(\wait_bypass_count[0]_i_7_n_0 ),
        .I2(\wait_bypass_count[0]_i_8_n_0 ),
        .I3(\wait_bypass_count[0]_i_9_n_0 ),
        .O(\wait_bypass_count[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_bypass_count[0]_i_5 
       (.I0(wait_bypass_count_reg[0]),
        .O(\wait_bypass_count[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \wait_bypass_count[0]_i_6 
       (.I0(wait_bypass_count_reg[4]),
        .I1(wait_bypass_count_reg[3]),
        .I2(wait_bypass_count_reg[6]),
        .I3(wait_bypass_count_reg[5]),
        .O(\wait_bypass_count[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hDFFFFFFF)) 
    \wait_bypass_count[0]_i_7 
       (.I0(wait_bypass_count_reg[0]),
        .I1(wait_bypass_count_reg[16]),
        .I2(wait_bypass_count_reg[15]),
        .I3(wait_bypass_count_reg[2]),
        .I4(wait_bypass_count_reg[1]),
        .O(\wait_bypass_count[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \wait_bypass_count[0]_i_8 
       (.I0(wait_bypass_count_reg[12]),
        .I1(wait_bypass_count_reg[11]),
        .I2(wait_bypass_count_reg[13]),
        .I3(wait_bypass_count_reg[14]),
        .O(\wait_bypass_count[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \wait_bypass_count[0]_i_9 
       (.I0(wait_bypass_count_reg[7]),
        .I1(wait_bypass_count_reg[8]),
        .I2(wait_bypass_count_reg[9]),
        .I3(wait_bypass_count_reg[10]),
        .O(\wait_bypass_count[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[0] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_7 ),
        .Q(wait_bypass_count_reg[0]),
        .R(clear));
  CARRY4 \wait_bypass_count_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\wait_bypass_count_reg[0]_i_3_n_0 ,\wait_bypass_count_reg[0]_i_3_n_1 ,\wait_bypass_count_reg[0]_i_3_n_2 ,\wait_bypass_count_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\wait_bypass_count_reg[0]_i_3_n_4 ,\wait_bypass_count_reg[0]_i_3_n_5 ,\wait_bypass_count_reg[0]_i_3_n_6 ,\wait_bypass_count_reg[0]_i_3_n_7 }),
        .S({wait_bypass_count_reg[3:1],\wait_bypass_count[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[10] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_5 ),
        .Q(wait_bypass_count_reg[10]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[11] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_4 ),
        .Q(wait_bypass_count_reg[11]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[12] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1_n_7 ),
        .Q(wait_bypass_count_reg[12]),
        .R(clear));
  CARRY4 \wait_bypass_count_reg[12]_i_1 
       (.CI(\wait_bypass_count_reg[8]_i_1_n_0 ),
        .CO({\wait_bypass_count_reg[12]_i_1_n_0 ,\wait_bypass_count_reg[12]_i_1_n_1 ,\wait_bypass_count_reg[12]_i_1_n_2 ,\wait_bypass_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wait_bypass_count_reg[12]_i_1_n_4 ,\wait_bypass_count_reg[12]_i_1_n_5 ,\wait_bypass_count_reg[12]_i_1_n_6 ,\wait_bypass_count_reg[12]_i_1_n_7 }),
        .S(wait_bypass_count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[13] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1_n_6 ),
        .Q(wait_bypass_count_reg[13]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[14] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1_n_5 ),
        .Q(wait_bypass_count_reg[14]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[15] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1_n_4 ),
        .Q(wait_bypass_count_reg[15]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[16] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[16]_i_1_n_7 ),
        .Q(wait_bypass_count_reg[16]),
        .R(clear));
  CARRY4 \wait_bypass_count_reg[16]_i_1 
       (.CI(\wait_bypass_count_reg[12]_i_1_n_0 ),
        .CO(\NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED [3:1],\wait_bypass_count_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,wait_bypass_count_reg[16]}));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[1] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_6 ),
        .Q(wait_bypass_count_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[2] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_5 ),
        .Q(wait_bypass_count_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[3] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_4 ),
        .Q(wait_bypass_count_reg[3]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[4] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_7 ),
        .Q(wait_bypass_count_reg[4]),
        .R(clear));
  CARRY4 \wait_bypass_count_reg[4]_i_1 
       (.CI(\wait_bypass_count_reg[0]_i_3_n_0 ),
        .CO({\wait_bypass_count_reg[4]_i_1_n_0 ,\wait_bypass_count_reg[4]_i_1_n_1 ,\wait_bypass_count_reg[4]_i_1_n_2 ,\wait_bypass_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wait_bypass_count_reg[4]_i_1_n_4 ,\wait_bypass_count_reg[4]_i_1_n_5 ,\wait_bypass_count_reg[4]_i_1_n_6 ,\wait_bypass_count_reg[4]_i_1_n_7 }),
        .S(wait_bypass_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[5] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_6 ),
        .Q(wait_bypass_count_reg[5]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[6] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_5 ),
        .Q(wait_bypass_count_reg[6]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[7] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_4 ),
        .Q(wait_bypass_count_reg[7]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[8] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_7 ),
        .Q(wait_bypass_count_reg[8]),
        .R(clear));
  CARRY4 \wait_bypass_count_reg[8]_i_1 
       (.CI(\wait_bypass_count_reg[4]_i_1_n_0 ),
        .CO({\wait_bypass_count_reg[8]_i_1_n_0 ,\wait_bypass_count_reg[8]_i_1_n_1 ,\wait_bypass_count_reg[8]_i_1_n_2 ,\wait_bypass_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wait_bypass_count_reg[8]_i_1_n_4 ,\wait_bypass_count_reg[8]_i_1_n_5 ,\wait_bypass_count_reg[8]_i_1_n_6 ,\wait_bypass_count_reg[8]_i_1_n_7 }),
        .S(wait_bypass_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[9] 
       (.C(s_level_out_d6_reg_0),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_6 ),
        .Q(wait_bypass_count_reg[9]),
        .R(clear));
  LUT4 #(
    .INIT(16'h0070)) 
    \wait_time_cnt[0]_i_1 
       (.I0(tx_state[2]),
        .I1(tx_state[1]),
        .I2(tx_state[0]),
        .I3(tx_state[3]),
        .O(\wait_time_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \wait_time_cnt[0]_i_2 
       (.I0(wait_time_cnt_reg[1]),
        .I1(wait_time_cnt_reg[0]),
        .I2(wait_time_cnt_reg[3]),
        .I3(wait_time_cnt_reg[2]),
        .I4(\wait_time_cnt[0]_i_4_n_0 ),
        .I5(\wait_time_cnt[0]_i_5_n_0 ),
        .O(sel));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \wait_time_cnt[0]_i_4 
       (.I0(wait_time_cnt_reg[14]),
        .I1(wait_time_cnt_reg[15]),
        .I2(wait_time_cnt_reg[12]),
        .I3(wait_time_cnt_reg[13]),
        .I4(wait_time_cnt_reg[11]),
        .I5(wait_time_cnt_reg[10]),
        .O(\wait_time_cnt[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \wait_time_cnt[0]_i_5 
       (.I0(wait_time_cnt_reg[8]),
        .I1(wait_time_cnt_reg[9]),
        .I2(wait_time_cnt_reg[6]),
        .I3(wait_time_cnt_reg[7]),
        .I4(wait_time_cnt_reg[5]),
        .I5(wait_time_cnt_reg[4]),
        .O(\wait_time_cnt[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_6 
       (.I0(wait_time_cnt_reg[3]),
        .O(\wait_time_cnt[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_7 
       (.I0(wait_time_cnt_reg[2]),
        .O(\wait_time_cnt[0]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_8 
       (.I0(wait_time_cnt_reg[1]),
        .O(\wait_time_cnt[0]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_9 
       (.I0(wait_time_cnt_reg[0]),
        .O(\wait_time_cnt[0]_i_9_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_2 
       (.I0(wait_time_cnt_reg[15]),
        .O(\wait_time_cnt[12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_3 
       (.I0(wait_time_cnt_reg[14]),
        .O(\wait_time_cnt[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_4 
       (.I0(wait_time_cnt_reg[13]),
        .O(\wait_time_cnt[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_5 
       (.I0(wait_time_cnt_reg[12]),
        .O(\wait_time_cnt[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_2 
       (.I0(wait_time_cnt_reg[7]),
        .O(\wait_time_cnt[4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_3 
       (.I0(wait_time_cnt_reg[6]),
        .O(\wait_time_cnt[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_4 
       (.I0(wait_time_cnt_reg[5]),
        .O(\wait_time_cnt[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_5 
       (.I0(wait_time_cnt_reg[4]),
        .O(\wait_time_cnt[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_2 
       (.I0(wait_time_cnt_reg[11]),
        .O(\wait_time_cnt[8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_3 
       (.I0(wait_time_cnt_reg[10]),
        .O(\wait_time_cnt[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_4 
       (.I0(wait_time_cnt_reg[9]),
        .O(\wait_time_cnt[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_5 
       (.I0(wait_time_cnt_reg[8]),
        .O(\wait_time_cnt[8]_i_5_n_0 ));
  FDRE \wait_time_cnt_reg[0] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[0]_i_3_n_7 ),
        .Q(wait_time_cnt_reg[0]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  CARRY4 \wait_time_cnt_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\wait_time_cnt_reg[0]_i_3_n_0 ,\wait_time_cnt_reg[0]_i_3_n_1 ,\wait_time_cnt_reg[0]_i_3_n_2 ,\wait_time_cnt_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[0]_i_3_n_4 ,\wait_time_cnt_reg[0]_i_3_n_5 ,\wait_time_cnt_reg[0]_i_3_n_6 ,\wait_time_cnt_reg[0]_i_3_n_7 }),
        .S({\wait_time_cnt[0]_i_6_n_0 ,\wait_time_cnt[0]_i_7_n_0 ,\wait_time_cnt[0]_i_8_n_0 ,\wait_time_cnt[0]_i_9_n_0 }));
  FDRE \wait_time_cnt_reg[10] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[8]_i_1_n_5 ),
        .Q(wait_time_cnt_reg[10]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[11] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[8]_i_1_n_4 ),
        .Q(wait_time_cnt_reg[11]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[12] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[12]_i_1_n_7 ),
        .Q(wait_time_cnt_reg[12]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  CARRY4 \wait_time_cnt_reg[12]_i_1 
       (.CI(\wait_time_cnt_reg[8]_i_1_n_0 ),
        .CO({\NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED [3],\wait_time_cnt_reg[12]_i_1_n_1 ,\wait_time_cnt_reg[12]_i_1_n_2 ,\wait_time_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[12]_i_1_n_4 ,\wait_time_cnt_reg[12]_i_1_n_5 ,\wait_time_cnt_reg[12]_i_1_n_6 ,\wait_time_cnt_reg[12]_i_1_n_7 }),
        .S({\wait_time_cnt[12]_i_2_n_0 ,\wait_time_cnt[12]_i_3_n_0 ,\wait_time_cnt[12]_i_4_n_0 ,\wait_time_cnt[12]_i_5_n_0 }));
  FDRE \wait_time_cnt_reg[13] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[12]_i_1_n_6 ),
        .Q(wait_time_cnt_reg[13]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[14] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[12]_i_1_n_5 ),
        .Q(wait_time_cnt_reg[14]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[15] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[12]_i_1_n_4 ),
        .Q(wait_time_cnt_reg[15]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[1] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[0]_i_3_n_6 ),
        .Q(wait_time_cnt_reg[1]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[2] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[0]_i_3_n_5 ),
        .Q(wait_time_cnt_reg[2]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDSE \wait_time_cnt_reg[3] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[0]_i_3_n_4 ),
        .Q(wait_time_cnt_reg[3]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[4] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[4]_i_1_n_7 ),
        .Q(wait_time_cnt_reg[4]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  CARRY4 \wait_time_cnt_reg[4]_i_1 
       (.CI(\wait_time_cnt_reg[0]_i_3_n_0 ),
        .CO({\wait_time_cnt_reg[4]_i_1_n_0 ,\wait_time_cnt_reg[4]_i_1_n_1 ,\wait_time_cnt_reg[4]_i_1_n_2 ,\wait_time_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[4]_i_1_n_4 ,\wait_time_cnt_reg[4]_i_1_n_5 ,\wait_time_cnt_reg[4]_i_1_n_6 ,\wait_time_cnt_reg[4]_i_1_n_7 }),
        .S({\wait_time_cnt[4]_i_2_n_0 ,\wait_time_cnt[4]_i_3_n_0 ,\wait_time_cnt[4]_i_4_n_0 ,\wait_time_cnt[4]_i_5_n_0 }));
  FDSE \wait_time_cnt_reg[5] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[4]_i_1_n_6 ),
        .Q(wait_time_cnt_reg[5]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  FDSE \wait_time_cnt_reg[6] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[4]_i_1_n_5 ),
        .Q(wait_time_cnt_reg[6]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  FDSE \wait_time_cnt_reg[7] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[4]_i_1_n_4 ),
        .Q(wait_time_cnt_reg[7]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  FDSE \wait_time_cnt_reg[8] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[8]_i_1_n_7 ),
        .Q(wait_time_cnt_reg[8]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  CARRY4 \wait_time_cnt_reg[8]_i_1 
       (.CI(\wait_time_cnt_reg[4]_i_1_n_0 ),
        .CO({\wait_time_cnt_reg[8]_i_1_n_0 ,\wait_time_cnt_reg[8]_i_1_n_1 ,\wait_time_cnt_reg[8]_i_1_n_2 ,\wait_time_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[8]_i_1_n_4 ,\wait_time_cnt_reg[8]_i_1_n_5 ,\wait_time_cnt_reg[8]_i_1_n_6 ,\wait_time_cnt_reg[8]_i_1_n_7 }),
        .S({\wait_time_cnt[8]_i_2_n_0 ,\wait_time_cnt[8]_i_3_n_0 ,\wait_time_cnt[8]_i_4_n_0 ,\wait_time_cnt[8]_i_5_n_0 }));
  FDSE \wait_time_cnt_reg[9] 
       (.C(init_clk_in),
        .CE(sel),
        .D(\wait_time_cnt_reg[8]_i_1_n_6 ),
        .Q(wait_time_cnt_reg[9]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
