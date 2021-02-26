`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2021 04:15:41 PM
// Design Name: 
// Module Name: main_tb
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


// Se envía 3 grupos de 19 datos empezando en 0 y sumandole 4 cada vez
// La bandera tlast se levanta en los valores 72, 148 y 224 el cual es el último dato


module main_tb();
   parameter clock_period = 5.0;
    
   // Inputs
   reg USR_rst;
   reg clk_in_n;
   reg clk_in_p;
   reg reset;
       
   // GTX transceiver
   wire [0:0]txn;
   wire [0:0]txp;
   wire [0:0]rxn;
   wire [0:0]rxp;
  
   // Outputs
   wire channel_up;
   wire locked;

  
  // Internal wires
    wire frame_err;
    wire gt_reset_out;
    wire hard_err;
    wire [0:0]lane_up;
    wire [0:31]m_axi_rx_tdata;
    wire [0:3]m_axi_rx_tkeep;
    wire m_axi_rx_tlast;
    wire m_axi_rx_tvalid;
    wire [0:0]out_rst;
    wire pll_not_locked_out;
    wire rx_resetdone_out;
    wire [0:31]s_axi_tx_tdata;
    wire s_axi_tx_tlast;
    wire s_axi_tx_tready;
    wire s_axi_tx_tvalid;
    wire soft_err;
    wire sync_clk_out;
    wire sys_reset_out;
    wire tx_lock;
    wire tx_resetdone_out;
    wire user_clk_out;
    wire clock_drp;
    wire ref_clk;
    
    // Connection Internal Wires

   	assign m_axi_rx_tdata = UUT.main_i.aurora_8b10b_0_m_axi_rx_tdata; 
    assign m_axi_rx_tkeep = UUT.main_i.aurora_8b10b_0_m_axi_rx_tkeep;
    assign m_axi_rx_tlast = UUT.main_i.aurora_8b10b_0_m_axi_rx_tlast;
    assign m_axi_rx_tvalid = UUT.main_i.aurora_8b10b_0_m_axi_rx_tvalid;
    assign s_axi_tx_tdata = UUT.main_i.FSM_AXI4_0_s_axi_tx_tdata_0;
    assign s_axi_tx_tlast = UUT.main_i.FSM_AXI4_0_s_axi_tx_tlast_0;
    assign s_axi_tx_tready = UUT.main_i.aurora_8b10b_0_s_axi_tx_tready;
    assign s_axi_tx_tvalid = UUT.main_i.FSM_AXI4_0_s_axi_tx_tvalid_0;
    assign sys_reset_out = UUT.main_i.aurora_8b10b_0_sys_reset_out;
    assign soft_err = UUT.main_i.aurora_8b10b_0.soft_err;
    assign sync_clk_out = UUT.main_i.aurora_8b10b_0.sync_clk_out;
    assign tx_lock = UUT.main_i.aurora_8b10b_0.tx_lock;
    assign tx_resetdone_out = UUT.main_i.aurora_8b10b_0.tx_resetdone_out;
    assign user_clk_out = UUT.main_i.aurora_8b10b_0.user_clk_out;
    assign clock_drp = UUT.main_i.clk_wiz_0_clk_out1;
    assign frame_err = UUT.main_i.aurora_8b10b_0.frame_err;
    assign gt_reset_out = UUT.main_i.aurora_8b10b_0.gt_reset_out;
    assign hard_err = UUT.main_i.aurora_8b10b_0.hard_err;
    assign lane_up = UUT.main_i.aurora_8b10b_0.lane_up;
    assign out_rst = UUT.main_i.FSM_Initial_Sequence_0_out_rst;
    assign pll_not_locked_out = UUT.main_i.aurora_8b10b_0.pll_not_locked_out;
    assign rx_resetdone_out = UUT.main_i.aurora_8b10b_0.rx_resetdone_out;
    assign ref_clk = UUT.main_i.clk_wiz_0_clk_out2;
    
  main_wrapper UUT
       (.USR_rst(USR_rst),
        .channel_up(channel_up),
        .clk_in_n(clk_in_n),
        .clk_in_p(clk_in_p),
        .locked(locked),
        .reset(reset),
        .rxn(rxn),
        .rxp(rxp),
        .txn(txn),
        .txp(txp));
   
    // Interconexión de transmición y recepción
    assign rxp = txp;
    assign rxn = txn;

    //Inicialización
    initial begin
        //Relojes
        clk_in_n = 1'b1;
        clk_in_p = 1'b0;
        
        // Secuencia de reseto
        USR_rst = 1'b1;
        reset = 1'b1;
        // Primero se libera el reset del Clock Wizard        
        #(10*clock_period) reset = 1'b0;
        // Reset del sistema
        #(10000) USR_rst = 1'b0;
    end
    
   // Bloque para detener la unidad 10000ns después de que se levanten los canales 
   always @(posedge(channel_up) or posedge(s_axi_tx_tready))
        if(channel_up && s_axi_tx_tready)begin
               #10000; 
               $finish();
        end
          
    //Reloj de entrada
    always
        #(clock_period/2) clk_in_n = ~clk_in_n;
    
    always begin
        #(clock_period/2) clk_in_p = ~clk_in_p;
    end
    
endmodule
