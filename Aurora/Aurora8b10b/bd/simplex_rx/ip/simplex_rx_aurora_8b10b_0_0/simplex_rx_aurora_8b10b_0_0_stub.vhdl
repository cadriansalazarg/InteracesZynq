-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Tue Jul  7 23:44:38 2020
-- Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/carlositcr/Vivado_Projects/Aurora/project_1/project_1.srcs/sources_1/bd/simplex_rx/ip/simplex_rx_aurora_8b10b_0_0/simplex_rx_aurora_8b10b_0_0_stub.vhdl
-- Design      : simplex_rx_aurora_8b10b_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simplex_rx_aurora_8b10b_0_0 is
  Port ( 
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 15 );
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 1 );
    m_axi_rx_tvalid : out STD_LOGIC;
    m_axi_rx_tlast : out STD_LOGIC;
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    frame_err : out STD_LOGIC;
    rx_hard_err : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    rx_lane_up : out STD_LOGIC;
    rx_channel_up : out STD_LOGIC;
    rx_aligned : out STD_LOGIC;
    rx_verify : out STD_LOGIC;
    rx_reset : out STD_LOGIC;
    user_clk_out : out STD_LOGIC;
    sync_clk_out : out STD_LOGIC;
    gt_reset : in STD_LOGIC;
    rx_system_reset : in STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    gt_reset_out : out STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_lock : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    gt0_qplllock_out : out STD_LOGIC;
    gt0_qpllrefclklost_out : out STD_LOGIC;
    gt_qpllclk_quad1_out : out STD_LOGIC;
    gt_qpllrefclk_quad1_out : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC
  );

end simplex_rx_aurora_8b10b_0_0;

architecture stub of simplex_rx_aurora_8b10b_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "m_axi_rx_tdata[0:15],m_axi_rx_tkeep[0:1],m_axi_rx_tvalid,m_axi_rx_tlast,rxp,rxn,gt_refclk1,frame_err,rx_hard_err,soft_err,rx_lane_up,rx_channel_up,rx_aligned,rx_verify,rx_reset,user_clk_out,sync_clk_out,gt_reset,rx_system_reset,sys_reset_out,gt_reset_out,power_down,loopback[2:0],tx_lock,init_clk_in,rx_resetdone_out,link_reset_out,drpclk_in,gt0_qplllock_out,gt0_qpllrefclklost_out,gt_qpllclk_quad1_out,gt_qpllrefclk_quad1_out,pll_not_locked_out";
begin
end;
