// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Jul  7 23:44:38 2020
// Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/carlositcr/Vivado_Projects/Aurora/project_1/project_1.srcs/sources_1/bd/simplex_rx/ip/simplex_rx_aurora_8b10b_0_0/simplex_rx_aurora_8b10b_0_0_sim_netlist.v
// Design      : simplex_rx_aurora_8b10b_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module simplex_rx_aurora_8b10b_0_0
   (m_axi_rx_tdata,
    m_axi_rx_tkeep,
    m_axi_rx_tvalid,
    m_axi_rx_tlast,
    rxp,
    rxn,
    gt_refclk1,
    frame_err,
    rx_hard_err,
    soft_err,
    rx_lane_up,
    rx_channel_up,
    rx_aligned,
    rx_verify,
    rx_reset,
    user_clk_out,
    sync_clk_out,
    gt_reset,
    rx_system_reset,
    sys_reset_out,
    gt_reset_out,
    power_down,
    loopback,
    tx_lock,
    init_clk_in,
    rx_resetdone_out,
    link_reset_out,
    drpclk_in,
    gt0_qplllock_out,
    gt0_qpllrefclklost_out,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    pll_not_locked_out);
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

  wire drpclk_in;
  wire frame_err;
  wire gt0_qplllock_out;
  wire gt0_qpllrefclklost_out;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_reset;
  wire gt_reset_out;
  wire init_clk_in;
  wire link_reset_out;
  wire [2:0]loopback;
  wire [0:15]m_axi_rx_tdata;
  wire [0:1]m_axi_rx_tkeep;
  wire m_axi_rx_tlast;
  wire m_axi_rx_tvalid;
  wire pll_not_locked_out;
  wire power_down;
  wire rx_aligned;
  wire rx_channel_up;
  wire rx_hard_err;
  wire rx_lane_up;
  wire rx_reset;
  wire rx_resetdone_out;
  wire rx_system_reset;
  wire rx_verify;
  wire rxn;
  wire rxp;
  wire soft_err;
  wire sync_clk_out;
  wire sys_reset_out;
  wire tx_lock;
  wire user_clk_out;
  wire NLW_inst_drprdy_out_UNCONNECTED;
  wire [15:0]NLW_inst_drpdo_out_UNCONNECTED;

  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_support inst
       (.drpaddr_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drpclk_in(drpclk_in),
        .drpdi_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drpdo_out(NLW_inst_drpdo_out_UNCONNECTED[15:0]),
        .drpen_in(1'b0),
        .drprdy_out(NLW_inst_drprdy_out_UNCONNECTED),
        .drpwe_in(1'b0),
        .frame_err(frame_err),
        .gt0_qplllock_out(gt0_qplllock_out),
        .gt0_qpllrefclklost_out(gt0_qpllrefclklost_out),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .gt_reset(gt_reset),
        .gt_reset_out(gt_reset_out),
        .init_clk_in(init_clk_in),
        .link_reset_out(link_reset_out),
        .loopback(loopback),
        .m_axi_rx_tdata(m_axi_rx_tdata),
        .m_axi_rx_tkeep(m_axi_rx_tkeep),
        .m_axi_rx_tlast(m_axi_rx_tlast),
        .m_axi_rx_tvalid(m_axi_rx_tvalid),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .rx_aligned(rx_aligned),
        .rx_channel_up(rx_channel_up),
        .rx_hard_err(rx_hard_err),
        .rx_lane_up(rx_lane_up),
        .rx_reset(rx_reset),
        .rx_resetdone_out(rx_resetdone_out),
        .rx_system_reset(rx_system_reset),
        .rx_verify(rx_verify),
        .rxn(rxn),
        .rxp(rxp),
        .soft_err(soft_err),
        .sync_clk_out(sync_clk_out),
        .sys_reset_out(sys_reset_out),
        .tx_lock(tx_lock),
        .user_clk_out(user_clk_out));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_CLOCK_MODULE" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_CLOCK_MODULE
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_GT_WRAPPER" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_GT_WRAPPER
   (init_clk_in_0,
    drprdy_out,
    rx_realign_i,
    tx_out_clk_i,
    drpdo_out,
    D,
    RXDISPERR,
    RXNOTINTABLE,
    rx_resetdone_out,
    pll_not_locked_out,
    rxfsm_rxresetdone_r3_reg_0,
    left_aligned_r_reg,
    left_aligned_r_reg_0,
    init_clk_in_1,
    init_clk_in_2,
    hard_err_flop_r0,
    left_aligned_r_reg_1,
    left_aligned_r_reg_2,
    init_clk_in,
    drpclk_in,
    drpen_in,
    drpwe_in,
    gt_refclk1,
    rxn,
    rxp,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    ena_comma_align_i,
    rx_polarity_i,
    p_level_in_d1_cdc_from_reg,
    drpdi_in,
    power_down,
    loopback,
    drpaddr_in,
    gt_reset_out,
    GTRXRESET_OUT,
    link_reset_r,
    \word_aligned_control_bits_r_reg[1] ,
    bucket_full_r);
  output init_clk_in_0;
  output drprdy_out;
  output rx_realign_i;
  output tx_out_clk_i;
  output [15:0]drpdo_out;
  output [1:0]D;
  output [1:0]RXDISPERR;
  output [1:0]RXNOTINTABLE;
  output rx_resetdone_out;
  output pll_not_locked_out;
  output rxfsm_rxresetdone_r3_reg_0;
  output left_aligned_r_reg;
  output left_aligned_r_reg_0;
  output [1:0]init_clk_in_1;
  output init_clk_in_2;
  output hard_err_flop_r0;
  output [7:0]left_aligned_r_reg_1;
  output [7:0]left_aligned_r_reg_2;
  input init_clk_in;
  input drpclk_in;
  input drpen_in;
  input drpwe_in;
  input gt_refclk1;
  input rxn;
  input rxp;
  input gt_qpllclk_quad1_out;
  input gt_qpllrefclk_quad1_out;
  input ena_comma_align_i;
  input rx_polarity_i;
  input p_level_in_d1_cdc_from_reg;
  input [15:0]drpdi_in;
  input power_down;
  input [2:0]loopback;
  input [8:0]drpaddr_in;
  input gt_reset_out;
  input GTRXRESET_OUT;
  input link_reset_r;
  input \word_aligned_control_bits_r_reg[1] ;
  input bucket_full_r;

  wire [1:0]D;
  wire GTRXRESET_OUT;
  wire [1:0]RXDISPERR;
  wire [1:0]RXNOTINTABLE;
  wire bucket_full_r;
  wire cpll_reset_i;
  wire [31:1]data0;
  wire [8:0]drpaddr_in;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdo_out;
  wire drpen_in;
  wire drprdy_out;
  wire drpwe_in;
  wire ena_comma_align_i;
  wire gt0_rxresetdone_r3_reg_srl3_n_0;
  wire \gt0_simplex_rx_aurora_8b10b_0_0_i/ack_flag ;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_reset_out;
  wire gt_rx_reset_i;
  wire gt_rxdfelfhold_i;
  wire gt_rxresetfsm_i_n_4;
  wire gt_rxuserrdy_i;
  wire gt_tx_reset_i;
  wire gtrxreset_pulse;
  wire gtrxreset_pulse_i_1_n_0;
  wire gtrxreset_r1;
  wire gtrxreset_r2;
  wire gtrxreset_r3;
  wire gtrxreset_sync;
  wire hard_err_flop_r0;
  wire init_clk_in;
  wire init_clk_in_0;
  wire [1:0]init_clk_in_1;
  wire init_clk_in_2;
  wire left_aligned_r_reg;
  wire left_aligned_r_reg_0;
  wire [7:0]left_aligned_r_reg_1;
  wire [7:0]left_aligned_r_reg_2;
  wire link_reset_r;
  wire link_reset_r2;
  wire [2:0]loopback;
  wire p_level_in_d1_cdc_from_reg;
  wire pll_not_locked_out;
  wire power_down;
  wire [31:0]rx_cdrlock_counter;
  wire rx_cdrlock_counter0_carry__0_n_0;
  wire rx_cdrlock_counter0_carry__0_n_1;
  wire rx_cdrlock_counter0_carry__0_n_2;
  wire rx_cdrlock_counter0_carry__0_n_3;
  wire rx_cdrlock_counter0_carry__1_n_0;
  wire rx_cdrlock_counter0_carry__1_n_1;
  wire rx_cdrlock_counter0_carry__1_n_2;
  wire rx_cdrlock_counter0_carry__1_n_3;
  wire rx_cdrlock_counter0_carry__2_n_0;
  wire rx_cdrlock_counter0_carry__2_n_1;
  wire rx_cdrlock_counter0_carry__2_n_2;
  wire rx_cdrlock_counter0_carry__2_n_3;
  wire rx_cdrlock_counter0_carry__3_n_0;
  wire rx_cdrlock_counter0_carry__3_n_1;
  wire rx_cdrlock_counter0_carry__3_n_2;
  wire rx_cdrlock_counter0_carry__3_n_3;
  wire rx_cdrlock_counter0_carry__4_n_0;
  wire rx_cdrlock_counter0_carry__4_n_1;
  wire rx_cdrlock_counter0_carry__4_n_2;
  wire rx_cdrlock_counter0_carry__4_n_3;
  wire rx_cdrlock_counter0_carry__5_n_0;
  wire rx_cdrlock_counter0_carry__5_n_1;
  wire rx_cdrlock_counter0_carry__5_n_2;
  wire rx_cdrlock_counter0_carry__5_n_3;
  wire rx_cdrlock_counter0_carry__6_n_2;
  wire rx_cdrlock_counter0_carry__6_n_3;
  wire rx_cdrlock_counter0_carry_n_0;
  wire rx_cdrlock_counter0_carry_n_1;
  wire rx_cdrlock_counter0_carry_n_2;
  wire rx_cdrlock_counter0_carry_n_3;
  wire \rx_cdrlock_counter[0]_i_1_n_0 ;
  wire \rx_cdrlock_counter[31]_i_2_n_0 ;
  wire \rx_cdrlock_counter[31]_i_3_n_0 ;
  wire \rx_cdrlock_counter[31]_i_4_n_0 ;
  wire \rx_cdrlock_counter[31]_i_5_n_0 ;
  wire \rx_cdrlock_counter[31]_i_6_n_0 ;
  wire \rx_cdrlock_counter[31]_i_7_n_0 ;
  wire \rx_cdrlock_counter[31]_i_8_n_0 ;
  wire \rx_cdrlock_counter[31]_i_9_n_0 ;
  wire [31:1]rx_cdrlock_counter_0;
  wire rx_cdrlocked_i_1_n_0;
  wire rx_cdrlocked_reg_n_0;
  wire rx_polarity_i;
  wire rx_realign_i;
  wire rx_resetdone_out;
  wire rxfsm_rxresetdone_r;
  wire rxfsm_rxresetdone_r2;
  wire rxfsm_rxresetdone_r3_reg_0;
  wire rxfsm_soft_reset_r;
  wire rxfsm_soft_reset_r0_n_0;
  wire rxn;
  wire rxp;
  wire simplex_rx_aurora_8b10b_0_0_multi_gt_i_n_3;
  wire tx_out_clk_i;
  wire \word_aligned_control_bits_r_reg[1] ;
  wire [3:2]NLW_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_rx_cdrlock_counter0_carry__6_O_UNCONNECTED;

  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/gt0_rxresetdone_r3_reg_srl3 " *) 
  SRL16E gt0_rxresetdone_r3_reg_srl3
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(p_level_in_d1_cdc_from_reg),
        .D(simplex_rx_aurora_8b10b_0_0_multi_gt_i_n_3),
        .Q(gt0_rxresetdone_r3_reg_srl3_n_0));
  FDRE gt_rx_reset_i_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(gt_tx_reset_i),
        .Q(gt_rx_reset_i),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    gt_rxresetdone_r_i_1
       (.I0(rx_resetdone_out),
        .O(rxfsm_rxresetdone_r3_reg_0));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_rx_startup_fsm gt_rxresetfsm_i
       (.AR(rxfsm_soft_reset_r),
        .CPLL_RESET_reg_0(gt_rxresetfsm_i_n_4),
        .ack_flag(\gt0_simplex_rx_aurora_8b10b_0_0_i/ack_flag ),
        .cpll_reset_i(cpll_reset_i),
        .gt_rxdfelfhold_i(gt_rxdfelfhold_i),
        .gt_rxuserrdy_i(gt_rxuserrdy_i),
        .gt_tx_reset_i(gt_tx_reset_i),
        .init_clk_in(init_clk_in),
        .p_level_in_d1_cdc_from_reg(p_level_in_d1_cdc_from_reg),
        .reset_time_out_reg_0(rx_cdrlocked_reg_n_0),
        .rxfsm_rxresetdone_r(rxfsm_rxresetdone_r),
        .s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg(init_clk_in_0));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_3 gtrxreset_cdc_sync
       (.GTRXRESET_OUT(GTRXRESET_OUT),
        .init_clk_in(init_clk_in),
        .out(gtrxreset_sync),
        .p_level_in_d1_cdc_from_reg_0(p_level_in_d1_cdc_from_reg));
  LUT2 #(
    .INIT(4'h2)) 
    gtrxreset_pulse_i_1
       (.I0(gtrxreset_r2),
        .I1(gtrxreset_r3),
        .O(gtrxreset_pulse_i_1_n_0));
  FDRE gtrxreset_pulse_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(gtrxreset_pulse_i_1_n_0),
        .Q(gtrxreset_pulse),
        .R(1'b0));
  FDRE gtrxreset_r1_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(gtrxreset_sync),
        .Q(gtrxreset_r1),
        .R(1'b0));
  FDRE gtrxreset_r2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(gtrxreset_r1),
        .Q(gtrxreset_r2),
        .R(1'b0));
  FDRE gtrxreset_r3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(gtrxreset_r2),
        .Q(gtrxreset_r3),
        .R(1'b0));
  (* equivalent_register_removal = "no" *) 
  FDRE link_reset_r2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(link_reset_r),
        .Q(link_reset_r2),
        .R(1'b0));
  CARRY4 rx_cdrlock_counter0_carry
       (.CI(1'b0),
        .CO({rx_cdrlock_counter0_carry_n_0,rx_cdrlock_counter0_carry_n_1,rx_cdrlock_counter0_carry_n_2,rx_cdrlock_counter0_carry_n_3}),
        .CYINIT(rx_cdrlock_counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(rx_cdrlock_counter[4:1]));
  CARRY4 rx_cdrlock_counter0_carry__0
       (.CI(rx_cdrlock_counter0_carry_n_0),
        .CO({rx_cdrlock_counter0_carry__0_n_0,rx_cdrlock_counter0_carry__0_n_1,rx_cdrlock_counter0_carry__0_n_2,rx_cdrlock_counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(rx_cdrlock_counter[8:5]));
  CARRY4 rx_cdrlock_counter0_carry__1
       (.CI(rx_cdrlock_counter0_carry__0_n_0),
        .CO({rx_cdrlock_counter0_carry__1_n_0,rx_cdrlock_counter0_carry__1_n_1,rx_cdrlock_counter0_carry__1_n_2,rx_cdrlock_counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(rx_cdrlock_counter[12:9]));
  CARRY4 rx_cdrlock_counter0_carry__2
       (.CI(rx_cdrlock_counter0_carry__1_n_0),
        .CO({rx_cdrlock_counter0_carry__2_n_0,rx_cdrlock_counter0_carry__2_n_1,rx_cdrlock_counter0_carry__2_n_2,rx_cdrlock_counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(rx_cdrlock_counter[16:13]));
  CARRY4 rx_cdrlock_counter0_carry__3
       (.CI(rx_cdrlock_counter0_carry__2_n_0),
        .CO({rx_cdrlock_counter0_carry__3_n_0,rx_cdrlock_counter0_carry__3_n_1,rx_cdrlock_counter0_carry__3_n_2,rx_cdrlock_counter0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(rx_cdrlock_counter[20:17]));
  CARRY4 rx_cdrlock_counter0_carry__4
       (.CI(rx_cdrlock_counter0_carry__3_n_0),
        .CO({rx_cdrlock_counter0_carry__4_n_0,rx_cdrlock_counter0_carry__4_n_1,rx_cdrlock_counter0_carry__4_n_2,rx_cdrlock_counter0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(rx_cdrlock_counter[24:21]));
  CARRY4 rx_cdrlock_counter0_carry__5
       (.CI(rx_cdrlock_counter0_carry__4_n_0),
        .CO({rx_cdrlock_counter0_carry__5_n_0,rx_cdrlock_counter0_carry__5_n_1,rx_cdrlock_counter0_carry__5_n_2,rx_cdrlock_counter0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[28:25]),
        .S(rx_cdrlock_counter[28:25]));
  CARRY4 rx_cdrlock_counter0_carry__6
       (.CI(rx_cdrlock_counter0_carry__5_n_0),
        .CO({NLW_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED[3:2],rx_cdrlock_counter0_carry__6_n_2,rx_cdrlock_counter0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_rx_cdrlock_counter0_carry__6_O_UNCONNECTED[3],data0[31:29]}),
        .S({1'b0,rx_cdrlock_counter[31:29]}));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    \rx_cdrlock_counter[0]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(rx_cdrlock_counter[0]),
        .O(\rx_cdrlock_counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \rx_cdrlock_counter[10]_i_1 
       (.I0(data0[10]),
        .I1(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .O(rx_cdrlock_counter_0[10]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[11]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[11]),
        .O(rx_cdrlock_counter_0[11]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[12]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[12]),
        .O(rx_cdrlock_counter_0[12]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[13]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[13]),
        .O(rx_cdrlock_counter_0[13]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[14]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[14]),
        .O(rx_cdrlock_counter_0[14]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[15]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[15]),
        .O(rx_cdrlock_counter_0[15]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[16]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[16]),
        .O(rx_cdrlock_counter_0[16]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[17]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[17]),
        .O(rx_cdrlock_counter_0[17]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[18]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[18]),
        .O(rx_cdrlock_counter_0[18]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[19]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[19]),
        .O(rx_cdrlock_counter_0[19]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[1]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[1]),
        .O(rx_cdrlock_counter_0[1]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[20]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[20]),
        .O(rx_cdrlock_counter_0[20]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[21]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[21]),
        .O(rx_cdrlock_counter_0[21]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[22]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[22]),
        .O(rx_cdrlock_counter_0[22]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[23]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[23]),
        .O(rx_cdrlock_counter_0[23]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[24]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[24]),
        .O(rx_cdrlock_counter_0[24]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[25]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[25]),
        .O(rx_cdrlock_counter_0[25]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[26]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[26]),
        .O(rx_cdrlock_counter_0[26]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[27]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[27]),
        .O(rx_cdrlock_counter_0[27]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[28]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[28]),
        .O(rx_cdrlock_counter_0[28]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[29]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[29]),
        .O(rx_cdrlock_counter_0[29]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[2]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[2]),
        .O(rx_cdrlock_counter_0[2]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[30]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[30]),
        .O(rx_cdrlock_counter_0[30]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[31]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[31]),
        .O(rx_cdrlock_counter_0[31]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \rx_cdrlock_counter[31]_i_2 
       (.I0(rx_cdrlock_counter[18]),
        .I1(rx_cdrlock_counter[19]),
        .I2(rx_cdrlock_counter[16]),
        .I3(rx_cdrlock_counter[17]),
        .I4(\rx_cdrlock_counter[31]_i_6_n_0 ),
        .O(\rx_cdrlock_counter[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \rx_cdrlock_counter[31]_i_3 
       (.I0(rx_cdrlock_counter[26]),
        .I1(rx_cdrlock_counter[27]),
        .I2(rx_cdrlock_counter[24]),
        .I3(rx_cdrlock_counter[25]),
        .I4(\rx_cdrlock_counter[31]_i_7_n_0 ),
        .O(\rx_cdrlock_counter[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \rx_cdrlock_counter[31]_i_4 
       (.I0(rx_cdrlock_counter[2]),
        .I1(rx_cdrlock_counter[3]),
        .I2(rx_cdrlock_counter[0]),
        .I3(rx_cdrlock_counter[1]),
        .I4(\rx_cdrlock_counter[31]_i_8_n_0 ),
        .O(\rx_cdrlock_counter[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    \rx_cdrlock_counter[31]_i_5 
       (.I0(rx_cdrlock_counter[11]),
        .I1(rx_cdrlock_counter[10]),
        .I2(rx_cdrlock_counter[8]),
        .I3(rx_cdrlock_counter[9]),
        .I4(\rx_cdrlock_counter[31]_i_9_n_0 ),
        .O(\rx_cdrlock_counter[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_cdrlock_counter[31]_i_6 
       (.I0(rx_cdrlock_counter[21]),
        .I1(rx_cdrlock_counter[20]),
        .I2(rx_cdrlock_counter[23]),
        .I3(rx_cdrlock_counter[22]),
        .O(\rx_cdrlock_counter[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_cdrlock_counter[31]_i_7 
       (.I0(rx_cdrlock_counter[29]),
        .I1(rx_cdrlock_counter[28]),
        .I2(rx_cdrlock_counter[31]),
        .I3(rx_cdrlock_counter[30]),
        .O(\rx_cdrlock_counter[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \rx_cdrlock_counter[31]_i_8 
       (.I0(rx_cdrlock_counter[5]),
        .I1(rx_cdrlock_counter[4]),
        .I2(rx_cdrlock_counter[6]),
        .I3(rx_cdrlock_counter[7]),
        .O(\rx_cdrlock_counter[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_cdrlock_counter[31]_i_9 
       (.I0(rx_cdrlock_counter[13]),
        .I1(rx_cdrlock_counter[12]),
        .I2(rx_cdrlock_counter[15]),
        .I3(rx_cdrlock_counter[14]),
        .O(\rx_cdrlock_counter[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[3]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[3]),
        .O(rx_cdrlock_counter_0[3]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[4]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[4]),
        .O(rx_cdrlock_counter_0[4]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[5]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[5]),
        .O(rx_cdrlock_counter_0[5]));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \rx_cdrlock_counter[6]_i_1 
       (.I0(data0[6]),
        .I1(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .O(rx_cdrlock_counter_0[6]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[7]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[7]),
        .O(rx_cdrlock_counter_0[7]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \rx_cdrlock_counter[8]_i_1 
       (.I0(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I1(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .I4(data0[8]),
        .O(rx_cdrlock_counter_0[8]));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \rx_cdrlock_counter[9]_i_1 
       (.I0(data0[9]),
        .I1(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .O(rx_cdrlock_counter_0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[0] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\rx_cdrlock_counter[0]_i_1_n_0 ),
        .Q(rx_cdrlock_counter[0]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[10] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[10]),
        .Q(rx_cdrlock_counter[10]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[11] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[11]),
        .Q(rx_cdrlock_counter[11]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[12] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[12]),
        .Q(rx_cdrlock_counter[12]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[13] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[13]),
        .Q(rx_cdrlock_counter[13]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[14] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[14]),
        .Q(rx_cdrlock_counter[14]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[15] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[15]),
        .Q(rx_cdrlock_counter[15]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[16] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[16]),
        .Q(rx_cdrlock_counter[16]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[17] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[17]),
        .Q(rx_cdrlock_counter[17]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[18] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[18]),
        .Q(rx_cdrlock_counter[18]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[19] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[19]),
        .Q(rx_cdrlock_counter[19]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[1] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[1]),
        .Q(rx_cdrlock_counter[1]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[20] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[20]),
        .Q(rx_cdrlock_counter[20]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[21] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[21]),
        .Q(rx_cdrlock_counter[21]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[22] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[22]),
        .Q(rx_cdrlock_counter[22]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[23] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[23]),
        .Q(rx_cdrlock_counter[23]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[24] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[24]),
        .Q(rx_cdrlock_counter[24]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[25] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[25]),
        .Q(rx_cdrlock_counter[25]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[26] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[26]),
        .Q(rx_cdrlock_counter[26]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[27] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[27]),
        .Q(rx_cdrlock_counter[27]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[28] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[28]),
        .Q(rx_cdrlock_counter[28]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[29] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[29]),
        .Q(rx_cdrlock_counter[29]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[2] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[2]),
        .Q(rx_cdrlock_counter[2]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[30] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[30]),
        .Q(rx_cdrlock_counter[30]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[31] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[31]),
        .Q(rx_cdrlock_counter[31]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[3] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[3]),
        .Q(rx_cdrlock_counter[3]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[4] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[4]),
        .Q(rx_cdrlock_counter[4]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[5] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[5]),
        .Q(rx_cdrlock_counter[5]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[6] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[6]),
        .Q(rx_cdrlock_counter[6]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[7] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[7]),
        .Q(rx_cdrlock_counter[7]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[8] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[8]),
        .Q(rx_cdrlock_counter[8]),
        .R(gt_rx_reset_i));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cdrlock_counter_reg[9] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlock_counter_0[9]),
        .Q(rx_cdrlock_counter[9]),
        .R(gt_rx_reset_i));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    rx_cdrlocked_i_1
       (.I0(rx_cdrlocked_reg_n_0),
        .I1(\rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(\rx_cdrlock_counter[31]_i_5_n_0 ),
        .O(rx_cdrlocked_i_1_n_0));
  FDRE rx_cdrlocked_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_cdrlocked_i_1_n_0),
        .Q(rx_cdrlocked_reg_n_0),
        .R(gt_rx_reset_i));
  (* equivalent_register_removal = "no" *) 
  FDRE rxfsm_rxresetdone_r2_reg
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rxfsm_rxresetdone_r),
        .Q(rxfsm_rxresetdone_r2),
        .R(1'b0));
  FDRE rxfsm_rxresetdone_r3_reg
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rxfsm_rxresetdone_r2),
        .Q(rx_resetdone_out),
        .R(1'b0));
  FDRE rxfsm_rxresetdone_r_reg
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(gt0_rxresetdone_r3_reg_srl3_n_0),
        .Q(rxfsm_rxresetdone_r),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hFE)) 
    rxfsm_soft_reset_r0
       (.I0(link_reset_r2),
        .I1(gt_reset_out),
        .I2(gtrxreset_pulse),
        .O(rxfsm_soft_reset_r0_n_0));
  FDRE rxfsm_soft_reset_r_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rxfsm_soft_reset_r0_n_0),
        .Q(rxfsm_soft_reset_r),
        .R(1'b0));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_multi_gt simplex_rx_aurora_8b10b_0_0_multi_gt_i
       (.D(D),
        .RXDISPERR(RXDISPERR),
        .RXNOTINTABLE(RXNOTINTABLE),
        .SR(gt_rx_reset_i),
        .ack_flag(\gt0_simplex_rx_aurora_8b10b_0_0_i/ack_flag ),
        .bucket_full_r(bucket_full_r),
        .cpll_reset_i(cpll_reset_i),
        .drpaddr_in(drpaddr_in),
        .drpclk_in(drpclk_in),
        .drpdi_in(drpdi_in),
        .drpdo_out(drpdo_out),
        .drpen_in(drpen_in),
        .drprdy_out(drprdy_out),
        .drpwe_in(drpwe_in),
        .ena_comma_align_i(ena_comma_align_i),
        .flag2_reg(gt_rxresetfsm_i_n_4),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .gt_rxdfelfhold_i(gt_rxdfelfhold_i),
        .gt_rxuserrdy_i(gt_rxuserrdy_i),
        .gt_tx_reset_i(gt_tx_reset_i),
        .hard_err_flop_r0(hard_err_flop_r0),
        .init_clk_in(init_clk_in),
        .init_clk_in_0(init_clk_in_0),
        .init_clk_in_1(simplex_rx_aurora_8b10b_0_0_multi_gt_i_n_3),
        .init_clk_in_2(init_clk_in_1),
        .init_clk_in_3(init_clk_in_2),
        .left_aligned_r_reg(left_aligned_r_reg),
        .left_aligned_r_reg_0(left_aligned_r_reg_0),
        .left_aligned_r_reg_1(left_aligned_r_reg_1),
        .left_aligned_r_reg_2(left_aligned_r_reg_2),
        .loopback(loopback),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .rx_polarity_i(rx_polarity_i),
        .rx_realign_i(rx_realign_i),
        .rxn(rxn),
        .rxp(rxp),
        .s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg(p_level_in_d1_cdc_from_reg),
        .tx_out_clk_i(tx_out_clk_i),
        .\word_aligned_control_bits_r_reg[1] (\word_aligned_control_bits_r_reg[1] ));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_RESET_LOGIC" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RESET_LOGIC
   (link_reset_r,
    SR,
    wait_for_lane_up_r0,
    in0,
    link_reset_out,
    init_clk_in,
    s_level_out_d6_reg,
    tx_lock_comb_r_reg_0,
    gt_rxresetdone_r2_reg_0,
    reset_channel_i);
  output link_reset_r;
  output [0:0]SR;
  output wait_for_lane_up_r0;
  input in0;
  input link_reset_out;
  input init_clk_in;
  input s_level_out_d6_reg;
  input tx_lock_comb_r_reg_0;
  input gt_rxresetdone_r2_reg_0;
  input reset_channel_i;

  wire [0:0]SR;
  wire SYSTEM_RESET0_n_0;
  wire gt_rxresetdone_r;
  wire gt_rxresetdone_r2;
  wire gt_rxresetdone_r2_reg_0;
  wire gt_rxresetdone_r3;
  wire in0;
  wire init_clk_in;
  wire link_reset_out;
  wire link_reset_r;
  wire link_reset_sync;
  wire reset_channel_i;
  wire s_level_out_d6_reg;
  wire tx_lock_comb_r;
  wire tx_lock_comb_r_reg_0;
  wire tx_lock_sync;
  wire wait_for_lane_up_r0;

  LUT4 #(
    .INIT(16'hFFDF)) 
    SYSTEM_RESET0
       (.I0(tx_lock_sync),
        .I1(in0),
        .I2(gt_rxresetdone_r3),
        .I3(link_reset_sync),
        .O(SYSTEM_RESET0_n_0));
  FDRE SYSTEM_RESET_reg
       (.C(s_level_out_d6_reg),
        .CE(1'b1),
        .D(SYSTEM_RESET0_n_0),
        .Q(SR),
        .R(1'b0));
  FDCE gt_rxresetdone_r2_reg
       (.C(s_level_out_d6_reg),
        .CE(1'b1),
        .CLR(gt_rxresetdone_r2_reg_0),
        .D(gt_rxresetdone_r),
        .Q(gt_rxresetdone_r2));
  FDRE gt_rxresetdone_r3_reg
       (.C(s_level_out_d6_reg),
        .CE(1'b1),
        .D(gt_rxresetdone_r2),
        .Q(gt_rxresetdone_r3),
        .R(1'b0));
  FDCE gt_rxresetdone_r_reg
       (.C(s_level_out_d6_reg),
        .CE(1'b1),
        .CLR(gt_rxresetdone_r2_reg_0),
        .D(1'b1),
        .Q(gt_rxresetdone_r));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_11 link_reset_cdc_sync
       (.init_clk_in(init_clk_in),
        .link_reset_r(link_reset_r),
        .out(link_reset_sync),
        .s_level_out_d6_reg_0(s_level_out_d6_reg));
  FDRE link_reset_comb_r_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(link_reset_out),
        .Q(link_reset_r),
        .R(1'b0));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_12 tx_lock_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(tx_lock_sync),
        .s_level_out_d6_reg_0(s_level_out_d6_reg),
        .tx_lock_comb_r(tx_lock_comb_r));
  FDRE tx_lock_comb_r_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(tx_lock_comb_r_reg_0),
        .Q(tx_lock_comb_r),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    wait_for_lane_up_r_i_1
       (.I0(SR),
        .I1(reset_channel_i),
        .O(wait_for_lane_up_r0));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_RX_AURORA_LANE_SIMPLEX_V5" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_AURORA_LANE_SIMPLEX_V5
   (rx_lane_up,
    link_reset_out,
    ena_comma_align_i,
    rx_scp_i,
    rx_ecp_i,
    bucket_full_r,
    hard_err_reset_i,
    GOT_V,
    HARD_ERR,
    RX_PAD,
    rx_polarity_i,
    left_aligned_r_reg,
    rx_pe_data_v_i,
    in_frame_r_reg,
    RX_PE_DATA_V_reg,
    RX_ECP_reg,
    Q,
    \soft_err_r_reg[1] ,
    first_v_received_r_reg,
    \rx_pe_data_r_reg[0] ,
    init_clk_in,
    ready_r_reg0,
    \word_aligned_control_bits_r_reg[1] ,
    \word_aligned_control_bits_r_reg[0] ,
    hard_err_flop_r0,
    in_frame_r,
    START_RX,
    storage_v_r,
    D,
    left_aligned_r_reg_0,
    rx_realign_i,
    rx_channel_up,
    RXDISPERR,
    RXNOTINTABLE,
    \word_aligned_data_r_reg[8] ,
    \word_aligned_data_r_reg[0] ,
    \soft_err_r_reg[0] );
  output rx_lane_up;
  output link_reset_out;
  output ena_comma_align_i;
  output rx_scp_i;
  output rx_ecp_i;
  output bucket_full_r;
  output hard_err_reset_i;
  output GOT_V;
  output HARD_ERR;
  output RX_PAD;
  output rx_polarity_i;
  output left_aligned_r_reg;
  output rx_pe_data_v_i;
  output in_frame_r_reg;
  output RX_PE_DATA_V_reg;
  output RX_ECP_reg;
  output [15:0]Q;
  output \soft_err_r_reg[1] ;
  input first_v_received_r_reg;
  input \rx_pe_data_r_reg[0] ;
  input init_clk_in;
  input ready_r_reg0;
  input \word_aligned_control_bits_r_reg[1] ;
  input \word_aligned_control_bits_r_reg[0] ;
  input hard_err_flop_r0;
  input in_frame_r;
  input START_RX;
  input storage_v_r;
  input [1:0]D;
  input left_aligned_r_reg_0;
  input rx_realign_i;
  input rx_channel_up;
  input [1:0]RXDISPERR;
  input [1:0]RXNOTINTABLE;
  input [7:0]\word_aligned_data_r_reg[8] ;
  input [7:0]\word_aligned_data_r_reg[0] ;
  input [1:0]\soft_err_r_reg[0] ;

  wire [1:0]D;
  wire GOT_V;
  wire HARD_ERR;
  wire [15:0]Q;
  wire [1:0]RXDISPERR;
  wire [1:0]RXNOTINTABLE;
  wire RX_CC;
  wire RX_ECP_reg;
  wire RX_NEG;
  wire RX_PAD;
  wire RX_PE_DATA_V_reg;
  wire START_RX;
  wire bucket_full_r;
  wire counter2_r0;
  wire ena_comma_align_i;
  wire first_v_received_r_reg;
  wire hard_err_flop_r0;
  wire hard_err_reset_i;
  wire in_frame_r;
  wire in_frame_r_reg;
  wire init_clk_in;
  wire left_aligned_r_reg;
  wire left_aligned_r_reg_0;
  wire link_reset_out;
  wire ready_r;
  wire ready_r_reg0;
  wire rx_channel_up;
  wire rx_ecp_i;
  wire rx_lane_init_sm_simplex_i_n_4;
  wire rx_lane_up;
  wire \rx_pe_data_r_reg[0] ;
  wire rx_pe_data_v_i;
  wire rx_polarity_i;
  wire rx_realign_i;
  wire rx_scp_i;
  wire [1:0]\soft_err_r_reg[0] ;
  wire \soft_err_r_reg[1] ;
  wire storage_v_r;
  wire \word_aligned_control_bits_r_reg[0] ;
  wire \word_aligned_control_bits_r_reg[1] ;
  wire [7:0]\word_aligned_data_r_reg[0] ;
  wire [7:0]\word_aligned_data_r_reg[8] ;

  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_ERR_DETECT_SIMPLEX_V5 rx_err_detect_simplex_gtp_i
       (.HARD_ERR(HARD_ERR),
        .SR(rx_lane_init_sm_simplex_i_n_4),
        .bucket_full_r(bucket_full_r),
        .hard_err_flop_r0(hard_err_flop_r0),
        .hard_err_flop_r_reg_0(\rx_pe_data_r_reg[0] ),
        .hard_err_reset_i(hard_err_reset_i),
        .\soft_err_r_reg[0]_0 (\soft_err_r_reg[0] ),
        .\soft_err_r_reg[1]_0 (\soft_err_r_reg[1] ));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LANE_INIT_SM_SIMPLEX rx_lane_init_sm_simplex_i
       (.D(D),
        .RXDISPERR(RXDISPERR),
        .RXNOTINTABLE(RXNOTINTABLE),
        .RX_NEG(RX_NEG),
        .SR(rx_lane_init_sm_simplex_i_n_4),
        .align_r_reg_0(ena_comma_align_i),
        .\counter1_r_reg[0]_0 (\rx_pe_data_r_reg[0] ),
        .counter2_r0(counter2_r0),
        .lane_up_flop_i_0(first_v_received_r_reg),
        .ready_r(ready_r),
        .ready_r_reg0(ready_r_reg0),
        .rx_lane_up(rx_lane_up),
        .rx_polarity_i(rx_polarity_i),
        .rx_realign_i(rx_realign_i));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_hotplug simplex_rx_aurora_8b10b_0_0_hotplug_i
       (.D(RX_CC),
        .init_clk_in(init_clk_in),
        .link_reset_out(link_reset_out),
        .p_level_in_d1_cdc_from_reg(\rx_pe_data_r_reg[0] ),
        .\rx_cc_extend_r_reg[7]_0 (first_v_received_r_reg));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SYM_DEC sym_dec_i
       (.D(RX_CC),
        .GOT_V(GOT_V),
        .Q(Q),
        .RX_ECP_reg_0(rx_ecp_i),
        .RX_ECP_reg_1(RX_ECP_reg),
        .RX_NEG(RX_NEG),
        .RX_PAD(RX_PAD),
        .RX_PE_DATA_V_reg_0(RX_PE_DATA_V_reg),
        .START_RX(START_RX),
        .counter2_r0(counter2_r0),
        .ena_comma_align_i(ena_comma_align_i),
        .first_v_received_r_reg_0(first_v_received_r_reg),
        .in_frame_r(in_frame_r),
        .in_frame_r_reg(in_frame_r_reg),
        .left_aligned_r_reg_0(left_aligned_r_reg),
        .left_aligned_r_reg_1(D[0]),
        .left_aligned_r_reg_2(left_aligned_r_reg_0),
        .ready_r(ready_r),
        .rx_channel_up(rx_channel_up),
        .\rx_pe_data_r_reg[0]_0 (\rx_pe_data_r_reg[0] ),
        .rx_pe_data_v_i(rx_pe_data_v_i),
        .rx_scp_i(rx_scp_i),
        .storage_v_r(storage_v_r),
        .\word_aligned_control_bits_r_reg[0]_0 (\word_aligned_control_bits_r_reg[0] ),
        .\word_aligned_control_bits_r_reg[1]_0 (\word_aligned_control_bits_r_reg[1] ),
        .\word_aligned_data_r_reg[0]_0 (\word_aligned_data_r_reg[0] ),
        .\word_aligned_data_r_reg[8]_0 (\word_aligned_data_r_reg[8] ));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX
   (rx_hard_err,
    rx_aligned,
    reset_channel_i,
    soft_err,
    HARD_ERR,
    RESET_CHANNEL_reg_0,
    rx_lane_up,
    CHANNEL_SOFT_ERR_reg_0,
    power_down);
  output rx_hard_err;
  output rx_aligned;
  output reset_channel_i;
  output soft_err;
  input HARD_ERR;
  input RESET_CHANNEL_reg_0;
  input rx_lane_up;
  input CHANNEL_SOFT_ERR_reg_0;
  input power_down;

  wire CHANNEL_SOFT_ERR_reg_0;
  wire HARD_ERR;
  wire RESET_CHANNEL_i_1_n_0;
  wire RESET_CHANNEL_reg_0;
  wire hard_err_r;
  wire lane_up_r;
  wire power_down;
  wire reset_channel_i;
  wire rx_aligned;
  wire rx_hard_err;
  wire rx_lane_up;
  wire soft_err;
  wire soft_err_r_reg_srl3_n_0;

  FDRE #(
    .INIT(1'b1)) 
    CHANNEL_HARD_ERR_reg
       (.C(RESET_CHANNEL_reg_0),
        .CE(1'b1),
        .D(hard_err_r),
        .Q(rx_hard_err),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    CHANNEL_SOFT_ERR_reg
       (.C(RESET_CHANNEL_reg_0),
        .CE(1'b1),
        .D(soft_err_r_reg_srl3_n_0),
        .Q(soft_err),
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
       (.C(RESET_CHANNEL_reg_0),
        .CE(1'b1),
        .D(RESET_CHANNEL_i_1_n_0),
        .Q(reset_channel_i),
        .R(1'b0));
  FDRE RX_ALIGNED_reg
       (.C(RESET_CHANNEL_reg_0),
        .CE(1'b1),
        .D(lane_up_r),
        .Q(rx_aligned),
        .R(1'b0));
  FDRE hard_err_r_reg
       (.C(RESET_CHANNEL_reg_0),
        .CE(1'b1),
        .D(HARD_ERR),
        .Q(hard_err_r),
        .R(1'b0));
  FDRE lane_up_r_reg
       (.C(RESET_CHANNEL_reg_0),
        .CE(1'b1),
        .D(rx_lane_up),
        .Q(lane_up_r),
        .R(1'b0));
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_err_detect_simplex_i/soft_err_r_reg_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    soft_err_r_reg_srl3
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(RESET_CHANNEL_reg_0),
        .D(CHANNEL_SOFT_ERR_reg_0),
        .Q(soft_err_r_reg_srl3_n_0));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX
   (SR,
    GTRXRESET_OUT,
    rx_channel_up,
    START_RX,
    ready_r_reg0,
    \free_count_r_reg[13]_0 ,
    GOT_V,
    wait_for_lane_up_r0,
    \gtrxreset_extend_r_reg[0]_0 ,
    hard_err_reset_i,
    reset_channel_i);
  output [0:0]SR;
  output GTRXRESET_OUT;
  output rx_channel_up;
  output START_RX;
  output ready_r_reg0;
  input \free_count_r_reg[13]_0 ;
  input GOT_V;
  input wait_for_lane_up_r0;
  input [0:0]\gtrxreset_extend_r_reg[0]_0 ;
  input hard_err_reset_i;
  input reset_channel_i;

  wire GOT_V;
  wire GTRXRESET_OUT;
  wire GTRXRESET_OUT_i_1_n_0;
  wire GTRXRESET_OUT_i_2_n_0;
  wire [0:0]SR;
  wire START_RX;
  wire START_RX0;
  wire all_lanes_v_r;
  wire bad_v_r;
  wire bad_v_r0;
  wire \free_count_r[13]_i_2_n_0 ;
  wire \free_count_r[13]_i_3_n_0 ;
  wire \free_count_r[13]_i_4_n_0 ;
  wire \free_count_r[13]_i_5_n_0 ;
  wire \free_count_r[1]_i_2_n_0 ;
  wire \free_count_r[1]_i_3_n_0 ;
  wire \free_count_r[5]_i_2_n_0 ;
  wire \free_count_r[5]_i_3_n_0 ;
  wire \free_count_r[5]_i_4_n_0 ;
  wire \free_count_r[5]_i_5_n_0 ;
  wire \free_count_r[9]_i_2_n_0 ;
  wire \free_count_r[9]_i_3_n_0 ;
  wire \free_count_r[9]_i_4_n_0 ;
  wire \free_count_r[9]_i_5_n_0 ;
  wire [0:13]free_count_r_reg;
  wire \free_count_r_reg[13]_0 ;
  wire \free_count_r_reg[13]_i_1_n_0 ;
  wire \free_count_r_reg[13]_i_1_n_1 ;
  wire \free_count_r_reg[13]_i_1_n_2 ;
  wire \free_count_r_reg[13]_i_1_n_3 ;
  wire \free_count_r_reg[13]_i_1_n_4 ;
  wire \free_count_r_reg[13]_i_1_n_5 ;
  wire \free_count_r_reg[13]_i_1_n_6 ;
  wire \free_count_r_reg[13]_i_1_n_7 ;
  wire \free_count_r_reg[1]_i_1_n_3 ;
  wire \free_count_r_reg[1]_i_1_n_6 ;
  wire \free_count_r_reg[1]_i_1_n_7 ;
  wire \free_count_r_reg[5]_i_1_n_0 ;
  wire \free_count_r_reg[5]_i_1_n_1 ;
  wire \free_count_r_reg[5]_i_1_n_2 ;
  wire \free_count_r_reg[5]_i_1_n_3 ;
  wire \free_count_r_reg[5]_i_1_n_4 ;
  wire \free_count_r_reg[5]_i_1_n_5 ;
  wire \free_count_r_reg[5]_i_1_n_6 ;
  wire \free_count_r_reg[5]_i_1_n_7 ;
  wire \free_count_r_reg[9]_i_1_n_0 ;
  wire \free_count_r_reg[9]_i_1_n_1 ;
  wire \free_count_r_reg[9]_i_1_n_2 ;
  wire \free_count_r_reg[9]_i_1_n_3 ;
  wire \free_count_r_reg[9]_i_1_n_4 ;
  wire \free_count_r_reg[9]_i_1_n_5 ;
  wire \free_count_r_reg[9]_i_1_n_6 ;
  wire \free_count_r_reg[9]_i_1_n_7 ;
  wire got_first_v_r;
  wire got_first_v_r_i_1_n_0;
  wire gtreset_c;
  wire [7:0]gtrxreset_extend_r;
  wire [0:0]\gtrxreset_extend_r_reg[0]_0 ;
  wire gtrxreset_nxt;
  wire hard_err_reset_i;
  wire next_ready_c;
  wire next_verify_c;
  wire [31:31]p_2_out;
  wire ready_r;
  wire ready_r2;
  wire ready_r_reg0;
  wire reset_channel_i;
  wire reset_lanes_c;
  wire rx_channel_up;
  wire rxver_count_r0;
  wire \rxver_count_r_reg[1]_srl2_n_0 ;
  wire \rxver_count_r_reg_n_0_[2] ;
  wire \v_count_r_reg[30]_srl31_n_0 ;
  wire \v_count_r_reg_n_0_[31] ;
  wire verify_r;
  wire verify_watchdog_r0;
  wire \verify_watchdog_r_reg[14]_srl15_i_2_n_0 ;
  wire \verify_watchdog_r_reg[14]_srl15_i_3_n_0 ;
  wire \verify_watchdog_r_reg[14]_srl15_n_0 ;
  wire \verify_watchdog_r_reg_n_0_[15] ;
  wire wait_for_lane_up_r;
  wire wait_for_lane_up_r0;
  wire [3:1]\NLW_free_count_r_reg[1]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_free_count_r_reg[1]_i_1_O_UNCONNECTED ;
  wire \NLW_v_count_r_reg[30]_srl31_Q31_UNCONNECTED ;

  FDRE CHANNEL_UP_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(ready_r2),
        .Q(rx_channel_up),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    GTRXRESET_OUT_i_1
       (.I0(gtrxreset_extend_r[2]),
        .I1(gtrxreset_extend_r[3]),
        .I2(gtrxreset_extend_r[0]),
        .I3(gtrxreset_extend_r[1]),
        .I4(GTRXRESET_OUT_i_2_n_0),
        .O(GTRXRESET_OUT_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    GTRXRESET_OUT_i_2
       (.I0(gtrxreset_extend_r[5]),
        .I1(gtrxreset_extend_r[4]),
        .I2(gtrxreset_extend_r[7]),
        .I3(gtrxreset_extend_r[6]),
        .O(GTRXRESET_OUT_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    GTRXRESET_OUT_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(GTRXRESET_OUT_i_1_n_0),
        .Q(GTRXRESET_OUT),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    START_RX_i_1
       (.I0(wait_for_lane_up_r),
        .O(START_RX0));
  FDRE START_RX_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(START_RX0),
        .Q(START_RX),
        .R(\gtrxreset_extend_r_reg[0]_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    align_r_i_1
       (.I0(SR),
        .I1(hard_err_reset_i),
        .O(ready_r_reg0));
  FDRE all_lanes_v_r_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(GOT_V),
        .Q(all_lanes_v_r),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h48)) 
    bad_v_r_i_1
       (.I0(all_lanes_v_r),
        .I1(got_first_v_r),
        .I2(\v_count_r_reg_n_0_[31] ),
        .O(bad_v_r0));
  FDRE bad_v_r_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(bad_v_r0),
        .Q(bad_v_r),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[13]_i_2 
       (.I0(free_count_r_reg[10]),
        .O(\free_count_r[13]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[13]_i_3 
       (.I0(free_count_r_reg[11]),
        .O(\free_count_r[13]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[13]_i_4 
       (.I0(free_count_r_reg[12]),
        .O(\free_count_r[13]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[13]_i_5 
       (.I0(free_count_r_reg[13]),
        .O(\free_count_r[13]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[1]_i_2 
       (.I0(free_count_r_reg[0]),
        .O(\free_count_r[1]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[1]_i_3 
       (.I0(free_count_r_reg[1]),
        .O(\free_count_r[1]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[5]_i_2 
       (.I0(free_count_r_reg[2]),
        .O(\free_count_r[5]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[5]_i_3 
       (.I0(free_count_r_reg[3]),
        .O(\free_count_r[5]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[5]_i_4 
       (.I0(free_count_r_reg[4]),
        .O(\free_count_r[5]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[5]_i_5 
       (.I0(free_count_r_reg[5]),
        .O(\free_count_r[5]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[9]_i_2 
       (.I0(free_count_r_reg[6]),
        .O(\free_count_r[9]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[9]_i_3 
       (.I0(free_count_r_reg[7]),
        .O(\free_count_r[9]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[9]_i_4 
       (.I0(free_count_r_reg[8]),
        .O(\free_count_r[9]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \free_count_r[9]_i_5 
       (.I0(free_count_r_reg[9]),
        .O(\free_count_r[9]_i_5_n_0 ));
  FDSE \free_count_r_reg[0] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[1]_i_1_n_6 ),
        .Q(free_count_r_reg[0]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[10] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[13]_i_1_n_4 ),
        .Q(free_count_r_reg[10]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[11] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[13]_i_1_n_5 ),
        .Q(free_count_r_reg[11]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[12] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[13]_i_1_n_6 ),
        .Q(free_count_r_reg[12]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[13] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[13]_i_1_n_7 ),
        .Q(free_count_r_reg[13]),
        .S(wait_for_lane_up_r0));
  CARRY4 \free_count_r_reg[13]_i_1 
       (.CI(1'b0),
        .CO({\free_count_r_reg[13]_i_1_n_0 ,\free_count_r_reg[13]_i_1_n_1 ,\free_count_r_reg[13]_i_1_n_2 ,\free_count_r_reg[13]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\free_count_r_reg[13]_i_1_n_4 ,\free_count_r_reg[13]_i_1_n_5 ,\free_count_r_reg[13]_i_1_n_6 ,\free_count_r_reg[13]_i_1_n_7 }),
        .S({\free_count_r[13]_i_2_n_0 ,\free_count_r[13]_i_3_n_0 ,\free_count_r[13]_i_4_n_0 ,\free_count_r[13]_i_5_n_0 }));
  FDSE \free_count_r_reg[1] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[1]_i_1_n_7 ),
        .Q(free_count_r_reg[1]),
        .S(wait_for_lane_up_r0));
  CARRY4 \free_count_r_reg[1]_i_1 
       (.CI(\free_count_r_reg[5]_i_1_n_0 ),
        .CO({\NLW_free_count_r_reg[1]_i_1_CO_UNCONNECTED [3:1],\free_count_r_reg[1]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\NLW_free_count_r_reg[1]_i_1_O_UNCONNECTED [3:2],\free_count_r_reg[1]_i_1_n_6 ,\free_count_r_reg[1]_i_1_n_7 }),
        .S({1'b0,1'b0,\free_count_r[1]_i_2_n_0 ,\free_count_r[1]_i_3_n_0 }));
  FDSE \free_count_r_reg[2] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[5]_i_1_n_4 ),
        .Q(free_count_r_reg[2]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[3] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[5]_i_1_n_5 ),
        .Q(free_count_r_reg[3]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[4] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[5]_i_1_n_6 ),
        .Q(free_count_r_reg[4]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[5] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[5]_i_1_n_7 ),
        .Q(free_count_r_reg[5]),
        .S(wait_for_lane_up_r0));
  CARRY4 \free_count_r_reg[5]_i_1 
       (.CI(\free_count_r_reg[9]_i_1_n_0 ),
        .CO({\free_count_r_reg[5]_i_1_n_0 ,\free_count_r_reg[5]_i_1_n_1 ,\free_count_r_reg[5]_i_1_n_2 ,\free_count_r_reg[5]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\free_count_r_reg[5]_i_1_n_4 ,\free_count_r_reg[5]_i_1_n_5 ,\free_count_r_reg[5]_i_1_n_6 ,\free_count_r_reg[5]_i_1_n_7 }),
        .S({\free_count_r[5]_i_2_n_0 ,\free_count_r[5]_i_3_n_0 ,\free_count_r[5]_i_4_n_0 ,\free_count_r[5]_i_5_n_0 }));
  FDSE \free_count_r_reg[6] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[9]_i_1_n_4 ),
        .Q(free_count_r_reg[6]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[7] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[9]_i_1_n_5 ),
        .Q(free_count_r_reg[7]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[8] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[9]_i_1_n_6 ),
        .Q(free_count_r_reg[8]),
        .S(wait_for_lane_up_r0));
  FDSE \free_count_r_reg[9] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\free_count_r_reg[9]_i_1_n_7 ),
        .Q(free_count_r_reg[9]),
        .S(wait_for_lane_up_r0));
  CARRY4 \free_count_r_reg[9]_i_1 
       (.CI(\free_count_r_reg[13]_i_1_n_0 ),
        .CO({\free_count_r_reg[9]_i_1_n_0 ,\free_count_r_reg[9]_i_1_n_1 ,\free_count_r_reg[9]_i_1_n_2 ,\free_count_r_reg[9]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\free_count_r_reg[9]_i_1_n_4 ,\free_count_r_reg[9]_i_1_n_5 ,\free_count_r_reg[9]_i_1_n_6 ,\free_count_r_reg[9]_i_1_n_7 }),
        .S({\free_count_r[9]_i_2_n_0 ,\free_count_r[9]_i_3_n_0 ,\free_count_r[9]_i_4_n_0 ,\free_count_r[9]_i_5_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    got_first_v_r_i_1
       (.I0(verify_r),
        .I1(got_first_v_r),
        .I2(all_lanes_v_r),
        .O(got_first_v_r_i_1_n_0));
  FDRE got_first_v_r_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(got_first_v_r_i_1_n_0),
        .Q(got_first_v_r),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b1)) 
    gtreset_flop_0_i
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(gtreset_c),
        .Q(gtrxreset_nxt),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'hAE00)) 
    gtreset_flop_0_i_i_1
       (.I0(\verify_watchdog_r_reg_n_0_[15] ),
        .I1(bad_v_r),
        .I2(\rxver_count_r_reg_n_0_[2] ),
        .I3(verify_r),
        .O(gtreset_c));
  FDRE #(
    .INIT(1'b0)) 
    \gtrxreset_extend_r_reg[0] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(gtrxreset_extend_r[1]),
        .Q(gtrxreset_extend_r[0]),
        .R(\gtrxreset_extend_r_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gtrxreset_extend_r_reg[1] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(gtrxreset_extend_r[2]),
        .Q(gtrxreset_extend_r[1]),
        .R(\gtrxreset_extend_r_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gtrxreset_extend_r_reg[2] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(gtrxreset_extend_r[3]),
        .Q(gtrxreset_extend_r[2]),
        .R(\gtrxreset_extend_r_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gtrxreset_extend_r_reg[3] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(gtrxreset_extend_r[4]),
        .Q(gtrxreset_extend_r[3]),
        .R(\gtrxreset_extend_r_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gtrxreset_extend_r_reg[4] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(gtrxreset_extend_r[5]),
        .Q(gtrxreset_extend_r[4]),
        .R(\gtrxreset_extend_r_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gtrxreset_extend_r_reg[5] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(gtrxreset_extend_r[6]),
        .Q(gtrxreset_extend_r[5]),
        .R(\gtrxreset_extend_r_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gtrxreset_extend_r_reg[6] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(gtrxreset_extend_r[7]),
        .Q(gtrxreset_extend_r[6]),
        .R(\gtrxreset_extend_r_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gtrxreset_extend_r_reg[7] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(gtrxreset_nxt),
        .Q(gtrxreset_extend_r[7]),
        .R(\gtrxreset_extend_r_reg[0]_0 ));
  FDRE ready_r2_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(ready_r),
        .Q(ready_r2),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hF8)) 
    ready_r_i_1__0
       (.I0(\rxver_count_r_reg_n_0_[2] ),
        .I1(verify_r),
        .I2(ready_r),
        .O(next_ready_c));
  FDRE ready_r_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(next_ready_c),
        .Q(ready_r),
        .R(wait_for_lane_up_r0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  FDRE #(
    .INIT(1'b1)) 
    reset_lanes_flop_i
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(reset_lanes_c),
        .Q(SR),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFFAE)) 
    reset_lanes_flop_i_i_1
       (.I0(\gtrxreset_extend_r_reg[0]_0 ),
        .I1(reset_channel_i),
        .I2(wait_for_lane_up_r),
        .I3(gtreset_c),
        .O(reset_lanes_c));
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/rxver_count_r_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/rxver_count_r_reg[1]_srl2 " *) 
  SRL16E \rxver_count_r_reg[1]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(rxver_count_r0),
        .CLK(\free_count_r_reg[13]_0 ),
        .D(verify_r),
        .Q(\rxver_count_r_reg[1]_srl2_n_0 ));
  LUT3 #(
    .INIT(8'h8F)) 
    \rxver_count_r_reg[1]_srl2_i_1 
       (.I0(\v_count_r_reg_n_0_[31] ),
        .I1(all_lanes_v_r),
        .I2(verify_r),
        .O(rxver_count_r0));
  FDRE \rxver_count_r_reg[2] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(rxver_count_r0),
        .D(\rxver_count_r_reg[1]_srl2_n_0 ),
        .Q(\rxver_count_r_reg_n_0_[2] ),
        .R(1'b0));
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/v_count_r_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/v_count_r_reg[30]_srl31 " *) 
  SRLC32E \v_count_r_reg[30]_srl31 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b0}),
        .CE(1'b1),
        .CLK(\free_count_r_reg[13]_0 ),
        .D(p_2_out),
        .Q(\v_count_r_reg[30]_srl31_n_0 ),
        .Q31(\NLW_v_count_r_reg[30]_srl31_Q31_UNCONNECTED ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'hF444)) 
    \v_count_r_reg[30]_srl31_i_1 
       (.I0(got_first_v_r),
        .I1(all_lanes_v_r),
        .I2(verify_r),
        .I3(\v_count_r_reg_n_0_[31] ),
        .O(p_2_out));
  FDRE \v_count_r_reg[31] 
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(\v_count_r_reg[30]_srl31_n_0 ),
        .Q(\v_count_r_reg_n_0_[31] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    verify_r_i_1
       (.I0(\rxver_count_r_reg_n_0_[2] ),
        .I1(verify_r),
        .I2(wait_for_lane_up_r),
        .O(next_verify_c));
  FDRE verify_r_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(next_verify_c),
        .Q(verify_r),
        .R(wait_for_lane_up_r0));
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/verify_watchdog_r_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/verify_watchdog_r_reg[14]_srl15 " *) 
  SRL16E \verify_watchdog_r_reg[14]_srl15 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b1),
        .CE(verify_watchdog_r0),
        .CLK(\free_count_r_reg[13]_0 ),
        .D(verify_r),
        .Q(\verify_watchdog_r_reg[14]_srl15_n_0 ));
  LUT5 #(
    .INIT(32'h0200FFFF)) 
    \verify_watchdog_r_reg[14]_srl15_i_1 
       (.I0(\verify_watchdog_r_reg[14]_srl15_i_2_n_0 ),
        .I1(free_count_r_reg[12]),
        .I2(free_count_r_reg[13]),
        .I3(\verify_watchdog_r_reg[14]_srl15_i_3_n_0 ),
        .I4(verify_r),
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
       (.C(\free_count_r_reg[13]_0 ),
        .CE(verify_watchdog_r0),
        .D(\verify_watchdog_r_reg[14]_srl15_n_0 ),
        .Q(\verify_watchdog_r_reg_n_0_[15] ),
        .R(1'b0));
  FDRE wait_for_lane_up_r_reg
       (.C(\free_count_r_reg[13]_0 ),
        .CE(1'b1),
        .D(wait_for_lane_up_r0),
        .Q(wait_for_lane_up_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_RX_ERR_DETECT_SIMPLEX_V5" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_ERR_DETECT_SIMPLEX_V5
   (bucket_full_r,
    hard_err_reset_i,
    HARD_ERR,
    \soft_err_r_reg[1]_0 ,
    hard_err_flop_r_reg_0,
    SR,
    hard_err_flop_r0,
    \soft_err_r_reg[0]_0 );
  output bucket_full_r;
  output hard_err_reset_i;
  output HARD_ERR;
  output \soft_err_r_reg[1]_0 ;
  input hard_err_flop_r_reg_0;
  input [0:0]SR;
  input hard_err_flop_r0;
  input [1:0]\soft_err_r_reg[0]_0 ;

  wire \/i__n_0 ;
  wire HARD_ERR;
  wire [0:0]SR;
  wire bucket_full_r;
  wire bucket_full_r_i_1_n_0;
  wire \count_r[0]_i_2_n_0 ;
  wire \count_r[1]_i_1_n_0 ;
  wire \good_count_r[1]_i_1_n_0 ;
  wire \good_count_r_reg_n_0_[1] ;
  wire hard_err_flop_r0;
  wire hard_err_flop_r_reg_0;
  wire hard_err_reset_i;
  wire [4:0]p_0_in;
  wire [1:0]\soft_err_r_reg[0]_0 ;
  wire \soft_err_r_reg[1]_0 ;

  LUT4 #(
    .INIT(16'h0004)) 
    \/i_ 
       (.I0(p_0_in[2]),
        .I1(\good_count_r_reg_n_0_[1] ),
        .I2(p_0_in[3]),
        .I3(p_0_in[4]),
        .O(\/i__n_0 ));
  FDRE HARD_ERR_reg
       (.C(hard_err_flop_r_reg_0),
        .CE(1'b1),
        .D(hard_err_reset_i),
        .Q(HARD_ERR),
        .R(SR));
  LUT2 #(
    .INIT(4'h8)) 
    bucket_full_r_i_1
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .O(bucket_full_r_i_1_n_0));
  FDRE bucket_full_r_reg
       (.C(hard_err_flop_r_reg_0),
        .CE(1'b1),
        .D(bucket_full_r_i_1_n_0),
        .Q(bucket_full_r),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'hFFEFEE88)) 
    \count_r[0]_i_2 
       (.I0(p_0_in[0]),
        .I1(p_0_in[3]),
        .I2(p_0_in[2]),
        .I3(p_0_in[4]),
        .I4(p_0_in[1]),
        .O(\count_r[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'hEEABBBEC)) 
    \count_r[1]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[3]),
        .I2(p_0_in[2]),
        .I3(p_0_in[4]),
        .I4(p_0_in[0]),
        .O(\count_r[1]_i_1_n_0 ));
  FDRE \count_r_reg[0] 
       (.C(hard_err_flop_r_reg_0),
        .CE(1'b1),
        .D(\count_r[0]_i_2_n_0 ),
        .Q(p_0_in[1]),
        .R(SR));
  FDRE \count_r_reg[1] 
       (.C(hard_err_flop_r_reg_0),
        .CE(1'b1),
        .D(\count_r[1]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h1011)) 
    \good_count_r[1]_i_1 
       (.I0(p_0_in[3]),
        .I1(p_0_in[4]),
        .I2(p_0_in[2]),
        .I3(\good_count_r_reg_n_0_[1] ),
        .O(\good_count_r[1]_i_1_n_0 ));
  FDRE \good_count_r_reg[0] 
       (.C(hard_err_flop_r_reg_0),
        .CE(1'b1),
        .D(\/i__n_0 ),
        .Q(p_0_in[2]),
        .R(SR));
  FDSE \good_count_r_reg[1] 
       (.C(hard_err_flop_r_reg_0),
        .CE(1'b1),
        .D(\good_count_r[1]_i_1_n_0 ),
        .Q(\good_count_r_reg_n_0_[1] ),
        .S(SR));
  FDRE hard_err_flop_r_reg
       (.C(hard_err_flop_r_reg_0),
        .CE(1'b1),
        .D(hard_err_flop_r0),
        .Q(hard_err_reset_i),
        .R(SR));
  FDRE \soft_err_r_reg[0] 
       (.C(hard_err_flop_r_reg_0),
        .CE(1'b1),
        .D(\soft_err_r_reg[0]_0 [1]),
        .Q(p_0_in[4]),
        .R(SR));
  FDRE \soft_err_r_reg[1] 
       (.C(hard_err_flop_r_reg_0),
        .CE(1'b1),
        .D(\soft_err_r_reg[0]_0 [0]),
        .Q(p_0_in[3]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    soft_err_r_reg_srl3_i_1
       (.I0(p_0_in[3]),
        .I1(p_0_in[4]),
        .O(\soft_err_r_reg[1]_0 ));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX
   (SR,
    GTRXRESET_OUT,
    rx_channel_up,
    rx_hard_err,
    rx_aligned,
    reset_channel_i,
    START_RX,
    soft_err,
    ready_r_reg0,
    \free_count_r_reg[13] ,
    GOT_V,
    wait_for_lane_up_r0,
    HARD_ERR,
    rx_lane_up,
    \gtrxreset_extend_r_reg[0] ,
    CHANNEL_SOFT_ERR_reg,
    power_down,
    hard_err_reset_i);
  output [0:0]SR;
  output GTRXRESET_OUT;
  output rx_channel_up;
  output rx_hard_err;
  output rx_aligned;
  output reset_channel_i;
  output START_RX;
  output soft_err;
  output ready_r_reg0;
  input \free_count_r_reg[13] ;
  input GOT_V;
  input wait_for_lane_up_r0;
  input HARD_ERR;
  input rx_lane_up;
  input [0:0]\gtrxreset_extend_r_reg[0] ;
  input CHANNEL_SOFT_ERR_reg;
  input power_down;
  input hard_err_reset_i;

  wire CHANNEL_SOFT_ERR_reg;
  wire GOT_V;
  wire GTRXRESET_OUT;
  wire HARD_ERR;
  wire [0:0]SR;
  wire START_RX;
  wire \free_count_r_reg[13] ;
  wire [0:0]\gtrxreset_extend_r_reg[0] ;
  wire hard_err_reset_i;
  wire power_down;
  wire ready_r_reg0;
  wire reset_channel_i;
  wire rx_aligned;
  wire rx_channel_up;
  wire rx_hard_err;
  wire rx_lane_up;
  wire soft_err;
  wire wait_for_lane_up_r0;

  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX rx_channel_err_detect_simplex_i
       (.CHANNEL_SOFT_ERR_reg_0(CHANNEL_SOFT_ERR_reg),
        .HARD_ERR(HARD_ERR),
        .RESET_CHANNEL_reg_0(\free_count_r_reg[13] ),
        .power_down(power_down),
        .reset_channel_i(reset_channel_i),
        .rx_aligned(rx_aligned),
        .rx_hard_err(rx_hard_err),
        .rx_lane_up(rx_lane_up),
        .soft_err(soft_err));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX rx_channel_init_sm_simplex_i
       (.GOT_V(GOT_V),
        .GTRXRESET_OUT(GTRXRESET_OUT),
        .SR(SR),
        .START_RX(START_RX),
        .\free_count_r_reg[13]_0 (\free_count_r_reg[13] ),
        .\gtrxreset_extend_r_reg[0]_0 (\gtrxreset_extend_r_reg[0] ),
        .hard_err_reset_i(hard_err_reset_i),
        .ready_r_reg0(ready_r_reg0),
        .reset_channel_i(reset_channel_i),
        .rx_channel_up(rx_channel_up),
        .wait_for_lane_up_r0(wait_for_lane_up_r0));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_RX_LANE_INIT_SM_SIMPLEX" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LANE_INIT_SM_SIMPLEX
   (rx_lane_up,
    ready_r,
    align_r_reg_0,
    rx_polarity_i,
    SR,
    lane_up_flop_i_0,
    \counter1_r_reg[0]_0 ,
    ready_r_reg0,
    counter2_r0,
    RX_NEG,
    rx_realign_i,
    RXDISPERR,
    RXNOTINTABLE,
    D);
  output rx_lane_up;
  output ready_r;
  output align_r_reg_0;
  output rx_polarity_i;
  output [0:0]SR;
  input lane_up_flop_i_0;
  input \counter1_r_reg[0]_0 ;
  input ready_r_reg0;
  input counter2_r0;
  input RX_NEG;
  input rx_realign_i;
  input [1:0]RXDISPERR;
  input [1:0]RXNOTINTABLE;
  input [1:0]D;

  wire [1:0]D;
  wire ENABLE_ERR_DETECT;
  wire [1:0]RXDISPERR;
  wire [1:0]RXNOTINTABLE;
  wire [1:0]RX_CHAR_IS_COMMA_R;
  wire RX_NEG;
  wire [0:0]SR;
  wire align_r_reg_0;
  wire begin_r;
  wire comma_over_two_cycles_r;
  wire comma_over_two_cycles_r0;
  wire count_128d_done_r;
  wire count_32d_done_r;
  wire count_8d_done_r;
  wire counter1_r0;
  wire \counter1_r[0]_i_4_n_0 ;
  wire \counter1_r_reg[0]_0 ;
  wire \counter1_r_reg_n_0_[1] ;
  wire \counter1_r_reg_n_0_[3] ;
  wire \counter1_r_reg_n_0_[5] ;
  wire \counter1_r_reg_n_0_[6] ;
  wire \counter1_r_reg_n_0_[7] ;
  wire counter2_r0;
  wire \counter2_r_reg[14]_srl15_n_0 ;
  wire \counter2_r_reg_n_0_[15] ;
  wire gtp_rx_reset_i;
  wire inc_count_c;
  wire inc_count_c1;
  wire lane_up_flop_i_0;
  wire next_align_c;
  wire next_begin_c;
  wire next_polarity_c;
  wire next_ready_c;
  wire next_realign_c;
  wire next_rst_c;
  wire [7:0]p_0_in__1;
  wire polarity_r;
  wire prev_char_was_comma_r;
  wire ready_r;
  wire ready_r_reg0;
  wire realign_r;
  wire reset_count_r;
  wire reset_count_r0;
  wire reset_count_r_i_2_n_0;
  wire rx_lane_up;
  wire rx_polarity_i;
  wire rx_polarity_r_i_1_n_0;
  wire rx_realign_i;

  FDRE ENABLE_ERR_DETECT_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(ready_r),
        .Q(ENABLE_ERR_DETECT),
        .R(1'b0));
  FDRE \RX_CHAR_IS_COMMA_R_reg[0] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(D[0]),
        .Q(RX_CHAR_IS_COMMA_R[0]),
        .R(1'b0));
  FDRE \RX_CHAR_IS_COMMA_R_reg[1] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(D[1]),
        .Q(RX_CHAR_IS_COMMA_R[1]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h8F88)) 
    align_r_i_2
       (.I0(count_8d_done_r),
        .I1(gtp_rx_reset_i),
        .I2(count_128d_done_r),
        .I3(align_r_reg_0),
        .O(next_align_c));
  FDRE align_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(next_align_c),
        .Q(align_r_reg_0),
        .R(ready_r_reg0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    begin_r_i_1
       (.I0(realign_r),
        .I1(rx_realign_i),
        .I2(\counter2_r_reg_n_0_[15] ),
        .I3(ready_r),
        .I4(polarity_r),
        .I5(RX_NEG),
        .O(next_begin_c));
  FDSE begin_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(next_begin_c),
        .Q(begin_r),
        .S(ready_r_reg0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h56FF)) 
    comma_over_two_cycles_r_i_1
       (.I0(prev_char_was_comma_r),
        .I1(RX_CHAR_IS_COMMA_R[0]),
        .I2(RX_CHAR_IS_COMMA_R[1]),
        .I3(align_r_reg_0),
        .O(comma_over_two_cycles_r0));
  FDRE comma_over_two_cycles_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(comma_over_two_cycles_r0),
        .Q(comma_over_two_cycles_r),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \count_r[0]_i_1 
       (.I0(ENABLE_ERR_DETECT),
        .O(SR));
  LUT2 #(
    .INIT(4'hE)) 
    \counter1_r[0]_i_1 
       (.I0(reset_count_r),
        .I1(ready_r),
        .O(counter1_r0));
  LUT3 #(
    .INIT(8'hEF)) 
    \counter1_r[0]_i_2 
       (.I0(RX_CHAR_IS_COMMA_R[1]),
        .I1(RX_CHAR_IS_COMMA_R[0]),
        .I2(align_r_reg_0),
        .O(inc_count_c));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \counter1_r[0]_i_3 
       (.I0(\counter1_r_reg_n_0_[1] ),
        .I1(\counter1_r[0]_i_4_n_0 ),
        .I2(count_128d_done_r),
        .O(p_0_in__1[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \counter1_r[0]_i_4 
       (.I0(\counter1_r_reg_n_0_[3] ),
        .I1(\counter1_r_reg_n_0_[5] ),
        .I2(\counter1_r_reg_n_0_[7] ),
        .I3(\counter1_r_reg_n_0_[6] ),
        .I4(count_8d_done_r),
        .I5(count_32d_done_r),
        .O(\counter1_r[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \counter1_r[1]_i_1 
       (.I0(\counter1_r[0]_i_4_n_0 ),
        .I1(\counter1_r_reg_n_0_[1] ),
        .O(p_0_in__1[6]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter1_r[2]_i_1 
       (.I0(\counter1_r_reg_n_0_[3] ),
        .I1(\counter1_r_reg_n_0_[5] ),
        .I2(\counter1_r_reg_n_0_[7] ),
        .I3(\counter1_r_reg_n_0_[6] ),
        .I4(count_8d_done_r),
        .I5(count_32d_done_r),
        .O(p_0_in__1[5]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \counter1_r[3]_i_1 
       (.I0(count_8d_done_r),
        .I1(\counter1_r_reg_n_0_[6] ),
        .I2(\counter1_r_reg_n_0_[7] ),
        .I3(\counter1_r_reg_n_0_[5] ),
        .I4(\counter1_r_reg_n_0_[3] ),
        .O(p_0_in__1[4]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter1_r[4]_i_1 
       (.I0(\counter1_r_reg_n_0_[5] ),
        .I1(\counter1_r_reg_n_0_[7] ),
        .I2(\counter1_r_reg_n_0_[6] ),
        .I3(count_8d_done_r),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter1_r[5]_i_1 
       (.I0(\counter1_r_reg_n_0_[6] ),
        .I1(\counter1_r_reg_n_0_[7] ),
        .I2(\counter1_r_reg_n_0_[5] ),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter1_r[6]_i_1 
       (.I0(\counter1_r_reg_n_0_[7] ),
        .I1(\counter1_r_reg_n_0_[6] ),
        .O(p_0_in__1[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \counter1_r[7]_i_1 
       (.I0(\counter1_r_reg_n_0_[7] ),
        .O(p_0_in__1[0]));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[0] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(inc_count_c),
        .D(p_0_in__1[7]),
        .Q(count_128d_done_r),
        .R(counter1_r0));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[1] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(inc_count_c),
        .D(p_0_in__1[6]),
        .Q(\counter1_r_reg_n_0_[1] ),
        .R(counter1_r0));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[2] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(inc_count_c),
        .D(p_0_in__1[5]),
        .Q(count_32d_done_r),
        .R(counter1_r0));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[3] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(inc_count_c),
        .D(p_0_in__1[4]),
        .Q(\counter1_r_reg_n_0_[3] ),
        .R(counter1_r0));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[4] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(inc_count_c),
        .D(p_0_in__1[3]),
        .Q(count_8d_done_r),
        .R(counter1_r0));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[5] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(inc_count_c),
        .D(p_0_in__1[2]),
        .Q(\counter1_r_reg_n_0_[5] ),
        .R(counter1_r0));
  FDRE #(
    .INIT(1'b0)) 
    \counter1_r_reg[6] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(inc_count_c),
        .D(p_0_in__1[1]),
        .Q(\counter1_r_reg_n_0_[6] ),
        .R(counter1_r0));
  FDSE #(
    .INIT(1'b1)) 
    \counter1_r_reg[7] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(inc_count_c),
        .D(p_0_in__1[0]),
        .Q(\counter1_r_reg_n_0_[7] ),
        .S(counter1_r0));
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_aurora_lane_simplex_v5_0_i/rx_lane_init_sm_simplex_i/counter2_r_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_aurora_lane_simplex_v5_0_i/rx_lane_init_sm_simplex_i/counter2_r_reg[14]_srl15 " *) 
  SRL16E \counter2_r_reg[14]_srl15 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b1),
        .CE(counter2_r0),
        .CLK(\counter1_r_reg[0]_0 ),
        .D(ready_r),
        .Q(\counter2_r_reg[14]_srl15_n_0 ));
  FDRE \counter2_r_reg[15] 
       (.C(\counter1_r_reg[0]_0 ),
        .CE(counter2_r0),
        .D(\counter2_r_reg[14]_srl15_n_0 ),
        .Q(\counter2_r_reg_n_0_[15] ),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    lane_up_flop_i
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(ready_r),
        .Q(rx_lane_up),
        .R(lane_up_flop_i_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h40)) 
    polarity_r_i_1
       (.I0(rx_realign_i),
        .I1(realign_r),
        .I2(count_32d_done_r),
        .O(next_polarity_c));
  FDRE polarity_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(next_polarity_c),
        .Q(polarity_r),
        .R(ready_r_reg0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'hE)) 
    prev_char_was_comma_r_i_1
       (.I0(RX_CHAR_IS_COMMA_R[0]),
        .I1(RX_CHAR_IS_COMMA_R[1]),
        .O(inc_count_c1));
  FDRE prev_char_was_comma_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(inc_count_c1),
        .Q(prev_char_was_comma_r),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h4F44)) 
    ready_r_i_1
       (.I0(RX_NEG),
        .I1(polarity_r),
        .I2(\counter2_r_reg_n_0_[15] ),
        .I3(ready_r),
        .O(next_ready_c));
  FDRE ready_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(next_ready_c),
        .Q(ready_r),
        .R(ready_r_reg0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h88888F88)) 
    realign_r_i_1
       (.I0(count_128d_done_r),
        .I1(align_r_reg_0),
        .I2(count_32d_done_r),
        .I3(realign_r),
        .I4(rx_realign_i),
        .O(next_realign_c));
  FDRE realign_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(next_realign_c),
        .Q(realign_r),
        .R(ready_r_reg0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF3331)) 
    reset_count_r_i_1
       (.I0(comma_over_two_cycles_r),
        .I1(gtp_rx_reset_i),
        .I2(RXDISPERR[1]),
        .I3(RXNOTINTABLE[1]),
        .I4(reset_count_r_i_2_n_0),
        .I5(lane_up_flop_i_0),
        .O(reset_count_r0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h00FFAAFC)) 
    reset_count_r_i_2
       (.I0(count_8d_done_r),
        .I1(RXNOTINTABLE[0]),
        .I2(RXDISPERR[0]),
        .I3(gtp_rx_reset_i),
        .I4(begin_r),
        .O(reset_count_r_i_2_n_0));
  FDRE reset_count_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(reset_count_r0),
        .Q(reset_count_r),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    rst_r_i_1
       (.I0(count_8d_done_r),
        .I1(gtp_rx_reset_i),
        .I2(begin_r),
        .O(next_rst_c));
  FDRE rst_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(next_rst_c),
        .Q(gtp_rx_reset_i),
        .R(ready_r_reg0));
  LUT3 #(
    .INIT(8'h78)) 
    rx_polarity_r_i_1
       (.I0(polarity_r),
        .I1(RX_NEG),
        .I2(rx_polarity_i),
        .O(rx_polarity_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_polarity_r_reg
       (.C(\counter1_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_polarity_r_i_1_n_0),
        .Q(rx_polarity_i),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_RX_LL" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL
   (frame_err,
    m_axi_rx_tvalid,
    in_frame_r,
    storage_v_r,
    m_axi_rx_tdata,
    m_axi_rx_tkeep,
    m_axi_rx_tlast,
    RX_EOF_N_reg,
    storage_v_r_reg,
    RX_PAD,
    RX_SRC_RDY_N_reg_inv,
    in_frame_r_reg,
    rx_scp_i,
    rx_ecp_i,
    rx_pe_data_v_i,
    D,
    START_RX);
  output frame_err;
  output m_axi_rx_tvalid;
  output in_frame_r;
  output storage_v_r;
  output [0:15]m_axi_rx_tdata;
  output [0:0]m_axi_rx_tkeep;
  output m_axi_rx_tlast;
  input RX_EOF_N_reg;
  input storage_v_r_reg;
  input RX_PAD;
  input RX_SRC_RDY_N_reg_inv;
  input in_frame_r_reg;
  input rx_scp_i;
  input rx_ecp_i;
  input rx_pe_data_v_i;
  input [15:0]D;
  input START_RX;

  wire [15:0]D;
  wire RX_EOF_N_reg;
  wire RX_PAD;
  wire RX_SRC_RDY_N_reg_inv;
  wire START_RX;
  wire frame_err;
  wire in_frame_r;
  wire in_frame_r_reg;
  wire [0:15]m_axi_rx_tdata;
  wire [0:0]m_axi_rx_tkeep;
  wire m_axi_rx_tlast;
  wire m_axi_rx_tvalid;
  wire rx_ecp_i;
  wire rx_pe_data_v_i;
  wire rx_scp_i;
  wire storage_v_r;
  wire storage_v_r_reg;

  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL_PDU_DATAPATH rx_ll_pdu_datapath_i
       (.D(D),
        .RX_EOF_N_reg_0(RX_EOF_N_reg),
        .RX_PAD(RX_PAD),
        .RX_SRC_RDY_N_reg_inv_0(RX_SRC_RDY_N_reg_inv),
        .START_RX(START_RX),
        .frame_err(frame_err),
        .in_frame_r_reg_0(in_frame_r),
        .in_frame_r_reg_1(in_frame_r_reg),
        .m_axi_rx_tdata(m_axi_rx_tdata),
        .m_axi_rx_tkeep(m_axi_rx_tkeep),
        .m_axi_rx_tlast(m_axi_rx_tlast),
        .m_axi_rx_tvalid(m_axi_rx_tvalid),
        .rx_ecp_i(rx_ecp_i),
        .rx_pe_data_v_i(rx_pe_data_v_i),
        .rx_scp_i(rx_scp_i),
        .storage_v_r(storage_v_r),
        .storage_v_r_reg_0(storage_v_r_reg));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_RX_LL_PDU_DATAPATH" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL_PDU_DATAPATH
   (frame_err,
    m_axi_rx_tvalid,
    in_frame_r_reg_0,
    storage_v_r,
    m_axi_rx_tdata,
    m_axi_rx_tkeep,
    m_axi_rx_tlast,
    RX_EOF_N_reg_0,
    storage_v_r_reg_0,
    RX_PAD,
    RX_SRC_RDY_N_reg_inv_0,
    in_frame_r_reg_1,
    rx_scp_i,
    rx_ecp_i,
    rx_pe_data_v_i,
    D,
    START_RX);
  output frame_err;
  output m_axi_rx_tvalid;
  output in_frame_r_reg_0;
  output storage_v_r;
  output [0:15]m_axi_rx_tdata;
  output [0:0]m_axi_rx_tkeep;
  output m_axi_rx_tlast;
  input RX_EOF_N_reg_0;
  input storage_v_r_reg_0;
  input RX_PAD;
  input RX_SRC_RDY_N_reg_inv_0;
  input in_frame_r_reg_1;
  input rx_scp_i;
  input rx_ecp_i;
  input rx_pe_data_v_i;
  input [15:0]D;
  input START_RX;

  wire [15:0]D;
  wire FRAME_ERR0__0;
  wire RX_EOF_N_reg_0;
  wire RX_PAD;
  wire \RX_REM[0]_i_1_n_0 ;
  wire RX_SRC_RDY_N_reg_inv_0;
  wire START_RX;
  wire frame_err;
  wire in_frame_r_reg_0;
  wire in_frame_r_reg_1;
  wire [0:15]m_axi_rx_tdata;
  wire [0:0]m_axi_rx_tkeep;
  wire m_axi_rx_tlast;
  wire m_axi_rx_tvalid;
  wire pad_in_storage_r;
  wire rx_ecp_i;
  wire rx_eof;
  wire rx_pe_data_v_i;
  wire rx_rem_int;
  wire rx_scp_i;
  wire storage_ce_c;
  wire [0:15]storage_r;
  wire storage_v_r;
  wire storage_v_r_i_1_n_0;
  wire storage_v_r_reg_0;

  LUT4 #(
    .INIT(16'hACEC)) 
    FRAME_ERR0
       (.I0(rx_scp_i),
        .I1(rx_ecp_i),
        .I2(in_frame_r_reg_0),
        .I3(storage_v_r),
        .O(FRAME_ERR0__0));
  FDRE FRAME_ERR_reg
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(FRAME_ERR0__0),
        .Q(frame_err),
        .R(1'b0));
  FDRE \RX_D_reg[0] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[0]),
        .Q(m_axi_rx_tdata[0]),
        .R(1'b0));
  FDRE \RX_D_reg[10] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[10]),
        .Q(m_axi_rx_tdata[10]),
        .R(1'b0));
  FDRE \RX_D_reg[11] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[11]),
        .Q(m_axi_rx_tdata[11]),
        .R(1'b0));
  FDRE \RX_D_reg[12] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[12]),
        .Q(m_axi_rx_tdata[12]),
        .R(1'b0));
  FDRE \RX_D_reg[13] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[13]),
        .Q(m_axi_rx_tdata[13]),
        .R(1'b0));
  FDRE \RX_D_reg[14] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[14]),
        .Q(m_axi_rx_tdata[14]),
        .R(1'b0));
  FDRE \RX_D_reg[15] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[15]),
        .Q(m_axi_rx_tdata[15]),
        .R(1'b0));
  FDRE \RX_D_reg[1] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[1]),
        .Q(m_axi_rx_tdata[1]),
        .R(1'b0));
  FDRE \RX_D_reg[2] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[2]),
        .Q(m_axi_rx_tdata[2]),
        .R(1'b0));
  FDRE \RX_D_reg[3] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[3]),
        .Q(m_axi_rx_tdata[3]),
        .R(1'b0));
  FDRE \RX_D_reg[4] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[4]),
        .Q(m_axi_rx_tdata[4]),
        .R(1'b0));
  FDRE \RX_D_reg[5] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[5]),
        .Q(m_axi_rx_tdata[5]),
        .R(1'b0));
  FDRE \RX_D_reg[6] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[6]),
        .Q(m_axi_rx_tdata[6]),
        .R(1'b0));
  FDRE \RX_D_reg[7] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[7]),
        .Q(m_axi_rx_tdata[7]),
        .R(1'b0));
  FDRE \RX_D_reg[8] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[8]),
        .Q(m_axi_rx_tdata[8]),
        .R(1'b0));
  FDRE \RX_D_reg[9] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_r[9]),
        .Q(m_axi_rx_tdata[9]),
        .R(1'b0));
  FDRE RX_EOF_N_reg
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(RX_EOF_N_reg_0),
        .Q(rx_eof),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \RX_REM[0]_i_1 
       (.I0(pad_in_storage_r),
        .O(\RX_REM[0]_i_1_n_0 ));
  FDRE \RX_REM_reg[0] 
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(\RX_REM[0]_i_1_n_0 ),
        .Q(rx_rem_int),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    RX_SRC_RDY_N_reg_inv
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(RX_SRC_RDY_N_reg_inv_0),
        .Q(m_axi_rx_tvalid),
        .R(1'b0));
  FDRE in_frame_r_reg
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(in_frame_r_reg_1),
        .Q(in_frame_r_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \m_axi_rx_tkeep[1]_INST_0 
       (.I0(rx_rem_int),
        .I1(rx_eof),
        .O(m_axi_rx_tkeep));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT1 #(
    .INIT(2'h1)) 
    m_axi_rx_tlast_INST_0
       (.I0(rx_eof),
        .O(m_axi_rx_tlast));
  LUT2 #(
    .INIT(4'h8)) 
    pad_in_storage_r_i_1
       (.I0(in_frame_r_reg_0),
        .I1(rx_pe_data_v_i),
        .O(storage_ce_c));
  FDRE pad_in_storage_r_reg
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(RX_PAD),
        .Q(pad_in_storage_r),
        .R(1'b0));
  FDRE \storage_r_reg[0] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[15]),
        .Q(storage_r[0]),
        .R(1'b0));
  FDRE \storage_r_reg[10] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[5]),
        .Q(storage_r[10]),
        .R(1'b0));
  FDRE \storage_r_reg[11] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[4]),
        .Q(storage_r[11]),
        .R(1'b0));
  FDRE \storage_r_reg[12] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[3]),
        .Q(storage_r[12]),
        .R(1'b0));
  FDRE \storage_r_reg[13] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[2]),
        .Q(storage_r[13]),
        .R(1'b0));
  FDRE \storage_r_reg[14] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[1]),
        .Q(storage_r[14]),
        .R(1'b0));
  FDRE \storage_r_reg[15] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[0]),
        .Q(storage_r[15]),
        .R(1'b0));
  FDRE \storage_r_reg[1] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[14]),
        .Q(storage_r[1]),
        .R(1'b0));
  FDRE \storage_r_reg[2] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[13]),
        .Q(storage_r[2]),
        .R(1'b0));
  FDRE \storage_r_reg[3] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[12]),
        .Q(storage_r[3]),
        .R(1'b0));
  FDRE \storage_r_reg[4] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[11]),
        .Q(storage_r[4]),
        .R(1'b0));
  FDRE \storage_r_reg[5] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[10]),
        .Q(storage_r[5]),
        .R(1'b0));
  FDRE \storage_r_reg[6] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[9]),
        .Q(storage_r[6]),
        .R(1'b0));
  FDRE \storage_r_reg[7] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[8]),
        .Q(storage_r[7]),
        .R(1'b0));
  FDRE \storage_r_reg[8] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[7]),
        .Q(storage_r[8]),
        .R(1'b0));
  FDRE \storage_r_reg[9] 
       (.C(storage_v_r_reg_0),
        .CE(storage_ce_c),
        .D(D[6]),
        .Q(storage_r[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h88F80000)) 
    storage_v_r_i_1
       (.I0(in_frame_r_reg_0),
        .I1(rx_pe_data_v_i),
        .I2(storage_v_r),
        .I3(rx_ecp_i),
        .I4(START_RX),
        .O(storage_v_r_i_1_n_0));
  FDRE storage_v_r_reg
       (.C(storage_v_r_reg_0),
        .CE(1'b1),
        .D(storage_v_r_i_1_n_0),
        .Q(storage_v_r),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC
   (gt_reset_out,
    in0,
    init_clk_in,
    CLK,
    D,
    \debounce_gt_rst_r_reg[0]_0 );
  output gt_reset_out;
  output in0;
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
  wire in0;
  wire init_clk_in;
  wire [0:3]reset_debounce_r;
  wire reset_debounce_r20_n_0;

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
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0 gt_rst_r_cdc_sync
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
        .Q(in0),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_SYM_DEC" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SYM_DEC
   (RX_NEG,
    rx_scp_i,
    RX_ECP_reg_0,
    D,
    GOT_V,
    RX_PAD,
    left_aligned_r_reg_0,
    rx_pe_data_v_i,
    in_frame_r_reg,
    RX_PE_DATA_V_reg_0,
    RX_ECP_reg_1,
    counter2_r0,
    Q,
    \rx_pe_data_r_reg[0]_0 ,
    \word_aligned_control_bits_r_reg[1]_0 ,
    \word_aligned_control_bits_r_reg[0]_0 ,
    first_v_received_r_reg_0,
    in_frame_r,
    START_RX,
    storage_v_r,
    left_aligned_r_reg_1,
    ena_comma_align_i,
    ready_r,
    left_aligned_r_reg_2,
    rx_channel_up,
    \word_aligned_data_r_reg[8]_0 ,
    \word_aligned_data_r_reg[0]_0 );
  output RX_NEG;
  output rx_scp_i;
  output RX_ECP_reg_0;
  output [0:0]D;
  output GOT_V;
  output RX_PAD;
  output left_aligned_r_reg_0;
  output rx_pe_data_v_i;
  output in_frame_r_reg;
  output RX_PE_DATA_V_reg_0;
  output RX_ECP_reg_1;
  output counter2_r0;
  output [15:0]Q;
  input \rx_pe_data_r_reg[0]_0 ;
  input \word_aligned_control_bits_r_reg[1]_0 ;
  input \word_aligned_control_bits_r_reg[0]_0 ;
  input first_v_received_r_reg_0;
  input in_frame_r;
  input START_RX;
  input storage_v_r;
  input [0:0]left_aligned_r_reg_1;
  input ena_comma_align_i;
  input ready_r;
  input left_aligned_r_reg_2;
  input rx_channel_up;
  input [7:0]\word_aligned_data_r_reg[8]_0 ;
  input [7:0]\word_aligned_data_r_reg[0]_0 ;

  wire [0:0]D;
  wire GOT_V;
  wire GOT_V_i_2_n_0;
  wire [15:0]Q;
  wire RX_CC0;
  wire RX_ECP_i_1_n_0;
  wire RX_ECP_reg_0;
  wire RX_ECP_reg_1;
  wire RX_NEG;
  wire RX_NEG0;
  wire RX_PAD;
  wire RX_PAD0;
  wire RX_PE_DATA_V_i_1_n_0;
  wire RX_PE_DATA_V_reg_0;
  wire RX_SCP_i_1_n_0;
  wire RX_SP_i_2_n_0;
  wire START_RX;
  wire counter2_r0;
  wire ena_comma_align_i;
  wire first_v_received_r;
  wire first_v_received_r_i_1_n_0;
  wire first_v_received_r_reg_0;
  wire got_v_c;
  wire in_frame_r;
  wire in_frame_r_reg;
  wire left_aligned_r_i_1_n_0;
  wire left_aligned_r_reg_0;
  wire [0:0]left_aligned_r_reg_1;
  wire left_aligned_r_reg_2;
  wire [3:0]p_0_in;
  wire p_2_in;
  wire [3:2]p_5_out;
  wire prev_beat_sp_d_r05_out;
  wire prev_beat_sp_d_r08_out;
  wire prev_beat_sp_d_r0__0;
  wire prev_beat_sp_d_r16_in;
  wire prev_beat_sp_d_r1__0;
  wire prev_beat_sp_r;
  wire prev_beat_sp_r0;
  wire [0:0]prev_beat_v_d_r;
  wire prev_beat_v_d_r0__0;
  wire prev_beat_v_d_r0_n_0;
  wire prev_beat_v_r;
  wire prev_beat_v_r0;
  wire ready_r;
  wire [1:3]rx_cc_r;
  wire rx_cc_r0__0;
  wire rx_cc_r0_n_0;
  wire rx_channel_up;
  wire [0:3]rx_ecp_d_r;
  wire rx_ecp_d_r0__0;
  wire \rx_ecp_d_r0_inferred__0/i__n_0 ;
  wire rx_ecp_d_r0_n_0;
  wire [0:1]rx_pad_d_r;
  wire rx_pad_d_r0__0;
  wire rx_pad_d_r0_n_0;
  wire \rx_pe_control_r_reg_n_0_[1] ;
  wire [0:15]rx_pe_data_r;
  wire \rx_pe_data_r_reg[0]_0 ;
  wire rx_pe_data_v_i;
  wire [0:3]rx_scp_d_r;
  wire rx_scp_d_r0__0;
  wire \rx_scp_d_r0_inferred__0/i__n_0 ;
  wire \rx_scp_d_r0_inferred__1/i__n_0 ;
  wire \rx_scp_d_r0_inferred__2/i__n_0 ;
  wire rx_scp_i;
  wire rx_sp_c;
  wire [0:3]rx_sp_d_r;
  wire rx_sp_i;
  wire [0:1]rx_sp_neg_d_r;
  wire [0:1]rx_spa_neg_d_r;
  wire rx_spa_neg_d_r0_n_0;
  wire \rx_spa_neg_d_r[0]_i_1_n_0 ;
  wire [0:3]rx_v_d_r;
  wire rx_v_d_r0__0;
  wire rx_v_d_r0_n_0;
  wire storage_v_r;
  wire [0:1]word_aligned_control_bits_r;
  wire \word_aligned_control_bits_r_reg[0]_0 ;
  wire \word_aligned_control_bits_r_reg[1]_0 ;
  wire [7:0]\word_aligned_data_r_reg[0]_0 ;
  wire [7:0]\word_aligned_data_r_reg[8]_0 ;
  wire \word_aligned_data_r_reg_n_0_[0] ;
  wire \word_aligned_data_r_reg_n_0_[12] ;
  wire \word_aligned_data_r_reg_n_0_[13] ;
  wire \word_aligned_data_r_reg_n_0_[14] ;
  wire \word_aligned_data_r_reg_n_0_[15] ;
  wire \word_aligned_data_r_reg_n_0_[1] ;
  wire \word_aligned_data_r_reg_n_0_[2] ;
  wire \word_aligned_data_r_reg_n_0_[3] ;
  wire \word_aligned_data_r_reg_n_0_[4] ;
  wire \word_aligned_data_r_reg_n_0_[5] ;
  wire \word_aligned_data_r_reg_n_0_[6] ;
  wire \word_aligned_data_r_reg_n_0_[7] ;

  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h01)) 
    GOT_V_i_1
       (.I0(p_2_in),
        .I1(\rx_pe_control_r_reg_n_0_[1] ),
        .I2(GOT_V_i_2_n_0),
        .O(got_v_c));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    GOT_V_i_2
       (.I0(prev_beat_v_r),
        .I1(rx_v_d_r[3]),
        .I2(rx_v_d_r[2]),
        .I3(rx_v_d_r[0]),
        .I4(rx_v_d_r[1]),
        .O(GOT_V_i_2_n_0));
  FDRE GOT_V_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(got_v_c),
        .Q(GOT_V),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    RX_CC_i_1
       (.I0(rx_ecp_d_r[0]),
        .I1(rx_ecp_d_r[2]),
        .I2(rx_cc_r[3]),
        .I3(rx_cc_r[1]),
        .I4(p_2_in),
        .I5(\rx_pe_control_r_reg_n_0_[1] ),
        .O(RX_CC0));
  FDRE RX_CC_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(RX_CC0),
        .Q(D),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    RX_ECP_i_1
       (.I0(rx_ecp_d_r[0]),
        .I1(rx_ecp_d_r[2]),
        .I2(rx_ecp_d_r[3]),
        .I3(rx_ecp_d_r[1]),
        .I4(p_2_in),
        .I5(\rx_pe_control_r_reg_n_0_[1] ),
        .O(RX_ECP_i_1_n_0));
  FDRE RX_ECP_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(RX_ECP_i_1_n_0),
        .Q(RX_ECP_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT1 #(
    .INIT(2'h1)) 
    RX_EOF_N_i_1
       (.I0(RX_ECP_reg_0),
        .O(RX_ECP_reg_1));
  LUT5 #(
    .INIT(32'h0F080808)) 
    RX_NEG_i_1
       (.I0(rx_sp_neg_d_r[1]),
        .I1(rx_sp_neg_d_r[0]),
        .I2(\rx_pe_control_r_reg_n_0_[1] ),
        .I3(rx_spa_neg_d_r[1]),
        .I4(rx_spa_neg_d_r[0]),
        .O(RX_NEG0));
  FDRE RX_NEG_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(RX_NEG0),
        .Q(RX_NEG),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    RX_PAD_i_1
       (.I0(rx_pad_d_r[0]),
        .I1(rx_pad_d_r[1]),
        .I2(p_2_in),
        .I3(\rx_pe_control_r_reg_n_0_[1] ),
        .O(RX_PAD0));
  FDRE RX_PAD_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(RX_PAD0),
        .Q(RX_PAD),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0F08)) 
    RX_PE_DATA_V_i_1
       (.I0(RX_SP_i_2_n_0),
        .I1(GOT_V_i_2_n_0),
        .I2(p_2_in),
        .I3(\rx_pe_control_r_reg_n_0_[1] ),
        .O(RX_PE_DATA_V_i_1_n_0));
  FDRE RX_PE_DATA_V_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(RX_PE_DATA_V_i_1_n_0),
        .Q(rx_pe_data_v_i),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[0]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[10] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[10]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[11] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[11]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[12] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[12]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[13] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[13]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[14] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[14]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[15] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[15]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[1]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[2] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[2]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[3] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[3]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[4] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[4]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[5] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[5]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[6] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[6]),
        .Q(Q[9]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[7] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[7]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[8] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[8]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \RX_PE_DATA_reg[9] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pe_data_r[9]),
        .Q(Q[6]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    RX_SCP_i_1
       (.I0(rx_scp_d_r[1]),
        .I1(rx_scp_d_r[0]),
        .I2(rx_scp_d_r[3]),
        .I3(rx_ecp_d_r[2]),
        .I4(p_2_in),
        .I5(\rx_pe_control_r_reg_n_0_[1] ),
        .O(RX_SCP_i_1_n_0));
  FDRE RX_SCP_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(RX_SCP_i_1_n_0),
        .Q(rx_scp_i),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h01)) 
    RX_SP_i_1
       (.I0(p_2_in),
        .I1(\rx_pe_control_r_reg_n_0_[1] ),
        .I2(RX_SP_i_2_n_0),
        .O(rx_sp_c));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    RX_SP_i_2
       (.I0(prev_beat_sp_r),
        .I1(rx_sp_d_r[3]),
        .I2(rx_sp_d_r[2]),
        .I3(rx_sp_d_r[0]),
        .I4(rx_sp_d_r[1]),
        .O(RX_SP_i_2_n_0));
  FDRE RX_SP_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_sp_c),
        .Q(rx_sp_i),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'hF8000000)) 
    RX_SRC_RDY_N_inv_i_1
       (.I0(rx_pe_data_v_i),
        .I1(in_frame_r),
        .I2(RX_ECP_reg_0),
        .I3(storage_v_r),
        .I4(START_RX),
        .O(RX_PE_DATA_V_reg_0));
  LUT3 #(
    .INIT(8'h8F)) 
    \counter2_r_reg[14]_srl15_i_1 
       (.I0(rx_sp_i),
        .I1(rx_channel_up),
        .I2(ready_r),
        .O(counter2_r0));
  LUT4 #(
    .INIT(16'hFF01)) 
    first_v_received_r_i_1
       (.I0(GOT_V_i_2_n_0),
        .I1(\rx_pe_control_r_reg_n_0_[1] ),
        .I2(p_2_in),
        .I3(first_v_received_r),
        .O(first_v_received_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    first_v_received_r_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(first_v_received_r_i_1_n_0),
        .Q(first_v_received_r),
        .R(first_v_received_r_reg_0));
  LUT4 #(
    .INIT(16'hF200)) 
    in_frame_r_i_1
       (.I0(in_frame_r),
        .I1(RX_ECP_reg_0),
        .I2(rx_scp_i),
        .I3(START_RX),
        .O(in_frame_r_reg));
  LUT6 #(
    .INIT(64'hEEEFFFFF22200000)) 
    left_aligned_r_i_1
       (.I0(left_aligned_r_reg_1),
        .I1(first_v_received_r),
        .I2(ena_comma_align_i),
        .I3(ready_r),
        .I4(left_aligned_r_reg_2),
        .I5(left_aligned_r_reg_0),
        .O(left_aligned_r_i_1_n_0));
  FDRE left_aligned_r_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(left_aligned_r_i_1_n_0),
        .Q(left_aligned_r_reg_0),
        .R(first_v_received_r_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    prev_beat_sp_d_r0
       (.I0(\word_aligned_data_r_reg_n_0_[1] ),
        .I1(\word_aligned_data_r_reg_n_0_[0] ),
        .I2(\word_aligned_data_r_reg_n_0_[2] ),
        .I3(\word_aligned_data_r_reg_n_0_[3] ),
        .O(prev_beat_sp_d_r0__0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h1008)) 
    \prev_beat_sp_d_r0_inferred__0/i_ 
       (.I0(\word_aligned_data_r_reg_n_0_[15] ),
        .I1(\word_aligned_data_r_reg_n_0_[13] ),
        .I2(\word_aligned_data_r_reg_n_0_[14] ),
        .I3(\word_aligned_data_r_reg_n_0_[12] ),
        .O(prev_beat_sp_d_r05_out));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h0180)) 
    \prev_beat_sp_d_r0_inferred__1/i_ 
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in[3]),
        .I3(p_0_in[2]),
        .O(prev_beat_sp_d_r08_out));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    prev_beat_sp_d_r1
       (.I0(\word_aligned_data_r_reg_n_0_[12] ),
        .I1(\word_aligned_data_r_reg_n_0_[14] ),
        .I2(\word_aligned_data_r_reg_n_0_[13] ),
        .I3(\word_aligned_data_r_reg_n_0_[15] ),
        .O(prev_beat_sp_d_r1__0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \prev_beat_sp_d_r1_inferred__0/i_ 
       (.I0(p_0_in[2]),
        .I1(p_0_in[3]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .O(prev_beat_sp_d_r16_in));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    prev_beat_sp_r_i_1
       (.I0(p_2_in),
        .I1(\rx_pe_control_r_reg_n_0_[1] ),
        .I2(prev_beat_v_d_r),
        .I3(rx_scp_d_r[1]),
        .I4(rx_sp_d_r[2]),
        .I5(rx_sp_d_r[3]),
        .O(prev_beat_sp_r0));
  FDRE prev_beat_sp_r_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(prev_beat_sp_r0),
        .Q(prev_beat_sp_r),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    prev_beat_v_d_r0
       (.I0(\word_aligned_data_r_reg_n_0_[13] ),
        .I1(\word_aligned_data_r_reg_n_0_[14] ),
        .I2(\word_aligned_data_r_reg_n_0_[12] ),
        .I3(\word_aligned_data_r_reg_n_0_[15] ),
        .O(prev_beat_v_d_r0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \prev_beat_v_d_r0_inferred__0/i_ 
       (.I0(p_0_in[0]),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(p_0_in[1]),
        .O(prev_beat_v_d_r0__0));
  FDRE \prev_beat_v_d_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(prev_beat_sp_d_r0__0),
        .Q(prev_beat_v_d_r),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    prev_beat_v_r_i_1
       (.I0(p_2_in),
        .I1(\rx_pe_control_r_reg_n_0_[1] ),
        .I2(prev_beat_v_d_r),
        .I3(rx_scp_d_r[1]),
        .I4(rx_v_d_r[2]),
        .I5(rx_v_d_r[3]),
        .O(prev_beat_v_r0));
  FDRE prev_beat_v_r_reg
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(prev_beat_v_r0),
        .Q(prev_beat_v_r),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    rx_cc_r0
       (.I0(\word_aligned_data_r_reg_n_0_[12] ),
        .I1(\word_aligned_data_r_reg_n_0_[13] ),
        .I2(\word_aligned_data_r_reg_n_0_[14] ),
        .I3(\word_aligned_data_r_reg_n_0_[15] ),
        .O(rx_cc_r0_n_0));
  LUT4 #(
    .INIT(16'h4000)) 
    \rx_cc_r0_inferred__0/i_ 
       (.I0(\word_aligned_data_r_reg_n_0_[4] ),
        .I1(\word_aligned_data_r_reg_n_0_[5] ),
        .I2(\word_aligned_data_r_reg_n_0_[6] ),
        .I3(\word_aligned_data_r_reg_n_0_[7] ),
        .O(rx_cc_r0__0));
  FDRE \rx_cc_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_cc_r0__0),
        .Q(rx_cc_r[1]),
        .R(1'b0));
  FDRE \rx_cc_r_reg[3] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_cc_r0_n_0),
        .Q(rx_cc_r[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    rx_ecp_d_r0
       (.I0(\word_aligned_data_r_reg_n_0_[15] ),
        .I1(\word_aligned_data_r_reg_n_0_[13] ),
        .I2(\word_aligned_data_r_reg_n_0_[12] ),
        .I3(\word_aligned_data_r_reg_n_0_[14] ),
        .O(rx_ecp_d_r0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \rx_ecp_d_r0_inferred__0/i_ 
       (.I0(\word_aligned_data_r_reg_n_0_[6] ),
        .I1(\word_aligned_data_r_reg_n_0_[5] ),
        .I2(\word_aligned_data_r_reg_n_0_[4] ),
        .I3(\word_aligned_data_r_reg_n_0_[7] ),
        .O(\rx_ecp_d_r0_inferred__0/i__n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \rx_ecp_d_r0_inferred__1/i_ 
       (.I0(\word_aligned_data_r_reg_n_0_[2] ),
        .I1(\word_aligned_data_r_reg_n_0_[3] ),
        .I2(\word_aligned_data_r_reg_n_0_[1] ),
        .I3(\word_aligned_data_r_reg_n_0_[0] ),
        .O(rx_ecp_d_r0__0));
  FDRE \rx_ecp_d_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_ecp_d_r0__0),
        .Q(rx_ecp_d_r[0]),
        .R(1'b0));
  FDRE \rx_ecp_d_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\rx_ecp_d_r0_inferred__0/i__n_0 ),
        .Q(rx_ecp_d_r[1]),
        .R(1'b0));
  FDRE \rx_ecp_d_r_reg[2] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\rx_scp_d_r0_inferred__1/i__n_0 ),
        .Q(rx_ecp_d_r[2]),
        .R(1'b0));
  FDRE \rx_ecp_d_r_reg[3] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_ecp_d_r0_n_0),
        .Q(rx_ecp_d_r[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    rx_pad_d_r0
       (.I0(\word_aligned_data_r_reg_n_0_[14] ),
        .I1(\word_aligned_data_r_reg_n_0_[15] ),
        .I2(\word_aligned_data_r_reg_n_0_[13] ),
        .I3(\word_aligned_data_r_reg_n_0_[12] ),
        .O(rx_pad_d_r0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \rx_pad_d_r0_inferred__0/i_ 
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .O(rx_pad_d_r0__0));
  FDRE \rx_pad_d_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pad_d_r0__0),
        .Q(rx_pad_d_r[0]),
        .R(1'b0));
  FDRE \rx_pad_d_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_pad_d_r0_n_0),
        .Q(rx_pad_d_r[1]),
        .R(1'b0));
  FDRE \rx_pe_control_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(word_aligned_control_bits_r[0]),
        .Q(p_2_in),
        .R(1'b0));
  FDRE \rx_pe_control_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(word_aligned_control_bits_r[1]),
        .Q(\rx_pe_control_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[0] ),
        .Q(rx_pe_data_r[0]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[10] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(rx_pe_data_r[10]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[11] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(rx_pe_data_r[11]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[12] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[12] ),
        .Q(rx_pe_data_r[12]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[13] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[13] ),
        .Q(rx_pe_data_r[13]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[14] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[14] ),
        .Q(rx_pe_data_r[14]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[15] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[15] ),
        .Q(rx_pe_data_r[15]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[1] ),
        .Q(rx_pe_data_r[1]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[2] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[2] ),
        .Q(rx_pe_data_r[2]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[3] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[3] ),
        .Q(rx_pe_data_r[3]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[4] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[4] ),
        .Q(rx_pe_data_r[4]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[5] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[5] ),
        .Q(rx_pe_data_r[5]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[6] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[6] ),
        .Q(rx_pe_data_r[6]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[7] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg_n_0_[7] ),
        .Q(rx_pe_data_r[7]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[8] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(rx_pe_data_r[8]),
        .R(1'b0));
  FDRE \rx_pe_data_r_reg[9] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(rx_pe_data_r[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    rx_scp_d_r0
       (.I0(\word_aligned_data_r_reg_n_0_[6] ),
        .I1(\word_aligned_data_r_reg_n_0_[7] ),
        .I2(\word_aligned_data_r_reg_n_0_[5] ),
        .I3(\word_aligned_data_r_reg_n_0_[4] ),
        .O(rx_scp_d_r0__0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \rx_scp_d_r0_inferred__0/i_ 
       (.I0(\word_aligned_data_r_reg_n_0_[13] ),
        .I1(\word_aligned_data_r_reg_n_0_[12] ),
        .I2(\word_aligned_data_r_reg_n_0_[14] ),
        .I3(\word_aligned_data_r_reg_n_0_[15] ),
        .O(\rx_scp_d_r0_inferred__0/i__n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \rx_scp_d_r0_inferred__1/i_ 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(p_0_in[3]),
        .O(\rx_scp_d_r0_inferred__1/i__n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \rx_scp_d_r0_inferred__2/i_ 
       (.I0(\word_aligned_data_r_reg_n_0_[0] ),
        .I1(\word_aligned_data_r_reg_n_0_[2] ),
        .I2(\word_aligned_data_r_reg_n_0_[1] ),
        .I3(\word_aligned_data_r_reg_n_0_[3] ),
        .O(\rx_scp_d_r0_inferred__2/i__n_0 ));
  FDRE \rx_scp_d_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\rx_scp_d_r0_inferred__2/i__n_0 ),
        .Q(rx_scp_d_r[0]),
        .R(1'b0));
  FDRE \rx_scp_d_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_scp_d_r0__0),
        .Q(rx_scp_d_r[1]),
        .R(1'b0));
  FDRE \rx_scp_d_r_reg[3] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\rx_scp_d_r0_inferred__0/i__n_0 ),
        .Q(rx_scp_d_r[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h0180)) 
    \rx_sp_d_r[0]_i_1 
       (.I0(\word_aligned_data_r_reg_n_0_[3] ),
        .I1(\word_aligned_data_r_reg_n_0_[2] ),
        .I2(\word_aligned_data_r_reg_n_0_[0] ),
        .I3(\word_aligned_data_r_reg_n_0_[1] ),
        .O(p_5_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h1008)) 
    \rx_sp_d_r[1]_i_1 
       (.I0(\word_aligned_data_r_reg_n_0_[5] ),
        .I1(\word_aligned_data_r_reg_n_0_[7] ),
        .I2(\word_aligned_data_r_reg_n_0_[6] ),
        .I3(\word_aligned_data_r_reg_n_0_[4] ),
        .O(p_5_out[2]));
  FDRE \rx_sp_d_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_5_out[3]),
        .Q(rx_sp_d_r[0]),
        .R(1'b0));
  FDRE \rx_sp_d_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(p_5_out[2]),
        .Q(rx_sp_d_r[1]),
        .R(1'b0));
  FDRE \rx_sp_d_r_reg[2] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(prev_beat_sp_d_r08_out),
        .Q(rx_sp_d_r[2]),
        .R(1'b0));
  FDRE \rx_sp_d_r_reg[3] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(prev_beat_sp_d_r05_out),
        .Q(rx_sp_d_r[3]),
        .R(1'b0));
  FDRE \rx_sp_neg_d_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(prev_beat_sp_d_r16_in),
        .Q(rx_sp_neg_d_r[0]),
        .R(1'b0));
  FDRE \rx_sp_neg_d_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(prev_beat_sp_d_r1__0),
        .Q(rx_sp_neg_d_r[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    rx_spa_neg_d_r0
       (.I0(\word_aligned_data_r_reg_n_0_[13] ),
        .I1(\word_aligned_data_r_reg_n_0_[12] ),
        .I2(\word_aligned_data_r_reg_n_0_[14] ),
        .I3(\word_aligned_data_r_reg_n_0_[15] ),
        .O(rx_spa_neg_d_r0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \rx_spa_neg_d_r[0]_i_1 
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .O(\rx_spa_neg_d_r[0]_i_1_n_0 ));
  FDRE \rx_spa_neg_d_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\rx_spa_neg_d_r[0]_i_1_n_0 ),
        .Q(rx_spa_neg_d_r[0]),
        .R(1'b0));
  FDRE \rx_spa_neg_d_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_spa_neg_d_r0_n_0),
        .Q(rx_spa_neg_d_r[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    rx_v_d_r0
       (.I0(\word_aligned_data_r_reg_n_0_[5] ),
        .I1(\word_aligned_data_r_reg_n_0_[6] ),
        .I2(\word_aligned_data_r_reg_n_0_[4] ),
        .I3(\word_aligned_data_r_reg_n_0_[7] ),
        .O(rx_v_d_r0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \rx_v_d_r0_inferred__0/i_ 
       (.I0(\word_aligned_data_r_reg_n_0_[3] ),
        .I1(\word_aligned_data_r_reg_n_0_[1] ),
        .I2(\word_aligned_data_r_reg_n_0_[0] ),
        .I3(\word_aligned_data_r_reg_n_0_[2] ),
        .O(rx_v_d_r0__0));
  FDRE \rx_v_d_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_v_d_r0__0),
        .Q(rx_v_d_r[0]),
        .R(1'b0));
  FDRE \rx_v_d_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(rx_v_d_r0_n_0),
        .Q(rx_v_d_r[1]),
        .R(1'b0));
  FDRE \rx_v_d_r_reg[2] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(prev_beat_v_d_r0__0),
        .Q(rx_v_d_r[2]),
        .R(1'b0));
  FDRE \rx_v_d_r_reg[3] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(prev_beat_v_d_r0_n_0),
        .Q(rx_v_d_r[3]),
        .R(1'b0));
  FDRE \word_aligned_control_bits_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_control_bits_r_reg[0]_0 ),
        .Q(word_aligned_control_bits_r[0]),
        .R(1'b0));
  FDRE \word_aligned_control_bits_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_control_bits_r_reg[1]_0 ),
        .Q(word_aligned_control_bits_r[1]),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[0] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[0]_0 [7]),
        .Q(\word_aligned_data_r_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[10] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[8]_0 [5]),
        .Q(p_0_in[1]),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[11] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[8]_0 [4]),
        .Q(p_0_in[0]),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[12] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[8]_0 [3]),
        .Q(\word_aligned_data_r_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[13] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[8]_0 [2]),
        .Q(\word_aligned_data_r_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[14] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[8]_0 [1]),
        .Q(\word_aligned_data_r_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[15] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[8]_0 [0]),
        .Q(\word_aligned_data_r_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[1] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[0]_0 [6]),
        .Q(\word_aligned_data_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[2] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[0]_0 [5]),
        .Q(\word_aligned_data_r_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[3] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[0]_0 [4]),
        .Q(\word_aligned_data_r_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[4] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[0]_0 [3]),
        .Q(\word_aligned_data_r_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[5] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[0]_0 [2]),
        .Q(\word_aligned_data_r_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[6] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[0]_0 [1]),
        .Q(\word_aligned_data_r_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[7] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[0]_0 [0]),
        .Q(\word_aligned_data_r_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[8] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[8]_0 [7]),
        .Q(p_0_in[3]),
        .R(1'b0));
  FDRE \word_aligned_data_r_reg[9] 
       (.C(\rx_pe_data_r_reg[0]_0 ),
        .CE(1'b1),
        .D(\word_aligned_data_r_reg[8]_0 [6]),
        .Q(p_0_in[2]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync
   (D,
    gt_reset,
    init_clk_in);
  output [0:0]D;
  input gt_reset;
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_0
   (D,
    rx_system_reset,
    s_level_out_d6_reg_0);
  output [0:0]D;
  input rx_system_reset;
  input s_level_out_d6_reg_0;

  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  assign D[0] = s_level_out_d6;
  assign p_level_in_int = rx_system_reset;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_1
   (in0,
    init_clk_in);
  input in0;
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  assign p_level_in_int = in0;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_5
   (\FSM_sequential_rx_state_reg[1] ,
    \FSM_sequential_rx_state_reg[1]_0 ,
    E,
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg_0,
    init_clk_in,
    reset_time_out_reg,
    Q,
    reset_time_out_reg_0,
    recclk_mon_count_reset,
    reset_time_out_reg_1,
    \FSM_sequential_rx_state_reg[0] ,
    \FSM_sequential_rx_state_reg[0]_0 ,
    \FSM_sequential_rx_state_reg[0]_1 ,
    \FSM_sequential_rx_state_reg[0]_2 ,
    \FSM_sequential_rx_state_reg[0]_3 ,
    \FSM_sequential_rx_state_reg[0]_4 ,
    rxresetdone_s3);
  output \FSM_sequential_rx_state_reg[1] ;
  output \FSM_sequential_rx_state_reg[1]_0 ;
  output [0:0]E;
  input s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg_0;
  input init_clk_in;
  input reset_time_out_reg;
  input [3:0]Q;
  input reset_time_out_reg_0;
  input recclk_mon_count_reset;
  input reset_time_out_reg_1;
  input \FSM_sequential_rx_state_reg[0] ;
  input \FSM_sequential_rx_state_reg[0]_0 ;
  input \FSM_sequential_rx_state_reg[0]_1 ;
  input \FSM_sequential_rx_state_reg[0]_2 ;
  input \FSM_sequential_rx_state_reg[0]_3 ;
  input \FSM_sequential_rx_state_reg[0]_4 ;
  input rxresetdone_s3;

  wire [0:0]E;
  wire \FSM_sequential_rx_state[3]_i_5_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_6_n_0 ;
  wire \FSM_sequential_rx_state_reg[0] ;
  wire \FSM_sequential_rx_state_reg[0]_0 ;
  wire \FSM_sequential_rx_state_reg[0]_1 ;
  wire \FSM_sequential_rx_state_reg[0]_2 ;
  wire \FSM_sequential_rx_state_reg[0]_3 ;
  wire \FSM_sequential_rx_state_reg[0]_4 ;
  wire \FSM_sequential_rx_state_reg[1] ;
  wire \FSM_sequential_rx_state_reg[1]_0 ;
  wire [3:0]Q;
  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  wire recclk_mon_count_reset;
  wire reset_time_out_i_2_n_0;
  wire reset_time_out_i_3_n_0;
  wire reset_time_out_i_4_n_0;
  wire reset_time_out_i_5_n_0;
  wire reset_time_out_reg;
  wire reset_time_out_reg_0;
  wire reset_time_out_reg_1;
  wire rxresetdone_s3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d7;

  assign p_level_in_int = s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg_0;
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_sequential_rx_state[3]_i_1 
       (.I0(\FSM_sequential_rx_state_reg[0] ),
        .I1(\FSM_sequential_rx_state_reg[0]_0 ),
        .I2(\FSM_sequential_rx_state[3]_i_5_n_0 ),
        .I3(\FSM_sequential_rx_state[3]_i_6_n_0 ),
        .I4(\FSM_sequential_rx_state_reg[0]_1 ),
        .I5(reset_time_out_reg),
        .O(E));
  LUT6 #(
    .INIT(64'h2222000003000000)) 
    \FSM_sequential_rx_state[3]_i_5 
       (.I0(\FSM_sequential_rx_state_reg[0]_2 ),
        .I1(\FSM_sequential_rx_state_reg[0]_3 ),
        .I2(s_level_out_d6),
        .I3(\FSM_sequential_rx_state_reg[0]_4 ),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\FSM_sequential_rx_state[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h3202000000000000)) 
    \FSM_sequential_rx_state[3]_i_6 
       (.I0(s_level_out_d6),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(rxresetdone_s3),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\FSM_sequential_rx_state[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFDFFFFFF01000100)) 
    adapt_count_reset_i_1
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(s_level_out_d6),
        .I5(recclk_mon_count_reset),
        .O(\FSM_sequential_rx_state_reg[1]_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    reset_time_out_i_1
       (.I0(reset_time_out_reg),
        .I1(reset_time_out_i_2_n_0),
        .I2(Q[1]),
        .I3(reset_time_out_i_3_n_0),
        .I4(reset_time_out_i_4_n_0),
        .I5(reset_time_out_reg_0),
        .O(\FSM_sequential_rx_state_reg[1] ));
  LUT5 #(
    .INIT(32'h00000004)) 
    reset_time_out_i_2
       (.I0(Q[1]),
        .I1(\FSM_sequential_rx_state_reg[0]_4 ),
        .I2(s_level_out_d6),
        .I3(Q[3]),
        .I4(Q[2]),
        .O(reset_time_out_i_2_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    reset_time_out_i_3
       (.I0(rxresetdone_s3),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(s_level_out_d6),
        .O(reset_time_out_i_3_n_0));
  LUT6 #(
    .INIT(64'h00333333FF00FC88)) 
    reset_time_out_i_4
       (.I0(reset_time_out_reg_1),
        .I1(Q[2]),
        .I2(reset_time_out_i_5_n_0),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(reset_time_out_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    reset_time_out_i_5
       (.I0(\FSM_sequential_rx_state_reg[0]_4 ),
        .I1(s_level_out_d6),
        .O(reset_time_out_i_5_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_6
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
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
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
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_7
   (init_clk_in);
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0
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
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
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
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(CLK),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(CLK),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_10
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
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
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
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_11
   (out,
    link_reset_r,
    init_clk_in,
    s_level_out_d6_reg_0);
  output out;
  input link_reset_r;
  input init_clk_in;
  input s_level_out_d6_reg_0;

  wire init_clk_in;
  wire link_reset_r;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(link_reset_r),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_12
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
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
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
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_2
   (out,
    rx_cc_extend_r2,
    p_level_in_d1_cdc_from_reg_0,
    init_clk_in);
  output out;
  input rx_cc_extend_r2;
  input p_level_in_d1_cdc_from_reg_0;
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_d1_cdc_from_reg_0;
  wire p_level_in_int;
  wire rx_cc_extend_r2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(p_level_in_d1_cdc_from_reg_0),
        .CE(1'b1),
        .D(rx_cc_extend_r2),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_3
   (out,
    GTRXRESET_OUT,
    p_level_in_d1_cdc_from_reg_0,
    init_clk_in);
  output out;
  input GTRXRESET_OUT;
  input p_level_in_d1_cdc_from_reg_0;
  input init_clk_in;

  wire GTRXRESET_OUT;
  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_d1_cdc_from_reg_0;
  wire p_level_in_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(p_level_in_d1_cdc_from_reg_0),
        .CE(1'b1),
        .D(GTRXRESET_OUT),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_4
   (out,
    rxfsm_rxresetdone_r,
    p_level_in_d1_cdc_from_reg_0,
    init_clk_in);
  output out;
  input rxfsm_rxresetdone_r;
  input p_level_in_d1_cdc_from_reg_0;
  input init_clk_in;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_d1_cdc_from_reg_0;
  wire p_level_in_int;
  wire rxfsm_rxresetdone_r;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(p_level_in_d1_cdc_from_reg_0),
        .CE(1'b1),
        .D(rxfsm_rxresetdone_r),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_8
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
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
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
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_cdc_sync" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_9
   (out,
    rx_fsm_reset_done_int,
    init_clk_in,
    s_level_out_d6_reg_0);
  output out;
  input rx_fsm_reset_done_int;
  input init_clk_in;
  input s_level_out_d6_reg_0;

  wire init_clk_in;
  (* RTL_KEEP = "true" *) wire p_level_in_d1_cdc_from;
  wire p_level_in_int;
  wire rx_fsm_reset_done_int;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire [1:0]s_level_out_bus_d6;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d2;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d3;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d4;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d5;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_level_out_d6;
  wire s_level_out_d6_reg_0;
  (* async_reg = "true" *) (* shift_extract = "{no}" *) wire s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to;
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
        .O(s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to));
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
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to[0]));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    p_level_in_d1_cdc_from_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_fsm_reset_done_int),
        .Q(p_level_in_d1_cdc_from),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(p_level_in_int),
        .Q(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* shift_extract = "{no}" *) 
  FDRE #(
    .INIT(1'b0)) 
    s_level_out_d2_reg
       (.C(s_level_out_d6_reg_0),
        .CE(1'b1),
        .D(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_core" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_core
   (rx_lane_up,
    SR,
    init_clk_in_0,
    drprdy_out,
    tx_out_clk_i,
    drpdo_out,
    link_reset_out,
    rx_resetdone_out,
    SYSTEM_RESET_reg,
    rx_channel_up,
    rx_hard_err,
    rx_aligned,
    frame_err,
    m_axi_rx_tvalid,
    soft_err,
    pll_not_locked_out,
    m_axi_rx_tdata,
    m_axi_rx_tkeep,
    m_axi_rx_tlast,
    in0,
    storage_v_r_reg,
    init_clk_in,
    drpclk_in,
    drpen_in,
    drpwe_in,
    gt_refclk1,
    rxn,
    rxp,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    drpdi_in,
    power_down,
    loopback,
    drpaddr_in,
    gt_reset_out);
  output rx_lane_up;
  output [0:0]SR;
  output init_clk_in_0;
  output drprdy_out;
  output tx_out_clk_i;
  output [15:0]drpdo_out;
  output link_reset_out;
  output rx_resetdone_out;
  output SYSTEM_RESET_reg;
  output rx_channel_up;
  output rx_hard_err;
  output rx_aligned;
  output frame_err;
  output m_axi_rx_tvalid;
  output soft_err;
  output pll_not_locked_out;
  output [0:15]m_axi_rx_tdata;
  output [0:0]m_axi_rx_tkeep;
  output m_axi_rx_tlast;
  input in0;
  input storage_v_r_reg;
  input init_clk_in;
  input drpclk_in;
  input drpen_in;
  input drpwe_in;
  input gt_refclk1;
  input rxn;
  input rxp;
  input gt_qpllclk_quad1_out;
  input gt_qpllrefclk_quad1_out;
  input [15:0]drpdi_in;
  input power_down;
  input [2:0]loopback;
  input [8:0]drpaddr_in;
  input gt_reset_out;

  wire GOT_V;
  wire GTRXRESET_OUT;
  wire HARD_ERR;
  wire RX_PAD;
  wire [0:15]RX_PE_DATA;
  wire [0:0]SR;
  wire START_RX;
  wire SYSTEM_RESET_reg;
  wire [8:0]drpaddr_in;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdo_out;
  wire drpen_in;
  wire drprdy_out;
  wire drpwe_in;
  wire ena_comma_align_i;
  wire frame_err;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_reset_out;
  wire gt_wrapper_i_n_28;
  wire gt_wrapper_i_n_29;
  wire gt_wrapper_i_n_30;
  wire gt_wrapper_i_n_33;
  wire gt_wrapper_i_n_35;
  wire gt_wrapper_i_n_36;
  wire gt_wrapper_i_n_37;
  wire gt_wrapper_i_n_38;
  wire gt_wrapper_i_n_39;
  wire gt_wrapper_i_n_40;
  wire gt_wrapper_i_n_41;
  wire gt_wrapper_i_n_42;
  wire gt_wrapper_i_n_43;
  wire gt_wrapper_i_n_44;
  wire gt_wrapper_i_n_45;
  wire gt_wrapper_i_n_46;
  wire gt_wrapper_i_n_47;
  wire gt_wrapper_i_n_48;
  wire gt_wrapper_i_n_49;
  wire gt_wrapper_i_n_50;
  wire hard_err_reset_i;
  wire in0;
  wire init_clk_in;
  wire init_clk_in_0;
  wire link_reset_out;
  wire link_reset_r;
  wire [2:0]loopback;
  wire [0:15]m_axi_rx_tdata;
  wire [0:0]m_axi_rx_tkeep;
  wire m_axi_rx_tlast;
  wire m_axi_rx_tvalid;
  wire pll_not_locked_out;
  wire power_down;
  wire reset_channel_i;
  wire rx_aligned;
  wire rx_aurora_lane_simplex_v5_0_i_n_11;
  wire rx_aurora_lane_simplex_v5_0_i_n_13;
  wire rx_aurora_lane_simplex_v5_0_i_n_14;
  wire rx_aurora_lane_simplex_v5_0_i_n_15;
  wire rx_aurora_lane_simplex_v5_0_i_n_32;
  wire \rx_channel_init_sm_simplex_i/wait_for_lane_up_r0 ;
  wire rx_channel_up;
  wire [1:0]rx_char_is_comma_i;
  wire [1:0]rx_disp_err_i;
  wire rx_ecp_i;
  wire \rx_err_detect_simplex_gtp_i/bucket_full_r ;
  wire \rx_err_detect_simplex_gtp_i/hard_err_flop_r0 ;
  wire [1:0]\rx_err_detect_simplex_gtp_i/p_2_out ;
  wire rx_hard_err;
  wire \rx_lane_init_sm_simplex_i/ready_r_reg0 ;
  wire rx_lane_up;
  wire \rx_ll_pdu_datapath_i/in_frame_r ;
  wire \rx_ll_pdu_datapath_i/storage_v_r ;
  wire [1:0]rx_not_in_table_i;
  wire rx_pe_data_v_i;
  wire rx_polarity_i;
  wire rx_realign_i;
  wire rx_resetdone_out;
  wire rx_scp_i;
  wire rxn;
  wire rxp;
  wire soft_err;
  wire storage_v_r_reg;
  wire tx_out_clk_i;

  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RESET_LOGIC core_reset_logic_i
       (.SR(SYSTEM_RESET_reg),
        .gt_rxresetdone_r2_reg_0(gt_wrapper_i_n_28),
        .in0(in0),
        .init_clk_in(init_clk_in),
        .link_reset_out(link_reset_out),
        .link_reset_r(link_reset_r),
        .reset_channel_i(reset_channel_i),
        .s_level_out_d6_reg(storage_v_r_reg),
        .tx_lock_comb_r_reg_0(init_clk_in_0),
        .wait_for_lane_up_r0(\rx_channel_init_sm_simplex_i/wait_for_lane_up_r0 ));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_GT_WRAPPER gt_wrapper_i
       (.D(rx_char_is_comma_i),
        .GTRXRESET_OUT(GTRXRESET_OUT),
        .RXDISPERR(rx_disp_err_i),
        .RXNOTINTABLE(rx_not_in_table_i),
        .bucket_full_r(\rx_err_detect_simplex_gtp_i/bucket_full_r ),
        .drpaddr_in(drpaddr_in),
        .drpclk_in(drpclk_in),
        .drpdi_in(drpdi_in),
        .drpdo_out(drpdo_out),
        .drpen_in(drpen_in),
        .drprdy_out(drprdy_out),
        .drpwe_in(drpwe_in),
        .ena_comma_align_i(ena_comma_align_i),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .gt_reset_out(gt_reset_out),
        .hard_err_flop_r0(\rx_err_detect_simplex_gtp_i/hard_err_flop_r0 ),
        .init_clk_in(init_clk_in),
        .init_clk_in_0(init_clk_in_0),
        .init_clk_in_1(\rx_err_detect_simplex_gtp_i/p_2_out ),
        .init_clk_in_2(gt_wrapper_i_n_33),
        .left_aligned_r_reg(gt_wrapper_i_n_29),
        .left_aligned_r_reg_0(gt_wrapper_i_n_30),
        .left_aligned_r_reg_1({gt_wrapper_i_n_35,gt_wrapper_i_n_36,gt_wrapper_i_n_37,gt_wrapper_i_n_38,gt_wrapper_i_n_39,gt_wrapper_i_n_40,gt_wrapper_i_n_41,gt_wrapper_i_n_42}),
        .left_aligned_r_reg_2({gt_wrapper_i_n_43,gt_wrapper_i_n_44,gt_wrapper_i_n_45,gt_wrapper_i_n_46,gt_wrapper_i_n_47,gt_wrapper_i_n_48,gt_wrapper_i_n_49,gt_wrapper_i_n_50}),
        .link_reset_r(link_reset_r),
        .loopback(loopback),
        .p_level_in_d1_cdc_from_reg(storage_v_r_reg),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .rx_polarity_i(rx_polarity_i),
        .rx_realign_i(rx_realign_i),
        .rx_resetdone_out(rx_resetdone_out),
        .rxfsm_rxresetdone_r3_reg_0(gt_wrapper_i_n_28),
        .rxn(rxn),
        .rxp(rxp),
        .tx_out_clk_i(tx_out_clk_i),
        .\word_aligned_control_bits_r_reg[1] (rx_aurora_lane_simplex_v5_0_i_n_11));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_1 hpcnt_reset_cdc_sync
       (.in0(in0),
        .init_clk_in(init_clk_in));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_AURORA_LANE_SIMPLEX_V5 rx_aurora_lane_simplex_v5_0_i
       (.D(rx_char_is_comma_i),
        .GOT_V(GOT_V),
        .HARD_ERR(HARD_ERR),
        .Q({RX_PE_DATA[0],RX_PE_DATA[1],RX_PE_DATA[2],RX_PE_DATA[3],RX_PE_DATA[4],RX_PE_DATA[5],RX_PE_DATA[6],RX_PE_DATA[7],RX_PE_DATA[8],RX_PE_DATA[9],RX_PE_DATA[10],RX_PE_DATA[11],RX_PE_DATA[12],RX_PE_DATA[13],RX_PE_DATA[14],RX_PE_DATA[15]}),
        .RXDISPERR(rx_disp_err_i),
        .RXNOTINTABLE(rx_not_in_table_i),
        .RX_ECP_reg(rx_aurora_lane_simplex_v5_0_i_n_15),
        .RX_PAD(RX_PAD),
        .RX_PE_DATA_V_reg(rx_aurora_lane_simplex_v5_0_i_n_14),
        .START_RX(START_RX),
        .bucket_full_r(\rx_err_detect_simplex_gtp_i/bucket_full_r ),
        .ena_comma_align_i(ena_comma_align_i),
        .first_v_received_r_reg(SR),
        .hard_err_flop_r0(\rx_err_detect_simplex_gtp_i/hard_err_flop_r0 ),
        .hard_err_reset_i(hard_err_reset_i),
        .in_frame_r(\rx_ll_pdu_datapath_i/in_frame_r ),
        .in_frame_r_reg(rx_aurora_lane_simplex_v5_0_i_n_13),
        .init_clk_in(init_clk_in),
        .left_aligned_r_reg(rx_aurora_lane_simplex_v5_0_i_n_11),
        .left_aligned_r_reg_0(gt_wrapper_i_n_33),
        .link_reset_out(link_reset_out),
        .ready_r_reg0(\rx_lane_init_sm_simplex_i/ready_r_reg0 ),
        .rx_channel_up(rx_channel_up),
        .rx_ecp_i(rx_ecp_i),
        .rx_lane_up(rx_lane_up),
        .\rx_pe_data_r_reg[0] (storage_v_r_reg),
        .rx_pe_data_v_i(rx_pe_data_v_i),
        .rx_polarity_i(rx_polarity_i),
        .rx_realign_i(rx_realign_i),
        .rx_scp_i(rx_scp_i),
        .\soft_err_r_reg[0] (\rx_err_detect_simplex_gtp_i/p_2_out ),
        .\soft_err_r_reg[1] (rx_aurora_lane_simplex_v5_0_i_n_32),
        .storage_v_r(\rx_ll_pdu_datapath_i/storage_v_r ),
        .\word_aligned_control_bits_r_reg[0] (gt_wrapper_i_n_30),
        .\word_aligned_control_bits_r_reg[1] (gt_wrapper_i_n_29),
        .\word_aligned_data_r_reg[0] ({gt_wrapper_i_n_43,gt_wrapper_i_n_44,gt_wrapper_i_n_45,gt_wrapper_i_n_46,gt_wrapper_i_n_47,gt_wrapper_i_n_48,gt_wrapper_i_n_49,gt_wrapper_i_n_50}),
        .\word_aligned_data_r_reg[8] ({gt_wrapper_i_n_35,gt_wrapper_i_n_36,gt_wrapper_i_n_37,gt_wrapper_i_n_38,gt_wrapper_i_n_39,gt_wrapper_i_n_40,gt_wrapper_i_n_41,gt_wrapper_i_n_42}));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX rx_global_logic_simplex_i
       (.CHANNEL_SOFT_ERR_reg(rx_aurora_lane_simplex_v5_0_i_n_32),
        .GOT_V(GOT_V),
        .GTRXRESET_OUT(GTRXRESET_OUT),
        .HARD_ERR(HARD_ERR),
        .SR(SR),
        .START_RX(START_RX),
        .\free_count_r_reg[13] (storage_v_r_reg),
        .\gtrxreset_extend_r_reg[0] (SYSTEM_RESET_reg),
        .hard_err_reset_i(hard_err_reset_i),
        .power_down(power_down),
        .ready_r_reg0(\rx_lane_init_sm_simplex_i/ready_r_reg0 ),
        .reset_channel_i(reset_channel_i),
        .rx_aligned(rx_aligned),
        .rx_channel_up(rx_channel_up),
        .rx_hard_err(rx_hard_err),
        .rx_lane_up(rx_lane_up),
        .soft_err(soft_err),
        .wait_for_lane_up_r0(\rx_channel_init_sm_simplex_i/wait_for_lane_up_r0 ));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL rx_ll_i
       (.D({RX_PE_DATA[0],RX_PE_DATA[1],RX_PE_DATA[2],RX_PE_DATA[3],RX_PE_DATA[4],RX_PE_DATA[5],RX_PE_DATA[6],RX_PE_DATA[7],RX_PE_DATA[8],RX_PE_DATA[9],RX_PE_DATA[10],RX_PE_DATA[11],RX_PE_DATA[12],RX_PE_DATA[13],RX_PE_DATA[14],RX_PE_DATA[15]}),
        .RX_EOF_N_reg(rx_aurora_lane_simplex_v5_0_i_n_15),
        .RX_PAD(RX_PAD),
        .RX_SRC_RDY_N_reg_inv(rx_aurora_lane_simplex_v5_0_i_n_14),
        .START_RX(START_RX),
        .frame_err(frame_err),
        .in_frame_r(\rx_ll_pdu_datapath_i/in_frame_r ),
        .in_frame_r_reg(rx_aurora_lane_simplex_v5_0_i_n_13),
        .m_axi_rx_tdata(m_axi_rx_tdata),
        .m_axi_rx_tkeep(m_axi_rx_tkeep),
        .m_axi_rx_tlast(m_axi_rx_tlast),
        .m_axi_rx_tvalid(m_axi_rx_tvalid),
        .rx_ecp_i(rx_ecp_i),
        .rx_pe_data_v_i(rx_pe_data_v_i),
        .rx_scp_i(rx_scp_i),
        .storage_v_r(\rx_ll_pdu_datapath_i/storage_v_r ),
        .storage_v_r_reg(storage_v_r_reg));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_gt" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt
   (init_clk_in_0,
    drprdy_out,
    rx_realign_i,
    init_clk_in_1,
    tx_out_clk_i,
    drpdo_out,
    D,
    RXDISPERR,
    RXNOTINTABLE,
    ack_flag,
    pll_not_locked_out,
    left_aligned_r_reg,
    left_aligned_r_reg_0,
    init_clk_in_2,
    init_clk_in_3,
    hard_err_flop_r0,
    left_aligned_r_reg_1,
    left_aligned_r_reg_2,
    init_clk_in,
    drpclk_in,
    drpen_in,
    drpwe_in,
    gt_refclk1,
    SR,
    gt_tx_reset_i,
    rxn,
    rxp,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    gt_rxdfelfhold_i,
    ena_comma_align_i,
    rx_polarity_i,
    gt_rxuserrdy_i,
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg,
    drpdi_in,
    power_down,
    loopback,
    drpaddr_in,
    flag2_reg_0,
    cpll_reset_i,
    \word_aligned_control_bits_r_reg[1] ,
    bucket_full_r);
  output init_clk_in_0;
  output drprdy_out;
  output rx_realign_i;
  output init_clk_in_1;
  output tx_out_clk_i;
  output [15:0]drpdo_out;
  output [1:0]D;
  output [1:0]RXDISPERR;
  output [1:0]RXNOTINTABLE;
  output ack_flag;
  output pll_not_locked_out;
  output left_aligned_r_reg;
  output left_aligned_r_reg_0;
  output [1:0]init_clk_in_2;
  output init_clk_in_3;
  output hard_err_flop_r0;
  output [7:0]left_aligned_r_reg_1;
  output [7:0]left_aligned_r_reg_2;
  input init_clk_in;
  input drpclk_in;
  input drpen_in;
  input drpwe_in;
  input gt_refclk1;
  input [0:0]SR;
  input gt_tx_reset_i;
  input rxn;
  input rxp;
  input gt_qpllclk_quad1_out;
  input gt_qpllrefclk_quad1_out;
  input gt_rxdfelfhold_i;
  input ena_comma_align_i;
  input rx_polarity_i;
  input gt_rxuserrdy_i;
  input s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg;
  input [15:0]drpdi_in;
  input power_down;
  input [2:0]loopback;
  input [8:0]drpaddr_in;
  input flag2_reg_0;
  input cpll_reset_i;
  input \word_aligned_control_bits_r_reg[1] ;
  input bucket_full_r;

  wire [1:0]D;
  wire [1:0]RXDISPERR;
  wire [1:0]RXNOTINTABLE;
  wire [0:0]SR;
  wire ack_flag;
  wire ack_flag_i_1_n_0;
  wire ack_sync1;
  wire ack_sync2;
  wire ack_sync3;
  wire ack_sync4;
  wire ack_sync5;
  wire ack_sync6;
  wire bucket_full_r;
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
  wire ena_comma_align_i;
  wire flag;
  wire flag2;
  wire flag2_reg_0;
  wire flag_i_1_n_0;
  wire gt_pllrefclklost_i;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_rxdfelfhold_i;
  wire gt_rxuserrdy_i;
  wire gt_tx_reset_i;
  wire gtxe2_i_n_0;
  wire gtxe2_i_n_11;
  wire gtxe2_i_n_16;
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
  wire gtxe2_i_n_23;
  wire gtxe2_i_n_27;
  wire gtxe2_i_n_38;
  wire gtxe2_i_n_39;
  wire gtxe2_i_n_4;
  wire gtxe2_i_n_45;
  wire gtxe2_i_n_6;
  wire gtxe2_i_n_7;
  wire gtxe2_i_n_78;
  wire gtxe2_i_n_79;
  wire gtxe2_i_n_80;
  wire gtxe2_i_n_81;
  wire gtxe2_i_n_83;
  wire gtxe2_i_n_84;
  wire gtxe2_i_n_9;
  wire hard_err_flop_r0;
  wire init_clk_in;
  wire init_clk_in_0;
  wire init_clk_in_1;
  wire [1:0]init_clk_in_2;
  wire init_clk_in_3;
  wire left_aligned_r_reg;
  wire left_aligned_r_reg_0;
  wire [7:0]left_aligned_r_reg_1;
  wire [7:0]left_aligned_r_reg_2;
  wire [2:0]loopback;
  wire pll_not_locked_out;
  wire power_down;
  wire rx_buf_err_i;
  wire [1:0]rx_char_is_k_i;
  wire [15:0]rx_data_i;
  wire rx_polarity_i;
  wire rx_realign_i;
  wire rxn;
  wire rxp;
  wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg;
  wire tx_out_clk_i;
  wire \word_aligned_control_bits_r_reg[1] ;
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
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg[31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'hFFFFFFFF)) 
    \cpllpd_wait_reg[31]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(1'b0),
        .Q(\NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllpd_wait_reg[31]_srl32_n_1 ));
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg[63]_srl32 " *) 
  SRLC32E #(
    .INIT(32'hFFFFFFFF)) 
    \cpllpd_wait_reg[63]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(\cpllpd_wait_reg[31]_srl32_n_1 ),
        .Q(\NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllpd_wait_reg[63]_srl32_n_1 ));
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg[94]_srl31 " *) 
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
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg[126]_srl31 " *) 
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
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg[31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h000000FF)) 
    \cpllreset_wait_reg[31]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(1'b0),
        .Q(\NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[31]_srl32_n_1 ));
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg[63]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[63]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_refclk1),
        .D(\cpllreset_wait_reg[31]_srl32_n_1 ),
        .Q(\NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[63]_srl32_n_1 ));
  (* srl_bus_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg[95]_srl32 " *) 
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
        .CPLLLOCK(init_clk_in_0),
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
        .GTRXRESET(SR),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .GTTXRESET(gt_tx_reset_i),
        .GTXRXN(rxn),
        .GTXRXP(rxp),
        .GTXTXN(gtxe2_i_n_6),
        .GTXTXP(gtxe2_i_n_7),
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
        .RXBUFSTATUS({rx_buf_err_i,gtxe2_i_n_83,gtxe2_i_n_84}),
        .RXBYTEISALIGNED(gtxe2_i_n_9),
        .RXBYTEREALIGN(rx_realign_i),
        .RXCDRFREQRESET(1'b0),
        .RXCDRHOLD(1'b0),
        .RXCDRLOCK(gtxe2_i_n_11),
        .RXCDROVRDEN(1'b0),
        .RXCDRRESET(1'b0),
        .RXCDRRESETRSV(1'b0),
        .RXCHANBONDSEQ(NLW_gtxe2_i_RXCHANBONDSEQ_UNCONNECTED),
        .RXCHANISALIGNED(NLW_gtxe2_i_RXCHANISALIGNED_UNCONNECTED),
        .RXCHANREALIGN(NLW_gtxe2_i_RXCHANREALIGN_UNCONNECTED),
        .RXCHARISCOMMA({NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED[7:2],D}),
        .RXCHARISK({NLW_gtxe2_i_RXCHARISK_UNCONNECTED[7:2],rx_char_is_k_i}),
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
        .RXDATA({NLW_gtxe2_i_RXDATA_UNCONNECTED[63:16],rx_data_i}),
        .RXDATAVALID(NLW_gtxe2_i_RXDATAVALID_UNCONNECTED),
        .RXDDIEN(1'b0),
        .RXDFEAGCHOLD(gt_rxdfelfhold_i),
        .RXDFEAGCOVRDEN(1'b0),
        .RXDFECM1EN(1'b0),
        .RXDFELFHOLD(gt_rxdfelfhold_i),
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
        .RXDISPERR({NLW_gtxe2_i_RXDISPERR_UNCONNECTED[7:2],RXDISPERR}),
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
        .RXMCOMMAALIGNEN(ena_comma_align_i),
        .RXMONITOROUT({gtxe2_i_n_170,gtxe2_i_n_171,gtxe2_i_n_172,gtxe2_i_n_173,gtxe2_i_n_174,gtxe2_i_n_175,gtxe2_i_n_176}),
        .RXMONITORSEL({1'b0,1'b0}),
        .RXNOTINTABLE({NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED[7:2],RXNOTINTABLE}),
        .RXOOBRESET(1'b0),
        .RXOSHOLD(1'b0),
        .RXOSOVRDEN(1'b0),
        .RXOUTCLK(gtxe2_i_n_23),
        .RXOUTCLKFABRIC(NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED),
        .RXOUTCLKPCS(NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED),
        .RXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .RXPCOMMAALIGNEN(ena_comma_align_i),
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
        .RXPOLARITY(rx_polarity_i),
        .RXPRBSCNTRESET(1'b0),
        .RXPRBSERR(gtxe2_i_n_27),
        .RXPRBSSEL({1'b0,1'b0,1'b0}),
        .RXQPIEN(1'b0),
        .RXQPISENN(NLW_gtxe2_i_RXQPISENN_UNCONNECTED),
        .RXQPISENP(NLW_gtxe2_i_RXQPISENP_UNCONNECTED),
        .RXRATE({1'b0,1'b0,1'b0}),
        .RXRATEDONE(NLW_gtxe2_i_RXRATEDONE_UNCONNECTED),
        .RXRESETDONE(init_clk_in_1),
        .RXSLIDE(1'b0),
        .RXSTARTOFSEQ(NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED),
        .RXSTATUS(NLW_gtxe2_i_RXSTATUS_UNCONNECTED[2:0]),
        .RXSYSCLKSEL({1'b0,1'b0}),
        .RXUSERRDY(gt_rxuserrdy_i),
        .RXUSRCLK(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg),
        .RXUSRCLK2(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg),
        .RXVALID(NLW_gtxe2_i_RXVALID_UNCONNECTED),
        .SETERRSTATUS(1'b0),
        .TSTIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .TSTOUT(NLW_gtxe2_i_TSTOUT_UNCONNECTED[9:0]),
        .TX8B10BBYPASS({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX8B10BEN(1'b1),
        .TXBUFDIFFCTRL({1'b1,1'b0,1'b0}),
        .TXBUFSTATUS({gtxe2_i_n_80,gtxe2_i_n_81}),
        .TXCHARDISPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARDISPVAL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARISK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCOMFINISH(NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED),
        .TXCOMINIT(1'b0),
        .TXCOMSAS(1'b0),
        .TXCOMWAKE(1'b0),
        .TXDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .TXELECIDLE(1'b0),
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
        .TXRESETDONE(gtxe2_i_n_45),
        .TXSEQUENCE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXSTARTSEQ(1'b0),
        .TXSWING(1'b0),
        .TXSYSCLKSEL({1'b0,1'b0}),
        .TXUSERRDY(1'b1),
        .TXUSRCLK(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg),
        .TXUSRCLK2(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg));
  LUT3 #(
    .INIT(8'hFE)) 
    hard_err_flop_r_i_1
       (.I0(rx_realign_i),
        .I1(bucket_full_r),
        .I2(rx_buf_err_i),
        .O(hard_err_flop_r0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0420)) 
    left_aligned_r_i_2
       (.I0(D[1]),
        .I1(D[0]),
        .I2(rx_char_is_k_i[1]),
        .I3(rx_char_is_k_i[0]),
        .O(init_clk_in_3));
  LUT1 #(
    .INIT(2'h1)) 
    pll_not_locked_out_INST_0
       (.I0(init_clk_in_0),
        .O(pll_not_locked_out));
  LUT2 #(
    .INIT(4'hE)) 
    \soft_err_r[0]_i_1 
       (.I0(RXDISPERR[0]),
        .I1(RXNOTINTABLE[0]),
        .O(init_clk_in_2[1]));
  LUT2 #(
    .INIT(4'hE)) 
    \soft_err_r[1]_i_1 
       (.I0(RXDISPERR[1]),
        .I1(RXNOTINTABLE[1]),
        .O(init_clk_in_2[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_control_bits_r[0]_i_1 
       (.I0(rx_char_is_k_i[0]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_char_is_k_i[1]),
        .O(left_aligned_r_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_control_bits_r[1]_i_1 
       (.I0(rx_char_is_k_i[1]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_char_is_k_i[0]),
        .O(left_aligned_r_reg));
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[0]_i_1 
       (.I0(rx_data_i[7]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[15]),
        .O(left_aligned_r_reg_2[7]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[10]_i_1 
       (.I0(rx_data_i[13]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[5]),
        .O(left_aligned_r_reg_1[5]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[11]_i_1 
       (.I0(rx_data_i[12]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[4]),
        .O(left_aligned_r_reg_1[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[12]_i_1 
       (.I0(rx_data_i[11]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[3]),
        .O(left_aligned_r_reg_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[13]_i_1 
       (.I0(rx_data_i[10]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[2]),
        .O(left_aligned_r_reg_1[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[14]_i_1 
       (.I0(rx_data_i[9]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[1]),
        .O(left_aligned_r_reg_1[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[15]_i_1 
       (.I0(rx_data_i[8]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[0]),
        .O(left_aligned_r_reg_1[0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[1]_i_1 
       (.I0(rx_data_i[6]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[14]),
        .O(left_aligned_r_reg_2[6]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[2]_i_1 
       (.I0(rx_data_i[5]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[13]),
        .O(left_aligned_r_reg_2[5]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[3]_i_1 
       (.I0(rx_data_i[4]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[12]),
        .O(left_aligned_r_reg_2[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[4]_i_1 
       (.I0(rx_data_i[3]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[11]),
        .O(left_aligned_r_reg_2[3]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[5]_i_1 
       (.I0(rx_data_i[2]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[10]),
        .O(left_aligned_r_reg_2[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[6]_i_1 
       (.I0(rx_data_i[1]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[9]),
        .O(left_aligned_r_reg_2[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[7]_i_1 
       (.I0(rx_data_i[0]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[8]),
        .O(left_aligned_r_reg_2[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[8]_i_1 
       (.I0(rx_data_i[15]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[7]),
        .O(left_aligned_r_reg_1[7]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \word_aligned_data_r[9]_i_1 
       (.I0(rx_data_i[14]),
        .I1(\word_aligned_control_bits_r_reg[1] ),
        .I2(rx_data_i[6]),
        .O(left_aligned_r_reg_1[6]));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_gt_common_wrapper" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt_common_wrapper
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_hotplug" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_hotplug
   (link_reset_out,
    init_clk_in,
    p_level_in_d1_cdc_from_reg,
    \rx_cc_extend_r_reg[7]_0 ,
    D);
  output link_reset_out;
  input init_clk_in;
  input p_level_in_d1_cdc_from_reg;
  input \rx_cc_extend_r_reg[7]_0 ;
  input [0:0]D;

  wire [0:0]D;
  wire cc_sync;
  wire \count_for_reset_r[0]_i_2_n_0 ;
  wire [25:0]count_for_reset_r_reg;
  wire \count_for_reset_r_reg[0]_i_1_n_0 ;
  wire \count_for_reset_r_reg[0]_i_1_n_1 ;
  wire \count_for_reset_r_reg[0]_i_1_n_2 ;
  wire \count_for_reset_r_reg[0]_i_1_n_3 ;
  wire \count_for_reset_r_reg[0]_i_1_n_4 ;
  wire \count_for_reset_r_reg[0]_i_1_n_5 ;
  wire \count_for_reset_r_reg[0]_i_1_n_6 ;
  wire \count_for_reset_r_reg[0]_i_1_n_7 ;
  wire \count_for_reset_r_reg[12]_i_1_n_0 ;
  wire \count_for_reset_r_reg[12]_i_1_n_1 ;
  wire \count_for_reset_r_reg[12]_i_1_n_2 ;
  wire \count_for_reset_r_reg[12]_i_1_n_3 ;
  wire \count_for_reset_r_reg[12]_i_1_n_4 ;
  wire \count_for_reset_r_reg[12]_i_1_n_5 ;
  wire \count_for_reset_r_reg[12]_i_1_n_6 ;
  wire \count_for_reset_r_reg[12]_i_1_n_7 ;
  wire \count_for_reset_r_reg[16]_i_1_n_0 ;
  wire \count_for_reset_r_reg[16]_i_1_n_1 ;
  wire \count_for_reset_r_reg[16]_i_1_n_2 ;
  wire \count_for_reset_r_reg[16]_i_1_n_3 ;
  wire \count_for_reset_r_reg[16]_i_1_n_4 ;
  wire \count_for_reset_r_reg[16]_i_1_n_5 ;
  wire \count_for_reset_r_reg[16]_i_1_n_6 ;
  wire \count_for_reset_r_reg[16]_i_1_n_7 ;
  wire \count_for_reset_r_reg[20]_i_1_n_0 ;
  wire \count_for_reset_r_reg[20]_i_1_n_1 ;
  wire \count_for_reset_r_reg[20]_i_1_n_2 ;
  wire \count_for_reset_r_reg[20]_i_1_n_3 ;
  wire \count_for_reset_r_reg[20]_i_1_n_4 ;
  wire \count_for_reset_r_reg[20]_i_1_n_5 ;
  wire \count_for_reset_r_reg[20]_i_1_n_6 ;
  wire \count_for_reset_r_reg[20]_i_1_n_7 ;
  wire \count_for_reset_r_reg[24]_i_1_n_3 ;
  wire \count_for_reset_r_reg[24]_i_1_n_6 ;
  wire \count_for_reset_r_reg[24]_i_1_n_7 ;
  wire \count_for_reset_r_reg[4]_i_1_n_0 ;
  wire \count_for_reset_r_reg[4]_i_1_n_1 ;
  wire \count_for_reset_r_reg[4]_i_1_n_2 ;
  wire \count_for_reset_r_reg[4]_i_1_n_3 ;
  wire \count_for_reset_r_reg[4]_i_1_n_4 ;
  wire \count_for_reset_r_reg[4]_i_1_n_5 ;
  wire \count_for_reset_r_reg[4]_i_1_n_6 ;
  wire \count_for_reset_r_reg[4]_i_1_n_7 ;
  wire \count_for_reset_r_reg[8]_i_1_n_0 ;
  wire \count_for_reset_r_reg[8]_i_1_n_1 ;
  wire \count_for_reset_r_reg[8]_i_1_n_2 ;
  wire \count_for_reset_r_reg[8]_i_1_n_3 ;
  wire \count_for_reset_r_reg[8]_i_1_n_4 ;
  wire \count_for_reset_r_reg[8]_i_1_n_5 ;
  wire \count_for_reset_r_reg[8]_i_1_n_6 ;
  wire \count_for_reset_r_reg[8]_i_1_n_7 ;
  wire init_clk_in;
  wire link_reset_0;
  wire link_reset_0_i_1_n_0;
  wire link_reset_0_i_2_n_0;
  wire link_reset_0_i_3_n_0;
  wire link_reset_0_i_4_n_0;
  wire link_reset_0_i_5_n_0;
  wire link_reset_0_i_6_n_0;
  wire link_reset_out;
  wire p_level_in_d1_cdc_from_reg;
  wire [7:0]rx_cc_extend_r;
  wire rx_cc_extend_r2;
  wire rx_cc_extend_r2_i_1_n_0;
  wire rx_cc_extend_r2_i_2_n_0;
  wire \rx_cc_extend_r_reg[7]_0 ;
  wire [3:1]\NLW_count_for_reset_r_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_count_for_reset_r_reg[24]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \count_for_reset_r[0]_i_2 
       (.I0(count_for_reset_r_reg[0]),
        .O(\count_for_reset_r[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[0] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[0]_i_1_n_7 ),
        .Q(count_for_reset_r_reg[0]),
        .R(cc_sync));
  CARRY4 \count_for_reset_r_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\count_for_reset_r_reg[0]_i_1_n_0 ,\count_for_reset_r_reg[0]_i_1_n_1 ,\count_for_reset_r_reg[0]_i_1_n_2 ,\count_for_reset_r_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\count_for_reset_r_reg[0]_i_1_n_4 ,\count_for_reset_r_reg[0]_i_1_n_5 ,\count_for_reset_r_reg[0]_i_1_n_6 ,\count_for_reset_r_reg[0]_i_1_n_7 }),
        .S({count_for_reset_r_reg[3:1],\count_for_reset_r[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[10] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[8]_i_1_n_5 ),
        .Q(count_for_reset_r_reg[10]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[11] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[8]_i_1_n_4 ),
        .Q(count_for_reset_r_reg[11]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[12] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[12]_i_1_n_7 ),
        .Q(count_for_reset_r_reg[12]),
        .R(cc_sync));
  CARRY4 \count_for_reset_r_reg[12]_i_1 
       (.CI(\count_for_reset_r_reg[8]_i_1_n_0 ),
        .CO({\count_for_reset_r_reg[12]_i_1_n_0 ,\count_for_reset_r_reg[12]_i_1_n_1 ,\count_for_reset_r_reg[12]_i_1_n_2 ,\count_for_reset_r_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_for_reset_r_reg[12]_i_1_n_4 ,\count_for_reset_r_reg[12]_i_1_n_5 ,\count_for_reset_r_reg[12]_i_1_n_6 ,\count_for_reset_r_reg[12]_i_1_n_7 }),
        .S(count_for_reset_r_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[13] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[12]_i_1_n_6 ),
        .Q(count_for_reset_r_reg[13]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[14] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[12]_i_1_n_5 ),
        .Q(count_for_reset_r_reg[14]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[15] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[12]_i_1_n_4 ),
        .Q(count_for_reset_r_reg[15]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[16] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[16]_i_1_n_7 ),
        .Q(count_for_reset_r_reg[16]),
        .R(cc_sync));
  CARRY4 \count_for_reset_r_reg[16]_i_1 
       (.CI(\count_for_reset_r_reg[12]_i_1_n_0 ),
        .CO({\count_for_reset_r_reg[16]_i_1_n_0 ,\count_for_reset_r_reg[16]_i_1_n_1 ,\count_for_reset_r_reg[16]_i_1_n_2 ,\count_for_reset_r_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_for_reset_r_reg[16]_i_1_n_4 ,\count_for_reset_r_reg[16]_i_1_n_5 ,\count_for_reset_r_reg[16]_i_1_n_6 ,\count_for_reset_r_reg[16]_i_1_n_7 }),
        .S(count_for_reset_r_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[17] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[16]_i_1_n_6 ),
        .Q(count_for_reset_r_reg[17]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[18] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[16]_i_1_n_5 ),
        .Q(count_for_reset_r_reg[18]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[19] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[16]_i_1_n_4 ),
        .Q(count_for_reset_r_reg[19]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[1] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[0]_i_1_n_6 ),
        .Q(count_for_reset_r_reg[1]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[20] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[20]_i_1_n_7 ),
        .Q(count_for_reset_r_reg[20]),
        .R(cc_sync));
  CARRY4 \count_for_reset_r_reg[20]_i_1 
       (.CI(\count_for_reset_r_reg[16]_i_1_n_0 ),
        .CO({\count_for_reset_r_reg[20]_i_1_n_0 ,\count_for_reset_r_reg[20]_i_1_n_1 ,\count_for_reset_r_reg[20]_i_1_n_2 ,\count_for_reset_r_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_for_reset_r_reg[20]_i_1_n_4 ,\count_for_reset_r_reg[20]_i_1_n_5 ,\count_for_reset_r_reg[20]_i_1_n_6 ,\count_for_reset_r_reg[20]_i_1_n_7 }),
        .S(count_for_reset_r_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[21] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[20]_i_1_n_6 ),
        .Q(count_for_reset_r_reg[21]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[22] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[20]_i_1_n_5 ),
        .Q(count_for_reset_r_reg[22]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[23] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[20]_i_1_n_4 ),
        .Q(count_for_reset_r_reg[23]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[24] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[24]_i_1_n_7 ),
        .Q(count_for_reset_r_reg[24]),
        .R(cc_sync));
  CARRY4 \count_for_reset_r_reg[24]_i_1 
       (.CI(\count_for_reset_r_reg[20]_i_1_n_0 ),
        .CO({\NLW_count_for_reset_r_reg[24]_i_1_CO_UNCONNECTED [3:1],\count_for_reset_r_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_for_reset_r_reg[24]_i_1_O_UNCONNECTED [3:2],\count_for_reset_r_reg[24]_i_1_n_6 ,\count_for_reset_r_reg[24]_i_1_n_7 }),
        .S({1'b0,1'b0,count_for_reset_r_reg[25:24]}));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[25] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[24]_i_1_n_6 ),
        .Q(count_for_reset_r_reg[25]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[2] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[0]_i_1_n_5 ),
        .Q(count_for_reset_r_reg[2]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[3] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[0]_i_1_n_4 ),
        .Q(count_for_reset_r_reg[3]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[4] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[4]_i_1_n_7 ),
        .Q(count_for_reset_r_reg[4]),
        .R(cc_sync));
  CARRY4 \count_for_reset_r_reg[4]_i_1 
       (.CI(\count_for_reset_r_reg[0]_i_1_n_0 ),
        .CO({\count_for_reset_r_reg[4]_i_1_n_0 ,\count_for_reset_r_reg[4]_i_1_n_1 ,\count_for_reset_r_reg[4]_i_1_n_2 ,\count_for_reset_r_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_for_reset_r_reg[4]_i_1_n_4 ,\count_for_reset_r_reg[4]_i_1_n_5 ,\count_for_reset_r_reg[4]_i_1_n_6 ,\count_for_reset_r_reg[4]_i_1_n_7 }),
        .S(count_for_reset_r_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[5] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[4]_i_1_n_6 ),
        .Q(count_for_reset_r_reg[5]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[6] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[4]_i_1_n_5 ),
        .Q(count_for_reset_r_reg[6]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[7] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[4]_i_1_n_4 ),
        .Q(count_for_reset_r_reg[7]),
        .R(cc_sync));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[8] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[8]_i_1_n_7 ),
        .Q(count_for_reset_r_reg[8]),
        .R(cc_sync));
  CARRY4 \count_for_reset_r_reg[8]_i_1 
       (.CI(\count_for_reset_r_reg[4]_i_1_n_0 ),
        .CO({\count_for_reset_r_reg[8]_i_1_n_0 ,\count_for_reset_r_reg[8]_i_1_n_1 ,\count_for_reset_r_reg[8]_i_1_n_2 ,\count_for_reset_r_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_for_reset_r_reg[8]_i_1_n_4 ,\count_for_reset_r_reg[8]_i_1_n_5 ,\count_for_reset_r_reg[8]_i_1_n_6 ,\count_for_reset_r_reg[8]_i_1_n_7 }),
        .S(count_for_reset_r_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \count_for_reset_r_reg[9] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(\count_for_reset_r_reg[8]_i_1_n_6 ),
        .Q(count_for_reset_r_reg[9]),
        .R(cc_sync));
  LUT5 #(
    .INIT(32'h80000000)) 
    link_reset_0_i_1
       (.I0(link_reset_0_i_2_n_0),
        .I1(link_reset_0_i_3_n_0),
        .I2(link_reset_0_i_4_n_0),
        .I3(link_reset_0_i_5_n_0),
        .I4(link_reset_0_i_6_n_0),
        .O(link_reset_0_i_1_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    link_reset_0_i_2
       (.I0(count_for_reset_r_reg[7]),
        .I1(count_for_reset_r_reg[6]),
        .I2(count_for_reset_r_reg[5]),
        .O(link_reset_0_i_2_n_0));
  LUT5 #(
    .INIT(32'h78F8F8F8)) 
    link_reset_0_i_3
       (.I0(count_for_reset_r_reg[2]),
        .I1(count_for_reset_r_reg[3]),
        .I2(count_for_reset_r_reg[4]),
        .I3(count_for_reset_r_reg[1]),
        .I4(count_for_reset_r_reg[0]),
        .O(link_reset_0_i_3_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    link_reset_0_i_4
       (.I0(count_for_reset_r_reg[16]),
        .I1(count_for_reset_r_reg[17]),
        .I2(count_for_reset_r_reg[14]),
        .I3(count_for_reset_r_reg[15]),
        .I4(count_for_reset_r_reg[19]),
        .I5(count_for_reset_r_reg[18]),
        .O(link_reset_0_i_4_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    link_reset_0_i_5
       (.I0(count_for_reset_r_reg[10]),
        .I1(count_for_reset_r_reg[11]),
        .I2(count_for_reset_r_reg[8]),
        .I3(count_for_reset_r_reg[9]),
        .I4(count_for_reset_r_reg[13]),
        .I5(count_for_reset_r_reg[12]),
        .O(link_reset_0_i_5_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    link_reset_0_i_6
       (.I0(count_for_reset_r_reg[22]),
        .I1(count_for_reset_r_reg[23]),
        .I2(count_for_reset_r_reg[20]),
        .I3(count_for_reset_r_reg[21]),
        .I4(count_for_reset_r_reg[25]),
        .I5(count_for_reset_r_reg[24]),
        .O(link_reset_0_i_6_n_0));
  FDRE link_reset_0_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(link_reset_0_i_1_n_0),
        .Q(link_reset_0),
        .R(1'b0));
  FDRE \link_reset_r_reg[0] 
       (.C(init_clk_in),
        .CE(1'b1),
        .D(link_reset_0),
        .Q(link_reset_out),
        .R(1'b0));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_2 rx_cc_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(cc_sync),
        .p_level_in_d1_cdc_from_reg_0(p_level_in_d1_cdc_from_reg),
        .rx_cc_extend_r2(rx_cc_extend_r2));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    rx_cc_extend_r2_i_1
       (.I0(rx_cc_extend_r[2]),
        .I1(rx_cc_extend_r[3]),
        .I2(rx_cc_extend_r[0]),
        .I3(rx_cc_extend_r[1]),
        .I4(rx_cc_extend_r2_i_2_n_0),
        .O(rx_cc_extend_r2_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    rx_cc_extend_r2_i_2
       (.I0(rx_cc_extend_r[5]),
        .I1(rx_cc_extend_r[4]),
        .I2(rx_cc_extend_r[7]),
        .I3(rx_cc_extend_r[6]),
        .O(rx_cc_extend_r2_i_2_n_0));
  FDRE rx_cc_extend_r2_reg
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rx_cc_extend_r2_i_1_n_0),
        .Q(rx_cc_extend_r2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cc_extend_r_reg[0] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rx_cc_extend_r[1]),
        .Q(rx_cc_extend_r[0]),
        .R(\rx_cc_extend_r_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cc_extend_r_reg[1] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rx_cc_extend_r[2]),
        .Q(rx_cc_extend_r[1]),
        .R(\rx_cc_extend_r_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cc_extend_r_reg[2] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rx_cc_extend_r[3]),
        .Q(rx_cc_extend_r[2]),
        .R(\rx_cc_extend_r_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cc_extend_r_reg[3] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rx_cc_extend_r[4]),
        .Q(rx_cc_extend_r[3]),
        .R(\rx_cc_extend_r_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cc_extend_r_reg[4] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rx_cc_extend_r[5]),
        .Q(rx_cc_extend_r[4]),
        .R(\rx_cc_extend_r_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cc_extend_r_reg[5] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rx_cc_extend_r[6]),
        .Q(rx_cc_extend_r[5]),
        .R(\rx_cc_extend_r_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cc_extend_r_reg[6] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(rx_cc_extend_r[7]),
        .Q(rx_cc_extend_r[6]),
        .R(\rx_cc_extend_r_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_cc_extend_r_reg[7] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(D),
        .Q(rx_cc_extend_r[7]),
        .R(\rx_cc_extend_r_reg[7]_0 ));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_multi_gt" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_multi_gt
   (init_clk_in_0,
    drprdy_out,
    rx_realign_i,
    init_clk_in_1,
    tx_out_clk_i,
    drpdo_out,
    D,
    RXDISPERR,
    RXNOTINTABLE,
    ack_flag,
    pll_not_locked_out,
    left_aligned_r_reg,
    left_aligned_r_reg_0,
    init_clk_in_2,
    init_clk_in_3,
    hard_err_flop_r0,
    left_aligned_r_reg_1,
    left_aligned_r_reg_2,
    init_clk_in,
    drpclk_in,
    drpen_in,
    drpwe_in,
    gt_refclk1,
    SR,
    gt_tx_reset_i,
    rxn,
    rxp,
    gt_qpllclk_quad1_out,
    gt_qpllrefclk_quad1_out,
    gt_rxdfelfhold_i,
    ena_comma_align_i,
    rx_polarity_i,
    gt_rxuserrdy_i,
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg,
    drpdi_in,
    power_down,
    loopback,
    drpaddr_in,
    flag2_reg,
    cpll_reset_i,
    \word_aligned_control_bits_r_reg[1] ,
    bucket_full_r);
  output init_clk_in_0;
  output drprdy_out;
  output rx_realign_i;
  output init_clk_in_1;
  output tx_out_clk_i;
  output [15:0]drpdo_out;
  output [1:0]D;
  output [1:0]RXDISPERR;
  output [1:0]RXNOTINTABLE;
  output ack_flag;
  output pll_not_locked_out;
  output left_aligned_r_reg;
  output left_aligned_r_reg_0;
  output [1:0]init_clk_in_2;
  output init_clk_in_3;
  output hard_err_flop_r0;
  output [7:0]left_aligned_r_reg_1;
  output [7:0]left_aligned_r_reg_2;
  input init_clk_in;
  input drpclk_in;
  input drpen_in;
  input drpwe_in;
  input gt_refclk1;
  input [0:0]SR;
  input gt_tx_reset_i;
  input rxn;
  input rxp;
  input gt_qpllclk_quad1_out;
  input gt_qpllrefclk_quad1_out;
  input gt_rxdfelfhold_i;
  input ena_comma_align_i;
  input rx_polarity_i;
  input gt_rxuserrdy_i;
  input s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg;
  input [15:0]drpdi_in;
  input power_down;
  input [2:0]loopback;
  input [8:0]drpaddr_in;
  input flag2_reg;
  input cpll_reset_i;
  input \word_aligned_control_bits_r_reg[1] ;
  input bucket_full_r;

  wire [1:0]D;
  wire [1:0]RXDISPERR;
  wire [1:0]RXNOTINTABLE;
  wire [0:0]SR;
  wire ack_flag;
  wire bucket_full_r;
  wire cpll_reset_i;
  wire [8:0]drpaddr_in;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdo_out;
  wire drpen_in;
  wire drprdy_out;
  wire drpwe_in;
  wire ena_comma_align_i;
  wire flag2_reg;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_rxdfelfhold_i;
  wire gt_rxuserrdy_i;
  wire gt_tx_reset_i;
  wire hard_err_flop_r0;
  wire init_clk_in;
  wire init_clk_in_0;
  wire init_clk_in_1;
  wire [1:0]init_clk_in_2;
  wire init_clk_in_3;
  wire left_aligned_r_reg;
  wire left_aligned_r_reg_0;
  wire [7:0]left_aligned_r_reg_1;
  wire [7:0]left_aligned_r_reg_2;
  wire [2:0]loopback;
  wire pll_not_locked_out;
  wire power_down;
  wire rx_polarity_i;
  wire rx_realign_i;
  wire rxn;
  wire rxp;
  wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg;
  wire tx_out_clk_i;
  wire \word_aligned_control_bits_r_reg[1] ;

  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt gt0_simplex_rx_aurora_8b10b_0_0_i
       (.D(D),
        .RXDISPERR(RXDISPERR),
        .RXNOTINTABLE(RXNOTINTABLE),
        .SR(SR),
        .ack_flag(ack_flag),
        .bucket_full_r(bucket_full_r),
        .cpll_reset_i(cpll_reset_i),
        .drpaddr_in(drpaddr_in),
        .drpclk_in(drpclk_in),
        .drpdi_in(drpdi_in),
        .drpdo_out(drpdo_out),
        .drpen_in(drpen_in),
        .drprdy_out(drprdy_out),
        .drpwe_in(drpwe_in),
        .ena_comma_align_i(ena_comma_align_i),
        .flag2_reg_0(flag2_reg),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .gt_rxdfelfhold_i(gt_rxdfelfhold_i),
        .gt_rxuserrdy_i(gt_rxuserrdy_i),
        .gt_tx_reset_i(gt_tx_reset_i),
        .hard_err_flop_r0(hard_err_flop_r0),
        .init_clk_in(init_clk_in),
        .init_clk_in_0(init_clk_in_0),
        .init_clk_in_1(init_clk_in_1),
        .init_clk_in_2(init_clk_in_2),
        .init_clk_in_3(init_clk_in_3),
        .left_aligned_r_reg(left_aligned_r_reg),
        .left_aligned_r_reg_0(left_aligned_r_reg_0),
        .left_aligned_r_reg_1(left_aligned_r_reg_1),
        .left_aligned_r_reg_2(left_aligned_r_reg_2),
        .loopback(loopback),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .rx_polarity_i(rx_polarity_i),
        .rx_realign_i(rx_realign_i),
        .rxn(rxn),
        .rxp(rxp),
        .s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg),
        .tx_out_clk_i(tx_out_clk_i),
        .\word_aligned_control_bits_r_reg[1] (\word_aligned_control_bits_r_reg[1] ));
endmodule

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_rx_startup_fsm" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_rx_startup_fsm
   (gt_tx_reset_i,
    gt_rxuserrdy_i,
    cpll_reset_i,
    gt_rxdfelfhold_i,
    CPLL_RESET_reg_0,
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg,
    init_clk_in,
    p_level_in_d1_cdc_from_reg,
    rxfsm_rxresetdone_r,
    AR,
    ack_flag,
    reset_time_out_reg_0);
  output gt_tx_reset_i;
  output gt_rxuserrdy_i;
  output cpll_reset_i;
  output gt_rxdfelfhold_i;
  output CPLL_RESET_reg_0;
  input s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg;
  input init_clk_in;
  input p_level_in_d1_cdc_from_reg;
  input rxfsm_rxresetdone_r;
  input [0:0]AR;
  input ack_flag;
  input reset_time_out_reg_0;

  wire [0:0]AR;
  wire CPLL_RESET_i_1_n_0;
  wire CPLL_RESET_reg_0;
  wire \FSM_sequential_rx_state[0]_i_1_n_0 ;
  wire \FSM_sequential_rx_state[0]_i_2_n_0 ;
  wire \FSM_sequential_rx_state[0]_i_3_n_0 ;
  wire \FSM_sequential_rx_state[1]_i_1_n_0 ;
  wire \FSM_sequential_rx_state[1]_i_2_n_0 ;
  wire \FSM_sequential_rx_state[1]_i_3_n_0 ;
  wire \FSM_sequential_rx_state[2]_i_1_n_0 ;
  wire \FSM_sequential_rx_state[2]_i_2_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_10_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_11_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_12_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_13_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_14_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_15_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_16_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_17_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_2_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_3_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_4_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_7_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_8_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_9_n_0 ;
  wire RXDFEAGCHOLD_i_1_n_0;
  wire RXUSERRDY_i_1_n_0;
  wire ack_flag;
  wire adapt_count;
  wire \adapt_count[0]_i_3_n_0 ;
  wire \adapt_count[0]_i_4_n_0 ;
  wire \adapt_count[0]_i_5_n_0 ;
  wire \adapt_count[0]_i_6_n_0 ;
  wire \adapt_count[0]_i_7_n_0 ;
  wire \adapt_count[0]_i_8_n_0 ;
  wire \adapt_count[0]_i_9_n_0 ;
  wire [31:0]adapt_count_reg;
  wire \adapt_count_reg[0]_i_2_n_0 ;
  wire \adapt_count_reg[0]_i_2_n_1 ;
  wire \adapt_count_reg[0]_i_2_n_2 ;
  wire \adapt_count_reg[0]_i_2_n_3 ;
  wire \adapt_count_reg[0]_i_2_n_4 ;
  wire \adapt_count_reg[0]_i_2_n_5 ;
  wire \adapt_count_reg[0]_i_2_n_6 ;
  wire \adapt_count_reg[0]_i_2_n_7 ;
  wire \adapt_count_reg[12]_i_1_n_0 ;
  wire \adapt_count_reg[12]_i_1_n_1 ;
  wire \adapt_count_reg[12]_i_1_n_2 ;
  wire \adapt_count_reg[12]_i_1_n_3 ;
  wire \adapt_count_reg[12]_i_1_n_4 ;
  wire \adapt_count_reg[12]_i_1_n_5 ;
  wire \adapt_count_reg[12]_i_1_n_6 ;
  wire \adapt_count_reg[12]_i_1_n_7 ;
  wire \adapt_count_reg[16]_i_1_n_0 ;
  wire \adapt_count_reg[16]_i_1_n_1 ;
  wire \adapt_count_reg[16]_i_1_n_2 ;
  wire \adapt_count_reg[16]_i_1_n_3 ;
  wire \adapt_count_reg[16]_i_1_n_4 ;
  wire \adapt_count_reg[16]_i_1_n_5 ;
  wire \adapt_count_reg[16]_i_1_n_6 ;
  wire \adapt_count_reg[16]_i_1_n_7 ;
  wire \adapt_count_reg[20]_i_1_n_0 ;
  wire \adapt_count_reg[20]_i_1_n_1 ;
  wire \adapt_count_reg[20]_i_1_n_2 ;
  wire \adapt_count_reg[20]_i_1_n_3 ;
  wire \adapt_count_reg[20]_i_1_n_4 ;
  wire \adapt_count_reg[20]_i_1_n_5 ;
  wire \adapt_count_reg[20]_i_1_n_6 ;
  wire \adapt_count_reg[20]_i_1_n_7 ;
  wire \adapt_count_reg[24]_i_1_n_0 ;
  wire \adapt_count_reg[24]_i_1_n_1 ;
  wire \adapt_count_reg[24]_i_1_n_2 ;
  wire \adapt_count_reg[24]_i_1_n_3 ;
  wire \adapt_count_reg[24]_i_1_n_4 ;
  wire \adapt_count_reg[24]_i_1_n_5 ;
  wire \adapt_count_reg[24]_i_1_n_6 ;
  wire \adapt_count_reg[24]_i_1_n_7 ;
  wire \adapt_count_reg[28]_i_1_n_1 ;
  wire \adapt_count_reg[28]_i_1_n_2 ;
  wire \adapt_count_reg[28]_i_1_n_3 ;
  wire \adapt_count_reg[28]_i_1_n_4 ;
  wire \adapt_count_reg[28]_i_1_n_5 ;
  wire \adapt_count_reg[28]_i_1_n_6 ;
  wire \adapt_count_reg[28]_i_1_n_7 ;
  wire \adapt_count_reg[4]_i_1_n_0 ;
  wire \adapt_count_reg[4]_i_1_n_1 ;
  wire \adapt_count_reg[4]_i_1_n_2 ;
  wire \adapt_count_reg[4]_i_1_n_3 ;
  wire \adapt_count_reg[4]_i_1_n_4 ;
  wire \adapt_count_reg[4]_i_1_n_5 ;
  wire \adapt_count_reg[4]_i_1_n_6 ;
  wire \adapt_count_reg[4]_i_1_n_7 ;
  wire \adapt_count_reg[8]_i_1_n_0 ;
  wire \adapt_count_reg[8]_i_1_n_1 ;
  wire \adapt_count_reg[8]_i_1_n_2 ;
  wire \adapt_count_reg[8]_i_1_n_3 ;
  wire \adapt_count_reg[8]_i_1_n_4 ;
  wire \adapt_count_reg[8]_i_1_n_5 ;
  wire \adapt_count_reg[8]_i_1_n_6 ;
  wire \adapt_count_reg[8]_i_1_n_7 ;
  wire check_tlock_max_i_1_n_0;
  wire check_tlock_max_reg_n_0;
  wire clear;
  wire cpll_reset_i;
  wire gt_rxdfelfhold_i;
  wire gt_rxuserrdy_i;
  wire gt_tx_reset_i;
  wire gtrxreset_i_i_1_n_0;
  wire init_clk_in;
  wire init_wait_count;
  wire \init_wait_count[0]_i_1_n_0 ;
  wire \init_wait_count[6]_i_2_n_0 ;
  wire \init_wait_count[7]_i_3_n_0 ;
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
  wire p_level_in_d1_cdc_from_reg;
  wire pll_reset_asserted_i_1_n_0;
  wire pll_reset_asserted_reg_n_0;
  wire recclk_mon_count_reset;
  wire reset_time_out_reg_0;
  wire reset_time_out_reg_n_0;
  wire run_phase_alignment_int;
  wire run_phase_alignment_int_i_1_n_0;
  wire run_phase_alignment_int_s2;
  wire run_phase_alignment_int_s3;
  wire rx_fsm_reset_done_int;
  wire rx_fsm_reset_done_int_0;
  wire rx_fsm_reset_done_int_i_1_n_0;
  wire rx_fsm_reset_done_int_i_3_n_0;
  wire rx_fsm_reset_done_int_i_4_n_0;
  wire rx_fsm_reset_done_int_i_5_n_0;
  wire rx_fsm_reset_done_int_s3;
  wire [3:0]rx_state;
  wire rxfsm_rxresetdone_r;
  wire rxresetdone_s2;
  wire rxresetdone_s3;
  wire s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg;
  wire sel;
  wire sync_cplllock_cdc_sync_n_0;
  wire sync_cplllock_cdc_sync_n_1;
  wire sync_cplllock_cdc_sync_n_2;
  wire sync_mmcm_lock_reclocked_cdc_sync_n_0;
  wire sync_mmcm_lock_reclocked_cdc_sync_n_1;
  wire sync_rx_fsm_reset_done_int_cdc_sync_n_0;
  wire time_out_100us_i_1_n_0;
  wire time_out_100us_i_2_n_0;
  wire time_out_100us_i_3_n_0;
  wire time_out_100us_i_4_n_0;
  wire time_out_100us_reg_n_0;
  wire time_out_1us_i_1_n_0;
  wire time_out_1us_i_2_n_0;
  wire time_out_1us_i_3_n_0;
  wire time_out_1us_i_4_n_0;
  wire time_out_1us_reg_n_0;
  wire time_out_2ms_i_1_n_0;
  wire time_out_2ms_i_2_n_0;
  wire time_out_2ms_reg_n_0;
  wire time_out_adapt_i_1_n_0;
  wire time_out_adapt_i_2_n_0;
  wire time_out_adapt_i_3_n_0;
  wire time_out_adapt_i_4_n_0;
  wire time_out_adapt_i_5_n_0;
  wire time_out_adapt_i_6_n_0;
  wire time_out_adapt_i_7_n_0;
  wire time_out_adapt_reg_n_0;
  wire \time_out_counter[0]_i_1_n_0 ;
  wire \time_out_counter[0]_i_3_n_0 ;
  wire \time_out_counter[0]_i_4_n_0 ;
  wire \time_out_counter[0]_i_5_n_0 ;
  wire \time_out_counter[0]_i_6_n_0 ;
  wire [18:0]time_out_counter_reg;
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
  wire \time_out_counter_reg[16]_i_1_n_2 ;
  wire \time_out_counter_reg[16]_i_1_n_3 ;
  wire \time_out_counter_reg[16]_i_1_n_5 ;
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
  wire time_tlock_max;
  wire time_tlock_max_i_1_n_0;
  wire time_tlock_max_i_2_n_0;
  wire time_tlock_max_i_3_n_0;
  wire time_tlock_max_i_4_n_0;
  wire time_tlock_max_i_5_n_0;
  wire \wait_bypass_count[0]_i_2_n_0 ;
  wire \wait_bypass_count[0]_i_4_n_0 ;
  wire \wait_bypass_count[0]_i_5_n_0 ;
  wire \wait_bypass_count[0]_i_6_n_0 ;
  wire \wait_bypass_count[0]_i_7_n_0 ;
  wire [12:0]wait_bypass_count_reg;
  wire \wait_bypass_count_reg[0]_i_3_n_0 ;
  wire \wait_bypass_count_reg[0]_i_3_n_1 ;
  wire \wait_bypass_count_reg[0]_i_3_n_2 ;
  wire \wait_bypass_count_reg[0]_i_3_n_3 ;
  wire \wait_bypass_count_reg[0]_i_3_n_4 ;
  wire \wait_bypass_count_reg[0]_i_3_n_5 ;
  wire \wait_bypass_count_reg[0]_i_3_n_6 ;
  wire \wait_bypass_count_reg[0]_i_3_n_7 ;
  wire \wait_bypass_count_reg[12]_i_1_n_7 ;
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
  wire [3:3]\NLW_adapt_count_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFDFF00000100)) 
    CPLL_RESET_i_1
       (.I0(pll_reset_asserted_reg_n_0),
        .I1(rx_state[3]),
        .I2(rx_state[2]),
        .I3(rx_state[0]),
        .I4(rx_state[1]),
        .I5(cpll_reset_i),
        .O(CPLL_RESET_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    CPLL_RESET_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(CPLL_RESET_i_1_n_0),
        .Q(cpll_reset_i),
        .R(AR));
  LUT5 #(
    .INIT(32'hFFEFEFEF)) 
    \FSM_sequential_rx_state[0]_i_1 
       (.I0(\FSM_sequential_rx_state[0]_i_2_n_0 ),
        .I1(\FSM_sequential_rx_state[0]_i_3_n_0 ),
        .I2(rx_state[0]),
        .I3(rx_state[1]),
        .I4(rx_state[3]),
        .O(\FSM_sequential_rx_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2222AAAA00300000)) 
    \FSM_sequential_rx_state[0]_i_2 
       (.I0(time_out_2ms_reg_n_0),
        .I1(reset_time_out_reg_n_0),
        .I2(time_tlock_max),
        .I3(rx_state[3]),
        .I4(rx_state[2]),
        .I5(rx_state[1]),
        .O(\FSM_sequential_rx_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \FSM_sequential_rx_state[0]_i_3 
       (.I0(rx_state[3]),
        .I1(reset_time_out_reg_n_0),
        .I2(gt_rxuserrdy_i),
        .I3(time_out_100us_reg_n_0),
        .O(\FSM_sequential_rx_state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAEEAAAAFAAAAA)) 
    \FSM_sequential_rx_state[1]_i_1 
       (.I0(\FSM_sequential_rx_state[1]_i_2_n_0 ),
        .I1(\FSM_sequential_rx_state[1]_i_3_n_0 ),
        .I2(rx_state[2]),
        .I3(rx_state[3]),
        .I4(rx_state[1]),
        .I5(rx_state[0]),
        .O(\FSM_sequential_rx_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000AABF000F0000)) 
    \FSM_sequential_rx_state[1]_i_2 
       (.I0(reset_time_out_reg_n_0),
        .I1(time_tlock_max),
        .I2(rx_state[2]),
        .I3(rx_state[3]),
        .I4(rx_state[1]),
        .I5(rx_state[0]),
        .O(\FSM_sequential_rx_state[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_rx_state[1]_i_3 
       (.I0(gt_rxuserrdy_i),
        .I1(time_out_100us_reg_n_0),
        .O(\FSM_sequential_rx_state[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h010C0C0C01000C0C)) 
    \FSM_sequential_rx_state[2]_i_1 
       (.I0(time_out_2ms_reg_n_0),
        .I1(rx_state[2]),
        .I2(rx_state[3]),
        .I3(rx_state[1]),
        .I4(rx_state[0]),
        .I5(\FSM_sequential_rx_state[2]_i_2_n_0 ),
        .O(\FSM_sequential_rx_state[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_rx_state[2]_i_2 
       (.I0(reset_time_out_reg_n_0),
        .I1(time_tlock_max),
        .O(\FSM_sequential_rx_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \FSM_sequential_rx_state[3]_i_10 
       (.I0(time_out_100us_reg_n_0),
        .I1(gt_rxuserrdy_i),
        .I2(reset_time_out_reg_n_0),
        .O(\FSM_sequential_rx_state[3]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_rx_state[3]_i_11 
       (.I0(reset_time_out_reg_n_0),
        .I1(time_out_2ms_reg_n_0),
        .O(\FSM_sequential_rx_state[3]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_rx_state[3]_i_12 
       (.I0(rx_state[2]),
        .I1(rx_state[3]),
        .O(\FSM_sequential_rx_state[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_sequential_rx_state[3]_i_13 
       (.I0(wait_time_cnt_reg[6]),
        .I1(wait_time_cnt_reg[7]),
        .I2(wait_time_cnt_reg[4]),
        .I3(wait_time_cnt_reg[5]),
        .I4(wait_time_cnt_reg[9]),
        .I5(wait_time_cnt_reg[8]),
        .O(\FSM_sequential_rx_state[3]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_sequential_rx_state[3]_i_14 
       (.I0(wait_time_cnt_reg[12]),
        .I1(wait_time_cnt_reg[13]),
        .I2(wait_time_cnt_reg[10]),
        .I3(wait_time_cnt_reg[11]),
        .I4(wait_time_cnt_reg[15]),
        .I5(wait_time_cnt_reg[14]),
        .O(\FSM_sequential_rx_state[3]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \FSM_sequential_rx_state[3]_i_15 
       (.I0(rx_state[0]),
        .I1(rx_state[1]),
        .I2(rx_state[3]),
        .I3(wait_time_cnt_reg[3]),
        .O(\FSM_sequential_rx_state[3]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h000000008F888888)) 
    \FSM_sequential_rx_state[3]_i_16 
       (.I0(rx_state[3]),
        .I1(gt_rxuserrdy_i),
        .I2(rx_state[0]),
        .I3(rx_state[2]),
        .I4(reset_time_out_reg_0),
        .I5(rx_state[1]),
        .O(\FSM_sequential_rx_state[3]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_rx_state[3]_i_17 
       (.I0(rx_state[1]),
        .I1(rx_state[0]),
        .O(\FSM_sequential_rx_state[3]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFAAAAEAEFAAAA)) 
    \FSM_sequential_rx_state[3]_i_2 
       (.I0(\FSM_sequential_rx_state[3]_i_9_n_0 ),
        .I1(\FSM_sequential_rx_state[3]_i_10_n_0 ),
        .I2(rx_state[0]),
        .I3(time_out_wait_bypass_s3),
        .I4(rx_state[3]),
        .I5(rx_state[1]),
        .O(\FSM_sequential_rx_state[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000F440000)) 
    \FSM_sequential_rx_state[3]_i_3 
       (.I0(\FSM_sequential_rx_state[2]_i_2_n_0 ),
        .I1(rx_state[2]),
        .I2(\FSM_sequential_rx_state[3]_i_11_n_0 ),
        .I3(rx_state[1]),
        .I4(rx_state[0]),
        .I5(rx_state[3]),
        .O(\FSM_sequential_rx_state[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    \FSM_sequential_rx_state[3]_i_4 
       (.I0(\FSM_sequential_rx_state[0]_i_3_n_0 ),
        .I1(rx_state[1]),
        .I2(rx_state[2]),
        .I3(init_wait_done_reg_n_0),
        .I4(rx_state[0]),
        .O(\FSM_sequential_rx_state[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \FSM_sequential_rx_state[3]_i_7 
       (.I0(\FSM_sequential_rx_state[3]_i_13_n_0 ),
        .I1(\FSM_sequential_rx_state[3]_i_14_n_0 ),
        .I2(wait_time_cnt_reg[2]),
        .I3(wait_time_cnt_reg[1]),
        .I4(wait_time_cnt_reg[0]),
        .I5(\FSM_sequential_rx_state[3]_i_15_n_0 ),
        .O(\FSM_sequential_rx_state[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAEAFFAAAAEA)) 
    \FSM_sequential_rx_state[3]_i_8 
       (.I0(\FSM_sequential_rx_state[3]_i_16_n_0 ),
        .I1(mmcm_lock_reclocked),
        .I2(rx_state[2]),
        .I3(rx_state[3]),
        .I4(\FSM_sequential_rx_state[3]_i_17_n_0 ),
        .I5(gt_rxuserrdy_i),
        .O(\FSM_sequential_rx_state[3]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h80800080)) 
    \FSM_sequential_rx_state[3]_i_9 
       (.I0(rx_state[0]),
        .I1(rx_state[1]),
        .I2(rx_state[2]),
        .I3(time_out_2ms_reg_n_0),
        .I4(reset_time_out_reg_n_0),
        .O(\FSM_sequential_rx_state[3]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rx_state_reg[0] 
       (.C(init_clk_in),
        .CE(sync_cplllock_cdc_sync_n_2),
        .D(\FSM_sequential_rx_state[0]_i_1_n_0 ),
        .Q(rx_state[0]),
        .R(AR));
  (* FSM_ENCODED_STATES = "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rx_state_reg[1] 
       (.C(init_clk_in),
        .CE(sync_cplllock_cdc_sync_n_2),
        .D(\FSM_sequential_rx_state[1]_i_1_n_0 ),
        .Q(rx_state[1]),
        .R(AR));
  (* FSM_ENCODED_STATES = "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rx_state_reg[2] 
       (.C(init_clk_in),
        .CE(sync_cplllock_cdc_sync_n_2),
        .D(\FSM_sequential_rx_state[2]_i_1_n_0 ),
        .Q(rx_state[2]),
        .R(AR));
  (* FSM_ENCODED_STATES = "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rx_state_reg[3] 
       (.C(init_clk_in),
        .CE(sync_cplllock_cdc_sync_n_2),
        .D(\FSM_sequential_rx_state[3]_i_2_n_0 ),
        .Q(rx_state[3]),
        .R(AR));
  LUT6 #(
    .INIT(64'hFFFFFFFF00080000)) 
    RXDFEAGCHOLD_i_1
       (.I0(time_out_adapt_reg_n_0),
        .I1(rx_state[1]),
        .I2(rx_state[0]),
        .I3(rx_state[2]),
        .I4(rx_state[3]),
        .I5(gt_rxdfelfhold_i),
        .O(RXDFEAGCHOLD_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    RXDFEAGCHOLD_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(RXDFEAGCHOLD_i_1_n_0),
        .Q(gt_rxdfelfhold_i),
        .R(AR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFB4000)) 
    RXUSERRDY_i_1
       (.I0(rx_state[3]),
        .I1(rx_state[0]),
        .I2(rx_state[2]),
        .I3(rx_state[1]),
        .I4(gt_rxuserrdy_i),
        .O(RXUSERRDY_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    RXUSERRDY_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(RXUSERRDY_i_1_n_0),
        .Q(gt_rxuserrdy_i),
        .R(AR));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    \adapt_count[0]_i_1 
       (.I0(\adapt_count[0]_i_3_n_0 ),
        .I1(\adapt_count[0]_i_4_n_0 ),
        .I2(\adapt_count[0]_i_5_n_0 ),
        .I3(\adapt_count[0]_i_6_n_0 ),
        .I4(\adapt_count[0]_i_7_n_0 ),
        .I5(\adapt_count[0]_i_8_n_0 ),
        .O(adapt_count));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    \adapt_count[0]_i_3 
       (.I0(adapt_count_reg[12]),
        .I1(adapt_count_reg[13]),
        .I2(adapt_count_reg[10]),
        .I3(adapt_count_reg[11]),
        .I4(adapt_count_reg[9]),
        .I5(adapt_count_reg[8]),
        .O(\adapt_count[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \adapt_count[0]_i_4 
       (.I0(adapt_count_reg[18]),
        .I1(adapt_count_reg[19]),
        .I2(adapt_count_reg[17]),
        .I3(adapt_count_reg[16]),
        .I4(adapt_count_reg[15]),
        .I5(adapt_count_reg[14]),
        .O(\adapt_count[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \adapt_count[0]_i_5 
       (.I0(adapt_count_reg[30]),
        .I1(adapt_count_reg[31]),
        .I2(adapt_count_reg[28]),
        .I3(adapt_count_reg[29]),
        .I4(adapt_count_reg[27]),
        .I5(adapt_count_reg[26]),
        .O(\adapt_count[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \adapt_count[0]_i_6 
       (.I0(adapt_count_reg[24]),
        .I1(adapt_count_reg[25]),
        .I2(adapt_count_reg[22]),
        .I3(adapt_count_reg[23]),
        .I4(adapt_count_reg[21]),
        .I5(adapt_count_reg[20]),
        .O(\adapt_count[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \adapt_count[0]_i_7 
       (.I0(adapt_count_reg[0]),
        .I1(adapt_count_reg[1]),
        .O(\adapt_count[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \adapt_count[0]_i_8 
       (.I0(adapt_count_reg[6]),
        .I1(adapt_count_reg[7]),
        .I2(adapt_count_reg[4]),
        .I3(adapt_count_reg[5]),
        .I4(adapt_count_reg[3]),
        .I5(adapt_count_reg[2]),
        .O(\adapt_count[0]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \adapt_count[0]_i_9 
       (.I0(adapt_count_reg[0]),
        .O(\adapt_count[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[0] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[0]_i_2_n_7 ),
        .Q(adapt_count_reg[0]),
        .R(recclk_mon_count_reset));
  CARRY4 \adapt_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\adapt_count_reg[0]_i_2_n_0 ,\adapt_count_reg[0]_i_2_n_1 ,\adapt_count_reg[0]_i_2_n_2 ,\adapt_count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\adapt_count_reg[0]_i_2_n_4 ,\adapt_count_reg[0]_i_2_n_5 ,\adapt_count_reg[0]_i_2_n_6 ,\adapt_count_reg[0]_i_2_n_7 }),
        .S({adapt_count_reg[3:1],\adapt_count[0]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[10] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[8]_i_1_n_5 ),
        .Q(adapt_count_reg[10]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[11] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[8]_i_1_n_4 ),
        .Q(adapt_count_reg[11]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[12] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[12]_i_1_n_7 ),
        .Q(adapt_count_reg[12]),
        .R(recclk_mon_count_reset));
  CARRY4 \adapt_count_reg[12]_i_1 
       (.CI(\adapt_count_reg[8]_i_1_n_0 ),
        .CO({\adapt_count_reg[12]_i_1_n_0 ,\adapt_count_reg[12]_i_1_n_1 ,\adapt_count_reg[12]_i_1_n_2 ,\adapt_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\adapt_count_reg[12]_i_1_n_4 ,\adapt_count_reg[12]_i_1_n_5 ,\adapt_count_reg[12]_i_1_n_6 ,\adapt_count_reg[12]_i_1_n_7 }),
        .S(adapt_count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[13] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[12]_i_1_n_6 ),
        .Q(adapt_count_reg[13]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[14] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[12]_i_1_n_5 ),
        .Q(adapt_count_reg[14]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[15] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[12]_i_1_n_4 ),
        .Q(adapt_count_reg[15]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[16] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[16]_i_1_n_7 ),
        .Q(adapt_count_reg[16]),
        .R(recclk_mon_count_reset));
  CARRY4 \adapt_count_reg[16]_i_1 
       (.CI(\adapt_count_reg[12]_i_1_n_0 ),
        .CO({\adapt_count_reg[16]_i_1_n_0 ,\adapt_count_reg[16]_i_1_n_1 ,\adapt_count_reg[16]_i_1_n_2 ,\adapt_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\adapt_count_reg[16]_i_1_n_4 ,\adapt_count_reg[16]_i_1_n_5 ,\adapt_count_reg[16]_i_1_n_6 ,\adapt_count_reg[16]_i_1_n_7 }),
        .S(adapt_count_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[17] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[16]_i_1_n_6 ),
        .Q(adapt_count_reg[17]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[18] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[16]_i_1_n_5 ),
        .Q(adapt_count_reg[18]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[19] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[16]_i_1_n_4 ),
        .Q(adapt_count_reg[19]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[1] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[0]_i_2_n_6 ),
        .Q(adapt_count_reg[1]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[20] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[20]_i_1_n_7 ),
        .Q(adapt_count_reg[20]),
        .R(recclk_mon_count_reset));
  CARRY4 \adapt_count_reg[20]_i_1 
       (.CI(\adapt_count_reg[16]_i_1_n_0 ),
        .CO({\adapt_count_reg[20]_i_1_n_0 ,\adapt_count_reg[20]_i_1_n_1 ,\adapt_count_reg[20]_i_1_n_2 ,\adapt_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\adapt_count_reg[20]_i_1_n_4 ,\adapt_count_reg[20]_i_1_n_5 ,\adapt_count_reg[20]_i_1_n_6 ,\adapt_count_reg[20]_i_1_n_7 }),
        .S(adapt_count_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[21] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[20]_i_1_n_6 ),
        .Q(adapt_count_reg[21]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[22] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[20]_i_1_n_5 ),
        .Q(adapt_count_reg[22]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[23] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[20]_i_1_n_4 ),
        .Q(adapt_count_reg[23]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[24] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[24]_i_1_n_7 ),
        .Q(adapt_count_reg[24]),
        .R(recclk_mon_count_reset));
  CARRY4 \adapt_count_reg[24]_i_1 
       (.CI(\adapt_count_reg[20]_i_1_n_0 ),
        .CO({\adapt_count_reg[24]_i_1_n_0 ,\adapt_count_reg[24]_i_1_n_1 ,\adapt_count_reg[24]_i_1_n_2 ,\adapt_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\adapt_count_reg[24]_i_1_n_4 ,\adapt_count_reg[24]_i_1_n_5 ,\adapt_count_reg[24]_i_1_n_6 ,\adapt_count_reg[24]_i_1_n_7 }),
        .S(adapt_count_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[25] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[24]_i_1_n_6 ),
        .Q(adapt_count_reg[25]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[26] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[24]_i_1_n_5 ),
        .Q(adapt_count_reg[26]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[27] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[24]_i_1_n_4 ),
        .Q(adapt_count_reg[27]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[28] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[28]_i_1_n_7 ),
        .Q(adapt_count_reg[28]),
        .R(recclk_mon_count_reset));
  CARRY4 \adapt_count_reg[28]_i_1 
       (.CI(\adapt_count_reg[24]_i_1_n_0 ),
        .CO({\NLW_adapt_count_reg[28]_i_1_CO_UNCONNECTED [3],\adapt_count_reg[28]_i_1_n_1 ,\adapt_count_reg[28]_i_1_n_2 ,\adapt_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\adapt_count_reg[28]_i_1_n_4 ,\adapt_count_reg[28]_i_1_n_5 ,\adapt_count_reg[28]_i_1_n_6 ,\adapt_count_reg[28]_i_1_n_7 }),
        .S(adapt_count_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[29] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[28]_i_1_n_6 ),
        .Q(adapt_count_reg[29]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[2] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[0]_i_2_n_5 ),
        .Q(adapt_count_reg[2]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[30] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[28]_i_1_n_5 ),
        .Q(adapt_count_reg[30]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[31] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[28]_i_1_n_4 ),
        .Q(adapt_count_reg[31]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[3] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[0]_i_2_n_4 ),
        .Q(adapt_count_reg[3]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[4] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[4]_i_1_n_7 ),
        .Q(adapt_count_reg[4]),
        .R(recclk_mon_count_reset));
  CARRY4 \adapt_count_reg[4]_i_1 
       (.CI(\adapt_count_reg[0]_i_2_n_0 ),
        .CO({\adapt_count_reg[4]_i_1_n_0 ,\adapt_count_reg[4]_i_1_n_1 ,\adapt_count_reg[4]_i_1_n_2 ,\adapt_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\adapt_count_reg[4]_i_1_n_4 ,\adapt_count_reg[4]_i_1_n_5 ,\adapt_count_reg[4]_i_1_n_6 ,\adapt_count_reg[4]_i_1_n_7 }),
        .S(adapt_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[5] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[4]_i_1_n_6 ),
        .Q(adapt_count_reg[5]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[6] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[4]_i_1_n_5 ),
        .Q(adapt_count_reg[6]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[7] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[4]_i_1_n_4 ),
        .Q(adapt_count_reg[7]),
        .R(recclk_mon_count_reset));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[8] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[8]_i_1_n_7 ),
        .Q(adapt_count_reg[8]),
        .R(recclk_mon_count_reset));
  CARRY4 \adapt_count_reg[8]_i_1 
       (.CI(\adapt_count_reg[4]_i_1_n_0 ),
        .CO({\adapt_count_reg[8]_i_1_n_0 ,\adapt_count_reg[8]_i_1_n_1 ,\adapt_count_reg[8]_i_1_n_2 ,\adapt_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\adapt_count_reg[8]_i_1_n_4 ,\adapt_count_reg[8]_i_1_n_5 ,\adapt_count_reg[8]_i_1_n_6 ,\adapt_count_reg[8]_i_1_n_7 }),
        .S(adapt_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \adapt_count_reg[9] 
       (.C(init_clk_in),
        .CE(adapt_count),
        .D(\adapt_count_reg[8]_i_1_n_6 ),
        .Q(adapt_count_reg[9]),
        .R(recclk_mon_count_reset));
  FDSE #(
    .INIT(1'b0)) 
    adapt_count_reset_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(sync_cplllock_cdc_sync_n_1),
        .Q(recclk_mon_count_reset),
        .S(AR));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    check_tlock_max_i_1
       (.I0(rx_state[2]),
        .I1(rx_state[0]),
        .I2(rx_state[1]),
        .I3(rx_state[3]),
        .I4(check_tlock_max_reg_n_0),
        .O(check_tlock_max_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    check_tlock_max_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(check_tlock_max_i_1_n_0),
        .Q(check_tlock_max_reg_n_0),
        .R(AR));
  LUT2 #(
    .INIT(4'h2)) 
    flag2_i_1
       (.I0(cpll_reset_i),
        .I1(ack_flag),
        .O(CPLL_RESET_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFEF0100)) 
    gtrxreset_i_i_1
       (.I0(rx_state[3]),
        .I1(rx_state[1]),
        .I2(rx_state[2]),
        .I3(rx_state[0]),
        .I4(gt_tx_reset_i),
        .O(gtrxreset_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gtrxreset_i_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(gtrxreset_i_i_1_n_0),
        .Q(gt_tx_reset_i),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \init_wait_count[0]_i_1 
       (.I0(init_wait_count_reg__0[0]),
        .O(\init_wait_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \init_wait_count[1]_i_1 
       (.I0(init_wait_count_reg__0[0]),
        .I1(init_wait_count_reg__0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
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
        .CLR(AR),
        .D(\init_wait_count[0]_i_1_n_0 ),
        .Q(init_wait_count_reg__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[1] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(AR),
        .D(p_0_in[1]),
        .Q(init_wait_count_reg__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[2] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(AR),
        .D(p_0_in[2]),
        .Q(init_wait_count_reg__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[3] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(AR),
        .D(p_0_in[3]),
        .Q(init_wait_count_reg__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[4] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(AR),
        .D(p_0_in[4]),
        .Q(init_wait_count_reg__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[5] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(AR),
        .D(p_0_in[5]),
        .Q(init_wait_count_reg__0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[6] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(AR),
        .D(p_0_in[6]),
        .Q(init_wait_count_reg__0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[7] 
       (.C(init_clk_in),
        .CE(init_wait_count),
        .CLR(AR),
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
        .CLR(AR),
        .D(init_wait_done_i_1_n_0),
        .Q(init_wait_done_reg_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \mmcm_lock_count[0]_i_1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mmcm_lock_count[1]_i_1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \mmcm_lock_count[2]_i_1 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .O(\mmcm_lock_count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \mmcm_lock_count[3]_i_1 
       (.I0(mmcm_lock_count_reg__0[2]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[1]),
        .I3(mmcm_lock_count_reg__0[3]),
        .O(\mmcm_lock_count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \mmcm_lock_count[7]_i_1 
       (.I0(mmcm_lock_count_reg__0[6]),
        .I1(\mmcm_lock_count[9]_i_4_n_0 ),
        .I2(mmcm_lock_count_reg__0[7]),
        .O(\mmcm_lock_count[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
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
    .INIT(32'hFDFF0100)) 
    pll_reset_asserted_i_1
       (.I0(rx_state[1]),
        .I1(rx_state[2]),
        .I2(rx_state[3]),
        .I3(rx_state[0]),
        .I4(pll_reset_asserted_reg_n_0),
        .O(pll_reset_asserted_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pll_reset_asserted_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(pll_reset_asserted_i_1_n_0),
        .Q(pll_reset_asserted_reg_n_0),
        .R(AR));
  FDSE #(
    .INIT(1'b0)) 
    reset_time_out_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(sync_cplllock_cdc_sync_n_0),
        .Q(reset_time_out_reg_n_0),
        .S(AR));
  LUT5 #(
    .INIT(32'hFEFF0010)) 
    run_phase_alignment_int_i_1
       (.I0(rx_state[2]),
        .I1(rx_state[1]),
        .I2(rx_state[3]),
        .I3(rx_state[0]),
        .I4(run_phase_alignment_int),
        .O(run_phase_alignment_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    run_phase_alignment_int_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(run_phase_alignment_int_i_1_n_0),
        .Q(run_phase_alignment_int),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    run_phase_alignment_int_s3_reg
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(run_phase_alignment_int_s2),
        .Q(run_phase_alignment_int_s3),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hABA8)) 
    rx_fsm_reset_done_int_i_1
       (.I0(rx_fsm_reset_done_int_0),
        .I1(rx_fsm_reset_done_int_i_3_n_0),
        .I2(rx_fsm_reset_done_int_i_4_n_0),
        .I3(rx_fsm_reset_done_int),
        .O(rx_fsm_reset_done_int_i_1_n_0));
  LUT5 #(
    .INIT(32'h00040000)) 
    rx_fsm_reset_done_int_i_2
       (.I0(rx_state[0]),
        .I1(time_out_1us_reg_n_0),
        .I2(rx_state[2]),
        .I3(reset_time_out_reg_n_0),
        .I4(gt_rxuserrdy_i),
        .O(rx_fsm_reset_done_int_0));
  LUT6 #(
    .INIT(64'h0400040004040400)) 
    rx_fsm_reset_done_int_i_3
       (.I0(\FSM_sequential_rx_state[3]_i_17_n_0 ),
        .I1(rx_state[3]),
        .I2(rx_state[2]),
        .I3(gt_rxuserrdy_i),
        .I4(time_out_100us_reg_n_0),
        .I5(reset_time_out_reg_n_0),
        .O(rx_fsm_reset_done_int_i_3_n_0));
  LUT6 #(
    .INIT(64'h0020002020200020)) 
    rx_fsm_reset_done_int_i_4
       (.I0(rx_state[1]),
        .I1(rx_state[0]),
        .I2(rx_fsm_reset_done_int_i_5_n_0),
        .I3(gt_rxuserrdy_i),
        .I4(time_out_1us_reg_n_0),
        .I5(reset_time_out_reg_n_0),
        .O(rx_fsm_reset_done_int_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    rx_fsm_reset_done_int_i_5
       (.I0(rx_state[3]),
        .I1(rx_state[2]),
        .O(rx_fsm_reset_done_int_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_fsm_reset_done_int_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rx_fsm_reset_done_int_i_1_n_0),
        .Q(rx_fsm_reset_done_int),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    rx_fsm_reset_done_int_s3_reg
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(1'b1),
        .D(sync_rx_fsm_reset_done_int_cdc_sync_n_0),
        .Q(rx_fsm_reset_done_int_s3),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rxresetdone_s3_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(rxresetdone_s2),
        .Q(rxresetdone_s3),
        .R(1'b0));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_4 sync_RXRESETDONE_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(rxresetdone_s2),
        .p_level_in_d1_cdc_from_reg_0(p_level_in_d1_cdc_from_reg),
        .rxfsm_rxresetdone_r(rxfsm_rxresetdone_r));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_5 sync_cplllock_cdc_sync
       (.E(sync_cplllock_cdc_sync_n_2),
        .\FSM_sequential_rx_state_reg[0] (\FSM_sequential_rx_state[3]_i_3_n_0 ),
        .\FSM_sequential_rx_state_reg[0]_0 (\FSM_sequential_rx_state[3]_i_4_n_0 ),
        .\FSM_sequential_rx_state_reg[0]_1 (\FSM_sequential_rx_state[3]_i_7_n_0 ),
        .\FSM_sequential_rx_state_reg[0]_2 (time_out_2ms_reg_n_0),
        .\FSM_sequential_rx_state_reg[0]_3 (\FSM_sequential_rx_state[3]_i_12_n_0 ),
        .\FSM_sequential_rx_state_reg[0]_4 (pll_reset_asserted_reg_n_0),
        .\FSM_sequential_rx_state_reg[1] (sync_cplllock_cdc_sync_n_0),
        .\FSM_sequential_rx_state_reg[1]_0 (sync_cplllock_cdc_sync_n_1),
        .Q(rx_state),
        .init_clk_in(init_clk_in),
        .recclk_mon_count_reset(recclk_mon_count_reset),
        .reset_time_out_reg(\FSM_sequential_rx_state[3]_i_8_n_0 ),
        .reset_time_out_reg_0(reset_time_out_reg_n_0),
        .reset_time_out_reg_1(reset_time_out_reg_0),
        .rxresetdone_s3(rxresetdone_s3),
        .s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg_0(s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_6 sync_mmcm_lock_reclocked_cdc_sync
       (.SR(sync_mmcm_lock_reclocked_cdc_sync_n_1),
        .init_clk_in(init_clk_in),
        .mmcm_lock_reclocked(mmcm_lock_reclocked),
        .mmcm_lock_reclocked_reg(sync_mmcm_lock_reclocked_cdc_sync_n_0),
        .mmcm_lock_reclocked_reg_0(mmcm_lock_reclocked_i_2_n_0));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_7 sync_qplllock_cdc_sync
       (.init_clk_in(init_clk_in));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_8 sync_run_phase_alignment_int_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(run_phase_alignment_int_s2),
        .run_phase_alignment_int(run_phase_alignment_int),
        .s_level_out_d6_reg_0(p_level_in_d1_cdc_from_reg));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_9 sync_rx_fsm_reset_done_int_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(sync_rx_fsm_reset_done_int_cdc_sync_n_0),
        .rx_fsm_reset_done_int(rx_fsm_reset_done_int),
        .s_level_out_d6_reg_0(p_level_in_d1_cdc_from_reg));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_10 sync_time_out_wait_bypass_cdc_sync
       (.init_clk_in(init_clk_in),
        .out(time_out_wait_bypass_s2),
        .p_level_in_d1_cdc_from_reg_0(p_level_in_d1_cdc_from_reg),
        .time_out_wait_bypass(time_out_wait_bypass));
  LUT5 #(
    .INIT(32'hFFFF0010)) 
    time_out_100us_i_1
       (.I0(time_out_100us_i_2_n_0),
        .I1(time_out_100us_i_3_n_0),
        .I2(time_out_100us_i_4_n_0),
        .I3(time_tlock_max_i_2_n_0),
        .I4(time_out_100us_reg_n_0),
        .O(time_out_100us_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF7)) 
    time_out_100us_i_2
       (.I0(time_out_counter_reg[9]),
        .I1(time_out_counter_reg[8]),
        .I2(time_out_counter_reg[2]),
        .I3(time_out_counter_reg[3]),
        .I4(time_out_counter_reg[1]),
        .I5(time_out_counter_reg[0]),
        .O(time_out_100us_i_2_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    time_out_100us_i_3
       (.I0(time_out_counter_reg[7]),
        .I1(time_out_counter_reg[6]),
        .I2(time_out_counter_reg[5]),
        .O(time_out_100us_i_3_n_0));
  LUT5 #(
    .INIT(32'h00000080)) 
    time_out_100us_i_4
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[10]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[12]),
        .I4(time_out_counter_reg[11]),
        .O(time_out_100us_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_100us_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(time_out_100us_i_1_n_0),
        .Q(time_out_100us_reg_n_0),
        .R(reset_time_out_reg_n_0));
  LUT5 #(
    .INIT(32'hFFFF0002)) 
    time_out_1us_i_1
       (.I0(time_out_1us_i_2_n_0),
        .I1(time_out_1us_i_3_n_0),
        .I2(time_out_1us_i_4_n_0),
        .I3(time_tlock_max_i_2_n_0),
        .I4(time_out_1us_reg_n_0),
        .O(time_out_1us_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    time_out_1us_i_2
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .I2(time_out_counter_reg[2]),
        .I3(time_out_counter_reg[7]),
        .I4(time_out_counter_reg[12]),
        .I5(time_out_counter_reg[11]),
        .O(time_out_1us_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    time_out_1us_i_3
       (.I0(time_out_counter_reg[3]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[0]),
        .O(time_out_1us_i_3_n_0));
  LUT5 #(
    .INIT(32'hFEFFFFFF)) 
    time_out_1us_i_4
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[10]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[6]),
        .I4(time_out_counter_reg[5]),
        .O(time_out_1us_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_1us_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(time_out_1us_i_1_n_0),
        .Q(time_out_1us_reg_n_0),
        .R(reset_time_out_reg_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    time_out_2ms_i_1
       (.I0(time_out_2ms_i_2_n_0),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[16]),
        .I3(time_out_counter_reg[17]),
        .I4(\time_out_counter[0]_i_5_n_0 ),
        .I5(time_out_2ms_reg_n_0),
        .O(time_out_2ms_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h08000000)) 
    time_out_2ms_i_2
       (.I0(time_out_counter_reg[7]),
        .I1(time_out_counter_reg[12]),
        .I2(time_out_counter_reg[11]),
        .I3(time_out_counter_reg[18]),
        .I4(time_out_counter_reg[15]),
        .O(time_out_2ms_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_2ms_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(time_out_2ms_i_1_n_0),
        .Q(time_out_2ms_reg_n_0),
        .R(reset_time_out_reg_n_0));
  LUT4 #(
    .INIT(16'h00EA)) 
    time_out_adapt_i_1
       (.I0(time_out_adapt_reg_n_0),
        .I1(time_out_adapt_i_2_n_0),
        .I2(time_out_adapt_i_3_n_0),
        .I3(recclk_mon_count_reset),
        .O(time_out_adapt_i_1_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    time_out_adapt_i_2
       (.I0(time_out_adapt_i_4_n_0),
        .I1(time_out_adapt_i_5_n_0),
        .I2(time_out_adapt_i_6_n_0),
        .I3(time_out_adapt_i_7_n_0),
        .I4(adapt_count_reg[0]),
        .I5(adapt_count_reg[1]),
        .O(time_out_adapt_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    time_out_adapt_i_3
       (.I0(adapt_count_reg[28]),
        .I1(adapt_count_reg[29]),
        .I2(adapt_count_reg[26]),
        .I3(adapt_count_reg[27]),
        .I4(adapt_count_reg[31]),
        .I5(adapt_count_reg[30]),
        .O(time_out_adapt_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    time_out_adapt_i_4
       (.I0(adapt_count_reg[22]),
        .I1(adapt_count_reg[23]),
        .I2(adapt_count_reg[20]),
        .I3(adapt_count_reg[21]),
        .I4(adapt_count_reg[25]),
        .I5(adapt_count_reg[24]),
        .O(time_out_adapt_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    time_out_adapt_i_5
       (.I0(adapt_count_reg[17]),
        .I1(adapt_count_reg[16]),
        .I2(adapt_count_reg[14]),
        .I3(adapt_count_reg[15]),
        .I4(adapt_count_reg[19]),
        .I5(adapt_count_reg[18]),
        .O(time_out_adapt_i_5_n_0));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    time_out_adapt_i_6
       (.I0(adapt_count_reg[10]),
        .I1(adapt_count_reg[11]),
        .I2(adapt_count_reg[8]),
        .I3(adapt_count_reg[9]),
        .I4(adapt_count_reg[13]),
        .I5(adapt_count_reg[12]),
        .O(time_out_adapt_i_6_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    time_out_adapt_i_7
       (.I0(adapt_count_reg[4]),
        .I1(adapt_count_reg[5]),
        .I2(adapt_count_reg[2]),
        .I3(adapt_count_reg[3]),
        .I4(adapt_count_reg[7]),
        .I5(adapt_count_reg[6]),
        .O(time_out_adapt_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_adapt_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(time_out_adapt_i_1_n_0),
        .Q(time_out_adapt_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \time_out_counter[0]_i_1 
       (.I0(\time_out_counter[0]_i_3_n_0 ),
        .I1(time_out_counter_reg[12]),
        .I2(time_out_counter_reg[7]),
        .I3(time_out_counter_reg[11]),
        .I4(\time_out_counter[0]_i_4_n_0 ),
        .I5(\time_out_counter[0]_i_5_n_0 ),
        .O(\time_out_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \time_out_counter[0]_i_3 
       (.I0(time_out_counter_reg[17]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[14]),
        .O(\time_out_counter[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \time_out_counter[0]_i_4 
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[18]),
        .O(\time_out_counter[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \time_out_counter[0]_i_5 
       (.I0(time_out_100us_i_2_n_0),
        .I1(time_out_counter_reg[5]),
        .I2(time_out_counter_reg[6]),
        .I3(time_out_counter_reg[13]),
        .I4(time_out_counter_reg[10]),
        .I5(time_out_counter_reg[4]),
        .O(\time_out_counter[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \time_out_counter[0]_i_6 
       (.I0(time_out_counter_reg[0]),
        .O(\time_out_counter[0]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[0] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[0]_i_2_n_7 ),
        .Q(time_out_counter_reg[0]),
        .R(reset_time_out_reg_n_0));
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
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[8]_i_1_n_5 ),
        .Q(time_out_counter_reg[10]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[11] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[8]_i_1_n_4 ),
        .Q(time_out_counter_reg[11]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[12] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[12]_i_1_n_7 ),
        .Q(time_out_counter_reg[12]),
        .R(reset_time_out_reg_n_0));
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
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[12]_i_1_n_6 ),
        .Q(time_out_counter_reg[13]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[14] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[12]_i_1_n_5 ),
        .Q(time_out_counter_reg[14]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[15] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[12]_i_1_n_4 ),
        .Q(time_out_counter_reg[15]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[16] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[16]_i_1_n_7 ),
        .Q(time_out_counter_reg[16]),
        .R(reset_time_out_reg_n_0));
  CARRY4 \time_out_counter_reg[16]_i_1 
       (.CI(\time_out_counter_reg[12]_i_1_n_0 ),
        .CO({\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED [3:2],\time_out_counter_reg[16]_i_1_n_2 ,\time_out_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED [3],\time_out_counter_reg[16]_i_1_n_5 ,\time_out_counter_reg[16]_i_1_n_6 ,\time_out_counter_reg[16]_i_1_n_7 }),
        .S({1'b0,time_out_counter_reg[18:16]}));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[17] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[16]_i_1_n_6 ),
        .Q(time_out_counter_reg[17]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[18] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[16]_i_1_n_5 ),
        .Q(time_out_counter_reg[18]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[1] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[0]_i_2_n_6 ),
        .Q(time_out_counter_reg[1]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[2] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[0]_i_2_n_5 ),
        .Q(time_out_counter_reg[2]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[3] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[0]_i_2_n_4 ),
        .Q(time_out_counter_reg[3]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[4] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[4]_i_1_n_7 ),
        .Q(time_out_counter_reg[4]),
        .R(reset_time_out_reg_n_0));
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
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[4]_i_1_n_6 ),
        .Q(time_out_counter_reg[5]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[6] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[4]_i_1_n_5 ),
        .Q(time_out_counter_reg[6]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[7] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[4]_i_1_n_4 ),
        .Q(time_out_counter_reg[7]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[8] 
       (.C(init_clk_in),
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[8]_i_1_n_7 ),
        .Q(time_out_counter_reg[8]),
        .R(reset_time_out_reg_n_0));
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
        .CE(\time_out_counter[0]_i_1_n_0 ),
        .D(\time_out_counter_reg[8]_i_1_n_6 ),
        .Q(time_out_counter_reg[9]),
        .R(reset_time_out_reg_n_0));
  LUT4 #(
    .INIT(16'hAB00)) 
    time_out_wait_bypass_i_1
       (.I0(time_out_wait_bypass),
        .I1(\wait_bypass_count[0]_i_4_n_0 ),
        .I2(rx_fsm_reset_done_int_s3),
        .I3(run_phase_alignment_int_s3),
        .O(time_out_wait_bypass_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_wait_bypass_reg
       (.C(p_level_in_d1_cdc_from_reg),
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
    .INIT(64'hFFFFFFFFC8C8C888)) 
    time_tlock_max_i_1
       (.I0(time_tlock_max_i_2_n_0),
        .I1(check_tlock_max_reg_n_0),
        .I2(time_out_counter_reg[13]),
        .I3(time_tlock_max_i_3_n_0),
        .I4(time_tlock_max_i_4_n_0),
        .I5(time_tlock_max),
        .O(time_tlock_max_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    time_tlock_max_i_2
       (.I0(time_out_counter_reg[18]),
        .I1(time_out_counter_reg[15]),
        .I2(time_out_counter_reg[14]),
        .I3(time_out_counter_reg[16]),
        .I4(time_out_counter_reg[17]),
        .O(time_tlock_max_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hE)) 
    time_tlock_max_i_3
       (.I0(time_out_counter_reg[11]),
        .I1(time_out_counter_reg[12]),
        .O(time_tlock_max_i_3_n_0));
  LUT6 #(
    .INIT(64'h8080800080008000)) 
    time_tlock_max_i_4
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_100us_i_3_n_0),
        .I4(time_tlock_max_i_5_n_0),
        .I5(time_out_counter_reg[4]),
        .O(time_tlock_max_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    time_tlock_max_i_5
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[3]),
        .I3(time_out_counter_reg[2]),
        .O(time_tlock_max_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_tlock_max_reg
       (.C(init_clk_in),
        .CE(1'b1),
        .D(time_tlock_max_i_1_n_0),
        .Q(time_tlock_max),
        .R(reset_time_out_reg_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_bypass_count[0]_i_1 
       (.I0(run_phase_alignment_int_s3),
        .O(clear));
  LUT2 #(
    .INIT(4'h2)) 
    \wait_bypass_count[0]_i_2 
       (.I0(\wait_bypass_count[0]_i_4_n_0 ),
        .I1(rx_fsm_reset_done_int_s3),
        .O(\wait_bypass_count[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \wait_bypass_count[0]_i_4 
       (.I0(\wait_bypass_count[0]_i_6_n_0 ),
        .I1(wait_bypass_count_reg[4]),
        .I2(wait_bypass_count_reg[3]),
        .I3(wait_bypass_count_reg[6]),
        .I4(wait_bypass_count_reg[5]),
        .I5(\wait_bypass_count[0]_i_7_n_0 ),
        .O(\wait_bypass_count[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_bypass_count[0]_i_5 
       (.I0(wait_bypass_count_reg[0]),
        .O(\wait_bypass_count[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \wait_bypass_count[0]_i_6 
       (.I0(wait_bypass_count_reg[8]),
        .I1(wait_bypass_count_reg[7]),
        .I2(wait_bypass_count_reg[9]),
        .I3(wait_bypass_count_reg[10]),
        .O(\wait_bypass_count[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hDFFFFFFF)) 
    \wait_bypass_count[0]_i_7 
       (.I0(wait_bypass_count_reg[0]),
        .I1(wait_bypass_count_reg[11]),
        .I2(wait_bypass_count_reg[12]),
        .I3(wait_bypass_count_reg[2]),
        .I4(wait_bypass_count_reg[1]),
        .O(\wait_bypass_count[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[0] 
       (.C(p_level_in_d1_cdc_from_reg),
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
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_5 ),
        .Q(wait_bypass_count_reg[10]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[11] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_4 ),
        .Q(wait_bypass_count_reg[11]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[12] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1_n_7 ),
        .Q(wait_bypass_count_reg[12]),
        .R(clear));
  CARRY4 \wait_bypass_count_reg[12]_i_1 
       (.CI(\wait_bypass_count_reg[8]_i_1_n_0 ),
        .CO(\NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED [3:1],\wait_bypass_count_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,wait_bypass_count_reg[12]}));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[1] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_6 ),
        .Q(wait_bypass_count_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[2] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_5 ),
        .Q(wait_bypass_count_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[3] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_4 ),
        .Q(wait_bypass_count_reg[3]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[4] 
       (.C(p_level_in_d1_cdc_from_reg),
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
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_6 ),
        .Q(wait_bypass_count_reg[5]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[6] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_5 ),
        .Q(wait_bypass_count_reg[6]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[7] 
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_4 ),
        .Q(wait_bypass_count_reg[7]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[8] 
       (.C(p_level_in_d1_cdc_from_reg),
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
       (.C(p_level_in_d1_cdc_from_reg),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_6 ),
        .Q(wait_bypass_count_reg[9]),
        .R(clear));
  LUT3 #(
    .INIT(8'h02)) 
    \wait_time_cnt[0]_i_1 
       (.I0(rx_state[0]),
        .I1(rx_state[1]),
        .I2(rx_state[3]),
        .O(\wait_time_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \wait_time_cnt[0]_i_2 
       (.I0(wait_time_cnt_reg[2]),
        .I1(wait_time_cnt_reg[3]),
        .I2(wait_time_cnt_reg[0]),
        .I3(wait_time_cnt_reg[1]),
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

(* ORIG_REF_NAME = "simplex_rx_aurora_8b10b_0_0_support" *) 
module simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_support
   (m_axi_rx_tdata,
    m_axi_rx_tkeep,
    m_axi_rx_tvalid,
    m_axi_rx_tlast,
    rxp,
    rxn,
    gt_refclk1,
    frame_err,
    rx_hard_err,
    soft_err,
    rx_lane_up,
    rx_channel_up,
    rx_aligned,
    rx_verify,
    rx_reset,
    user_clk_out,
    sync_clk_out,
    gt_reset,
    rx_system_reset,
    power_down,
    loopback,
    tx_lock,
    init_clk_in,
    rx_resetdone_out,
    link_reset_out,
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
  input power_down;
  input [2:0]loopback;
  output tx_lock;
  input init_clk_in;
  output rx_resetdone_out;
  output link_reset_out;
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

  wire \<const1> ;
  wire [8:0]drpaddr_in;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdo_out;
  wire drpen_in;
  wire drprdy_out;
  wire drpwe_in;
  wire frame_err;
  wire gt0_qplllock_out;
  wire gt0_qpllrefclklost_out;
  wire gt_qpllclk_quad1_out;
  wire gt_qpllrefclk_quad1_out;
  wire gt_refclk1;
  wire gt_reset;
  wire gt_reset_out;
  wire gt_reset_sync_init_clk;
  wire init_clk_in;
  wire link_reset_out;
  wire [2:0]loopback;
  wire [0:15]m_axi_rx_tdata;
  wire [1:1]\^m_axi_rx_tkeep ;
  wire m_axi_rx_tlast;
  wire m_axi_rx_tvalid;
  wire pll_not_locked_out;
  wire power_down;
  wire reset_sync_user_clk;
  wire rx_aligned;
  wire rx_channel_up;
  wire rx_hard_err;
  wire rx_lane_up;
  wire rx_reset;
  wire rx_resetdone_out;
  wire rx_system_reset;
  wire rxn;
  wire rxp;
  wire soft_err;
  wire sys_reset_out;
  wire system_reset_i;
  wire tx_lock;
  wire tx_out_clk_i;
  wire user_clk_out;

  assign m_axi_rx_tkeep[0] = \<const1> ;
  assign m_axi_rx_tkeep[1] = \^m_axi_rx_tkeep [1];
  assign rx_verify = rx_channel_up;
  assign sync_clk_out = user_clk_out;
  VCC VCC
       (.P(\<const1> ));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_CLOCK_MODULE clock_module_i
       (.init_clk_in(user_clk_out),
        .tx_out_clk_i(tx_out_clk_i));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt_common_wrapper gt_common_support
       (.gt0_qplllock_out(gt0_qplllock_out),
        .gt0_qpllrefclklost_out(gt0_qpllrefclklost_out),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .init_clk_in(init_clk_in));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync gt_reset_cdc_sync
       (.D(gt_reset_sync_init_clk),
        .gt_reset(gt_reset),
        .init_clk_in(init_clk_in));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_0 reset_sync_user_clk_cdc_sync
       (.D(reset_sync_user_clk),
        .rx_system_reset(rx_system_reset),
        .s_level_out_d6_reg_0(user_clk_out));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_core simplex_rx_aurora_8b10b_0_0_core_i
       (.SR(rx_reset),
        .SYSTEM_RESET_reg(sys_reset_out),
        .drpaddr_in(drpaddr_in),
        .drpclk_in(drpclk_in),
        .drpdi_in(drpdi_in),
        .drpdo_out(drpdo_out),
        .drpen_in(drpen_in),
        .drprdy_out(drprdy_out),
        .drpwe_in(drpwe_in),
        .frame_err(frame_err),
        .gt_qpllclk_quad1_out(gt_qpllclk_quad1_out),
        .gt_qpllrefclk_quad1_out(gt_qpllrefclk_quad1_out),
        .gt_refclk1(gt_refclk1),
        .gt_reset_out(gt_reset_out),
        .in0(system_reset_i),
        .init_clk_in(init_clk_in),
        .init_clk_in_0(tx_lock),
        .link_reset_out(link_reset_out),
        .loopback(loopback),
        .m_axi_rx_tdata(m_axi_rx_tdata),
        .m_axi_rx_tkeep(\^m_axi_rx_tkeep ),
        .m_axi_rx_tlast(m_axi_rx_tlast),
        .m_axi_rx_tvalid(m_axi_rx_tvalid),
        .pll_not_locked_out(pll_not_locked_out),
        .power_down(power_down),
        .rx_aligned(rx_aligned),
        .rx_channel_up(rx_channel_up),
        .rx_hard_err(rx_hard_err),
        .rx_lane_up(rx_lane_up),
        .rx_resetdone_out(rx_resetdone_out),
        .rxn(rxn),
        .rxp(rxp),
        .soft_err(soft_err),
        .storage_v_r_reg(user_clk_out),
        .tx_out_clk_i(tx_out_clk_i));
  simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC support_reset_logic_i
       (.CLK(user_clk_out),
        .D(reset_sync_user_clk),
        .\debounce_gt_rst_r_reg[0]_0 (gt_reset_sync_init_clk),
        .gt_reset_out(gt_reset_out),
        .in0(system_reset_i),
        .init_clk_in(init_clk_in));
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
