///////////////////////////////////////////////////////////////////////////////
// (c) Copyright 2008 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//
///////////////////////////////////////////////////////////////////////////////
//
//  simplex_tx_aurora_8b10b_0_0
//
//
//  Description: This is the top level module for a 1 2-byte lane
//               Simplex Aurora reference design module.
//
//               This is a Simplex TX module.  All GTs are used for
//               transmit only.
//               This module supports the following features:
//
//

`timescale 1 ns / 1 ps
(* core_generation_info = "simplex_tx_aurora_8b10b_0_0,aurora_8b10b_v11_1_6,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=2,c_line_rate=31250,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=true,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=TX-only_Simplex}" *)
module simplex_tx_aurora_8b10b_0_0_core #
 (
     parameter   WATCHDOG_TIMEOUT     =  14,
     parameter   SIM_GTRESET_SPEEDUP =   "TRUE",     // Set to 'TRUE' to speed up sim reset
     parameter CC_FREQ_FACTOR = 5'd24,
     parameter   EXAMPLE_SIMULATION   =   0      
 )
(
    // AXI TX Interface
    s_axi_tx_tdata,
    s_axi_tx_tkeep,
    s_axi_tx_tvalid,
    s_axi_tx_tlast,
    s_axi_tx_tready,




    // GT Serial I/O
    txp,
    txn,

    // GT Reference Clock Interface
    gt_refclk1,

    // Error Detection Interface
    tx_hard_err,

    // Status
    tx_channel_up,
    tx_lane_up,


    // Simplex Sideband Signals
    tx_aligned,
    tx_verify,
    tx_reset,

    // System Interface
    user_clk,
    sync_clk,
    tx_system_reset,
    tx_resetdone_out,
    power_down,
    gt_reset,
    tx_lock,
    init_clk_in,
    pll_not_locked,
drpclk_in,
    drpaddr_in,
    drpdi_in,
    drpdo_out,
    drpen_in,
    drprdy_out,
    drpwe_in,
    tx_out_clk,
//------------------{
//____________________________COMMON PORTS ,_______________________________{
gt0_qplllock_in,
gt0_qpllrefclklost_in,
gt0_qpllreset_out,
gt_qpllclk_quad1_in,
gt_qpllrefclk_quad1_in,
//____________________________COMMON PORTS ,_______________________________}
//------------------}

    sys_reset_out,
    loopback
);


`define DLY #1

//***********************************Port Declarations*******************************
output        sys_reset_out;

//------------------{
//____________________________COMMON PORTS ;_______________________________{
input                     gt0_qplllock_in;
input                     gt0_qpllrefclklost_in;
output                    gt0_qpllreset_out;
input                     gt_qpllclk_quad1_in;
input                     gt_qpllrefclk_quad1_in;
//____________________________COMMON PORTS ;_______________________________}
//------------------}

    // AXI TX Interface
 
input   [0:15]     s_axi_tx_tdata;
input   [0:1]      s_axi_tx_tkeep;
 
input              s_axi_tx_tvalid;
input              s_axi_tx_tlast;

output             s_axi_tx_tready;




output             txp;
output             txn;
    // GT Reference Clock Interface
input              gt_refclk1;

    // Error Detection Interface
output             tx_hard_err;

    // Status
output             tx_channel_up;
output             tx_lane_up;


    // Simplex Sideband Signals
input              tx_aligned;
input              tx_verify;
input              tx_reset;


    // System Interface
input              user_clk;
input              sync_clk;
input              tx_system_reset;
    output             tx_resetdone_out;

input              power_down;
input              gt_reset;
output             tx_lock;    
output             tx_out_clk;
    input              init_clk_in;
    input              pll_not_locked;

    //DRP Ports
input             drpclk_in;  
    input   [8:0]     drpaddr_in;  
    input             drpen_in;  
    input   [15:0]    drpdi_in;  
    output            drprdy_out;  
    output  [15:0]    drpdo_out;  
    input             drpwe_in;  
input   [2:0]      loopback;
//*********************************Wire Declarations**********************************
wire    [15:0]     open_i;

wire               TX1N_OUT_unused;
wire               TX1P_OUT_unused;
wire               RX1N_IN_unused;
wire               RX1P_IN_unused;
wire               ch_bond_done_i_unused;
wire    [1:0]      rx_char_is_comma_i_unused;
wire               rx_buf_err_i_unused;
wire    [1:0]      rx_char_is_k_i_unused;
wire    [15:0]     rx_data_i_unused;
wire    [1:0]      rx_disp_err_i_unused;
wire    [1:0]      rx_not_in_table_i_unused;
wire               rx_realign_i_unused;
wire               tx_buf_err_i_unused;

wire               ch_bond_done_i;
reg                ch_bond_done_r1;
reg                ch_bond_done_r2;
wire               en_chan_sync_i;
wire               ena_comma_align_i;
wire               gen_a_i;
wire               gen_cc_i;
wire               gen_ecp_i;
wire    [0:1]      gen_k_i;
wire               gen_pad_i;
wire    [0:1]      gen_r_i;
wire               gen_scp_i;
wire    [0:1]      gen_v_i;
wire               gtp_rx_reset_i;
wire               gtp_tx_reset_i;
wire               open_rx_rec1_clk_i;
wire               open_rx_rec2_clk_i;
wire               raw_rx_rec_clk_i;
wire               raw_tx_out_clk_i;
wire               rx_buf_err_i;
wire    [1:0]      rx_char_is_comma_i;
wire    [1:0]      rx_char_is_k_i;
wire    [2:0]      rx_clk_cor_cnt_i;
wire    [15:0]     rx_data_i;
wire    [1:0]      rx_disp_err_i;
wire    [1:0]      rx_not_in_table_i;
wire               rx_polarity_i;
wire               rx_realign_i;
wire               rx_rec_clk_i;
wire               tied_to_ground_i;
wire    [63:0]     tied_to_ground_vec_i;
wire               tied_to_vcc_i;
wire               tx_buf_err_i;
wire               tx_channel_up_i;
wire    [1:0]      tx_char_is_k_i;
wire    [15:0]     tx_data_i;
wire               tx_hard_err_i;
wire               tx_lane_up_i;
reg         lane_up_reduce_i;
wire        rst_cc_module_i;
wire               tx_lock_i;
wire               tx_out_clk_i;
wire    [0:15]     tx_pe_data_i;
wire               tx_pe_data_v_i;
wire               tx_reset_lanes_i;
wire               tx_system_reset_c;



wire    [0:15]     tied_to_gnd_vec_i;
    // TX AXI PDU I/F wires
wire    [0:15]     tx_data;
wire               tx_rem_int;
wire               tx_src_rdy;
wire               tx_sof;
wire               tx_eof;
wire               tx_dst_rdy;


wire   gtrxreset_i;
wire   system_reset_i;
wire   tx_lock_comb_i;
wire   tx_resetdone_i;
wire   reset_sync_user_clk;
wire   gt_reset_sync_init_clk;
reg    rxfsm_data_valid_r;
wire do_cc_i;
wire warn_cc;
//*********************************Main Body of Code**********************************

    // Tie off constant signals
    assign          tied_to_gnd_vec_i        = 16'd0;
    assign          tied_to_ground_i         = 1'b0;
    assign          tied_to_ground_vec_i     = 64'd0;
    assign          tied_to_vcc_i            = 1'b1;




    assign          tx_lock     =   tx_lock_comb_i;
    assign          sys_reset_out    =  system_reset_i;



    // Connect global top level signals to their internal equivalents
    assign          tx_channel_up       =   tx_channel_up_i;
    assign          tx_resetdone_out =  tx_resetdone_i;
    assign          tx_system_reset_c   =   system_reset_i || tx_reset;


    //Connect the TXOUTCLK of lane 0 to tx_out_clk
 
assign  tx_out_clk  =   tx_out_clk_i;
 
 

    assign reset_sync_user_clk = tx_system_reset;
    assign gt_reset_sync_init_clk = gt_reset;
   
    // Connect the tx_lock signal to tx_lock_i from lane 0
    assign  tx_lock_comb_i     =  &tx_lock_i;

    // RESET_LOGIC instance
    simplex_tx_aurora_8b10b_0_0_RESET_LOGIC core_reset_logic_i
    (
        .RESET(reset_sync_user_clk),
        .USER_CLK(user_clk),
        .INIT_CLK_IN(init_clk_in),
        .TX_LOCK_IN(tx_lock_comb_i),
        .PLL_NOT_LOCKED(pll_not_locked),
	     .TX_RESETDONE_IN(tx_resetdone_i),
        .LINK_RESET_IN(1'b0),
 
 
        .SYSTEM_RESET(system_reset_i)
    );

 





    // Tie off RX signals to the GT
assign  rx_polarity_i        =   1'b0;
assign  gtp_rx_reset_i       =   1'b0;
assign  ena_comma_align_i    =   1'b0;


    //_________________________Instantiate TX Lane 0______________________________

assign          tx_lane_up =   tx_lane_up_i;

    simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5 tx_aurora_lane_simplex_v5_0_i
    (
        // GT Interface
.TX_BUF_ERR(tx_buf_err_i),
        .TX_K_ERR(2'b00),            // TX_K_ERR not used in V5

        .TX_CHAR_IS_K(tx_char_is_k_i[1:0]),
        .TX_DATA(tx_data_i[15:0]),
.V5_TX_RESET(gtp_tx_reset_i),

        // TX_LL Interface
        .GEN_SCP(gen_scp_i),
        .GEN_ECP(gen_ecp_i),
.GEN_PAD(gen_pad_i),
        .TX_PE_DATA(tx_pe_data_i[0:15]),
.TX_PE_DATA_V(tx_pe_data_v_i),
.GEN_CC(gen_cc_i),

        // Sideband Interface
        .TX_ALIGNED(tx_aligned),

        // Global Logic Interface
.GEN_A(gen_a_i),
        .GEN_K(gen_k_i[0:1]),
        .GEN_R(gen_r_i[0:1]),
        .GEN_V(gen_v_i[0:1]),

.LANE_UP(tx_lane_up_i),
.HARD_ERR(tx_hard_err_i),
        .CHANNEL_UP(tx_channel_up_i),

        // System Interface
        .USER_CLK(user_clk),
        .RESET_SYMGEN(tx_system_reset_c),
.RESET(tx_reset_lanes_i)
    );



    //_________________________Instantiate GT Wrapper ______________________________

    simplex_tx_aurora_8b10b_0_0_GT_WRAPPER #
    (
         .SIM_GTRESET_SPEEDUP (SIM_GTRESET_SPEEDUP),
         .EXAMPLE_SIMULATION         (EXAMPLE_SIMULATION)

    )

    gt_wrapper_i
    (

        .gt0_txresetdone_out                (),
        .gt0_rxresetdone_out                (),
        .gt0_txbufstatus_out                (),
        .gt0_rxbufstatus_out                (),

        // DRP I/F
.DRPCLK_IN                      (drpclk_in),
.DRPADDR_IN                     (drpaddr_in),
.DRPDI_IN                       (drpdi_in),
.DRPDO_OUT                      (drpdo_out),
.DRPEN_IN                       (drpen_in),
.DRPRDY_OUT                     (drprdy_out),
.DRPWE_IN                       (drpwe_in),

        .INIT_CLK_IN                    (init_clk_in),   
	.PLL_NOT_LOCKED                 (pll_not_locked),
        .RXFSM_DATA_VALID            (1'b1),
	.TX_RESETDONE_OUT               (tx_resetdone_i),
	.RX_RESETDONE_OUT               (),
        // Aurora Lane Interface
.RXPOLARITY_IN(rx_polarity_i),
.RXRESET_IN(gtp_rx_reset_i),
.TXCHARISK_IN(tx_char_is_k_i[1:0]),
.TXDATA_IN(tx_data_i[15:0]),
.TXRESET_IN(gtp_tx_reset_i),
.RXDATA_OUT(rx_data_i[15:0]),
.RXNOTINTABLE_OUT(rx_not_in_table_i[1:0]),
.RXDISPERR_OUT(rx_disp_err_i[1:0]),
.RXCHARISK_OUT(rx_char_is_k_i[1:0]),
.RXCHARISCOMMA_OUT(rx_char_is_comma_i[1:0]),
.RXREALIGN_OUT(rx_realign_i),
.RXBUFERR_OUT(rx_buf_err_i),
.TXBUFERR_OUT(tx_buf_err_i),

        // Reset due to channel initialization watchdog timer expiry
        .GTRXRESET_IN(1'b0),

        // reset for hot plug
        .LINK_RESET_IN(1'b0),

        // Phase Align Interface
.ENMCOMMAALIGN_IN(ena_comma_align_i),
.ENPCOMMAALIGN_IN(ena_comma_align_i),
        // Global Logic Interface
.ENCHANSYNC_IN(en_chan_sync_i),
.CHBONDDONE_OUT(ch_bond_done_i),

        // Serial IO
.RX1N_IN(1'b0),
.RX1P_IN(1'b0),
.TX1N_OUT(txn),
.TX1P_OUT(txp),
        // Clocks and Clock Status
        .RXUSRCLK_IN(sync_clk),
        .RXUSRCLK2_IN(user_clk),
        .TXUSRCLK_IN(sync_clk),
        .TXUSRCLK2_IN(user_clk),
        .REFCLK(gt_refclk1),

.TXOUTCLK1_OUT(tx_out_clk_i),
.PLLLKDET_OUT(tx_lock_i),
        // System Interface
        .GTRESET_IN(gt_reset_sync_init_clk),
        .LOOPBACK_IN(loopback),


//------------------{
//____________________________COMMON PORTS ,_______________________________{
.gt0_qplllock_in        (gt0_qplllock_in),
.gt0_qpllrefclklost_in  (gt0_qpllrefclklost_in),
.gt0_qpllreset_out      (gt0_qpllreset_out),
.gt_qpllclk_quad1_in     (gt_qpllclk_quad1_in   ),
.gt_qpllrefclk_quad1_in  (gt_qpllrefclk_quad1_in),
//____________________________COMMON PORTS ,_______________________________}
//------------------}

    .POWERDOWN_IN(power_down)
    );

    

    // Tie off RX Global Logic signals to the GT
    assign  en_chan_sync_i  =   1'b0;


    //_____________________________Instantiate TX Global Logic___________________________

    simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX tx_global_logic_simplex_i
    (
        // Aurora Lane Interface
        .LANE_UP(tx_lane_up_i),
        .HARD_ERR(tx_hard_err_i),

        .GEN_A(gen_a_i),
        .GEN_K(gen_k_i),
        .GEN_R(gen_r_i),
        .GEN_V(gen_v_i),
        .RESET_LANES(tx_reset_lanes_i),

        // Sideband Signal

        .TX_VERIFY(tx_verify),

        // System Interface
        .USER_CLK(user_clk),
        .RESET(tx_system_reset_c),
        .POWER_DOWN(power_down),

        .CHANNEL_UP(tx_channel_up_i),
        .CHANNEL_HARD_ERR(tx_hard_err)
    );

    //_____________________________ TX AXI SHIM _______________________________
    simplex_tx_aurora_8b10b_0_0_AXI_TO_LL #
    (
       .DATA_WIDTH(16),
       .STRB_WIDTH(2),
       .USE_4_NFC (0),
       .REM_WIDTH (1)
    )

    axi_to_ll_pdu_i
    (
     .AXI4_S_IP_TX_TVALID(s_axi_tx_tvalid),
     .AXI4_S_IP_TX_TREADY(s_axi_tx_tready),
     .AXI4_S_IP_TX_TDATA(s_axi_tx_tdata),
     .AXI4_S_IP_TX_TKEEP(s_axi_tx_tkeep),
     .AXI4_S_IP_TX_TLAST(s_axi_tx_tlast),

     .LL_OP_DATA(tx_data),
     .LL_OP_SOF_N(tx_sof),
     .LL_OP_EOF_N(tx_eof),
     .LL_OP_REM(tx_rem_int),
     .LL_OP_SRC_RDY_N(tx_src_rdy),
     .LL_IP_DST_RDY_N(tx_dst_rdy),

     // System Interface
     .USER_CLK(user_clk),
     .RESET(tx_system_reset_c), 
     .CHANNEL_UP(tx_channel_up_i)
    );



    //_____________________________Instantiate TX_LL___________________________

    always @ (posedge user_clk) lane_up_reduce_i <= &tx_lane_up_i;
    assign rst_cc_module_i           =    system_reset_i;

    simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE  #
    (
     .CC_FREQ_FACTOR (CC_FREQ_FACTOR)
    )
    standard_cc_module_i
    (
        .RESET(rst_cc_module_i),
        // Clock Compensation Control Interface
        .WARN_CC(warn_cc),
        .DO_CC(do_cc_i),
        // System Interface
        .PLL_NOT_LOCKED(pll_not_locked),
        .USER_CLK(user_clk)
    );

    simplex_tx_aurora_8b10b_0_0_TX_LL tx_ll_i
    (
        // AXI PDU Interface
        .TX_D(tx_data),
        .TX_REM(tx_rem_int),
        .TX_SRC_RDY_N(tx_src_rdy),
        .TX_SOF_N(tx_sof),
        .TX_EOF_N(tx_eof),
        .TX_DST_RDY_N(tx_dst_rdy),

        // Clock Compenstaion Interface
        .WARN_CC(warn_cc),
        .DO_CC(do_cc_i),

        // Global Logic Interface
        .CHANNEL_UP(tx_channel_up_i),

        // Aurora Lane Interface
        .GEN_SCP(gen_scp_i),
        .GEN_ECP(gen_ecp_i),
        .TX_PE_DATA_V(tx_pe_data_v_i),
        .GEN_PAD(gen_pad_i),
        .TX_PE_DATA(tx_pe_data_i),
        .GEN_CC(gen_cc_i),

        // System Interface
        .USER_CLK(user_clk)
    );



endmodule
