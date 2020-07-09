`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2020 05:06:34 PM
// Design Name: 
// Module Name: tb_main
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


module tb_main;
    
    parameter SIM_MAX_TIME = 200000; //To quit the simulation    
        
    // *************************** Transmitter signals ****************************************************
    // AXI RX Interface
    wire [0:15]s_axi_tx_tdata_0;
    wire [0:1]s_axi_tx_tkeep_0;
    wire s_axi_tx_tlast_0;
    wire s_axi_tx_tready_0;
    wire s_axi_tx_tvalid_0;
    
    wire [0:0]txn_0;
    wire [0:0]txp_0;
    
    // Clocks
    reg drpclk_in_tx;
    reg init_clk_in_tx;
    reg gt_refclk1_tx;
    wire user_clk_out_tx;
    
    // Reset
    reg gt_reset_tx;
    reg tx_system_reset_0;
    
    // Simplex Sideband Signals 
    wire tx_aligned_0;
    wire tx_verify_0;
    wire tx_reset_0; 
    
    // Status
    wire tx_channel_up;
    wire tx_hard_err;
    wire pll_not_locked_out_tx;
    wire tx_lane_up;
    wire tx_resetdone_out_0;
    wire tx_lock_tx;
    wire sys_reset_out_tx;
    
    // Control
    reg [2:0] loopback_tx;
    reg power_down_tx;
    
    // *************************** Receiver signals ****************************************************
    // AXI RX Interface
    wire [0:15]m_axi_rx_tdata_0;
    wire [0:1]m_axi_rx_tkeep_0;
    wire m_axi_rx_tlast_0;
    wire m_axi_rx_tvalid_0;
    
    wire [0:0]rxn_0;
    wire [0:0]rxp_0;
    
    // Clocks
    reg drpclk_in_rx;
    reg init_clk_in_rx;
    reg gt_refclk1_rx;
    wire user_clk_out_rx;
    
    // Reset
    reg gt_reset_rx;
    reg rx_system_reset_0;
    
    // Simplex Sideband Signals 
    wire rx_aligned_0;
    wire rx_verify_0;
    wire rx_reset_0;
    
    // Status
    wire rx_channel_up;
    wire rx_hard_err;
    wire frame_err_rx;
    wire pll_not_locked_out_rx;
    wire [0:0]rx_lane_up;
    wire rx_resetdone_out_0;
    wire soft_err_rx;
    wire tx_lock_rx;
    wire sys_reset_out_rx;
    wire link_reset_out_rx;
    
    // Control  
    reg [2:0]loopback_rx;
    reg power_down_rx;
    
    // **************************************** Driver ***********************************************
        // LocalLink TX Interface
    (* mark_debug = "true" *) wire    [0:15]     tx_d_i;
    wire               tx_rem_i;
    wire               tx_src_rdy_n_i;
    wire               tx_sof_n_i;
    wire               tx_eof_n_i;
    wire               tx_dst_rdy_n_i;
    
    
     // **************************************** Monitor ***********************************************
    // LocalLink RX Interface
    (* mark_debug = "true" *) wire    [0:15]     rx_d_i;
    wire               rx_rem_i;
    wire               rx_src_rdy_n_i;
    wire               rx_sof_n_i;
    wire               rx_eof_n_i;
    
    //Frame check signals
    (* mark_debug = "true" *) wire    [0:7]      err_count_i;
    
    //_____________________________ TX AXI SHIM _______________________________
    tx_aurora_8b10b_0_LL_TO_AXI_EXDES #
    (
       .DATA_WIDTH(16),
       .USE_4_NFC (0),
       .STRB_WIDTH(2),
       .REM_WIDTH (1)
    )

    frame_gen_ll_to_axi_pdu_i
    (
     // LocalLink input Interface
     .LL_IP_DATA(tx_d_i),
     .LL_IP_SOF_N(tx_sof_n_i),
     .LL_IP_EOF_N(tx_eof_n_i),
     .LL_IP_REM(tx_rem_i),
     .LL_IP_SRC_RDY_N(tx_src_rdy_n_i),
     .LL_OP_DST_RDY_N(tx_dst_rdy_n_i),

     // AXI4-S output signals
     .AXI4_S_OP_TVALID(s_axi_tx_tvalid_0),
     .AXI4_S_OP_TDATA(s_axi_tx_tdata_0),
     .AXI4_S_OP_TKEEP(s_axi_tx_tkeep_0),
     .AXI4_S_OP_TLAST(s_axi_tx_tlast_0),
     .AXI4_S_IP_TREADY(s_axi_tx_tready_0)
    );
    
    //Connect a frame generator to the TX User interface
    tx_aurora_8b10b_0_FRAME_GEN frame_gen_i
    (
        // User Interface
        .TX_D(tx_d_i), 
        .TX_REM(tx_rem_i),    
        .TX_SOF_N(tx_sof_n_i),      
        .TX_EOF_N(tx_eof_n_i),
        .TX_SRC_RDY_N(tx_src_rdy_n_i),
        .TX_DST_RDY_N(tx_dst_rdy_n_i),


        // System Interface
        .USER_CLK(user_clk_out_tx),      
        .RESET(tx_system_reset_0),
        .CHANNEL_UP(tx_channel_up)	
    );
    
    
    transmitter dut1(
        .s_axi_tx_tdata_0(s_axi_tx_tdata_0),
        .s_axi_tx_tkeep_0(s_axi_tx_tkeep_0),
        .s_axi_tx_tlast_0(s_axi_tx_tlast_0),
        .s_axi_tx_tready_0(s_axi_tx_tready_0),
        .s_axi_tx_tvalid_0(s_axi_tx_tvalid_0),
        .txn_0(txn_0),
        .txp_0(txp_0),
        .drpclk_in_tx(drpclk_in_tx),
        .init_clk_in_tx(init_clk_in_tx),
        .gt_refclk1_tx(gt_refclk1_tx),
        .user_clk_out_tx(user_clk_out_tx),
        .gt_reset_tx(gt_reset_tx),
        .tx_system_reset_0(tx_system_reset_0),
        .tx_aligned_0(tx_aligned_0),
        .tx_verify_0(tx_verify_0),
        .tx_reset_0(tx_reset_0),
        .tx_channel_up(tx_channel_up),
        .tx_hard_err(tx_hard_err),
        .pll_not_locked_out_tx(pll_not_locked_out_tx),
        .tx_lane_up(tx_lane_up),
        .tx_resetdone_out_0(tx_resetdone_out_0),
        .tx_lock_tx(tx_lock_tx),
        .sys_reset_out_tx(sys_reset_out_tx),
        .loopback_tx(loopback_tx),
        .power_down_tx(power_down_tx)
    );
    
    
    receiver dut2(
        .m_axi_rx_tdata_0(m_axi_rx_tdata_0),
        .m_axi_rx_tkeep_0(m_axi_rx_tkeep_0),
        .m_axi_rx_tlast_0(m_axi_rx_tlast_0),
        .m_axi_rx_tvalid_0(m_axi_rx_tvalid_0),
        .rxn_0(rxn_0),
        .rxp_0(rxp_0),
        .drpclk_in_rx(drpclk_in_rx),
        .init_clk_in_rx(init_clk_in_rx),
        .gt_refclk1_rx(gt_refclk1_rx),
        .user_clk_out_rx(user_clk_out_rx),
        .gt_reset_rx(gt_reset_rx),
        .rx_system_reset_0(rx_system_reset_0),
        .rx_aligned_0(rx_aligned_0),
        .rx_verify_0(rx_verify_0),
        .rx_reset_0(rx_reset_0),
        .rx_channel_up(rx_channel_up),
        .rx_hard_err(rx_hard_err),
        .frame_err_rx(frame_err_rx),
        .pll_not_locked_out_rx(pll_not_locked_out_rx),
        .rx_lane_up(rx_lane_up),
        .rx_resetdone_out_0(rx_resetdone_out_0),
        .soft_err_rx(soft_err_rx),
        .tx_lock_rx(tx_lock_rx),
        .sys_reset_out_rx(sys_reset_out_rx),
        .link_reset_out_rx(link_reset_out_rx),
        .loopback_rx(loopback_rx),
        .power_down_rx(power_down_rx)
    );
    
    // *********************** Monitor *****************************
    
    //_____________________________ RX AXI SHIM _______________________________
    aurora_8b10b_0_AXI_TO_LL_EXDES #
    (
       .DATA_WIDTH(16),
       .STRB_WIDTH(2),
       .REM_WIDTH (1)
    )
    frame_chk_axi_to_ll_pdu_i
    (
     // AXI4-S input signals
     .AXI4_S_IP_TX_TVALID(m_axi_rx_tvalid_0),
     .AXI4_S_IP_TX_TREADY(),
     .AXI4_S_IP_TX_TDATA(m_axi_rx_tdata_0),
     .AXI4_S_IP_TX_TKEEP(m_axi_rx_tkeep_0),
     .AXI4_S_IP_TX_TLAST(m_axi_rx_tlast_0),

     // LocalLink output Interface
     .LL_OP_DATA(rx_d_i),
     .LL_OP_SOF_N(rx_sof_n_i),
     .LL_OP_EOF_N(rx_eof_n_i) ,
     .LL_OP_REM(rx_rem_i) ,
     .LL_OP_SRC_RDY_N(rx_src_rdy_n_i),
     .LL_IP_DST_RDY_N(1'b0),

     // System Interface
     .USER_CLK(user_clk_out_rx),      
     .RESET(rx_system_reset_0),
     .CHANNEL_UP(1'b0)//.CHANNEL_UP(tx_channel_up_r)
     );

    aurora_8b10b_0_FRAME_CHECK frame_check_i
    (
        // User Interface
        .RX_D(rx_d_i), 
        .RX_REM(rx_rem_i),    
        .RX_SOF_N(rx_sof_n_i),      
        .RX_EOF_N(rx_eof_n_i),
        .RX_SRC_RDY_N(rx_src_rdy_n_i),
 

        // System Interface
        .USER_CLK(user_clk_out_rx),      
        .RESET(rx_system_reset_0),
        .CHANNEL_UP(rx_channel_up),	
        .ERR_COUNT(err_count_i)
    );
    
    // Initial state
    initial begin
    
        // Transmitter**************************
        drpclk_in_tx = 1'b0;   // Ready
        init_clk_in_tx = 1'b0;  // Ready
        gt_refclk1_tx = 1'b0;   // Ready
        loopback_tx = 3'b000;   // Ready
        power_down_tx = 1'b0;   // Ready
        
        // Receiver *******************************************
        drpclk_in_rx = 1'b0;
        init_clk_in_rx = 1'b0;
        gt_refclk1_rx = 1'b0;
        loopback_rx = 3'b000;
        power_down_rx = 1'b0; 
    end
    
    // rx_system_reset and tx_system_reset_0 initialization sequency
    initial begin
        rx_system_reset_0 = 1'b1;
        tx_system_reset_0 = 1'b1;  
        #1000 rx_system_reset_0 = 1'b0;
        tx_system_reset_0 = 1'b0;
    end
    
    // gt_reset_rx initialization sequency
    initial begin    
        gt_reset_rx = 1'b1;
        #5000;
        gt_reset_rx = 1'b0;
        repeat(10) @(posedge init_clk_in_rx);
        gt_reset_rx = 1'b1;
        repeat(10) @(posedge init_clk_in_rx);
        gt_reset_rx = 1'b0;
    end
    
    // gt_reset_tx initialization sequency
    initial begin    
        gt_reset_tx = 1'b1;
        #5000;
        gt_reset_tx = 1'b0;
        repeat(10) @(posedge init_clk_in_tx);
        gt_reset_tx = 1'b1;
        repeat(10) @(posedge init_clk_in_tx);
        gt_reset_tx = 1'b0;
    end
    
    //_________________________GT Serial Connections________________
    
    assign rxn_0 = txn_0;
    assign rxp_0 = txp_0;
    
    //_________________________Simplex Sideband Connections________________
    assign tx_aligned_0 = rx_aligned_0;
    assign tx_verify_0 = rx_verify_0;
    assign tx_reset_0 = rx_reset_0;
    
    // Clock in transmitter side
    
    always #5 drpclk_in_tx = ~drpclk_in_tx;
    always #5 init_clk_in_tx = ~init_clk_in_tx;
    always #4 gt_refclk1_tx = ~gt_refclk1_tx;
    
    // Clock in transmitter receiver
    always #5 drpclk_in_rx = ~drpclk_in_rx;
    always #5 init_clk_in_rx = ~init_clk_in_rx;
    always #4 gt_refclk1_rx = ~gt_refclk1_rx;
    
    
    always @ (posedge tx_channel_up or posedge rx_channel_up) begin
        if((tx_channel_up == 1'b1) && (rx_channel_up == 1'b1)) begin	 
            $display("\nAURORA_TB : INFO : @Time : %t Both TX_CHANNEL_UP2 and RX_CHANNEL_UP1 are asserted\n", $time);
            #5000 $display("\nAURORA_TB : INFO : Test Completed Successfully\n");
            $finish;
        end
    end
    
    //Abort the simulation when it reaches to max time limit
    initial begin
        #(SIM_MAX_TIME) $display("\nAURORA_TB : INFO : Reached max. simulation time limit\n");
        $finish;
    end
    
    always @ (posedge err_count_i[7]) begin
        if(err_count_i >= 8'b0000_0001) begin	 
            $display("\nAURORA_TB : ERROR : TEST FAIL\n");
            $display("\nAURORA_TB : INFO  : ERR_COUNT1 = %b \n",err_count_i);
            #1000 $display("AURORA_TB : INFO : Exiting from simulation ....\n");
            $finish;
        end 
    end
    
    always @(posedge user_clk_out_tx) begin
        if(s_axi_tx_tvalid_0) begin
            $display("\n At time : %t Data Sent: %h\n", $time, s_axi_tx_tdata_0); 
        end
    end
    
    always @(posedge user_clk_out_rx) begin
        if(m_axi_rx_tvalid_0) begin
            $display("\n At time : %t Data Received: %h\n", $time, m_axi_rx_tdata_0); 
        end
    end
    
endmodule
