-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Tue Jul  7 23:44:38 2020
-- Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/carlositcr/Vivado_Projects/Aurora/project_1/project_1.srcs/sources_1/bd/simplex_rx/ip/simplex_rx_aurora_8b10b_0_0/simplex_rx_aurora_8b10b_0_0_sim_netlist.vhdl
-- Design      : simplex_rx_aurora_8b10b_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z045ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_CLOCK_MODULE is
  port (
    init_clk_in : out STD_LOGIC;
    tx_out_clk_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_CLOCK_MODULE : entity is "simplex_rx_aurora_8b10b_0_0_CLOCK_MODULE";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_CLOCK_MODULE;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_CLOCK_MODULE is
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of user_clk_buf_i : label is "PRIMITIVE";
begin
user_clk_buf_i: unisim.vcomponents.BUFG
     port map (
      I => tx_out_clk_i,
      O => init_clk_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX is
  port (
    rx_hard_err : out STD_LOGIC;
    rx_aligned : out STD_LOGIC;
    reset_channel_i : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    HARD_ERR : in STD_LOGIC;
    RESET_CHANNEL_reg_0 : in STD_LOGIC;
    rx_lane_up : in STD_LOGIC;
    CHANNEL_SOFT_ERR_reg_0 : in STD_LOGIC;
    power_down : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX : entity is "simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX is
  signal RESET_CHANNEL_i_1_n_0 : STD_LOGIC;
  signal hard_err_r : STD_LOGIC;
  signal lane_up_r : STD_LOGIC;
  signal soft_err_r_reg_srl3_n_0 : STD_LOGIC;
  attribute srl_name : string;
  attribute srl_name of soft_err_r_reg_srl3 : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_err_detect_simplex_i/soft_err_r_reg_srl3 ";
begin
CHANNEL_HARD_ERR_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => RESET_CHANNEL_reg_0,
      CE => '1',
      D => hard_err_r,
      Q => rx_hard_err,
      R => '0'
    );
CHANNEL_SOFT_ERR_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => RESET_CHANNEL_reg_0,
      CE => '1',
      D => soft_err_r_reg_srl3_n_0,
      Q => soft_err,
      R => '0'
    );
RESET_CHANNEL_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => power_down,
      I1 => lane_up_r,
      O => RESET_CHANNEL_i_1_n_0
    );
RESET_CHANNEL_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => RESET_CHANNEL_reg_0,
      CE => '1',
      D => RESET_CHANNEL_i_1_n_0,
      Q => reset_channel_i,
      R => '0'
    );
RX_ALIGNED_reg: unisim.vcomponents.FDRE
     port map (
      C => RESET_CHANNEL_reg_0,
      CE => '1',
      D => lane_up_r,
      Q => rx_aligned,
      R => '0'
    );
hard_err_r_reg: unisim.vcomponents.FDRE
     port map (
      C => RESET_CHANNEL_reg_0,
      CE => '1',
      D => HARD_ERR,
      Q => hard_err_r,
      R => '0'
    );
lane_up_r_reg: unisim.vcomponents.FDRE
     port map (
      C => RESET_CHANNEL_reg_0,
      CE => '1',
      D => rx_lane_up,
      Q => lane_up_r,
      R => '0'
    );
soft_err_r_reg_srl3: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => RESET_CHANNEL_reg_0,
      D => CHANNEL_SOFT_ERR_reg_0,
      Q => soft_err_r_reg_srl3_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    GTRXRESET_OUT : out STD_LOGIC;
    rx_channel_up : out STD_LOGIC;
    START_RX : out STD_LOGIC;
    ready_r_reg0 : out STD_LOGIC;
    \free_count_r_reg[13]_0\ : in STD_LOGIC;
    GOT_V : in STD_LOGIC;
    wait_for_lane_up_r0 : in STD_LOGIC;
    \gtrxreset_extend_r_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    hard_err_reset_i : in STD_LOGIC;
    reset_channel_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX : entity is "simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX is
  signal GTRXRESET_OUT_i_1_n_0 : STD_LOGIC;
  signal GTRXRESET_OUT_i_2_n_0 : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal START_RX0 : STD_LOGIC;
  signal all_lanes_v_r : STD_LOGIC;
  signal bad_v_r : STD_LOGIC;
  signal bad_v_r0 : STD_LOGIC;
  signal \free_count_r[13]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[13]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[13]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[13]_i_5_n_0\ : STD_LOGIC;
  signal \free_count_r[1]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[1]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[5]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[5]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[5]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[5]_i_5_n_0\ : STD_LOGIC;
  signal \free_count_r[9]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[9]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[9]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[9]_i_5_n_0\ : STD_LOGIC;
  signal free_count_r_reg : STD_LOGIC_VECTOR ( 0 to 13 );
  signal \free_count_r_reg[13]_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_1\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_4\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_7\ : STD_LOGIC;
  signal \free_count_r_reg[1]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[1]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[1]_i_1_n_7\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_1\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_4\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_7\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_1\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_4\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_7\ : STD_LOGIC;
  signal got_first_v_r : STD_LOGIC;
  signal got_first_v_r_i_1_n_0 : STD_LOGIC;
  signal gtreset_c : STD_LOGIC;
  signal gtrxreset_extend_r : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gtrxreset_nxt : STD_LOGIC;
  signal next_ready_c : STD_LOGIC;
  signal next_verify_c : STD_LOGIC;
  signal p_2_out : STD_LOGIC_VECTOR ( 31 to 31 );
  signal ready_r : STD_LOGIC;
  signal ready_r2 : STD_LOGIC;
  signal reset_lanes_c : STD_LOGIC;
  signal rxver_count_r0 : STD_LOGIC;
  signal \rxver_count_r_reg[1]_srl2_n_0\ : STD_LOGIC;
  signal \rxver_count_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \v_count_r_reg[30]_srl31_n_0\ : STD_LOGIC;
  signal \v_count_r_reg_n_0_[31]\ : STD_LOGIC;
  signal verify_r : STD_LOGIC;
  signal verify_watchdog_r0 : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_2_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_3_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg_n_0_[15]\ : STD_LOGIC;
  signal wait_for_lane_up_r : STD_LOGIC;
  signal \NLW_free_count_r_reg[1]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_free_count_r_reg[1]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_v_count_r_reg[30]_srl31_Q31_UNCONNECTED\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of got_first_v_r_i_1 : label is "soft_lutpair47";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gtreset_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of gtreset_flop_0_i : label is "FD";
  attribute SOFT_HLUTNM of gtreset_flop_0_i_i_1 : label is "soft_lutpair46";
  attribute BOX_TYPE of reset_lanes_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of reset_lanes_flop_i : label is "FD";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \rxver_count_r_reg[1]_srl2\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/rxver_count_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \rxver_count_r_reg[1]_srl2\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/rxver_count_r_reg[1]_srl2 ";
  attribute srl_bus_name of \v_count_r_reg[30]_srl31\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/v_count_r_reg ";
  attribute srl_name of \v_count_r_reg[30]_srl31\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/v_count_r_reg[30]_srl31 ";
  attribute SOFT_HLUTNM of \v_count_r_reg[30]_srl31_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of verify_r_i_1 : label is "soft_lutpair46";
  attribute srl_bus_name of \verify_watchdog_r_reg[14]_srl15\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/verify_watchdog_r_reg ";
  attribute srl_name of \verify_watchdog_r_reg[14]_srl15\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_global_logic_simplex_i/rx_channel_init_sm_simplex_i/verify_watchdog_r_reg[14]_srl15 ";
begin
  SR(0) <= \^sr\(0);
CHANNEL_UP_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => ready_r2,
      Q => rx_channel_up,
      R => '0'
    );
GTRXRESET_OUT_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => gtrxreset_extend_r(2),
      I1 => gtrxreset_extend_r(3),
      I2 => gtrxreset_extend_r(0),
      I3 => gtrxreset_extend_r(1),
      I4 => GTRXRESET_OUT_i_2_n_0,
      O => GTRXRESET_OUT_i_1_n_0
    );
GTRXRESET_OUT_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => gtrxreset_extend_r(5),
      I1 => gtrxreset_extend_r(4),
      I2 => gtrxreset_extend_r(7),
      I3 => gtrxreset_extend_r(6),
      O => GTRXRESET_OUT_i_2_n_0
    );
GTRXRESET_OUT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => GTRXRESET_OUT_i_1_n_0,
      Q => GTRXRESET_OUT,
      R => '0'
    );
START_RX_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_for_lane_up_r,
      O => START_RX0
    );
START_RX_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => START_RX0,
      Q => START_RX,
      R => \gtrxreset_extend_r_reg[0]_0\(0)
    );
align_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sr\(0),
      I1 => hard_err_reset_i,
      O => ready_r_reg0
    );
all_lanes_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => GOT_V,
      Q => all_lanes_v_r,
      R => '0'
    );
bad_v_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => all_lanes_v_r,
      I1 => got_first_v_r,
      I2 => \v_count_r_reg_n_0_[31]\,
      O => bad_v_r0
    );
bad_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => bad_v_r0,
      Q => bad_v_r,
      R => '0'
    );
\free_count_r[13]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(10),
      O => \free_count_r[13]_i_2_n_0\
    );
\free_count_r[13]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(11),
      O => \free_count_r[13]_i_3_n_0\
    );
\free_count_r[13]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(12),
      O => \free_count_r[13]_i_4_n_0\
    );
\free_count_r[13]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(13),
      O => \free_count_r[13]_i_5_n_0\
    );
\free_count_r[1]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(0),
      O => \free_count_r[1]_i_2_n_0\
    );
\free_count_r[1]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(1),
      O => \free_count_r[1]_i_3_n_0\
    );
\free_count_r[5]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(2),
      O => \free_count_r[5]_i_2_n_0\
    );
\free_count_r[5]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(3),
      O => \free_count_r[5]_i_3_n_0\
    );
\free_count_r[5]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(4),
      O => \free_count_r[5]_i_4_n_0\
    );
\free_count_r[5]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(5),
      O => \free_count_r[5]_i_5_n_0\
    );
\free_count_r[9]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(6),
      O => \free_count_r[9]_i_2_n_0\
    );
\free_count_r[9]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(7),
      O => \free_count_r[9]_i_3_n_0\
    );
\free_count_r[9]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(8),
      O => \free_count_r[9]_i_4_n_0\
    );
\free_count_r[9]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(9),
      O => \free_count_r[9]_i_5_n_0\
    );
\free_count_r_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[1]_i_1_n_6\,
      Q => free_count_r_reg(0),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[13]_i_1_n_4\,
      Q => free_count_r_reg(10),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[13]_i_1_n_5\,
      Q => free_count_r_reg(11),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[13]_i_1_n_6\,
      Q => free_count_r_reg(12),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[13]_i_1_n_7\,
      Q => free_count_r_reg(13),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[13]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \free_count_r_reg[13]_i_1_n_0\,
      CO(2) => \free_count_r_reg[13]_i_1_n_1\,
      CO(1) => \free_count_r_reg[13]_i_1_n_2\,
      CO(0) => \free_count_r_reg[13]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \free_count_r_reg[13]_i_1_n_4\,
      O(2) => \free_count_r_reg[13]_i_1_n_5\,
      O(1) => \free_count_r_reg[13]_i_1_n_6\,
      O(0) => \free_count_r_reg[13]_i_1_n_7\,
      S(3) => \free_count_r[13]_i_2_n_0\,
      S(2) => \free_count_r[13]_i_3_n_0\,
      S(1) => \free_count_r[13]_i_4_n_0\,
      S(0) => \free_count_r[13]_i_5_n_0\
    );
\free_count_r_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[1]_i_1_n_7\,
      Q => free_count_r_reg(1),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[1]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \free_count_r_reg[5]_i_1_n_0\,
      CO(3 downto 1) => \NLW_free_count_r_reg[1]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \free_count_r_reg[1]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3 downto 2) => \NLW_free_count_r_reg[1]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \free_count_r_reg[1]_i_1_n_6\,
      O(0) => \free_count_r_reg[1]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \free_count_r[1]_i_2_n_0\,
      S(0) => \free_count_r[1]_i_3_n_0\
    );
\free_count_r_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[5]_i_1_n_4\,
      Q => free_count_r_reg(2),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[5]_i_1_n_5\,
      Q => free_count_r_reg(3),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[5]_i_1_n_6\,
      Q => free_count_r_reg(4),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[5]_i_1_n_7\,
      Q => free_count_r_reg(5),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[5]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \free_count_r_reg[9]_i_1_n_0\,
      CO(3) => \free_count_r_reg[5]_i_1_n_0\,
      CO(2) => \free_count_r_reg[5]_i_1_n_1\,
      CO(1) => \free_count_r_reg[5]_i_1_n_2\,
      CO(0) => \free_count_r_reg[5]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \free_count_r_reg[5]_i_1_n_4\,
      O(2) => \free_count_r_reg[5]_i_1_n_5\,
      O(1) => \free_count_r_reg[5]_i_1_n_6\,
      O(0) => \free_count_r_reg[5]_i_1_n_7\,
      S(3) => \free_count_r[5]_i_2_n_0\,
      S(2) => \free_count_r[5]_i_3_n_0\,
      S(1) => \free_count_r[5]_i_4_n_0\,
      S(0) => \free_count_r[5]_i_5_n_0\
    );
\free_count_r_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[9]_i_1_n_4\,
      Q => free_count_r_reg(6),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[9]_i_1_n_5\,
      Q => free_count_r_reg(7),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[9]_i_1_n_6\,
      Q => free_count_r_reg(8),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \free_count_r_reg[9]_i_1_n_7\,
      Q => free_count_r_reg(9),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[9]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \free_count_r_reg[13]_i_1_n_0\,
      CO(3) => \free_count_r_reg[9]_i_1_n_0\,
      CO(2) => \free_count_r_reg[9]_i_1_n_1\,
      CO(1) => \free_count_r_reg[9]_i_1_n_2\,
      CO(0) => \free_count_r_reg[9]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \free_count_r_reg[9]_i_1_n_4\,
      O(2) => \free_count_r_reg[9]_i_1_n_5\,
      O(1) => \free_count_r_reg[9]_i_1_n_6\,
      O(0) => \free_count_r_reg[9]_i_1_n_7\,
      S(3) => \free_count_r[9]_i_2_n_0\,
      S(2) => \free_count_r[9]_i_3_n_0\,
      S(1) => \free_count_r[9]_i_4_n_0\,
      S(0) => \free_count_r[9]_i_5_n_0\
    );
got_first_v_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => verify_r,
      I1 => got_first_v_r,
      I2 => all_lanes_v_r,
      O => got_first_v_r_i_1_n_0
    );
got_first_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => got_first_v_r_i_1_n_0,
      Q => got_first_v_r,
      R => '0'
    );
gtreset_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => gtreset_c,
      Q => gtrxreset_nxt,
      R => '0'
    );
gtreset_flop_0_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AE00"
    )
        port map (
      I0 => \verify_watchdog_r_reg_n_0_[15]\,
      I1 => bad_v_r,
      I2 => \rxver_count_r_reg_n_0_[2]\,
      I3 => verify_r,
      O => gtreset_c
    );
\gtrxreset_extend_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => gtrxreset_extend_r(1),
      Q => gtrxreset_extend_r(0),
      R => \gtrxreset_extend_r_reg[0]_0\(0)
    );
\gtrxreset_extend_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => gtrxreset_extend_r(2),
      Q => gtrxreset_extend_r(1),
      R => \gtrxreset_extend_r_reg[0]_0\(0)
    );
\gtrxreset_extend_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => gtrxreset_extend_r(3),
      Q => gtrxreset_extend_r(2),
      R => \gtrxreset_extend_r_reg[0]_0\(0)
    );
\gtrxreset_extend_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => gtrxreset_extend_r(4),
      Q => gtrxreset_extend_r(3),
      R => \gtrxreset_extend_r_reg[0]_0\(0)
    );
\gtrxreset_extend_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => gtrxreset_extend_r(5),
      Q => gtrxreset_extend_r(4),
      R => \gtrxreset_extend_r_reg[0]_0\(0)
    );
\gtrxreset_extend_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => gtrxreset_extend_r(6),
      Q => gtrxreset_extend_r(5),
      R => \gtrxreset_extend_r_reg[0]_0\(0)
    );
\gtrxreset_extend_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => gtrxreset_extend_r(7),
      Q => gtrxreset_extend_r(6),
      R => \gtrxreset_extend_r_reg[0]_0\(0)
    );
\gtrxreset_extend_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => gtrxreset_nxt,
      Q => gtrxreset_extend_r(7),
      R => \gtrxreset_extend_r_reg[0]_0\(0)
    );
ready_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => ready_r,
      Q => ready_r2,
      R => '0'
    );
\ready_r_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \rxver_count_r_reg_n_0_[2]\,
      I1 => verify_r,
      I2 => ready_r,
      O => next_ready_c
    );
ready_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => next_ready_c,
      Q => ready_r,
      R => wait_for_lane_up_r0
    );
reset_lanes_flop_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => reset_lanes_c,
      Q => \^sr\(0),
      R => '0'
    );
reset_lanes_flop_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => \gtrxreset_extend_r_reg[0]_0\(0),
      I1 => reset_channel_i,
      I2 => wait_for_lane_up_r,
      I3 => gtreset_c,
      O => reset_lanes_c
    );
\rxver_count_r_reg[1]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => rxver_count_r0,
      CLK => \free_count_r_reg[13]_0\,
      D => verify_r,
      Q => \rxver_count_r_reg[1]_srl2_n_0\
    );
\rxver_count_r_reg[1]_srl2_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => \v_count_r_reg_n_0_[31]\,
      I1 => all_lanes_v_r,
      I2 => verify_r,
      O => rxver_count_r0
    );
\rxver_count_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => rxver_count_r0,
      D => \rxver_count_r_reg[1]_srl2_n_0\,
      Q => \rxver_count_r_reg_n_0_[2]\,
      R => '0'
    );
\v_count_r_reg[30]_srl31\: unisim.vcomponents.SRLC32E
     port map (
      A(4 downto 0) => B"11110",
      CE => '1',
      CLK => \free_count_r_reg[13]_0\,
      D => p_2_out(31),
      Q => \v_count_r_reg[30]_srl31_n_0\,
      Q31 => \NLW_v_count_r_reg[30]_srl31_Q31_UNCONNECTED\
    );
\v_count_r_reg[30]_srl31_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => got_first_v_r,
      I1 => all_lanes_v_r,
      I2 => verify_r,
      I3 => \v_count_r_reg_n_0_[31]\,
      O => p_2_out(31)
    );
\v_count_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => \v_count_r_reg[30]_srl31_n_0\,
      Q => \v_count_r_reg_n_0_[31]\,
      R => '0'
    );
verify_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \rxver_count_r_reg_n_0_[2]\,
      I1 => verify_r,
      I2 => wait_for_lane_up_r,
      O => next_verify_c
    );
verify_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => next_verify_c,
      Q => verify_r,
      R => wait_for_lane_up_r0
    );
\verify_watchdog_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => verify_watchdog_r0,
      CLK => \free_count_r_reg[13]_0\,
      D => verify_r,
      Q => \verify_watchdog_r_reg[14]_srl15_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0200FFFF"
    )
        port map (
      I0 => \verify_watchdog_r_reg[14]_srl15_i_2_n_0\,
      I1 => free_count_r_reg(12),
      I2 => free_count_r_reg(13),
      I3 => \verify_watchdog_r_reg[14]_srl15_i_3_n_0\,
      I4 => verify_r,
      O => verify_watchdog_r0
    );
\verify_watchdog_r_reg[14]_srl15_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => free_count_r_reg(9),
      I1 => free_count_r_reg(8),
      I2 => free_count_r_reg(11),
      I3 => free_count_r_reg(10),
      I4 => free_count_r_reg(6),
      I5 => free_count_r_reg(7),
      O => \verify_watchdog_r_reg[14]_srl15_i_2_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => free_count_r_reg(3),
      I1 => free_count_r_reg(2),
      I2 => free_count_r_reg(5),
      I3 => free_count_r_reg(4),
      I4 => free_count_r_reg(0),
      I5 => free_count_r_reg(1),
      O => \verify_watchdog_r_reg[14]_srl15_i_3_n_0\
    );
\verify_watchdog_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => verify_watchdog_r0,
      D => \verify_watchdog_r_reg[14]_srl15_n_0\,
      Q => \verify_watchdog_r_reg_n_0_[15]\,
      R => '0'
    );
wait_for_lane_up_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[13]_0\,
      CE => '1',
      D => wait_for_lane_up_r0,
      Q => wait_for_lane_up_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_ERR_DETECT_SIMPLEX_V5 is
  port (
    bucket_full_r : out STD_LOGIC;
    hard_err_reset_i : out STD_LOGIC;
    HARD_ERR : out STD_LOGIC;
    \soft_err_r_reg[1]_0\ : out STD_LOGIC;
    hard_err_flop_r_reg_0 : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    hard_err_flop_r0 : in STD_LOGIC;
    \soft_err_r_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_ERR_DETECT_SIMPLEX_V5 : entity is "simplex_rx_aurora_8b10b_0_0_RX_ERR_DETECT_SIMPLEX_V5";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_ERR_DETECT_SIMPLEX_V5;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_ERR_DETECT_SIMPLEX_V5 is
  signal \/i__n_0\ : STD_LOGIC;
  signal bucket_full_r_i_1_n_0 : STD_LOGIC;
  signal \count_r[0]_i_2_n_0\ : STD_LOGIC;
  signal \count_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \good_count_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \good_count_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \^hard_err_reset_i\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_r[0]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \count_r[1]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \good_count_r[1]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of soft_err_r_reg_srl3_i_1 : label is "soft_lutpair25";
begin
  hard_err_reset_i <= \^hard_err_reset_i\;
\/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => p_0_in(2),
      I1 => \good_count_r_reg_n_0_[1]\,
      I2 => p_0_in(3),
      I3 => p_0_in(4),
      O => \/i__n_0\
    );
HARD_ERR_reg: unisim.vcomponents.FDRE
     port map (
      C => hard_err_flop_r_reg_0,
      CE => '1',
      D => \^hard_err_reset_i\,
      Q => HARD_ERR,
      R => SR(0)
    );
bucket_full_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      O => bucket_full_r_i_1_n_0
    );
bucket_full_r_reg: unisim.vcomponents.FDRE
     port map (
      C => hard_err_flop_r_reg_0,
      CE => '1',
      D => bucket_full_r_i_1_n_0,
      Q => bucket_full_r,
      R => '0'
    );
\count_r[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFEE88"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(3),
      I2 => p_0_in(2),
      I3 => p_0_in(4),
      I4 => p_0_in(1),
      O => \count_r[0]_i_2_n_0\
    );
\count_r[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEABBBEC"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(3),
      I2 => p_0_in(2),
      I3 => p_0_in(4),
      I4 => p_0_in(0),
      O => \count_r[1]_i_1_n_0\
    );
\count_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => hard_err_flop_r_reg_0,
      CE => '1',
      D => \count_r[0]_i_2_n_0\,
      Q => p_0_in(1),
      R => SR(0)
    );
\count_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => hard_err_flop_r_reg_0,
      CE => '1',
      D => \count_r[1]_i_1_n_0\,
      Q => p_0_in(0),
      R => SR(0)
    );
\good_count_r[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1011"
    )
        port map (
      I0 => p_0_in(3),
      I1 => p_0_in(4),
      I2 => p_0_in(2),
      I3 => \good_count_r_reg_n_0_[1]\,
      O => \good_count_r[1]_i_1_n_0\
    );
\good_count_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => hard_err_flop_r_reg_0,
      CE => '1',
      D => \/i__n_0\,
      Q => p_0_in(2),
      R => SR(0)
    );
\good_count_r_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => hard_err_flop_r_reg_0,
      CE => '1',
      D => \good_count_r[1]_i_1_n_0\,
      Q => \good_count_r_reg_n_0_[1]\,
      S => SR(0)
    );
hard_err_flop_r_reg: unisim.vcomponents.FDRE
     port map (
      C => hard_err_flop_r_reg_0,
      CE => '1',
      D => hard_err_flop_r0,
      Q => \^hard_err_reset_i\,
      R => SR(0)
    );
\soft_err_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => hard_err_flop_r_reg_0,
      CE => '1',
      D => \soft_err_r_reg[0]_0\(1),
      Q => p_0_in(4),
      R => SR(0)
    );
\soft_err_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => hard_err_flop_r_reg_0,
      CE => '1',
      D => \soft_err_r_reg[0]_0\(0),
      Q => p_0_in(3),
      R => SR(0)
    );
soft_err_r_reg_srl3_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in(3),
      I1 => p_0_in(4),
      O => \soft_err_r_reg[1]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LANE_INIT_SM_SIMPLEX is
  port (
    rx_lane_up : out STD_LOGIC;
    ready_r : out STD_LOGIC;
    align_r_reg_0 : out STD_LOGIC;
    rx_polarity_i : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    lane_up_flop_i_0 : in STD_LOGIC;
    \counter1_r_reg[0]_0\ : in STD_LOGIC;
    ready_r_reg0 : in STD_LOGIC;
    counter2_r0 : in STD_LOGIC;
    RX_NEG : in STD_LOGIC;
    rx_realign_i : in STD_LOGIC;
    RXDISPERR : in STD_LOGIC_VECTOR ( 1 downto 0 );
    RXNOTINTABLE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    D : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LANE_INIT_SM_SIMPLEX : entity is "simplex_rx_aurora_8b10b_0_0_RX_LANE_INIT_SM_SIMPLEX";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LANE_INIT_SM_SIMPLEX;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LANE_INIT_SM_SIMPLEX is
  signal ENABLE_ERR_DETECT : STD_LOGIC;
  signal RX_CHAR_IS_COMMA_R : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^align_r_reg_0\ : STD_LOGIC;
  signal begin_r : STD_LOGIC;
  signal comma_over_two_cycles_r : STD_LOGIC;
  signal comma_over_two_cycles_r0 : STD_LOGIC;
  signal count_128d_done_r : STD_LOGIC;
  signal count_32d_done_r : STD_LOGIC;
  signal count_8d_done_r : STD_LOGIC;
  signal counter1_r0 : STD_LOGIC;
  signal \counter1_r[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \counter2_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \counter2_r_reg_n_0_[15]\ : STD_LOGIC;
  signal gtp_rx_reset_i : STD_LOGIC;
  signal inc_count_c : STD_LOGIC;
  signal inc_count_c1 : STD_LOGIC;
  signal next_align_c : STD_LOGIC;
  signal next_begin_c : STD_LOGIC;
  signal next_polarity_c : STD_LOGIC;
  signal next_ready_c : STD_LOGIC;
  signal next_realign_c : STD_LOGIC;
  signal next_rst_c : STD_LOGIC;
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal polarity_r : STD_LOGIC;
  signal prev_char_was_comma_r : STD_LOGIC;
  signal \^ready_r\ : STD_LOGIC;
  signal realign_r : STD_LOGIC;
  signal reset_count_r : STD_LOGIC;
  signal reset_count_r0 : STD_LOGIC;
  signal reset_count_r_i_2_n_0 : STD_LOGIC;
  signal \^rx_polarity_i\ : STD_LOGIC;
  signal rx_polarity_r_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of comma_over_two_cycles_r_i_1 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \counter1_r[0]_i_3\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \counter1_r[1]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \counter1_r[3]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \counter1_r[4]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \counter1_r[5]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \counter1_r[6]_i_1\ : label is "soft_lutpair30";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \counter2_r_reg[14]_srl15\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_aurora_lane_simplex_v5_0_i/rx_lane_init_sm_simplex_i/counter2_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \counter2_r_reg[14]_srl15\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/rx_aurora_lane_simplex_v5_0_i/rx_lane_init_sm_simplex_i/counter2_r_reg[14]_srl15 ";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of lane_up_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of lane_up_flop_i : label is "FDR";
  attribute SOFT_HLUTNM of polarity_r_i_1 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of prev_char_was_comma_r_i_1 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of realign_r_i_1 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of reset_count_r_i_2 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of rst_r_i_1 : label is "soft_lutpair26";
begin
  align_r_reg_0 <= \^align_r_reg_0\;
  ready_r <= \^ready_r\;
  rx_polarity_i <= \^rx_polarity_i\;
ENABLE_ERR_DETECT_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => \^ready_r\,
      Q => ENABLE_ERR_DETECT,
      R => '0'
    );
\RX_CHAR_IS_COMMA_R_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => D(0),
      Q => RX_CHAR_IS_COMMA_R(0),
      R => '0'
    );
\RX_CHAR_IS_COMMA_R_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => D(1),
      Q => RX_CHAR_IS_COMMA_R(1),
      R => '0'
    );
align_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => count_8d_done_r,
      I1 => gtp_rx_reset_i,
      I2 => count_128d_done_r,
      I3 => \^align_r_reg_0\,
      O => next_align_c
    );
align_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => next_align_c,
      Q => \^align_r_reg_0\,
      R => ready_r_reg0
    );
begin_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => realign_r,
      I1 => rx_realign_i,
      I2 => \counter2_r_reg_n_0_[15]\,
      I3 => \^ready_r\,
      I4 => polarity_r,
      I5 => RX_NEG,
      O => next_begin_c
    );
begin_r_reg: unisim.vcomponents.FDSE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => next_begin_c,
      Q => begin_r,
      S => ready_r_reg0
    );
comma_over_two_cycles_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56FF"
    )
        port map (
      I0 => prev_char_was_comma_r,
      I1 => RX_CHAR_IS_COMMA_R(0),
      I2 => RX_CHAR_IS_COMMA_R(1),
      I3 => \^align_r_reg_0\,
      O => comma_over_two_cycles_r0
    );
comma_over_two_cycles_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => comma_over_two_cycles_r0,
      Q => comma_over_two_cycles_r,
      R => '0'
    );
\count_r[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ENABLE_ERR_DETECT,
      O => SR(0)
    );
\counter1_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => reset_count_r,
      I1 => \^ready_r\,
      O => counter1_r0
    );
\counter1_r[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => RX_CHAR_IS_COMMA_R(1),
      I1 => RX_CHAR_IS_COMMA_R(0),
      I2 => \^align_r_reg_0\,
      O => inc_count_c
    );
\counter1_r[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[1]\,
      I1 => \counter1_r[0]_i_4_n_0\,
      I2 => count_128d_done_r,
      O => \p_0_in__1\(7)
    );
\counter1_r[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[3]\,
      I1 => \counter1_r_reg_n_0_[5]\,
      I2 => \counter1_r_reg_n_0_[7]\,
      I3 => \counter1_r_reg_n_0_[6]\,
      I4 => count_8d_done_r,
      I5 => count_32d_done_r,
      O => \counter1_r[0]_i_4_n_0\
    );
\counter1_r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \counter1_r[0]_i_4_n_0\,
      I1 => \counter1_r_reg_n_0_[1]\,
      O => \p_0_in__1\(6)
    );
\counter1_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[3]\,
      I1 => \counter1_r_reg_n_0_[5]\,
      I2 => \counter1_r_reg_n_0_[7]\,
      I3 => \counter1_r_reg_n_0_[6]\,
      I4 => count_8d_done_r,
      I5 => count_32d_done_r,
      O => \p_0_in__1\(5)
    );
\counter1_r[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => count_8d_done_r,
      I1 => \counter1_r_reg_n_0_[6]\,
      I2 => \counter1_r_reg_n_0_[7]\,
      I3 => \counter1_r_reg_n_0_[5]\,
      I4 => \counter1_r_reg_n_0_[3]\,
      O => \p_0_in__1\(4)
    );
\counter1_r[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[5]\,
      I1 => \counter1_r_reg_n_0_[7]\,
      I2 => \counter1_r_reg_n_0_[6]\,
      I3 => count_8d_done_r,
      O => \p_0_in__1\(3)
    );
\counter1_r[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[6]\,
      I1 => \counter1_r_reg_n_0_[7]\,
      I2 => \counter1_r_reg_n_0_[5]\,
      O => \p_0_in__1\(2)
    );
\counter1_r[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[7]\,
      I1 => \counter1_r_reg_n_0_[6]\,
      O => \p_0_in__1\(1)
    );
\counter1_r[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[7]\,
      O => \p_0_in__1\(0)
    );
\counter1_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => inc_count_c,
      D => \p_0_in__1\(7),
      Q => count_128d_done_r,
      R => counter1_r0
    );
\counter1_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => inc_count_c,
      D => \p_0_in__1\(6),
      Q => \counter1_r_reg_n_0_[1]\,
      R => counter1_r0
    );
\counter1_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => inc_count_c,
      D => \p_0_in__1\(5),
      Q => count_32d_done_r,
      R => counter1_r0
    );
\counter1_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => inc_count_c,
      D => \p_0_in__1\(4),
      Q => \counter1_r_reg_n_0_[3]\,
      R => counter1_r0
    );
\counter1_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => inc_count_c,
      D => \p_0_in__1\(3),
      Q => count_8d_done_r,
      R => counter1_r0
    );
\counter1_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => inc_count_c,
      D => \p_0_in__1\(2),
      Q => \counter1_r_reg_n_0_[5]\,
      R => counter1_r0
    );
\counter1_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => inc_count_c,
      D => \p_0_in__1\(1),
      Q => \counter1_r_reg_n_0_[6]\,
      R => counter1_r0
    );
\counter1_r_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => inc_count_c,
      D => \p_0_in__1\(0),
      Q => \counter1_r_reg_n_0_[7]\,
      S => counter1_r0
    );
\counter2_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => counter2_r0,
      CLK => \counter1_r_reg[0]_0\,
      D => \^ready_r\,
      Q => \counter2_r_reg[14]_srl15_n_0\
    );
\counter2_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => counter2_r0,
      D => \counter2_r_reg[14]_srl15_n_0\,
      Q => \counter2_r_reg_n_0_[15]\,
      R => '0'
    );
lane_up_flop_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => \^ready_r\,
      Q => rx_lane_up,
      R => lane_up_flop_i_0
    );
polarity_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => rx_realign_i,
      I1 => realign_r,
      I2 => count_32d_done_r,
      O => next_polarity_c
    );
polarity_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => next_polarity_c,
      Q => polarity_r,
      R => ready_r_reg0
    );
prev_char_was_comma_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => RX_CHAR_IS_COMMA_R(0),
      I1 => RX_CHAR_IS_COMMA_R(1),
      O => inc_count_c1
    );
prev_char_was_comma_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => inc_count_c1,
      Q => prev_char_was_comma_r,
      R => '0'
    );
ready_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => RX_NEG,
      I1 => polarity_r,
      I2 => \counter2_r_reg_n_0_[15]\,
      I3 => \^ready_r\,
      O => next_ready_c
    );
ready_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => next_ready_c,
      Q => \^ready_r\,
      R => ready_r_reg0
    );
realign_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888F88"
    )
        port map (
      I0 => count_128d_done_r,
      I1 => \^align_r_reg_0\,
      I2 => count_32d_done_r,
      I3 => realign_r,
      I4 => rx_realign_i,
      O => next_realign_c
    );
realign_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => next_realign_c,
      Q => realign_r,
      R => ready_r_reg0
    );
reset_count_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF3331"
    )
        port map (
      I0 => comma_over_two_cycles_r,
      I1 => gtp_rx_reset_i,
      I2 => RXDISPERR(1),
      I3 => RXNOTINTABLE(1),
      I4 => reset_count_r_i_2_n_0,
      I5 => lane_up_flop_i_0,
      O => reset_count_r0
    );
reset_count_r_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FFAAFC"
    )
        port map (
      I0 => count_8d_done_r,
      I1 => RXNOTINTABLE(0),
      I2 => RXDISPERR(0),
      I3 => gtp_rx_reset_i,
      I4 => begin_r,
      O => reset_count_r_i_2_n_0
    );
reset_count_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => reset_count_r0,
      Q => reset_count_r,
      R => '0'
    );
rst_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => count_8d_done_r,
      I1 => gtp_rx_reset_i,
      I2 => begin_r,
      O => next_rst_c
    );
rst_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => next_rst_c,
      Q => gtp_rx_reset_i,
      R => ready_r_reg0
    );
rx_polarity_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => polarity_r,
      I1 => RX_NEG,
      I2 => \^rx_polarity_i\,
      O => rx_polarity_r_i_1_n_0
    );
rx_polarity_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => rx_polarity_r_i_1_n_0,
      Q => \^rx_polarity_i\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL_PDU_DATAPATH is
  port (
    frame_err : out STD_LOGIC;
    m_axi_rx_tvalid : out STD_LOGIC;
    in_frame_r_reg_0 : out STD_LOGIC;
    storage_v_r : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 15 );
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rx_tlast : out STD_LOGIC;
    RX_EOF_N_reg_0 : in STD_LOGIC;
    storage_v_r_reg_0 : in STD_LOGIC;
    RX_PAD : in STD_LOGIC;
    RX_SRC_RDY_N_reg_inv_0 : in STD_LOGIC;
    in_frame_r_reg_1 : in STD_LOGIC;
    rx_scp_i : in STD_LOGIC;
    rx_ecp_i : in STD_LOGIC;
    rx_pe_data_v_i : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 15 downto 0 );
    START_RX : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL_PDU_DATAPATH : entity is "simplex_rx_aurora_8b10b_0_0_RX_LL_PDU_DATAPATH";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL_PDU_DATAPATH;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL_PDU_DATAPATH is
  signal \FRAME_ERR0__0\ : STD_LOGIC;
  signal \RX_REM[0]_i_1_n_0\ : STD_LOGIC;
  signal \^in_frame_r_reg_0\ : STD_LOGIC;
  signal pad_in_storage_r : STD_LOGIC;
  signal rx_eof : STD_LOGIC;
  signal rx_rem_int : STD_LOGIC;
  signal storage_ce_c : STD_LOGIC;
  signal storage_r : STD_LOGIC_VECTOR ( 0 to 15 );
  signal \^storage_v_r\ : STD_LOGIC;
  signal storage_v_r_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_axi_rx_tkeep[1]_INST_0\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of m_axi_rx_tlast_INST_0 : label is "soft_lutpair48";
begin
  in_frame_r_reg_0 <= \^in_frame_r_reg_0\;
  storage_v_r <= \^storage_v_r\;
FRAME_ERR0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACEC"
    )
        port map (
      I0 => rx_scp_i,
      I1 => rx_ecp_i,
      I2 => \^in_frame_r_reg_0\,
      I3 => \^storage_v_r\,
      O => \FRAME_ERR0__0\
    );
FRAME_ERR_reg: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => \FRAME_ERR0__0\,
      Q => frame_err,
      R => '0'
    );
\RX_D_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(0),
      Q => m_axi_rx_tdata(0),
      R => '0'
    );
\RX_D_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(10),
      Q => m_axi_rx_tdata(10),
      R => '0'
    );
\RX_D_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(11),
      Q => m_axi_rx_tdata(11),
      R => '0'
    );
\RX_D_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(12),
      Q => m_axi_rx_tdata(12),
      R => '0'
    );
\RX_D_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(13),
      Q => m_axi_rx_tdata(13),
      R => '0'
    );
\RX_D_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(14),
      Q => m_axi_rx_tdata(14),
      R => '0'
    );
\RX_D_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(15),
      Q => m_axi_rx_tdata(15),
      R => '0'
    );
\RX_D_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(1),
      Q => m_axi_rx_tdata(1),
      R => '0'
    );
\RX_D_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(2),
      Q => m_axi_rx_tdata(2),
      R => '0'
    );
\RX_D_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(3),
      Q => m_axi_rx_tdata(3),
      R => '0'
    );
\RX_D_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(4),
      Q => m_axi_rx_tdata(4),
      R => '0'
    );
\RX_D_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(5),
      Q => m_axi_rx_tdata(5),
      R => '0'
    );
\RX_D_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(6),
      Q => m_axi_rx_tdata(6),
      R => '0'
    );
\RX_D_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(7),
      Q => m_axi_rx_tdata(7),
      R => '0'
    );
\RX_D_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(8),
      Q => m_axi_rx_tdata(8),
      R => '0'
    );
\RX_D_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_r(9),
      Q => m_axi_rx_tdata(9),
      R => '0'
    );
RX_EOF_N_reg: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => RX_EOF_N_reg_0,
      Q => rx_eof,
      R => '0'
    );
\RX_REM[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pad_in_storage_r,
      O => \RX_REM[0]_i_1_n_0\
    );
\RX_REM_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => \RX_REM[0]_i_1_n_0\,
      Q => rx_rem_int,
      R => '0'
    );
RX_SRC_RDY_N_reg_inv: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => RX_SRC_RDY_N_reg_inv_0,
      Q => m_axi_rx_tvalid,
      R => '0'
    );
in_frame_r_reg: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => in_frame_r_reg_1,
      Q => \^in_frame_r_reg_0\,
      R => '0'
    );
\m_axi_rx_tkeep[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rx_rem_int,
      I1 => rx_eof,
      O => m_axi_rx_tkeep(0)
    );
m_axi_rx_tlast_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rx_eof,
      O => m_axi_rx_tlast
    );
pad_in_storage_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^in_frame_r_reg_0\,
      I1 => rx_pe_data_v_i,
      O => storage_ce_c
    );
pad_in_storage_r_reg: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => RX_PAD,
      Q => pad_in_storage_r,
      R => '0'
    );
\storage_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(15),
      Q => storage_r(0),
      R => '0'
    );
\storage_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(5),
      Q => storage_r(10),
      R => '0'
    );
\storage_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(4),
      Q => storage_r(11),
      R => '0'
    );
\storage_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(3),
      Q => storage_r(12),
      R => '0'
    );
\storage_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(2),
      Q => storage_r(13),
      R => '0'
    );
\storage_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(1),
      Q => storage_r(14),
      R => '0'
    );
\storage_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(0),
      Q => storage_r(15),
      R => '0'
    );
\storage_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(14),
      Q => storage_r(1),
      R => '0'
    );
\storage_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(13),
      Q => storage_r(2),
      R => '0'
    );
\storage_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(12),
      Q => storage_r(3),
      R => '0'
    );
\storage_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(11),
      Q => storage_r(4),
      R => '0'
    );
\storage_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(10),
      Q => storage_r(5),
      R => '0'
    );
\storage_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(9),
      Q => storage_r(6),
      R => '0'
    );
\storage_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(8),
      Q => storage_r(7),
      R => '0'
    );
\storage_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(7),
      Q => storage_r(8),
      R => '0'
    );
\storage_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => storage_ce_c,
      D => D(6),
      Q => storage_r(9),
      R => '0'
    );
storage_v_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88F80000"
    )
        port map (
      I0 => \^in_frame_r_reg_0\,
      I1 => rx_pe_data_v_i,
      I2 => \^storage_v_r\,
      I3 => rx_ecp_i,
      I4 => START_RX,
      O => storage_v_r_i_1_n_0
    );
storage_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => storage_v_r_reg_0,
      CE => '1',
      D => storage_v_r_i_1_n_0,
      Q => \^storage_v_r\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SYM_DEC is
  port (
    RX_NEG : out STD_LOGIC;
    rx_scp_i : out STD_LOGIC;
    RX_ECP_reg_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    GOT_V : out STD_LOGIC;
    RX_PAD : out STD_LOGIC;
    left_aligned_r_reg_0 : out STD_LOGIC;
    rx_pe_data_v_i : out STD_LOGIC;
    in_frame_r_reg : out STD_LOGIC;
    RX_PE_DATA_V_reg_0 : out STD_LOGIC;
    RX_ECP_reg_1 : out STD_LOGIC;
    counter2_r0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \rx_pe_data_r_reg[0]_0\ : in STD_LOGIC;
    \word_aligned_control_bits_r_reg[1]_0\ : in STD_LOGIC;
    \word_aligned_control_bits_r_reg[0]_0\ : in STD_LOGIC;
    first_v_received_r_reg_0 : in STD_LOGIC;
    in_frame_r : in STD_LOGIC;
    START_RX : in STD_LOGIC;
    storage_v_r : in STD_LOGIC;
    left_aligned_r_reg_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    ena_comma_align_i : in STD_LOGIC;
    ready_r : in STD_LOGIC;
    left_aligned_r_reg_2 : in STD_LOGIC;
    rx_channel_up : in STD_LOGIC;
    \word_aligned_data_r_reg[8]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_data_r_reg[0]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SYM_DEC : entity is "simplex_rx_aurora_8b10b_0_0_SYM_DEC";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SYM_DEC;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SYM_DEC is
  signal GOT_V_i_2_n_0 : STD_LOGIC;
  signal RX_CC0 : STD_LOGIC;
  signal RX_ECP_i_1_n_0 : STD_LOGIC;
  signal \^rx_ecp_reg_0\ : STD_LOGIC;
  signal RX_NEG0 : STD_LOGIC;
  signal RX_PAD0 : STD_LOGIC;
  signal RX_PE_DATA_V_i_1_n_0 : STD_LOGIC;
  signal RX_SCP_i_1_n_0 : STD_LOGIC;
  signal RX_SP_i_2_n_0 : STD_LOGIC;
  signal first_v_received_r : STD_LOGIC;
  signal first_v_received_r_i_1_n_0 : STD_LOGIC;
  signal got_v_c : STD_LOGIC;
  signal left_aligned_r_i_1_n_0 : STD_LOGIC;
  signal \^left_aligned_r_reg_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_2_in : STD_LOGIC;
  signal p_5_out : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal prev_beat_sp_d_r05_out : STD_LOGIC;
  signal prev_beat_sp_d_r08_out : STD_LOGIC;
  signal \prev_beat_sp_d_r0__0\ : STD_LOGIC;
  signal prev_beat_sp_d_r16_in : STD_LOGIC;
  signal \prev_beat_sp_d_r1__0\ : STD_LOGIC;
  signal prev_beat_sp_r : STD_LOGIC;
  signal prev_beat_sp_r0 : STD_LOGIC;
  signal prev_beat_v_d_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \prev_beat_v_d_r0__0\ : STD_LOGIC;
  signal prev_beat_v_d_r0_n_0 : STD_LOGIC;
  signal prev_beat_v_r : STD_LOGIC;
  signal prev_beat_v_r0 : STD_LOGIC;
  signal rx_cc_r : STD_LOGIC_VECTOR ( 1 to 3 );
  signal \rx_cc_r0__0\ : STD_LOGIC;
  signal rx_cc_r0_n_0 : STD_LOGIC;
  signal rx_ecp_d_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \rx_ecp_d_r0__0\ : STD_LOGIC;
  signal \rx_ecp_d_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal rx_ecp_d_r0_n_0 : STD_LOGIC;
  signal rx_pad_d_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal \rx_pad_d_r0__0\ : STD_LOGIC;
  signal rx_pad_d_r0_n_0 : STD_LOGIC;
  signal \rx_pe_control_r_reg_n_0_[1]\ : STD_LOGIC;
  signal rx_pe_data_r : STD_LOGIC_VECTOR ( 0 to 15 );
  signal \^rx_pe_data_v_i\ : STD_LOGIC;
  signal rx_scp_d_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \rx_scp_d_r0__0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__1/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__2/i__n_0\ : STD_LOGIC;
  signal \^rx_scp_i\ : STD_LOGIC;
  signal rx_sp_c : STD_LOGIC;
  signal rx_sp_d_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal rx_sp_i : STD_LOGIC;
  signal rx_sp_neg_d_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal rx_spa_neg_d_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal rx_spa_neg_d_r0_n_0 : STD_LOGIC;
  signal \rx_spa_neg_d_r[0]_i_1_n_0\ : STD_LOGIC;
  signal rx_v_d_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \rx_v_d_r0__0\ : STD_LOGIC;
  signal rx_v_d_r0_n_0 : STD_LOGIC;
  signal word_aligned_control_bits_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal \word_aligned_data_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[7]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of GOT_V_i_1 : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of RX_EOF_N_i_1 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of RX_PAD_i_1 : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of RX_PE_DATA_V_i_1 : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of RX_SP_i_1 : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of RX_SRC_RDY_N_inv_i_1 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of prev_beat_sp_d_r0 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \prev_beat_sp_d_r0_inferred__0/i_\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \prev_beat_sp_d_r0_inferred__1/i_\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of prev_beat_sp_d_r1 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \prev_beat_sp_d_r1_inferred__0/i_\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of prev_beat_v_d_r0 : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \prev_beat_v_d_r0_inferred__0/i_\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of rx_cc_r0 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of rx_ecp_d_r0 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \rx_ecp_d_r0_inferred__0/i_\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of rx_pad_d_r0 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \rx_pad_d_r0_inferred__0/i_\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of rx_scp_d_r0 : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__0/i_\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__1/i_\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__2/i_\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \rx_sp_d_r[0]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \rx_sp_d_r[1]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of rx_spa_neg_d_r0 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \rx_spa_neg_d_r[0]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of rx_v_d_r0 : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \rx_v_d_r0_inferred__0/i_\ : label is "soft_lutpair41";
begin
  RX_ECP_reg_0 <= \^rx_ecp_reg_0\;
  left_aligned_r_reg_0 <= \^left_aligned_r_reg_0\;
  rx_pe_data_v_i <= \^rx_pe_data_v_i\;
  rx_scp_i <= \^rx_scp_i\;
GOT_V_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => p_2_in,
      I1 => \rx_pe_control_r_reg_n_0_[1]\,
      I2 => GOT_V_i_2_n_0,
      O => got_v_c
    );
GOT_V_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => prev_beat_v_r,
      I1 => rx_v_d_r(3),
      I2 => rx_v_d_r(2),
      I3 => rx_v_d_r(0),
      I4 => rx_v_d_r(1),
      O => GOT_V_i_2_n_0
    );
GOT_V_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => got_v_c,
      Q => GOT_V,
      R => '0'
    );
RX_CC_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_ecp_d_r(0),
      I1 => rx_ecp_d_r(2),
      I2 => rx_cc_r(3),
      I3 => rx_cc_r(1),
      I4 => p_2_in,
      I5 => \rx_pe_control_r_reg_n_0_[1]\,
      O => RX_CC0
    );
RX_CC_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => RX_CC0,
      Q => D(0),
      R => '0'
    );
RX_ECP_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_ecp_d_r(0),
      I1 => rx_ecp_d_r(2),
      I2 => rx_ecp_d_r(3),
      I3 => rx_ecp_d_r(1),
      I4 => p_2_in,
      I5 => \rx_pe_control_r_reg_n_0_[1]\,
      O => RX_ECP_i_1_n_0
    );
RX_ECP_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => RX_ECP_i_1_n_0,
      Q => \^rx_ecp_reg_0\,
      R => '0'
    );
RX_EOF_N_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rx_ecp_reg_0\,
      O => RX_ECP_reg_1
    );
RX_NEG_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F080808"
    )
        port map (
      I0 => rx_sp_neg_d_r(1),
      I1 => rx_sp_neg_d_r(0),
      I2 => \rx_pe_control_r_reg_n_0_[1]\,
      I3 => rx_spa_neg_d_r(1),
      I4 => rx_spa_neg_d_r(0),
      O => RX_NEG0
    );
RX_NEG_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => RX_NEG0,
      Q => RX_NEG,
      R => '0'
    );
RX_PAD_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => rx_pad_d_r(0),
      I1 => rx_pad_d_r(1),
      I2 => p_2_in,
      I3 => \rx_pe_control_r_reg_n_0_[1]\,
      O => RX_PAD0
    );
RX_PAD_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => RX_PAD0,
      Q => RX_PAD,
      R => '0'
    );
RX_PE_DATA_V_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F08"
    )
        port map (
      I0 => RX_SP_i_2_n_0,
      I1 => GOT_V_i_2_n_0,
      I2 => p_2_in,
      I3 => \rx_pe_control_r_reg_n_0_[1]\,
      O => RX_PE_DATA_V_i_1_n_0
    );
RX_PE_DATA_V_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => RX_PE_DATA_V_i_1_n_0,
      Q => \^rx_pe_data_v_i\,
      R => '0'
    );
\RX_PE_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(0),
      Q => Q(15),
      R => '0'
    );
\RX_PE_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(10),
      Q => Q(5),
      R => '0'
    );
\RX_PE_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(11),
      Q => Q(4),
      R => '0'
    );
\RX_PE_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(12),
      Q => Q(3),
      R => '0'
    );
\RX_PE_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(13),
      Q => Q(2),
      R => '0'
    );
\RX_PE_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(14),
      Q => Q(1),
      R => '0'
    );
\RX_PE_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(15),
      Q => Q(0),
      R => '0'
    );
\RX_PE_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(1),
      Q => Q(14),
      R => '0'
    );
\RX_PE_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(2),
      Q => Q(13),
      R => '0'
    );
\RX_PE_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(3),
      Q => Q(12),
      R => '0'
    );
\RX_PE_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(4),
      Q => Q(11),
      R => '0'
    );
\RX_PE_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(5),
      Q => Q(10),
      R => '0'
    );
\RX_PE_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(6),
      Q => Q(9),
      R => '0'
    );
\RX_PE_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(7),
      Q => Q(8),
      R => '0'
    );
\RX_PE_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(8),
      Q => Q(7),
      R => '0'
    );
\RX_PE_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pe_data_r(9),
      Q => Q(6),
      R => '0'
    );
RX_SCP_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_scp_d_r(1),
      I1 => rx_scp_d_r(0),
      I2 => rx_scp_d_r(3),
      I3 => rx_ecp_d_r(2),
      I4 => p_2_in,
      I5 => \rx_pe_control_r_reg_n_0_[1]\,
      O => RX_SCP_i_1_n_0
    );
RX_SCP_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => RX_SCP_i_1_n_0,
      Q => \^rx_scp_i\,
      R => '0'
    );
RX_SP_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => p_2_in,
      I1 => \rx_pe_control_r_reg_n_0_[1]\,
      I2 => RX_SP_i_2_n_0,
      O => rx_sp_c
    );
RX_SP_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => prev_beat_sp_r,
      I1 => rx_sp_d_r(3),
      I2 => rx_sp_d_r(2),
      I3 => rx_sp_d_r(0),
      I4 => rx_sp_d_r(1),
      O => RX_SP_i_2_n_0
    );
RX_SP_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_sp_c,
      Q => rx_sp_i,
      R => '0'
    );
RX_SRC_RDY_N_inv_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8000000"
    )
        port map (
      I0 => \^rx_pe_data_v_i\,
      I1 => in_frame_r,
      I2 => \^rx_ecp_reg_0\,
      I3 => storage_v_r,
      I4 => START_RX,
      O => RX_PE_DATA_V_reg_0
    );
\counter2_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => rx_sp_i,
      I1 => rx_channel_up,
      I2 => ready_r,
      O => counter2_r0
    );
first_v_received_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => GOT_V_i_2_n_0,
      I1 => \rx_pe_control_r_reg_n_0_[1]\,
      I2 => p_2_in,
      I3 => first_v_received_r,
      O => first_v_received_r_i_1_n_0
    );
first_v_received_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => first_v_received_r_i_1_n_0,
      Q => first_v_received_r,
      R => first_v_received_r_reg_0
    );
in_frame_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F200"
    )
        port map (
      I0 => in_frame_r,
      I1 => \^rx_ecp_reg_0\,
      I2 => \^rx_scp_i\,
      I3 => START_RX,
      O => in_frame_r_reg
    );
left_aligned_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEFFFFF22200000"
    )
        port map (
      I0 => left_aligned_r_reg_1(0),
      I1 => first_v_received_r,
      I2 => ena_comma_align_i,
      I3 => ready_r,
      I4 => left_aligned_r_reg_2,
      I5 => \^left_aligned_r_reg_0\,
      O => left_aligned_r_i_1_n_0
    );
left_aligned_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => left_aligned_r_i_1_n_0,
      Q => \^left_aligned_r_reg_0\,
      R => first_v_received_r_reg_0
    );
prev_beat_sp_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[1]\,
      I1 => \word_aligned_data_r_reg_n_0_[0]\,
      I2 => \word_aligned_data_r_reg_n_0_[2]\,
      I3 => \word_aligned_data_r_reg_n_0_[3]\,
      O => \prev_beat_sp_d_r0__0\
    );
\prev_beat_sp_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1008"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[15]\,
      I1 => \word_aligned_data_r_reg_n_0_[13]\,
      I2 => \word_aligned_data_r_reg_n_0_[14]\,
      I3 => \word_aligned_data_r_reg_n_0_[12]\,
      O => prev_beat_sp_d_r05_out
    );
\prev_beat_sp_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0180"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      I2 => p_0_in(3),
      I3 => p_0_in(2),
      O => prev_beat_sp_d_r08_out
    );
prev_beat_sp_d_r1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[12]\,
      I1 => \word_aligned_data_r_reg_n_0_[14]\,
      I2 => \word_aligned_data_r_reg_n_0_[13]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => \prev_beat_sp_d_r1__0\
    );
\prev_beat_sp_d_r1_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(3),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      O => prev_beat_sp_d_r16_in
    );
prev_beat_sp_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => p_2_in,
      I1 => \rx_pe_control_r_reg_n_0_[1]\,
      I2 => prev_beat_v_d_r(0),
      I3 => rx_scp_d_r(1),
      I4 => rx_sp_d_r(2),
      I5 => rx_sp_d_r(3),
      O => prev_beat_sp_r0
    );
prev_beat_sp_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => prev_beat_sp_r0,
      Q => prev_beat_sp_r,
      R => '0'
    );
prev_beat_v_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[13]\,
      I1 => \word_aligned_data_r_reg_n_0_[14]\,
      I2 => \word_aligned_data_r_reg_n_0_[12]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => prev_beat_v_d_r0_n_0
    );
\prev_beat_v_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      O => \prev_beat_v_d_r0__0\
    );
\prev_beat_v_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \prev_beat_sp_d_r0__0\,
      Q => prev_beat_v_d_r(0),
      R => '0'
    );
prev_beat_v_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => p_2_in,
      I1 => \rx_pe_control_r_reg_n_0_[1]\,
      I2 => prev_beat_v_d_r(0),
      I3 => rx_scp_d_r(1),
      I4 => rx_v_d_r(2),
      I5 => rx_v_d_r(3),
      O => prev_beat_v_r0
    );
prev_beat_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => prev_beat_v_r0,
      Q => prev_beat_v_r,
      R => '0'
    );
rx_cc_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[12]\,
      I1 => \word_aligned_data_r_reg_n_0_[13]\,
      I2 => \word_aligned_data_r_reg_n_0_[14]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => rx_cc_r0_n_0
    );
\rx_cc_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[4]\,
      I1 => \word_aligned_data_r_reg_n_0_[5]\,
      I2 => \word_aligned_data_r_reg_n_0_[6]\,
      I3 => \word_aligned_data_r_reg_n_0_[7]\,
      O => \rx_cc_r0__0\
    );
\rx_cc_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_cc_r0__0\,
      Q => rx_cc_r(1),
      R => '0'
    );
\rx_cc_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_cc_r0_n_0,
      Q => rx_cc_r(3),
      R => '0'
    );
rx_ecp_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[15]\,
      I1 => \word_aligned_data_r_reg_n_0_[13]\,
      I2 => \word_aligned_data_r_reg_n_0_[12]\,
      I3 => \word_aligned_data_r_reg_n_0_[14]\,
      O => rx_ecp_d_r0_n_0
    );
\rx_ecp_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[6]\,
      I1 => \word_aligned_data_r_reg_n_0_[5]\,
      I2 => \word_aligned_data_r_reg_n_0_[4]\,
      I3 => \word_aligned_data_r_reg_n_0_[7]\,
      O => \rx_ecp_d_r0_inferred__0/i__n_0\
    );
\rx_ecp_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[2]\,
      I1 => \word_aligned_data_r_reg_n_0_[3]\,
      I2 => \word_aligned_data_r_reg_n_0_[1]\,
      I3 => \word_aligned_data_r_reg_n_0_[0]\,
      O => \rx_ecp_d_r0__0\
    );
\rx_ecp_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_ecp_d_r0__0\,
      Q => rx_ecp_d_r(0),
      R => '0'
    );
\rx_ecp_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_ecp_d_r0_inferred__0/i__n_0\,
      Q => rx_ecp_d_r(1),
      R => '0'
    );
\rx_ecp_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_scp_d_r0_inferred__1/i__n_0\,
      Q => rx_ecp_d_r(2),
      R => '0'
    );
\rx_ecp_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_ecp_d_r0_n_0,
      Q => rx_ecp_d_r(3),
      R => '0'
    );
rx_pad_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[14]\,
      I1 => \word_aligned_data_r_reg_n_0_[15]\,
      I2 => \word_aligned_data_r_reg_n_0_[13]\,
      I3 => \word_aligned_data_r_reg_n_0_[12]\,
      O => rx_pad_d_r0_n_0
    );
\rx_pad_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(1),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      O => \rx_pad_d_r0__0\
    );
\rx_pad_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_pad_d_r0__0\,
      Q => rx_pad_d_r(0),
      R => '0'
    );
\rx_pad_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_pad_d_r0_n_0,
      Q => rx_pad_d_r(1),
      R => '0'
    );
\rx_pe_control_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => word_aligned_control_bits_r(0),
      Q => p_2_in,
      R => '0'
    );
\rx_pe_control_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => word_aligned_control_bits_r(1),
      Q => \rx_pe_control_r_reg_n_0_[1]\,
      R => '0'
    );
\rx_pe_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[0]\,
      Q => rx_pe_data_r(0),
      R => '0'
    );
\rx_pe_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => p_0_in(1),
      Q => rx_pe_data_r(10),
      R => '0'
    );
\rx_pe_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => p_0_in(0),
      Q => rx_pe_data_r(11),
      R => '0'
    );
\rx_pe_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[12]\,
      Q => rx_pe_data_r(12),
      R => '0'
    );
\rx_pe_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[13]\,
      Q => rx_pe_data_r(13),
      R => '0'
    );
\rx_pe_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[14]\,
      Q => rx_pe_data_r(14),
      R => '0'
    );
\rx_pe_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[15]\,
      Q => rx_pe_data_r(15),
      R => '0'
    );
\rx_pe_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[1]\,
      Q => rx_pe_data_r(1),
      R => '0'
    );
\rx_pe_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[2]\,
      Q => rx_pe_data_r(2),
      R => '0'
    );
\rx_pe_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[3]\,
      Q => rx_pe_data_r(3),
      R => '0'
    );
\rx_pe_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[4]\,
      Q => rx_pe_data_r(4),
      R => '0'
    );
\rx_pe_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[5]\,
      Q => rx_pe_data_r(5),
      R => '0'
    );
\rx_pe_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[6]\,
      Q => rx_pe_data_r(6),
      R => '0'
    );
\rx_pe_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[7]\,
      Q => rx_pe_data_r(7),
      R => '0'
    );
\rx_pe_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => p_0_in(3),
      Q => rx_pe_data_r(8),
      R => '0'
    );
\rx_pe_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => p_0_in(2),
      Q => rx_pe_data_r(9),
      R => '0'
    );
rx_scp_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[6]\,
      I1 => \word_aligned_data_r_reg_n_0_[7]\,
      I2 => \word_aligned_data_r_reg_n_0_[5]\,
      I3 => \word_aligned_data_r_reg_n_0_[4]\,
      O => \rx_scp_d_r0__0\
    );
\rx_scp_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[13]\,
      I1 => \word_aligned_data_r_reg_n_0_[12]\,
      I2 => \word_aligned_data_r_reg_n_0_[14]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => \rx_scp_d_r0_inferred__0/i__n_0\
    );
\rx_scp_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      I2 => p_0_in(2),
      I3 => p_0_in(3),
      O => \rx_scp_d_r0_inferred__1/i__n_0\
    );
\rx_scp_d_r0_inferred__2/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[0]\,
      I1 => \word_aligned_data_r_reg_n_0_[2]\,
      I2 => \word_aligned_data_r_reg_n_0_[1]\,
      I3 => \word_aligned_data_r_reg_n_0_[3]\,
      O => \rx_scp_d_r0_inferred__2/i__n_0\
    );
\rx_scp_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_scp_d_r0_inferred__2/i__n_0\,
      Q => rx_scp_d_r(0),
      R => '0'
    );
\rx_scp_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_scp_d_r0__0\,
      Q => rx_scp_d_r(1),
      R => '0'
    );
\rx_scp_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_scp_d_r0_inferred__0/i__n_0\,
      Q => rx_scp_d_r(3),
      R => '0'
    );
\rx_sp_d_r[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0180"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[3]\,
      I1 => \word_aligned_data_r_reg_n_0_[2]\,
      I2 => \word_aligned_data_r_reg_n_0_[0]\,
      I3 => \word_aligned_data_r_reg_n_0_[1]\,
      O => p_5_out(3)
    );
\rx_sp_d_r[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1008"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[5]\,
      I1 => \word_aligned_data_r_reg_n_0_[7]\,
      I2 => \word_aligned_data_r_reg_n_0_[6]\,
      I3 => \word_aligned_data_r_reg_n_0_[4]\,
      O => p_5_out(2)
    );
\rx_sp_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => p_5_out(3),
      Q => rx_sp_d_r(0),
      R => '0'
    );
\rx_sp_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => p_5_out(2),
      Q => rx_sp_d_r(1),
      R => '0'
    );
\rx_sp_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => prev_beat_sp_d_r08_out,
      Q => rx_sp_d_r(2),
      R => '0'
    );
\rx_sp_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => prev_beat_sp_d_r05_out,
      Q => rx_sp_d_r(3),
      R => '0'
    );
\rx_sp_neg_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => prev_beat_sp_d_r16_in,
      Q => rx_sp_neg_d_r(0),
      R => '0'
    );
\rx_sp_neg_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \prev_beat_sp_d_r1__0\,
      Q => rx_sp_neg_d_r(1),
      R => '0'
    );
rx_spa_neg_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[13]\,
      I1 => \word_aligned_data_r_reg_n_0_[12]\,
      I2 => \word_aligned_data_r_reg_n_0_[14]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => rx_spa_neg_d_r0_n_0
    );
\rx_spa_neg_d_r[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(1),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      O => \rx_spa_neg_d_r[0]_i_1_n_0\
    );
\rx_spa_neg_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_spa_neg_d_r[0]_i_1_n_0\,
      Q => rx_spa_neg_d_r(0),
      R => '0'
    );
\rx_spa_neg_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_spa_neg_d_r0_n_0,
      Q => rx_spa_neg_d_r(1),
      R => '0'
    );
rx_v_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[5]\,
      I1 => \word_aligned_data_r_reg_n_0_[6]\,
      I2 => \word_aligned_data_r_reg_n_0_[4]\,
      I3 => \word_aligned_data_r_reg_n_0_[7]\,
      O => rx_v_d_r0_n_0
    );
\rx_v_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[3]\,
      I1 => \word_aligned_data_r_reg_n_0_[1]\,
      I2 => \word_aligned_data_r_reg_n_0_[0]\,
      I3 => \word_aligned_data_r_reg_n_0_[2]\,
      O => \rx_v_d_r0__0\
    );
\rx_v_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \rx_v_d_r0__0\,
      Q => rx_v_d_r(0),
      R => '0'
    );
\rx_v_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => rx_v_d_r0_n_0,
      Q => rx_v_d_r(1),
      R => '0'
    );
\rx_v_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \prev_beat_v_d_r0__0\,
      Q => rx_v_d_r(2),
      R => '0'
    );
\rx_v_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => prev_beat_v_d_r0_n_0,
      Q => rx_v_d_r(3),
      R => '0'
    );
\word_aligned_control_bits_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_control_bits_r_reg[0]_0\,
      Q => word_aligned_control_bits_r(0),
      R => '0'
    );
\word_aligned_control_bits_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_control_bits_r_reg[1]_0\,
      Q => word_aligned_control_bits_r(1),
      R => '0'
    );
\word_aligned_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[0]_0\(7),
      Q => \word_aligned_data_r_reg_n_0_[0]\,
      R => '0'
    );
\word_aligned_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[8]_0\(5),
      Q => p_0_in(1),
      R => '0'
    );
\word_aligned_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[8]_0\(4),
      Q => p_0_in(0),
      R => '0'
    );
\word_aligned_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[8]_0\(3),
      Q => \word_aligned_data_r_reg_n_0_[12]\,
      R => '0'
    );
\word_aligned_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[8]_0\(2),
      Q => \word_aligned_data_r_reg_n_0_[13]\,
      R => '0'
    );
\word_aligned_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[8]_0\(1),
      Q => \word_aligned_data_r_reg_n_0_[14]\,
      R => '0'
    );
\word_aligned_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[8]_0\(0),
      Q => \word_aligned_data_r_reg_n_0_[15]\,
      R => '0'
    );
\word_aligned_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[0]_0\(6),
      Q => \word_aligned_data_r_reg_n_0_[1]\,
      R => '0'
    );
\word_aligned_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[0]_0\(5),
      Q => \word_aligned_data_r_reg_n_0_[2]\,
      R => '0'
    );
\word_aligned_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[0]_0\(4),
      Q => \word_aligned_data_r_reg_n_0_[3]\,
      R => '0'
    );
\word_aligned_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[0]_0\(3),
      Q => \word_aligned_data_r_reg_n_0_[4]\,
      R => '0'
    );
\word_aligned_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[0]_0\(2),
      Q => \word_aligned_data_r_reg_n_0_[5]\,
      R => '0'
    );
\word_aligned_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[0]_0\(1),
      Q => \word_aligned_data_r_reg_n_0_[6]\,
      R => '0'
    );
\word_aligned_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[0]_0\(0),
      Q => \word_aligned_data_r_reg_n_0_[7]\,
      R => '0'
    );
\word_aligned_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[8]_0\(7),
      Q => p_0_in(3),
      R => '0'
    );
\word_aligned_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \rx_pe_data_r_reg[0]_0\,
      CE => '1',
      D => \word_aligned_data_r_reg[8]_0\(6),
      Q => p_0_in(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_reset : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  D(0) <= s_level_out_d6;
  p_level_in_int <= gt_reset;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_0 is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    rx_system_reset : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_0 : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_0;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_0 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  D(0) <= s_level_out_d6;
  p_level_in_int <= rx_system_reset;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_1 is
  port (
    in0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_1 : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_1;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_1 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  p_level_in_int <= in0;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_5 is
  port (
    \FSM_sequential_rx_state_reg[1]\ : out STD_LOGIC;
    \FSM_sequential_rx_state_reg[1]_0\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg_0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    reset_time_out_reg : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    reset_time_out_reg_0 : in STD_LOGIC;
    recclk_mon_count_reset : in STD_LOGIC;
    reset_time_out_reg_1 : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_1\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_2\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_3\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_4\ : in STD_LOGIC;
    rxresetdone_s3 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_5 : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_5;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_5 is
  signal \FSM_sequential_rx_state[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_6_n_0\ : STD_LOGIC;
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal reset_time_out_i_2_n_0 : STD_LOGIC;
  signal reset_time_out_i_3_n_0 : STD_LOGIC;
  signal reset_time_out_i_4_n_0 : STD_LOGIC;
  signal reset_time_out_i_5_n_0 : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  p_level_in_int <= s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg_0;
\FSM_sequential_rx_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]\,
      I1 => \FSM_sequential_rx_state_reg[0]_0\,
      I2 => \FSM_sequential_rx_state[3]_i_5_n_0\,
      I3 => \FSM_sequential_rx_state[3]_i_6_n_0\,
      I4 => \FSM_sequential_rx_state_reg[0]_1\,
      I5 => reset_time_out_reg,
      O => E(0)
    );
\FSM_sequential_rx_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222000003000000"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]_2\,
      I1 => \FSM_sequential_rx_state_reg[0]_3\,
      I2 => s_level_out_d6,
      I3 => \FSM_sequential_rx_state_reg[0]_4\,
      I4 => Q(0),
      I5 => Q(1),
      O => \FSM_sequential_rx_state[3]_i_5_n_0\
    );
\FSM_sequential_rx_state[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3202000000000000"
    )
        port map (
      I0 => s_level_out_d6,
      I1 => Q(3),
      I2 => Q(2),
      I3 => rxresetdone_s3,
      I4 => Q(1),
      I5 => Q(0),
      O => \FSM_sequential_rx_state[3]_i_6_n_0\
    );
adapt_count_reset_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFF01000100"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => Q(3),
      I3 => Q(0),
      I4 => s_level_out_d6,
      I5 => recclk_mon_count_reset,
      O => \FSM_sequential_rx_state_reg[1]_0\
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
reset_time_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => reset_time_out_reg,
      I1 => reset_time_out_i_2_n_0,
      I2 => Q(1),
      I3 => reset_time_out_i_3_n_0,
      I4 => reset_time_out_i_4_n_0,
      I5 => reset_time_out_reg_0,
      O => \FSM_sequential_rx_state_reg[1]\
    );
reset_time_out_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => Q(1),
      I1 => \FSM_sequential_rx_state_reg[0]_4\,
      I2 => s_level_out_d6,
      I3 => Q(3),
      I4 => Q(2),
      O => reset_time_out_i_2_n_0
    );
reset_time_out_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0B08"
    )
        port map (
      I0 => rxresetdone_s3,
      I1 => Q(2),
      I2 => Q(3),
      I3 => s_level_out_d6,
      O => reset_time_out_i_3_n_0
    );
reset_time_out_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00333333FF00FC88"
    )
        port map (
      I0 => reset_time_out_reg_1,
      I1 => Q(2),
      I2 => reset_time_out_i_5_n_0,
      I3 => Q(0),
      I4 => Q(1),
      I5 => Q(3),
      O => reset_time_out_i_4_n_0
    );
reset_time_out_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]_4\,
      I1 => s_level_out_d6,
      O => reset_time_out_i_5_n_0
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_6 is
  port (
    mmcm_lock_reclocked_reg : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    init_clk_in : in STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    mmcm_lock_reclocked_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_6 : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_6;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_6 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
\mmcm_lock_count[9]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_level_out_d6,
      O => SR(0)
    );
mmcm_lock_reclocked_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => mmcm_lock_reclocked,
      I1 => mmcm_lock_reclocked_reg_0,
      I2 => s_level_out_d6,
      O => mmcm_lock_reclocked_reg
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_7 is
  port (
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_7 : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_7;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_7 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0\ is
  port (
    AS : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_reset_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0\ : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0\;

architecture STRUCTURE of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  AS(0) <= s_level_out_d6;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => gt_reset_out,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\ is
  port (
    \out\ : out STD_LOGIC;
    time_out_wait_bypass : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg_0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\ : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\;

architecture STRUCTURE of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d6;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg_0,
      CE => '1',
      D => time_out_wait_bypass,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_11\ is
  port (
    \out\ : out STD_LOGIC;
    link_reset_r : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_11\ : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_11\;

architecture STRUCTURE of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_11\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d6;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_12\ is
  port (
    \out\ : out STD_LOGIC;
    tx_lock_comb_r : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_12\ : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_12\;

architecture STRUCTURE of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_12\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d6;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => tx_lock_comb_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\ is
  port (
    \out\ : out STD_LOGIC;
    rx_cc_extend_r2 : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg_0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\ : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\;

architecture STRUCTURE of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d6;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg_0,
      CE => '1',
      D => rx_cc_extend_r2,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_3\ is
  port (
    \out\ : out STD_LOGIC;
    GTRXRESET_OUT : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg_0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_3\ : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_3\;

architecture STRUCTURE of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_3\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d6;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg_0,
      CE => '1',
      D => GTRXRESET_OUT,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_4\ is
  port (
    \out\ : out STD_LOGIC;
    rxfsm_rxresetdone_r : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg_0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_4\ : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_4\;

architecture STRUCTURE of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_4\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d6;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg_0,
      CE => '1',
      D => rxfsm_rxresetdone_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\ is
  port (
    \out\ : out STD_LOGIC;
    run_phase_alignment_int : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\ : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\;

architecture STRUCTURE of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d6;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => run_phase_alignment_int,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\ is
  port (
    \out\ : out STD_LOGIC;
    rx_fsm_reset_done_int : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\ : entity is "simplex_rx_aurora_8b10b_0_0_cdc_sync";
end \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\;

architecture STRUCTURE of \simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d6;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_rx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_fsm_reset_done_int,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt is
  port (
    init_clk_in_0 : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    rx_realign_i : out STD_LOGIC;
    init_clk_in_1 : out STD_LOGIC;
    tx_out_clk_i : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RXDISPERR : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RXNOTINTABLE : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ack_flag : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC;
    left_aligned_r_reg : out STD_LOGIC;
    left_aligned_r_reg_0 : out STD_LOGIC;
    init_clk_in_2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    init_clk_in_3 : out STD_LOGIC;
    hard_err_flop_r0 : out STD_LOGIC;
    left_aligned_r_reg_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    left_aligned_r_reg_2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC;
    drpwe_in : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_tx_reset_i : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt_qpllclk_quad1_out : in STD_LOGIC;
    gt_qpllrefclk_quad1_out : in STD_LOGIC;
    gt_rxdfelfhold_i : in STD_LOGIC;
    ena_comma_align_i : in STD_LOGIC;
    rx_polarity_i : in STD_LOGIC;
    gt_rxuserrdy_i : in STD_LOGIC;
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    flag2_reg_0 : in STD_LOGIC;
    cpll_reset_i : in STD_LOGIC;
    \word_aligned_control_bits_r_reg[1]\ : in STD_LOGIC;
    bucket_full_r : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt : entity is "simplex_rx_aurora_8b10b_0_0_gt";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt is
  signal \^d\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^rxdisperr\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^rxnotintable\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^ack_flag\ : STD_LOGIC;
  signal ack_flag_i_1_n_0 : STD_LOGIC;
  signal ack_sync1 : STD_LOGIC;
  signal ack_sync2 : STD_LOGIC;
  signal ack_sync3 : STD_LOGIC;
  signal ack_sync4 : STD_LOGIC;
  signal ack_sync5 : STD_LOGIC;
  signal ack_sync6 : STD_LOGIC;
  signal cpll_pd_i : STD_LOGIC;
  signal cpll_reset_i_0 : STD_LOGIC;
  signal \cpllpd_wait_reg[31]_srl32_n_1\ : STD_LOGIC;
  signal \cpllpd_wait_reg[63]_srl32_n_1\ : STD_LOGIC;
  signal \cpllpd_wait_reg[94]_srl31_n_0\ : STD_LOGIC;
  signal cpllreset_ovrd_i : STD_LOGIC;
  signal \cpllreset_wait_reg[126]_srl31_n_0\ : STD_LOGIC;
  signal \cpllreset_wait_reg[31]_srl32_n_1\ : STD_LOGIC;
  signal \cpllreset_wait_reg[63]_srl32_n_1\ : STD_LOGIC;
  signal \cpllreset_wait_reg[95]_srl32_n_1\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal data_sync6 : STD_LOGIC;
  signal flag : STD_LOGIC;
  signal flag2 : STD_LOGIC;
  signal flag_i_1_n_0 : STD_LOGIC;
  signal gt_pllrefclklost_i : STD_LOGIC;
  signal gtxe2_i_n_0 : STD_LOGIC;
  signal gtxe2_i_n_11 : STD_LOGIC;
  signal gtxe2_i_n_16 : STD_LOGIC;
  signal gtxe2_i_n_170 : STD_LOGIC;
  signal gtxe2_i_n_171 : STD_LOGIC;
  signal gtxe2_i_n_172 : STD_LOGIC;
  signal gtxe2_i_n_173 : STD_LOGIC;
  signal gtxe2_i_n_174 : STD_LOGIC;
  signal gtxe2_i_n_175 : STD_LOGIC;
  signal gtxe2_i_n_176 : STD_LOGIC;
  signal gtxe2_i_n_177 : STD_LOGIC;
  signal gtxe2_i_n_178 : STD_LOGIC;
  signal gtxe2_i_n_179 : STD_LOGIC;
  signal gtxe2_i_n_180 : STD_LOGIC;
  signal gtxe2_i_n_181 : STD_LOGIC;
  signal gtxe2_i_n_182 : STD_LOGIC;
  signal gtxe2_i_n_183 : STD_LOGIC;
  signal gtxe2_i_n_184 : STD_LOGIC;
  signal gtxe2_i_n_23 : STD_LOGIC;
  signal gtxe2_i_n_27 : STD_LOGIC;
  signal gtxe2_i_n_38 : STD_LOGIC;
  signal gtxe2_i_n_39 : STD_LOGIC;
  signal gtxe2_i_n_4 : STD_LOGIC;
  signal gtxe2_i_n_45 : STD_LOGIC;
  signal gtxe2_i_n_6 : STD_LOGIC;
  signal gtxe2_i_n_7 : STD_LOGIC;
  signal gtxe2_i_n_78 : STD_LOGIC;
  signal gtxe2_i_n_79 : STD_LOGIC;
  signal gtxe2_i_n_80 : STD_LOGIC;
  signal gtxe2_i_n_81 : STD_LOGIC;
  signal gtxe2_i_n_83 : STD_LOGIC;
  signal gtxe2_i_n_84 : STD_LOGIC;
  signal gtxe2_i_n_9 : STD_LOGIC;
  signal \^init_clk_in_0\ : STD_LOGIC;
  signal rx_buf_err_i : STD_LOGIC;
  signal rx_char_is_k_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rx_data_i : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^rx_realign_i\ : STD_LOGIC;
  signal \NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_PHYSTATUS_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCHANBONDSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCHANISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCHANREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXDATAVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXELECIDLE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gtxe2_i_RXCHARISK_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gtxe2_i_RXCHBONDO_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtxe2_i_RXDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 16 );
  signal NLW_gtxe2_i_RXDISPERR_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gtxe2_i_RXHEADER_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtxe2_i_RXSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gtxe2_i_TSTOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of ack_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of ack_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of ack_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of ack_sync_reg1 : label is "FD";
  attribute ASYNC_REG of ack_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of ack_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of ack_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of ack_sync_reg2 : label is "FD";
  attribute ASYNC_REG of ack_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of ack_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of ack_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of ack_sync_reg3 : label is "FD";
  attribute ASYNC_REG of ack_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of ack_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of ack_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of ack_sync_reg4 : label is "FD";
  attribute ASYNC_REG of ack_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of ack_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of ack_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of ack_sync_reg5 : label is "FD";
  attribute ASYNC_REG of ack_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of ack_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of ack_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of ack_sync_reg6 : label is "FD";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \cpllpd_wait_reg[31]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg ";
  attribute srl_name : string;
  attribute srl_name of \cpllpd_wait_reg[31]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg[31]_srl32 ";
  attribute srl_bus_name of \cpllpd_wait_reg[63]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg ";
  attribute srl_name of \cpllpd_wait_reg[63]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg[63]_srl32 ";
  attribute srl_bus_name of \cpllpd_wait_reg[94]_srl31\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg ";
  attribute srl_name of \cpllpd_wait_reg[94]_srl31\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllpd_wait_reg[94]_srl31 ";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \cpllpd_wait_reg[95]\ : label is "no";
  attribute srl_bus_name of \cpllreset_wait_reg[126]_srl31\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[126]_srl31\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg[126]_srl31 ";
  attribute equivalent_register_removal of \cpllreset_wait_reg[127]\ : label is "no";
  attribute srl_bus_name of \cpllreset_wait_reg[31]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[31]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg[31]_srl32 ";
  attribute srl_bus_name of \cpllreset_wait_reg[63]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[63]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg[63]_srl32 ";
  attribute srl_bus_name of \cpllreset_wait_reg[95]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[95]_srl32\ : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_rx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_rx_aurora_8b10b_0_0_i/cpllreset_wait_reg[95]_srl32 ";
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute BOX_TYPE of gtxe2_i : label is "PRIMITIVE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of left_aligned_r_i_2 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \word_aligned_control_bits_r[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \word_aligned_control_bits_r[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \word_aligned_data_r[10]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \word_aligned_data_r[11]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \word_aligned_data_r[12]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \word_aligned_data_r[13]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \word_aligned_data_r[14]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \word_aligned_data_r[15]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \word_aligned_data_r[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \word_aligned_data_r[2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \word_aligned_data_r[3]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \word_aligned_data_r[4]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \word_aligned_data_r[5]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \word_aligned_data_r[6]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \word_aligned_data_r[7]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \word_aligned_data_r[8]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \word_aligned_data_r[9]_i_1\ : label is "soft_lutpair18";
begin
  D(1 downto 0) <= \^d\(1 downto 0);
  RXDISPERR(1 downto 0) <= \^rxdisperr\(1 downto 0);
  RXNOTINTABLE(1 downto 0) <= \^rxnotintable\(1 downto 0);
  ack_flag <= \^ack_flag\;
  init_clk_in_0 <= \^init_clk_in_0\;
  rx_realign_i <= \^rx_realign_i\;
ack_flag_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF90"
    )
        port map (
      I0 => ack_sync6,
      I1 => ack_sync5,
      I2 => \^ack_flag\,
      I3 => flag2,
      O => ack_flag_i_1_n_0
    );
ack_flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => ack_flag_i_1_n_0,
      Q => \^ack_flag\,
      R => '0'
    );
ack_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => data_sync6,
      Q => ack_sync1,
      R => '0'
    );
ack_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => ack_sync1,
      Q => ack_sync2,
      R => '0'
    );
ack_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => ack_sync2,
      Q => ack_sync3,
      R => '0'
    );
ack_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => ack_sync3,
      Q => ack_sync4,
      R => '0'
    );
ack_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => ack_sync4,
      Q => ack_sync5,
      R => '0'
    );
ack_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => ack_sync5,
      Q => ack_sync6,
      R => '0'
    );
\cpll_reset_i__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F6"
    )
        port map (
      I0 => data_sync5,
      I1 => data_sync6,
      I2 => cpllreset_ovrd_i,
      O => cpll_reset_i_0
    );
\cpllpd_wait_reg[31]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"FFFFFFFF"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1,
      D => '0',
      Q => \NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllpd_wait_reg[31]_srl32_n_1\
    );
\cpllpd_wait_reg[63]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"FFFFFFFF"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1,
      D => \cpllpd_wait_reg[31]_srl32_n_1\,
      Q => \NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllpd_wait_reg[63]_srl32_n_1\
    );
\cpllpd_wait_reg[94]_srl31\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      A(4 downto 0) => B"11110",
      CE => '1',
      CLK => gt_refclk1,
      D => \cpllpd_wait_reg[63]_srl32_n_1\,
      Q => \cpllpd_wait_reg[94]_srl31_n_0\,
      Q31 => \NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED\
    );
\cpllpd_wait_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gt_refclk1,
      CE => '1',
      D => \cpllpd_wait_reg[94]_srl31_n_0\,
      Q => cpll_pd_i,
      R => '0'
    );
\cpllreset_wait_reg[126]_srl31\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => B"11110",
      CE => '1',
      CLK => gt_refclk1,
      D => \cpllreset_wait_reg[95]_srl32_n_1\,
      Q => \cpllreset_wait_reg[126]_srl31_n_0\,
      Q31 => \NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED\
    );
\cpllreset_wait_reg[127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt_refclk1,
      CE => '1',
      D => \cpllreset_wait_reg[126]_srl31_n_0\,
      Q => cpllreset_ovrd_i,
      R => '0'
    );
\cpllreset_wait_reg[31]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"000000FF"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1,
      D => '0',
      Q => \NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllreset_wait_reg[31]_srl32_n_1\
    );
\cpllreset_wait_reg[63]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1,
      D => \cpllreset_wait_reg[31]_srl32_n_1\,
      Q => \NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllreset_wait_reg[63]_srl32_n_1\
    );
\cpllreset_wait_reg[95]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1,
      D => \cpllreset_wait_reg[63]_srl32_n_1\,
      Q => \NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllreset_wait_reg[95]_srl32_n_1\
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt_refclk1,
      CE => '1',
      D => flag,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt_refclk1,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt_refclk1,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt_refclk1,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt_refclk1,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt_refclk1,
      CE => '1',
      D => data_sync5,
      Q => data_sync6,
      R => '0'
    );
flag2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => flag2_reg_0,
      Q => flag2,
      R => '0'
    );
flag_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => \^ack_flag\,
      I1 => cpll_reset_i,
      I2 => flag,
      O => flag_i_1_n_0
    );
flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => flag_i_1_n_0,
      Q => flag,
      R => '0'
    );
gtxe2_i: unisim.vcomponents.GTXE2_CHANNEL
    generic map(
      ALIGN_COMMA_DOUBLE => "FALSE",
      ALIGN_COMMA_ENABLE => B"1111111111",
      ALIGN_COMMA_WORD => 2,
      ALIGN_MCOMMA_DET => "TRUE",
      ALIGN_MCOMMA_VALUE => B"1010000011",
      ALIGN_PCOMMA_DET => "TRUE",
      ALIGN_PCOMMA_VALUE => B"0101111100",
      CBCC_DATA_SOURCE_SEL => "DECODED",
      CHAN_BOND_KEEP_ALIGN => "FALSE",
      CHAN_BOND_MAX_SKEW => 7,
      CHAN_BOND_SEQ_1_1 => B"0101111100",
      CHAN_BOND_SEQ_1_2 => B"0000000000",
      CHAN_BOND_SEQ_1_3 => B"0000000000",
      CHAN_BOND_SEQ_1_4 => B"0000000000",
      CHAN_BOND_SEQ_1_ENABLE => B"0001",
      CHAN_BOND_SEQ_2_1 => B"0000000000",
      CHAN_BOND_SEQ_2_2 => B"0000000000",
      CHAN_BOND_SEQ_2_3 => B"0000000000",
      CHAN_BOND_SEQ_2_4 => B"0000000000",
      CHAN_BOND_SEQ_2_ENABLE => B"0000",
      CHAN_BOND_SEQ_2_USE => "FALSE",
      CHAN_BOND_SEQ_LEN => 1,
      CLK_CORRECT_USE => "TRUE",
      CLK_COR_KEEP_IDLE => "FALSE",
      CLK_COR_MAX_LAT => 17,
      CLK_COR_MIN_LAT => 12,
      CLK_COR_PRECEDENCE => "TRUE",
      CLK_COR_REPEAT_WAIT => 0,
      CLK_COR_SEQ_1_1 => B"0111110111",
      CLK_COR_SEQ_1_2 => B"0111110111",
      CLK_COR_SEQ_1_3 => B"0100000000",
      CLK_COR_SEQ_1_4 => B"0100000000",
      CLK_COR_SEQ_1_ENABLE => B"1111",
      CLK_COR_SEQ_2_1 => B"0100000000",
      CLK_COR_SEQ_2_2 => B"0100000000",
      CLK_COR_SEQ_2_3 => B"0100000000",
      CLK_COR_SEQ_2_4 => B"0100000000",
      CLK_COR_SEQ_2_ENABLE => B"1111",
      CLK_COR_SEQ_2_USE => "FALSE",
      CLK_COR_SEQ_LEN => 2,
      CPLL_CFG => X"BC07DC",
      CPLL_FBDIV => 5,
      CPLL_FBDIV_45 => 5,
      CPLL_INIT_CFG => X"00001E",
      CPLL_LOCK_CFG => X"01E8",
      CPLL_REFCLK_DIV => 1,
      DEC_MCOMMA_DETECT => "TRUE",
      DEC_PCOMMA_DETECT => "TRUE",
      DEC_VALID_COMMA_ONLY => "FALSE",
      DMONITOR_CFG => X"000A00",
      ES_CONTROL => B"000000",
      ES_ERRDET_EN => "FALSE",
      ES_EYE_SCAN_EN => "TRUE",
      ES_HORZ_OFFSET => X"000",
      ES_PMA_CFG => B"0000000000",
      ES_PRESCALE => B"00000",
      ES_QUALIFIER => X"00000000000000000000",
      ES_QUAL_MASK => X"00000000000000000000",
      ES_SDATA_MASK => X"00000000000000000000",
      ES_VERT_OFFSET => B"000000000",
      FTS_DESKEW_SEQ_ENABLE => B"1111",
      FTS_LANE_DESKEW_CFG => B"1111",
      FTS_LANE_DESKEW_EN => "FALSE",
      GEARBOX_MODE => B"000",
      IS_CPLLLOCKDETCLK_INVERTED => '0',
      IS_DRPCLK_INVERTED => '0',
      IS_GTGREFCLK_INVERTED => '0',
      IS_RXUSRCLK2_INVERTED => '0',
      IS_RXUSRCLK_INVERTED => '0',
      IS_TXPHDLYTSTCLK_INVERTED => '0',
      IS_TXUSRCLK2_INVERTED => '0',
      IS_TXUSRCLK_INVERTED => '0',
      OUTREFCLK_SEL_INV => B"11",
      PCS_PCIE_EN => "FALSE",
      PCS_RSVD_ATTR => X"000000000000",
      PD_TRANS_TIME_FROM_P2 => X"03C",
      PD_TRANS_TIME_NONE_P2 => X"19",
      PD_TRANS_TIME_TO_P2 => X"64",
      PMA_RSV => X"00018480",
      PMA_RSV2 => X"2050",
      PMA_RSV3 => B"00",
      PMA_RSV4 => X"00000000",
      RXBUFRESET_TIME => B"00001",
      RXBUF_ADDR_MODE => "FULL",
      RXBUF_EIDLE_HI_CNT => B"1000",
      RXBUF_EIDLE_LO_CNT => B"0000",
      RXBUF_EN => "TRUE",
      RXBUF_RESET_ON_CB_CHANGE => "TRUE",
      RXBUF_RESET_ON_COMMAALIGN => "FALSE",
      RXBUF_RESET_ON_EIDLE => "FALSE",
      RXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      RXBUF_THRESH_OVFLW => 61,
      RXBUF_THRESH_OVRD => "FALSE",
      RXBUF_THRESH_UNDFLW => 4,
      RXCDRFREQRESET_TIME => B"00001",
      RXCDRPHRESET_TIME => B"00001",
      RXCDR_CFG => X"03000023FF40200020",
      RXCDR_FR_RESET_ON_EIDLE => '0',
      RXCDR_HOLD_DURING_EIDLE => '0',
      RXCDR_LOCK_CFG => B"010101",
      RXCDR_PH_RESET_ON_EIDLE => '0',
      RXDFELPMRESET_TIME => B"0001111",
      RXDLY_CFG => X"001F",
      RXDLY_LCFG => X"030",
      RXDLY_TAP_CFG => X"0000",
      RXGEARBOX_EN => "FALSE",
      RXISCANRESET_TIME => B"00001",
      RXLPM_HF_CFG => B"00000011110000",
      RXLPM_LF_CFG => B"00000011110000",
      RXOOB_CFG => B"0000110",
      RXOUT_DIV => 2,
      RXPCSRESET_TIME => B"00001",
      RXPHDLY_CFG => X"084020",
      RXPH_CFG => X"000000",
      RXPH_MONITOR_SEL => B"00000",
      RXPMARESET_TIME => B"00011",
      RXPRBS_ERR_LOOPBACK => '0',
      RXSLIDE_AUTO_WAIT => 7,
      RXSLIDE_MODE => "OFF",
      RX_BIAS_CFG => B"000000000100",
      RX_BUFFER_CFG => B"000000",
      RX_CLK25_DIV => 5,
      RX_CLKMUX_PD => '1',
      RX_CM_SEL => B"11",
      RX_CM_TRIM => B"010",
      RX_DATA_WIDTH => 20,
      RX_DDI_SEL => B"000000",
      RX_DEBUG_CFG => B"000000000000",
      RX_DEFER_RESET_BUF_EN => "TRUE",
      RX_DFE_GAIN_CFG => X"020FEA",
      RX_DFE_H2_CFG => B"000000000000",
      RX_DFE_H3_CFG => B"000001000000",
      RX_DFE_H4_CFG => B"00011110000",
      RX_DFE_H5_CFG => B"00011100000",
      RX_DFE_KL_CFG => B"0000011111110",
      RX_DFE_KL_CFG2 => X"301148AC",
      RX_DFE_LPM_CFG => X"0954",
      RX_DFE_LPM_HOLD_DURING_EIDLE => '0',
      RX_DFE_UT_CFG => B"10001111000000000",
      RX_DFE_VP_CFG => B"00011111100000011",
      RX_DFE_XYD_CFG => B"0000000000000",
      RX_DISPERR_SEQ_MATCH => "TRUE",
      RX_INT_DATAWIDTH => 0,
      RX_OS_CFG => B"0000010000000",
      RX_SIG_VALID_DLY => 10,
      RX_XCLK_SEL => "RXREC",
      SAS_MAX_COM => 64,
      SAS_MIN_COM => 36,
      SATA_BURST_SEQ_LEN => B"0101",
      SATA_BURST_VAL => B"100",
      SATA_CPLL_CFG => "VCO_3000MHZ",
      SATA_EIDLE_VAL => B"100",
      SATA_MAX_BURST => 8,
      SATA_MAX_INIT => 21,
      SATA_MAX_WAKE => 7,
      SATA_MIN_BURST => 4,
      SATA_MIN_INIT => 12,
      SATA_MIN_WAKE => 4,
      SHOW_REALIGN_COMMA => "TRUE",
      SIM_CPLLREFCLK_SEL => B"001",
      SIM_RECEIVER_DETECT_PASS => "TRUE",
      SIM_RESET_SPEEDUP => "TRUE",
      SIM_TX_EIDLE_DRIVE_LEVEL => "X",
      SIM_VERSION => "4.0",
      TERM_RCAL_CFG => B"10000",
      TERM_RCAL_OVRD => '0',
      TRANS_TIME_RATE => X"0E",
      TST_RSV => X"00000000",
      TXBUF_EN => "TRUE",
      TXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      TXDLY_CFG => X"001F",
      TXDLY_LCFG => X"030",
      TXDLY_TAP_CFG => X"0000",
      TXGEARBOX_EN => "FALSE",
      TXOUT_DIV => 2,
      TXPCSRESET_TIME => B"00001",
      TXPHDLY_CFG => X"084020",
      TXPH_CFG => X"0780",
      TXPH_MONITOR_SEL => B"00000",
      TXPMARESET_TIME => B"00001",
      TX_CLK25_DIV => 5,
      TX_CLKMUX_PD => '1',
      TX_DATA_WIDTH => 20,
      TX_DEEMPH0 => B"00000",
      TX_DEEMPH1 => B"00000",
      TX_DRIVE_MODE => "DIRECT",
      TX_EIDLE_ASSERT_DELAY => B"110",
      TX_EIDLE_DEASSERT_DELAY => B"100",
      TX_INT_DATAWIDTH => 0,
      TX_LOOPBACK_DRIVE_HIZ => "FALSE",
      TX_MAINCURSOR_SEL => '0',
      TX_MARGIN_FULL_0 => B"1001110",
      TX_MARGIN_FULL_1 => B"1001001",
      TX_MARGIN_FULL_2 => B"1000101",
      TX_MARGIN_FULL_3 => B"1000010",
      TX_MARGIN_FULL_4 => B"1000000",
      TX_MARGIN_LOW_0 => B"1000110",
      TX_MARGIN_LOW_1 => B"1000100",
      TX_MARGIN_LOW_2 => B"1000010",
      TX_MARGIN_LOW_3 => B"1000000",
      TX_MARGIN_LOW_4 => B"1000000",
      TX_PREDRIVER_MODE => '0',
      TX_QPI_STATUS_EN => '0',
      TX_RXDETECT_CFG => X"1832",
      TX_RXDETECT_REF => B"100",
      TX_XCLK_SEL => "TXOUT",
      UCODEER_CLR => '0'
    )
        port map (
      CFGRESET => '0',
      CLKRSVD(3 downto 0) => B"0000",
      CPLLFBCLKLOST => gtxe2_i_n_0,
      CPLLLOCK => \^init_clk_in_0\,
      CPLLLOCKDETCLK => init_clk_in,
      CPLLLOCKEN => '1',
      CPLLPD => cpll_pd_i,
      CPLLREFCLKLOST => gt_pllrefclklost_i,
      CPLLREFCLKSEL(2 downto 0) => B"001",
      CPLLRESET => cpll_reset_i_0,
      DMONITOROUT(7) => gtxe2_i_n_177,
      DMONITOROUT(6) => gtxe2_i_n_178,
      DMONITOROUT(5) => gtxe2_i_n_179,
      DMONITOROUT(4) => gtxe2_i_n_180,
      DMONITOROUT(3) => gtxe2_i_n_181,
      DMONITOROUT(2) => gtxe2_i_n_182,
      DMONITOROUT(1) => gtxe2_i_n_183,
      DMONITOROUT(0) => gtxe2_i_n_184,
      DRPADDR(8 downto 0) => drpaddr_in(8 downto 0),
      DRPCLK => drpclk_in,
      DRPDI(15 downto 0) => drpdi_in(15 downto 0),
      DRPDO(15 downto 0) => drpdo_out(15 downto 0),
      DRPEN => drpen_in,
      DRPRDY => drprdy_out,
      DRPWE => drpwe_in,
      EYESCANDATAERROR => gtxe2_i_n_4,
      EYESCANMODE => '0',
      EYESCANRESET => '0',
      EYESCANTRIGGER => '0',
      GTGREFCLK => '0',
      GTNORTHREFCLK0 => '0',
      GTNORTHREFCLK1 => '0',
      GTREFCLK0 => gt_refclk1,
      GTREFCLK1 => '0',
      GTREFCLKMONITOR => NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED,
      GTRESETSEL => '0',
      GTRSVD(15 downto 0) => B"0000000000000000",
      GTRXRESET => SR(0),
      GTSOUTHREFCLK0 => '0',
      GTSOUTHREFCLK1 => '0',
      GTTXRESET => gt_tx_reset_i,
      GTXRXN => rxn,
      GTXRXP => rxp,
      GTXTXN => gtxe2_i_n_6,
      GTXTXP => gtxe2_i_n_7,
      LOOPBACK(2 downto 0) => loopback(2 downto 0),
      PCSRSVDIN(15 downto 0) => B"0000000000000000",
      PCSRSVDIN2(4 downto 0) => B"00000",
      PCSRSVDOUT(15 downto 0) => NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED(15 downto 0),
      PHYSTATUS => NLW_gtxe2_i_PHYSTATUS_UNCONNECTED,
      PMARSVDIN(4 downto 0) => B"00000",
      PMARSVDIN2(4 downto 0) => B"00000",
      QPLLCLK => gt_qpllclk_quad1_out,
      QPLLREFCLK => gt_qpllrefclk_quad1_out,
      RESETOVRD => '0',
      RX8B10BEN => '1',
      RXBUFRESET => '0',
      RXBUFSTATUS(2) => rx_buf_err_i,
      RXBUFSTATUS(1) => gtxe2_i_n_83,
      RXBUFSTATUS(0) => gtxe2_i_n_84,
      RXBYTEISALIGNED => gtxe2_i_n_9,
      RXBYTEREALIGN => \^rx_realign_i\,
      RXCDRFREQRESET => '0',
      RXCDRHOLD => '0',
      RXCDRLOCK => gtxe2_i_n_11,
      RXCDROVRDEN => '0',
      RXCDRRESET => '0',
      RXCDRRESETRSV => '0',
      RXCHANBONDSEQ => NLW_gtxe2_i_RXCHANBONDSEQ_UNCONNECTED,
      RXCHANISALIGNED => NLW_gtxe2_i_RXCHANISALIGNED_UNCONNECTED,
      RXCHANREALIGN => NLW_gtxe2_i_RXCHANREALIGN_UNCONNECTED,
      RXCHARISCOMMA(7 downto 2) => NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED(7 downto 2),
      RXCHARISCOMMA(1 downto 0) => \^d\(1 downto 0),
      RXCHARISK(7 downto 2) => NLW_gtxe2_i_RXCHARISK_UNCONNECTED(7 downto 2),
      RXCHARISK(1 downto 0) => rx_char_is_k_i(1 downto 0),
      RXCHBONDEN => '0',
      RXCHBONDI(4 downto 0) => B"00000",
      RXCHBONDLEVEL(2 downto 0) => B"000",
      RXCHBONDMASTER => '0',
      RXCHBONDO(4 downto 0) => NLW_gtxe2_i_RXCHBONDO_UNCONNECTED(4 downto 0),
      RXCHBONDSLAVE => '0',
      RXCLKCORCNT(1) => gtxe2_i_n_78,
      RXCLKCORCNT(0) => gtxe2_i_n_79,
      RXCOMINITDET => NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED,
      RXCOMMADET => gtxe2_i_n_16,
      RXCOMMADETEN => '1',
      RXCOMSASDET => NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED,
      RXCOMWAKEDET => NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED,
      RXDATA(63 downto 16) => NLW_gtxe2_i_RXDATA_UNCONNECTED(63 downto 16),
      RXDATA(15 downto 0) => rx_data_i(15 downto 0),
      RXDATAVALID => NLW_gtxe2_i_RXDATAVALID_UNCONNECTED,
      RXDDIEN => '0',
      RXDFEAGCHOLD => gt_rxdfelfhold_i,
      RXDFEAGCOVRDEN => '0',
      RXDFECM1EN => '0',
      RXDFELFHOLD => gt_rxdfelfhold_i,
      RXDFELFOVRDEN => '1',
      RXDFELPMRESET => '0',
      RXDFETAP2HOLD => '0',
      RXDFETAP2OVRDEN => '0',
      RXDFETAP3HOLD => '0',
      RXDFETAP3OVRDEN => '0',
      RXDFETAP4HOLD => '0',
      RXDFETAP4OVRDEN => '0',
      RXDFETAP5HOLD => '0',
      RXDFETAP5OVRDEN => '0',
      RXDFEUTHOLD => '0',
      RXDFEUTOVRDEN => '0',
      RXDFEVPHOLD => '0',
      RXDFEVPOVRDEN => '0',
      RXDFEVSEN => '0',
      RXDFEXYDEN => '1',
      RXDFEXYDHOLD => '0',
      RXDFEXYDOVRDEN => '0',
      RXDISPERR(7 downto 2) => NLW_gtxe2_i_RXDISPERR_UNCONNECTED(7 downto 2),
      RXDISPERR(1 downto 0) => \^rxdisperr\(1 downto 0),
      RXDLYBYPASS => '1',
      RXDLYEN => '0',
      RXDLYOVRDEN => '0',
      RXDLYSRESET => '0',
      RXDLYSRESETDONE => NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED,
      RXELECIDLE => NLW_gtxe2_i_RXELECIDLE_UNCONNECTED,
      RXELECIDLEMODE(1 downto 0) => B"11",
      RXGEARBOXSLIP => '0',
      RXHEADER(2 downto 0) => NLW_gtxe2_i_RXHEADER_UNCONNECTED(2 downto 0),
      RXHEADERVALID => NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED,
      RXLPMEN => '0',
      RXLPMHFHOLD => '0',
      RXLPMHFOVRDEN => '0',
      RXLPMLFHOLD => '0',
      RXLPMLFKLOVRDEN => '0',
      RXMCOMMAALIGNEN => ena_comma_align_i,
      RXMONITOROUT(6) => gtxe2_i_n_170,
      RXMONITOROUT(5) => gtxe2_i_n_171,
      RXMONITOROUT(4) => gtxe2_i_n_172,
      RXMONITOROUT(3) => gtxe2_i_n_173,
      RXMONITOROUT(2) => gtxe2_i_n_174,
      RXMONITOROUT(1) => gtxe2_i_n_175,
      RXMONITOROUT(0) => gtxe2_i_n_176,
      RXMONITORSEL(1 downto 0) => B"00",
      RXNOTINTABLE(7 downto 2) => NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED(7 downto 2),
      RXNOTINTABLE(1 downto 0) => \^rxnotintable\(1 downto 0),
      RXOOBRESET => '0',
      RXOSHOLD => '0',
      RXOSOVRDEN => '0',
      RXOUTCLK => gtxe2_i_n_23,
      RXOUTCLKFABRIC => NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED,
      RXOUTCLKPCS => NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED,
      RXOUTCLKSEL(2 downto 0) => B"010",
      RXPCOMMAALIGNEN => ena_comma_align_i,
      RXPCSRESET => '0',
      RXPD(1) => power_down,
      RXPD(0) => power_down,
      RXPHALIGN => '0',
      RXPHALIGNDONE => NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED,
      RXPHALIGNEN => '0',
      RXPHDLYPD => '0',
      RXPHDLYRESET => '0',
      RXPHMONITOR(4 downto 0) => NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED(4 downto 0),
      RXPHOVRDEN => '0',
      RXPHSLIPMONITOR(4 downto 0) => NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED(4 downto 0),
      RXPMARESET => '0',
      RXPOLARITY => rx_polarity_i,
      RXPRBSCNTRESET => '0',
      RXPRBSERR => gtxe2_i_n_27,
      RXPRBSSEL(2 downto 0) => B"000",
      RXQPIEN => '0',
      RXQPISENN => NLW_gtxe2_i_RXQPISENN_UNCONNECTED,
      RXQPISENP => NLW_gtxe2_i_RXQPISENP_UNCONNECTED,
      RXRATE(2 downto 0) => B"000",
      RXRATEDONE => NLW_gtxe2_i_RXRATEDONE_UNCONNECTED,
      RXRESETDONE => init_clk_in_1,
      RXSLIDE => '0',
      RXSTARTOFSEQ => NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED,
      RXSTATUS(2 downto 0) => NLW_gtxe2_i_RXSTATUS_UNCONNECTED(2 downto 0),
      RXSYSCLKSEL(1 downto 0) => B"00",
      RXUSERRDY => gt_rxuserrdy_i,
      RXUSRCLK => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg,
      RXUSRCLK2 => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg,
      RXVALID => NLW_gtxe2_i_RXVALID_UNCONNECTED,
      SETERRSTATUS => '0',
      TSTIN(19 downto 0) => B"11111111111111111111",
      TSTOUT(9 downto 0) => NLW_gtxe2_i_TSTOUT_UNCONNECTED(9 downto 0),
      TX8B10BBYPASS(7 downto 0) => B"00000000",
      TX8B10BEN => '1',
      TXBUFDIFFCTRL(2 downto 0) => B"100",
      TXBUFSTATUS(1) => gtxe2_i_n_80,
      TXBUFSTATUS(0) => gtxe2_i_n_81,
      TXCHARDISPMODE(7 downto 0) => B"00000000",
      TXCHARDISPVAL(7 downto 0) => B"00000000",
      TXCHARISK(7 downto 0) => B"00000000",
      TXCOMFINISH => NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED,
      TXCOMINIT => '0',
      TXCOMSAS => '0',
      TXCOMWAKE => '0',
      TXDATA(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      TXDEEMPH => '0',
      TXDETECTRX => '0',
      TXDIFFCTRL(3 downto 0) => B"1000",
      TXDIFFPD => '0',
      TXDLYBYPASS => '1',
      TXDLYEN => '0',
      TXDLYHOLD => '0',
      TXDLYOVRDEN => '0',
      TXDLYSRESET => '0',
      TXDLYSRESETDONE => NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED,
      TXDLYUPDOWN => '0',
      TXELECIDLE => '0',
      TXGEARBOXREADY => NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED,
      TXHEADER(2 downto 0) => B"000",
      TXINHIBIT => '0',
      TXMAINCURSOR(6 downto 0) => B"0000000",
      TXMARGIN(2 downto 0) => B"000",
      TXOUTCLK => tx_out_clk_i,
      TXOUTCLKFABRIC => gtxe2_i_n_38,
      TXOUTCLKPCS => gtxe2_i_n_39,
      TXOUTCLKSEL(2 downto 0) => B"010",
      TXPCSRESET => '0',
      TXPD(1) => power_down,
      TXPD(0) => power_down,
      TXPDELECIDLEMODE => '0',
      TXPHALIGN => '0',
      TXPHALIGNDONE => NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED,
      TXPHALIGNEN => '0',
      TXPHDLYPD => '0',
      TXPHDLYRESET => '0',
      TXPHDLYTSTCLK => '0',
      TXPHINIT => '0',
      TXPHINITDONE => NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED,
      TXPHOVRDEN => '0',
      TXPISOPD => '0',
      TXPMARESET => '0',
      TXPOLARITY => '0',
      TXPOSTCURSOR(4 downto 0) => B"00000",
      TXPOSTCURSORINV => '0',
      TXPRBSFORCEERR => '0',
      TXPRBSSEL(2 downto 0) => B"000",
      TXPRECURSOR(4 downto 0) => B"00000",
      TXPRECURSORINV => '0',
      TXQPIBIASEN => '0',
      TXQPISENN => NLW_gtxe2_i_TXQPISENN_UNCONNECTED,
      TXQPISENP => NLW_gtxe2_i_TXQPISENP_UNCONNECTED,
      TXQPISTRONGPDOWN => '0',
      TXQPIWEAKPUP => '0',
      TXRATE(2 downto 0) => B"000",
      TXRATEDONE => NLW_gtxe2_i_TXRATEDONE_UNCONNECTED,
      TXRESETDONE => gtxe2_i_n_45,
      TXSEQUENCE(6 downto 0) => B"0000000",
      TXSTARTSEQ => '0',
      TXSWING => '0',
      TXSYSCLKSEL(1 downto 0) => B"00",
      TXUSERRDY => '1',
      TXUSRCLK => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg,
      TXUSRCLK2 => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
    );
hard_err_flop_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^rx_realign_i\,
      I1 => bucket_full_r,
      I2 => rx_buf_err_i,
      O => hard_err_flop_r0
    );
left_aligned_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0420"
    )
        port map (
      I0 => \^d\(1),
      I1 => \^d\(0),
      I2 => rx_char_is_k_i(1),
      I3 => rx_char_is_k_i(0),
      O => init_clk_in_3
    );
pll_not_locked_out_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^init_clk_in_0\,
      O => pll_not_locked_out
    );
\soft_err_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^rxdisperr\(0),
      I1 => \^rxnotintable\(0),
      O => init_clk_in_2(1)
    );
\soft_err_r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^rxdisperr\(1),
      I1 => \^rxnotintable\(1),
      O => init_clk_in_2(0)
    );
\word_aligned_control_bits_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_char_is_k_i(0),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_char_is_k_i(1),
      O => left_aligned_r_reg_0
    );
\word_aligned_control_bits_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_char_is_k_i(1),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_char_is_k_i(0),
      O => left_aligned_r_reg
    );
\word_aligned_data_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(7),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(15),
      O => left_aligned_r_reg_2(7)
    );
\word_aligned_data_r[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(13),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(5),
      O => left_aligned_r_reg_1(5)
    );
\word_aligned_data_r[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(12),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(4),
      O => left_aligned_r_reg_1(4)
    );
\word_aligned_data_r[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(11),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(3),
      O => left_aligned_r_reg_1(3)
    );
\word_aligned_data_r[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(10),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(2),
      O => left_aligned_r_reg_1(2)
    );
\word_aligned_data_r[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(9),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(1),
      O => left_aligned_r_reg_1(1)
    );
\word_aligned_data_r[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(8),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(0),
      O => left_aligned_r_reg_1(0)
    );
\word_aligned_data_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(6),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(14),
      O => left_aligned_r_reg_2(6)
    );
\word_aligned_data_r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(5),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(13),
      O => left_aligned_r_reg_2(5)
    );
\word_aligned_data_r[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(4),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(12),
      O => left_aligned_r_reg_2(4)
    );
\word_aligned_data_r[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(3),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(11),
      O => left_aligned_r_reg_2(3)
    );
\word_aligned_data_r[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(2),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(10),
      O => left_aligned_r_reg_2(2)
    );
\word_aligned_data_r[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(1),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(9),
      O => left_aligned_r_reg_2(1)
    );
\word_aligned_data_r[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(0),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(8),
      O => left_aligned_r_reg_2(0)
    );
\word_aligned_data_r[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(15),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(7),
      O => left_aligned_r_reg_1(7)
    );
\word_aligned_data_r[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(14),
      I1 => \word_aligned_control_bits_r_reg[1]\,
      I2 => rx_data_i(6),
      O => left_aligned_r_reg_1(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt_common_wrapper is
  port (
    gt0_qplllock_out : out STD_LOGIC;
    gt_qpllclk_quad1_out : out STD_LOGIC;
    gt_qpllrefclk_quad1_out : out STD_LOGIC;
    gt0_qpllrefclklost_out : out STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt_common_wrapper : entity is "simplex_rx_aurora_8b10b_0_0_gt_common_wrapper";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt_common_wrapper;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt_common_wrapper is
  signal NLW_gtxe2_common_i_DRPRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_common_i_QPLLFBCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_common_i_REFCLKOUTMONITOR_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_common_i_DRPDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gtxe2_common_i_QPLLDMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gtxe2_common_i : label is "PRIMITIVE";
begin
gtxe2_common_i: unisim.vcomponents.GTXE2_COMMON
    generic map(
      BIAS_CFG => X"0000040000001000",
      COMMON_CFG => X"00000000",
      IS_DRPCLK_INVERTED => '0',
      IS_GTGREFCLK_INVERTED => '0',
      IS_QPLLLOCKDETCLK_INVERTED => '0',
      QPLL_CFG => X"06801C1",
      QPLL_CLKOUT_CFG => B"0000",
      QPLL_COARSE_FREQ_OVRD => B"010000",
      QPLL_COARSE_FREQ_OVRD_EN => '0',
      QPLL_CP => B"0000011111",
      QPLL_CP_MONITOR_EN => '0',
      QPLL_DMONITOR_SEL => '0',
      QPLL_FBDIV => B"0010000000",
      QPLL_FBDIV_MONITOR_EN => '0',
      QPLL_FBDIV_RATIO => '1',
      QPLL_INIT_CFG => X"000006",
      QPLL_LOCK_CFG => X"21E8",
      QPLL_LPF => B"1111",
      QPLL_REFCLK_DIV => 1,
      SIM_QPLLREFCLK_SEL => B"001",
      SIM_RESET_SPEEDUP => "FALSE",
      SIM_VERSION => "4.0"
    )
        port map (
      BGBYPASSB => '1',
      BGMONITORENB => '1',
      BGPDB => '1',
      BGRCALOVRD(4 downto 0) => B"11111",
      DRPADDR(7 downto 0) => B"00000000",
      DRPCLK => '0',
      DRPDI(15 downto 0) => B"0000000000000000",
      DRPDO(15 downto 0) => NLW_gtxe2_common_i_DRPDO_UNCONNECTED(15 downto 0),
      DRPEN => '0',
      DRPRDY => NLW_gtxe2_common_i_DRPRDY_UNCONNECTED,
      DRPWE => '0',
      GTGREFCLK => '0',
      GTNORTHREFCLK0 => '0',
      GTNORTHREFCLK1 => '0',
      GTREFCLK0 => gt_refclk1,
      GTREFCLK1 => '0',
      GTSOUTHREFCLK0 => '0',
      GTSOUTHREFCLK1 => '0',
      PMARSVD(7 downto 0) => B"00000000",
      QPLLDMONITOR(7 downto 0) => NLW_gtxe2_common_i_QPLLDMONITOR_UNCONNECTED(7 downto 0),
      QPLLFBCLKLOST => NLW_gtxe2_common_i_QPLLFBCLKLOST_UNCONNECTED,
      QPLLLOCK => gt0_qplllock_out,
      QPLLLOCKDETCLK => init_clk_in,
      QPLLLOCKEN => '1',
      QPLLOUTCLK => gt_qpllclk_quad1_out,
      QPLLOUTREFCLK => gt_qpllrefclk_quad1_out,
      QPLLOUTRESET => '0',
      QPLLPD => '1',
      QPLLREFCLKLOST => gt0_qpllrefclklost_out,
      QPLLREFCLKSEL(2 downto 0) => B"001",
      QPLLRESET => '0',
      QPLLRSVD1(15 downto 0) => B"0000000000000000",
      QPLLRSVD2(4 downto 0) => B"11111",
      RCALENB => '1',
      REFCLKOUTMONITOR => NLW_gtxe2_common_i_REFCLKOUTMONITOR_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RESET_LOGIC is
  port (
    link_reset_r : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    wait_for_lane_up_r0 : out STD_LOGIC;
    in0 : in STD_LOGIC;
    link_reset_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg : in STD_LOGIC;
    tx_lock_comb_r_reg_0 : in STD_LOGIC;
    gt_rxresetdone_r2_reg_0 : in STD_LOGIC;
    reset_channel_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RESET_LOGIC : entity is "simplex_rx_aurora_8b10b_0_0_RESET_LOGIC";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RESET_LOGIC;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RESET_LOGIC is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SYSTEM_RESET0_n_0 : STD_LOGIC;
  signal gt_rxresetdone_r : STD_LOGIC;
  signal gt_rxresetdone_r2 : STD_LOGIC;
  signal gt_rxresetdone_r3 : STD_LOGIC;
  signal \^link_reset_r\ : STD_LOGIC;
  signal link_reset_sync : STD_LOGIC;
  signal tx_lock_comb_r : STD_LOGIC;
  signal tx_lock_sync : STD_LOGIC;
begin
  SR(0) <= \^sr\(0);
  link_reset_r <= \^link_reset_r\;
SYSTEM_RESET0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => tx_lock_sync,
      I1 => in0,
      I2 => gt_rxresetdone_r3,
      I3 => link_reset_sync,
      O => SYSTEM_RESET0_n_0
    );
SYSTEM_RESET_reg: unisim.vcomponents.FDRE
     port map (
      C => s_level_out_d6_reg,
      CE => '1',
      D => SYSTEM_RESET0_n_0,
      Q => \^sr\(0),
      R => '0'
    );
gt_rxresetdone_r2_reg: unisim.vcomponents.FDCE
     port map (
      C => s_level_out_d6_reg,
      CE => '1',
      CLR => gt_rxresetdone_r2_reg_0,
      D => gt_rxresetdone_r,
      Q => gt_rxresetdone_r2
    );
gt_rxresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => s_level_out_d6_reg,
      CE => '1',
      D => gt_rxresetdone_r2,
      Q => gt_rxresetdone_r3,
      R => '0'
    );
gt_rxresetdone_r_reg: unisim.vcomponents.FDCE
     port map (
      C => s_level_out_d6_reg,
      CE => '1',
      CLR => gt_rxresetdone_r2_reg_0,
      D => '1',
      Q => gt_rxresetdone_r
    );
link_reset_cdc_sync: entity work.\simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_11\
     port map (
      init_clk_in => init_clk_in,
      link_reset_r => \^link_reset_r\,
      \out\ => link_reset_sync,
      s_level_out_d6_reg_0 => s_level_out_d6_reg
    );
link_reset_comb_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_out,
      Q => \^link_reset_r\,
      R => '0'
    );
tx_lock_cdc_sync: entity work.\simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_12\
     port map (
      init_clk_in => init_clk_in,
      \out\ => tx_lock_sync,
      s_level_out_d6_reg_0 => s_level_out_d6_reg,
      tx_lock_comb_r => tx_lock_comb_r
    );
tx_lock_comb_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => tx_lock_comb_r_reg_0,
      Q => tx_lock_comb_r,
      R => '0'
    );
wait_for_lane_up_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sr\(0),
      I1 => reset_channel_i,
      O => wait_for_lane_up_r0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    GTRXRESET_OUT : out STD_LOGIC;
    rx_channel_up : out STD_LOGIC;
    rx_hard_err : out STD_LOGIC;
    rx_aligned : out STD_LOGIC;
    reset_channel_i : out STD_LOGIC;
    START_RX : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    ready_r_reg0 : out STD_LOGIC;
    \free_count_r_reg[13]\ : in STD_LOGIC;
    GOT_V : in STD_LOGIC;
    wait_for_lane_up_r0 : in STD_LOGIC;
    HARD_ERR : in STD_LOGIC;
    rx_lane_up : in STD_LOGIC;
    \gtrxreset_extend_r_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    CHANNEL_SOFT_ERR_reg : in STD_LOGIC;
    power_down : in STD_LOGIC;
    hard_err_reset_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX : entity is "simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX is
  signal \^reset_channel_i\ : STD_LOGIC;
begin
  reset_channel_i <= \^reset_channel_i\;
rx_channel_err_detect_simplex_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX
     port map (
      CHANNEL_SOFT_ERR_reg_0 => CHANNEL_SOFT_ERR_reg,
      HARD_ERR => HARD_ERR,
      RESET_CHANNEL_reg_0 => \free_count_r_reg[13]\,
      power_down => power_down,
      reset_channel_i => \^reset_channel_i\,
      rx_aligned => rx_aligned,
      rx_hard_err => rx_hard_err,
      rx_lane_up => rx_lane_up,
      soft_err => soft_err
    );
rx_channel_init_sm_simplex_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX
     port map (
      GOT_V => GOT_V,
      GTRXRESET_OUT => GTRXRESET_OUT,
      SR(0) => SR(0),
      START_RX => START_RX,
      \free_count_r_reg[13]_0\ => \free_count_r_reg[13]\,
      \gtrxreset_extend_r_reg[0]_0\(0) => \gtrxreset_extend_r_reg[0]\(0),
      hard_err_reset_i => hard_err_reset_i,
      ready_r_reg0 => ready_r_reg0,
      reset_channel_i => \^reset_channel_i\,
      rx_channel_up => rx_channel_up,
      wait_for_lane_up_r0 => wait_for_lane_up_r0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL is
  port (
    frame_err : out STD_LOGIC;
    m_axi_rx_tvalid : out STD_LOGIC;
    in_frame_r : out STD_LOGIC;
    storage_v_r : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 15 );
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rx_tlast : out STD_LOGIC;
    RX_EOF_N_reg : in STD_LOGIC;
    storage_v_r_reg : in STD_LOGIC;
    RX_PAD : in STD_LOGIC;
    RX_SRC_RDY_N_reg_inv : in STD_LOGIC;
    in_frame_r_reg : in STD_LOGIC;
    rx_scp_i : in STD_LOGIC;
    rx_ecp_i : in STD_LOGIC;
    rx_pe_data_v_i : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 15 downto 0 );
    START_RX : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL : entity is "simplex_rx_aurora_8b10b_0_0_RX_LL";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL is
begin
rx_ll_pdu_datapath_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL_PDU_DATAPATH
     port map (
      D(15 downto 0) => D(15 downto 0),
      RX_EOF_N_reg_0 => RX_EOF_N_reg,
      RX_PAD => RX_PAD,
      RX_SRC_RDY_N_reg_inv_0 => RX_SRC_RDY_N_reg_inv,
      START_RX => START_RX,
      frame_err => frame_err,
      in_frame_r_reg_0 => in_frame_r,
      in_frame_r_reg_1 => in_frame_r_reg,
      m_axi_rx_tdata(0 to 15) => m_axi_rx_tdata(0 to 15),
      m_axi_rx_tkeep(0) => m_axi_rx_tkeep(0),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      rx_ecp_i => rx_ecp_i,
      rx_pe_data_v_i => rx_pe_data_v_i,
      rx_scp_i => rx_scp_i,
      storage_v_r => storage_v_r,
      storage_v_r_reg_0 => storage_v_r_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC is
  port (
    gt_reset_out : out STD_LOGIC;
    in0 : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \debounce_gt_rst_r_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC : entity is "simplex_rx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC is
  signal debounce_gt_rst_r : STD_LOGIC_VECTOR ( 0 to 3 );
  attribute async_reg : string;
  attribute async_reg of debounce_gt_rst_r : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of debounce_gt_rst_r : signal is "{no}";
  signal \^gt_reset_out\ : STD_LOGIC;
  signal gt_rst_r0_n_0 : STD_LOGIC;
  signal gt_rst_sync : STD_LOGIC;
  signal reset_debounce_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal reset_debounce_r20_n_0 : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \debounce_gt_rst_r_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \debounce_gt_rst_r_reg[0]\ : label is "yes";
  attribute shift_extract of \debounce_gt_rst_r_reg[0]\ : label is "{no}";
  attribute ASYNC_REG_boolean of \debounce_gt_rst_r_reg[1]\ : label is std.standard.true;
  attribute KEEP of \debounce_gt_rst_r_reg[1]\ : label is "yes";
  attribute shift_extract of \debounce_gt_rst_r_reg[1]\ : label is "{no}";
  attribute ASYNC_REG_boolean of \debounce_gt_rst_r_reg[2]\ : label is std.standard.true;
  attribute KEEP of \debounce_gt_rst_r_reg[2]\ : label is "yes";
  attribute shift_extract of \debounce_gt_rst_r_reg[2]\ : label is "{no}";
  attribute ASYNC_REG_boolean of \debounce_gt_rst_r_reg[3]\ : label is std.standard.true;
  attribute KEEP of \debounce_gt_rst_r_reg[3]\ : label is "yes";
  attribute shift_extract of \debounce_gt_rst_r_reg[3]\ : label is "{no}";
begin
  gt_reset_out <= \^gt_reset_out\;
\debounce_gt_rst_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \debounce_gt_rst_r_reg[0]_0\(0),
      Q => debounce_gt_rst_r(0),
      R => '0'
    );
\debounce_gt_rst_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => debounce_gt_rst_r(0),
      Q => debounce_gt_rst_r(1),
      R => '0'
    );
\debounce_gt_rst_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => debounce_gt_rst_r(1),
      Q => debounce_gt_rst_r(2),
      R => '0'
    );
\debounce_gt_rst_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => debounce_gt_rst_r(2),
      Q => debounce_gt_rst_r(3),
      R => '0'
    );
gt_rst_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => debounce_gt_rst_r(2),
      I1 => debounce_gt_rst_r(3),
      I2 => debounce_gt_rst_r(0),
      I3 => debounce_gt_rst_r(1),
      O => gt_rst_r0_n_0
    );
gt_rst_r_cdc_sync: entity work.\simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0\
     port map (
      AS(0) => gt_rst_sync,
      CLK => CLK,
      gt_reset_out => \^gt_reset_out\,
      init_clk_in => init_clk_in
    );
gt_rst_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gt_rst_r0_n_0,
      Q => \^gt_reset_out\,
      R => '0'
    );
reset_debounce_r20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => reset_debounce_r(2),
      I1 => reset_debounce_r(3),
      I2 => reset_debounce_r(0),
      I3 => reset_debounce_r(1),
      O => reset_debounce_r20_n_0
    );
reset_debounce_r2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_debounce_r20_n_0,
      Q => in0,
      R => '0'
    );
\reset_debounce_r_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(0),
      PRE => gt_rst_sync,
      Q => reset_debounce_r(0)
    );
\reset_debounce_r_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_debounce_r(0),
      PRE => gt_rst_sync,
      Q => reset_debounce_r(1)
    );
\reset_debounce_r_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_debounce_r(1),
      PRE => gt_rst_sync,
      Q => reset_debounce_r(2)
    );
\reset_debounce_r_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_debounce_r(2),
      PRE => gt_rst_sync,
      Q => reset_debounce_r(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_hotplug is
  port (
    link_reset_out : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg : in STD_LOGIC;
    \rx_cc_extend_r_reg[7]_0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_hotplug : entity is "simplex_rx_aurora_8b10b_0_0_hotplug";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_hotplug;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_hotplug is
  signal cc_sync : STD_LOGIC;
  signal \count_for_reset_r[0]_i_2_n_0\ : STD_LOGIC;
  signal count_for_reset_r_reg : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal \count_for_reset_r_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal link_reset_0 : STD_LOGIC;
  signal link_reset_0_i_1_n_0 : STD_LOGIC;
  signal link_reset_0_i_2_n_0 : STD_LOGIC;
  signal link_reset_0_i_3_n_0 : STD_LOGIC;
  signal link_reset_0_i_4_n_0 : STD_LOGIC;
  signal link_reset_0_i_5_n_0 : STD_LOGIC;
  signal link_reset_0_i_6_n_0 : STD_LOGIC;
  signal rx_cc_extend_r : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_cc_extend_r2 : STD_LOGIC;
  signal rx_cc_extend_r2_i_1_n_0 : STD_LOGIC;
  signal rx_cc_extend_r2_i_2_n_0 : STD_LOGIC;
  signal \NLW_count_for_reset_r_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_count_for_reset_r_reg[24]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
begin
\count_for_reset_r[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_for_reset_r_reg(0),
      O => \count_for_reset_r[0]_i_2_n_0\
    );
\count_for_reset_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[0]_i_1_n_7\,
      Q => count_for_reset_r_reg(0),
      R => cc_sync
    );
\count_for_reset_r_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_for_reset_r_reg[0]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[0]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[0]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_for_reset_r_reg[0]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[0]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[0]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[0]_i_1_n_7\,
      S(3 downto 1) => count_for_reset_r_reg(3 downto 1),
      S(0) => \count_for_reset_r[0]_i_2_n_0\
    );
\count_for_reset_r_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[8]_i_1_n_5\,
      Q => count_for_reset_r_reg(10),
      R => cc_sync
    );
\count_for_reset_r_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[8]_i_1_n_4\,
      Q => count_for_reset_r_reg(11),
      R => cc_sync
    );
\count_for_reset_r_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[12]_i_1_n_7\,
      Q => count_for_reset_r_reg(12),
      R => cc_sync
    );
\count_for_reset_r_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[8]_i_1_n_0\,
      CO(3) => \count_for_reset_r_reg[12]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[12]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[12]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_for_reset_r_reg[12]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[12]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[12]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[12]_i_1_n_7\,
      S(3 downto 0) => count_for_reset_r_reg(15 downto 12)
    );
\count_for_reset_r_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[12]_i_1_n_6\,
      Q => count_for_reset_r_reg(13),
      R => cc_sync
    );
\count_for_reset_r_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[12]_i_1_n_5\,
      Q => count_for_reset_r_reg(14),
      R => cc_sync
    );
\count_for_reset_r_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[12]_i_1_n_4\,
      Q => count_for_reset_r_reg(15),
      R => cc_sync
    );
\count_for_reset_r_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[16]_i_1_n_7\,
      Q => count_for_reset_r_reg(16),
      R => cc_sync
    );
\count_for_reset_r_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[12]_i_1_n_0\,
      CO(3) => \count_for_reset_r_reg[16]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[16]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[16]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_for_reset_r_reg[16]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[16]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[16]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[16]_i_1_n_7\,
      S(3 downto 0) => count_for_reset_r_reg(19 downto 16)
    );
\count_for_reset_r_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[16]_i_1_n_6\,
      Q => count_for_reset_r_reg(17),
      R => cc_sync
    );
\count_for_reset_r_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[16]_i_1_n_5\,
      Q => count_for_reset_r_reg(18),
      R => cc_sync
    );
\count_for_reset_r_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[16]_i_1_n_4\,
      Q => count_for_reset_r_reg(19),
      R => cc_sync
    );
\count_for_reset_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[0]_i_1_n_6\,
      Q => count_for_reset_r_reg(1),
      R => cc_sync
    );
\count_for_reset_r_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[20]_i_1_n_7\,
      Q => count_for_reset_r_reg(20),
      R => cc_sync
    );
\count_for_reset_r_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[16]_i_1_n_0\,
      CO(3) => \count_for_reset_r_reg[20]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[20]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[20]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_for_reset_r_reg[20]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[20]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[20]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[20]_i_1_n_7\,
      S(3 downto 0) => count_for_reset_r_reg(23 downto 20)
    );
\count_for_reset_r_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[20]_i_1_n_6\,
      Q => count_for_reset_r_reg(21),
      R => cc_sync
    );
\count_for_reset_r_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[20]_i_1_n_5\,
      Q => count_for_reset_r_reg(22),
      R => cc_sync
    );
\count_for_reset_r_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[20]_i_1_n_4\,
      Q => count_for_reset_r_reg(23),
      R => cc_sync
    );
\count_for_reset_r_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[24]_i_1_n_7\,
      Q => count_for_reset_r_reg(24),
      R => cc_sync
    );
\count_for_reset_r_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[20]_i_1_n_0\,
      CO(3 downto 1) => \NLW_count_for_reset_r_reg[24]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \count_for_reset_r_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_count_for_reset_r_reg[24]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \count_for_reset_r_reg[24]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[24]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => count_for_reset_r_reg(25 downto 24)
    );
\count_for_reset_r_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[24]_i_1_n_6\,
      Q => count_for_reset_r_reg(25),
      R => cc_sync
    );
\count_for_reset_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[0]_i_1_n_5\,
      Q => count_for_reset_r_reg(2),
      R => cc_sync
    );
\count_for_reset_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[0]_i_1_n_4\,
      Q => count_for_reset_r_reg(3),
      R => cc_sync
    );
\count_for_reset_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[4]_i_1_n_7\,
      Q => count_for_reset_r_reg(4),
      R => cc_sync
    );
\count_for_reset_r_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[0]_i_1_n_0\,
      CO(3) => \count_for_reset_r_reg[4]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[4]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[4]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_for_reset_r_reg[4]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[4]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[4]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[4]_i_1_n_7\,
      S(3 downto 0) => count_for_reset_r_reg(7 downto 4)
    );
\count_for_reset_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[4]_i_1_n_6\,
      Q => count_for_reset_r_reg(5),
      R => cc_sync
    );
\count_for_reset_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[4]_i_1_n_5\,
      Q => count_for_reset_r_reg(6),
      R => cc_sync
    );
\count_for_reset_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[4]_i_1_n_4\,
      Q => count_for_reset_r_reg(7),
      R => cc_sync
    );
\count_for_reset_r_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[8]_i_1_n_7\,
      Q => count_for_reset_r_reg(8),
      R => cc_sync
    );
\count_for_reset_r_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[4]_i_1_n_0\,
      CO(3) => \count_for_reset_r_reg[8]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[8]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[8]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_for_reset_r_reg[8]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[8]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[8]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[8]_i_1_n_7\,
      S(3 downto 0) => count_for_reset_r_reg(11 downto 8)
    );
\count_for_reset_r_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[8]_i_1_n_6\,
      Q => count_for_reset_r_reg(9),
      R => cc_sync
    );
link_reset_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => link_reset_0_i_2_n_0,
      I1 => link_reset_0_i_3_n_0,
      I2 => link_reset_0_i_4_n_0,
      I3 => link_reset_0_i_5_n_0,
      I4 => link_reset_0_i_6_n_0,
      O => link_reset_0_i_1_n_0
    );
link_reset_0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_for_reset_r_reg(7),
      I1 => count_for_reset_r_reg(6),
      I2 => count_for_reset_r_reg(5),
      O => link_reset_0_i_2_n_0
    );
link_reset_0_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78F8F8F8"
    )
        port map (
      I0 => count_for_reset_r_reg(2),
      I1 => count_for_reset_r_reg(3),
      I2 => count_for_reset_r_reg(4),
      I3 => count_for_reset_r_reg(1),
      I4 => count_for_reset_r_reg(0),
      O => link_reset_0_i_3_n_0
    );
link_reset_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => count_for_reset_r_reg(16),
      I1 => count_for_reset_r_reg(17),
      I2 => count_for_reset_r_reg(14),
      I3 => count_for_reset_r_reg(15),
      I4 => count_for_reset_r_reg(19),
      I5 => count_for_reset_r_reg(18),
      O => link_reset_0_i_4_n_0
    );
link_reset_0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => count_for_reset_r_reg(10),
      I1 => count_for_reset_r_reg(11),
      I2 => count_for_reset_r_reg(8),
      I3 => count_for_reset_r_reg(9),
      I4 => count_for_reset_r_reg(13),
      I5 => count_for_reset_r_reg(12),
      O => link_reset_0_i_5_n_0
    );
link_reset_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => count_for_reset_r_reg(22),
      I1 => count_for_reset_r_reg(23),
      I2 => count_for_reset_r_reg(20),
      I3 => count_for_reset_r_reg(21),
      I4 => count_for_reset_r_reg(25),
      I5 => count_for_reset_r_reg(24),
      O => link_reset_0_i_6_n_0
    );
link_reset_0_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_0_i_1_n_0,
      Q => link_reset_0,
      R => '0'
    );
\link_reset_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_0,
      Q => link_reset_out,
      R => '0'
    );
rx_cc_cdc_sync: entity work.\simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\
     port map (
      init_clk_in => init_clk_in,
      \out\ => cc_sync,
      p_level_in_d1_cdc_from_reg_0 => p_level_in_d1_cdc_from_reg,
      rx_cc_extend_r2 => rx_cc_extend_r2
    );
rx_cc_extend_r2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => rx_cc_extend_r(2),
      I1 => rx_cc_extend_r(3),
      I2 => rx_cc_extend_r(0),
      I3 => rx_cc_extend_r(1),
      I4 => rx_cc_extend_r2_i_2_n_0,
      O => rx_cc_extend_r2_i_1_n_0
    );
rx_cc_extend_r2_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rx_cc_extend_r(5),
      I1 => rx_cc_extend_r(4),
      I2 => rx_cc_extend_r(7),
      I3 => rx_cc_extend_r(6),
      O => rx_cc_extend_r2_i_2_n_0
    );
rx_cc_extend_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rx_cc_extend_r2_i_1_n_0,
      Q => rx_cc_extend_r2,
      R => '0'
    );
\rx_cc_extend_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rx_cc_extend_r(1),
      Q => rx_cc_extend_r(0),
      R => \rx_cc_extend_r_reg[7]_0\
    );
\rx_cc_extend_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rx_cc_extend_r(2),
      Q => rx_cc_extend_r(1),
      R => \rx_cc_extend_r_reg[7]_0\
    );
\rx_cc_extend_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rx_cc_extend_r(3),
      Q => rx_cc_extend_r(2),
      R => \rx_cc_extend_r_reg[7]_0\
    );
\rx_cc_extend_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rx_cc_extend_r(4),
      Q => rx_cc_extend_r(3),
      R => \rx_cc_extend_r_reg[7]_0\
    );
\rx_cc_extend_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rx_cc_extend_r(5),
      Q => rx_cc_extend_r(4),
      R => \rx_cc_extend_r_reg[7]_0\
    );
\rx_cc_extend_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rx_cc_extend_r(6),
      Q => rx_cc_extend_r(5),
      R => \rx_cc_extend_r_reg[7]_0\
    );
\rx_cc_extend_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rx_cc_extend_r(7),
      Q => rx_cc_extend_r(6),
      R => \rx_cc_extend_r_reg[7]_0\
    );
\rx_cc_extend_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => D(0),
      Q => rx_cc_extend_r(7),
      R => \rx_cc_extend_r_reg[7]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_multi_gt is
  port (
    init_clk_in_0 : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    rx_realign_i : out STD_LOGIC;
    init_clk_in_1 : out STD_LOGIC;
    tx_out_clk_i : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RXDISPERR : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RXNOTINTABLE : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ack_flag : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC;
    left_aligned_r_reg : out STD_LOGIC;
    left_aligned_r_reg_0 : out STD_LOGIC;
    init_clk_in_2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    init_clk_in_3 : out STD_LOGIC;
    hard_err_flop_r0 : out STD_LOGIC;
    left_aligned_r_reg_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    left_aligned_r_reg_2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC;
    drpwe_in : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_tx_reset_i : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt_qpllclk_quad1_out : in STD_LOGIC;
    gt_qpllrefclk_quad1_out : in STD_LOGIC;
    gt_rxdfelfhold_i : in STD_LOGIC;
    ena_comma_align_i : in STD_LOGIC;
    rx_polarity_i : in STD_LOGIC;
    gt_rxuserrdy_i : in STD_LOGIC;
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    flag2_reg : in STD_LOGIC;
    cpll_reset_i : in STD_LOGIC;
    \word_aligned_control_bits_r_reg[1]\ : in STD_LOGIC;
    bucket_full_r : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_multi_gt : entity is "simplex_rx_aurora_8b10b_0_0_multi_gt";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_multi_gt;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_multi_gt is
begin
gt0_simplex_rx_aurora_8b10b_0_0_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt
     port map (
      D(1 downto 0) => D(1 downto 0),
      RXDISPERR(1 downto 0) => RXDISPERR(1 downto 0),
      RXNOTINTABLE(1 downto 0) => RXNOTINTABLE(1 downto 0),
      SR(0) => SR(0),
      ack_flag => ack_flag,
      bucket_full_r => bucket_full_r,
      cpll_reset_i => cpll_reset_i,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      ena_comma_align_i => ena_comma_align_i,
      flag2_reg_0 => flag2_reg,
      gt_qpllclk_quad1_out => gt_qpllclk_quad1_out,
      gt_qpllrefclk_quad1_out => gt_qpllrefclk_quad1_out,
      gt_refclk1 => gt_refclk1,
      gt_rxdfelfhold_i => gt_rxdfelfhold_i,
      gt_rxuserrdy_i => gt_rxuserrdy_i,
      gt_tx_reset_i => gt_tx_reset_i,
      hard_err_flop_r0 => hard_err_flop_r0,
      init_clk_in => init_clk_in,
      init_clk_in_0 => init_clk_in_0,
      init_clk_in_1 => init_clk_in_1,
      init_clk_in_2(1 downto 0) => init_clk_in_2(1 downto 0),
      init_clk_in_3 => init_clk_in_3,
      left_aligned_r_reg => left_aligned_r_reg,
      left_aligned_r_reg_0 => left_aligned_r_reg_0,
      left_aligned_r_reg_1(7 downto 0) => left_aligned_r_reg_1(7 downto 0),
      left_aligned_r_reg_2(7 downto 0) => left_aligned_r_reg_2(7 downto 0),
      loopback(2 downto 0) => loopback(2 downto 0),
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i,
      rxn => rxn,
      rxp => rxp,
      s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg,
      tx_out_clk_i => tx_out_clk_i,
      \word_aligned_control_bits_r_reg[1]\ => \word_aligned_control_bits_r_reg[1]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_rx_startup_fsm is
  port (
    gt_tx_reset_i : out STD_LOGIC;
    gt_rxuserrdy_i : out STD_LOGIC;
    cpll_reset_i : out STD_LOGIC;
    gt_rxdfelfhold_i : out STD_LOGIC;
    CPLL_RESET_reg_0 : out STD_LOGIC;
    s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg : in STD_LOGIC;
    rxfsm_rxresetdone_r : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ack_flag : in STD_LOGIC;
    reset_time_out_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_rx_startup_fsm : entity is "simplex_rx_aurora_8b10b_0_0_rx_startup_fsm";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_rx_startup_fsm;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_rx_startup_fsm is
  signal CPLL_RESET_i_1_n_0 : STD_LOGIC;
  signal \FSM_sequential_rx_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_11_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_12_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_13_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_14_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_15_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_16_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_17_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_9_n_0\ : STD_LOGIC;
  signal RXDFEAGCHOLD_i_1_n_0 : STD_LOGIC;
  signal RXUSERRDY_i_1_n_0 : STD_LOGIC;
  signal adapt_count : STD_LOGIC;
  signal \adapt_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \adapt_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \adapt_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \adapt_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \adapt_count[0]_i_7_n_0\ : STD_LOGIC;
  signal \adapt_count[0]_i_8_n_0\ : STD_LOGIC;
  signal \adapt_count[0]_i_9_n_0\ : STD_LOGIC;
  signal adapt_count_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \adapt_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \adapt_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \adapt_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \adapt_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \adapt_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \adapt_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \adapt_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \adapt_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \adapt_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \adapt_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \adapt_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \adapt_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \adapt_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \adapt_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \adapt_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \adapt_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \adapt_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \adapt_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \adapt_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \adapt_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \adapt_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \adapt_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \adapt_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \adapt_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \adapt_count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \adapt_count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \adapt_count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \adapt_count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \adapt_count_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \adapt_count_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \adapt_count_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \adapt_count_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \adapt_count_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \adapt_count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \adapt_count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \adapt_count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \adapt_count_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \adapt_count_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \adapt_count_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \adapt_count_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \adapt_count_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \adapt_count_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \adapt_count_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \adapt_count_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \adapt_count_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \adapt_count_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \adapt_count_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \adapt_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \adapt_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \adapt_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \adapt_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \adapt_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \adapt_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \adapt_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \adapt_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \adapt_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \adapt_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \adapt_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \adapt_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \adapt_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \adapt_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \adapt_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \adapt_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal check_tlock_max_i_1_n_0 : STD_LOGIC;
  signal check_tlock_max_reg_n_0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \^cpll_reset_i\ : STD_LOGIC;
  signal \^gt_rxdfelfhold_i\ : STD_LOGIC;
  signal \^gt_rxuserrdy_i\ : STD_LOGIC;
  signal \^gt_tx_reset_i\ : STD_LOGIC;
  signal gtrxreset_i_i_1_n_0 : STD_LOGIC;
  signal init_wait_count : STD_LOGIC;
  signal \init_wait_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \init_wait_count[6]_i_2_n_0\ : STD_LOGIC;
  signal \init_wait_count[7]_i_3_n_0\ : STD_LOGIC;
  signal \init_wait_count_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal init_wait_done_i_1_n_0 : STD_LOGIC;
  signal init_wait_done_reg_n_0 : STD_LOGIC;
  signal \mmcm_lock_count[2]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[5]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[6]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[7]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[8]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[9]_i_2_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[9]_i_3_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[9]_i_4_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal mmcm_lock_reclocked_i_2_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal pll_reset_asserted_i_1_n_0 : STD_LOGIC;
  signal pll_reset_asserted_reg_n_0 : STD_LOGIC;
  signal recclk_mon_count_reset : STD_LOGIC;
  signal reset_time_out_reg_n_0 : STD_LOGIC;
  signal run_phase_alignment_int : STD_LOGIC;
  signal run_phase_alignment_int_i_1_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal run_phase_alignment_int_s3 : STD_LOGIC;
  signal rx_fsm_reset_done_int : STD_LOGIC;
  signal rx_fsm_reset_done_int_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_1_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_3_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_4_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_5_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s3 : STD_LOGIC;
  signal rx_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rxresetdone_s2 : STD_LOGIC;
  signal rxresetdone_s3 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal sync_cplllock_cdc_sync_n_0 : STD_LOGIC;
  signal sync_cplllock_cdc_sync_n_1 : STD_LOGIC;
  signal sync_cplllock_cdc_sync_n_2 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_cdc_sync_n_0 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_cdc_sync_n_1 : STD_LOGIC;
  signal sync_rx_fsm_reset_done_int_cdc_sync_n_0 : STD_LOGIC;
  signal time_out_100us_i_1_n_0 : STD_LOGIC;
  signal time_out_100us_i_2_n_0 : STD_LOGIC;
  signal time_out_100us_i_3_n_0 : STD_LOGIC;
  signal time_out_100us_i_4_n_0 : STD_LOGIC;
  signal time_out_100us_reg_n_0 : STD_LOGIC;
  signal time_out_1us_i_1_n_0 : STD_LOGIC;
  signal time_out_1us_i_2_n_0 : STD_LOGIC;
  signal time_out_1us_i_3_n_0 : STD_LOGIC;
  signal time_out_1us_i_4_n_0 : STD_LOGIC;
  signal time_out_1us_reg_n_0 : STD_LOGIC;
  signal time_out_2ms_i_1_n_0 : STD_LOGIC;
  signal time_out_2ms_i_2_n_0 : STD_LOGIC;
  signal time_out_2ms_reg_n_0 : STD_LOGIC;
  signal time_out_adapt_i_1_n_0 : STD_LOGIC;
  signal time_out_adapt_i_2_n_0 : STD_LOGIC;
  signal time_out_adapt_i_3_n_0 : STD_LOGIC;
  signal time_out_adapt_i_4_n_0 : STD_LOGIC;
  signal time_out_adapt_i_5_n_0 : STD_LOGIC;
  signal time_out_adapt_i_6_n_0 : STD_LOGIC;
  signal time_out_adapt_i_7_n_0 : STD_LOGIC;
  signal time_out_adapt_reg_n_0 : STD_LOGIC;
  signal \time_out_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_6_n_0\ : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \time_out_counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal time_out_wait_bypass : STD_LOGIC;
  signal time_out_wait_bypass_i_1_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal time_tlock_max : STD_LOGIC;
  signal time_tlock_max_i_1_n_0 : STD_LOGIC;
  signal time_tlock_max_i_2_n_0 : STD_LOGIC;
  signal time_tlock_max_i_3_n_0 : STD_LOGIC;
  signal time_tlock_max_i_4_n_0 : STD_LOGIC;
  signal time_tlock_max_i_5_n_0 : STD_LOGIC;
  signal \wait_bypass_count[0]_i_2_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_7_n_0\ : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \wait_bypass_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_8_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_9_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal wait_time_cnt_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \wait_time_cnt_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_adapt_count_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[0]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_10\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_11\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_12\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_17\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_9\ : label is "soft_lutpair9";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[0]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[1]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[2]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[3]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute SOFT_HLUTNM of RXUSERRDY_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of check_tlock_max_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of gtrxreset_i_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \init_wait_count[6]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mmcm_lock_count[8]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of mmcm_lock_reclocked_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of rx_fsm_reset_done_int_i_5 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of time_out_1us_i_3 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of time_out_2ms_i_2 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \time_out_counter[0]_i_3\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of time_tlock_max_i_2 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of time_tlock_max_i_3 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of time_tlock_max_i_5 : label is "soft_lutpair10";
begin
  cpll_reset_i <= \^cpll_reset_i\;
  gt_rxdfelfhold_i <= \^gt_rxdfelfhold_i\;
  gt_rxuserrdy_i <= \^gt_rxuserrdy_i\;
  gt_tx_reset_i <= \^gt_tx_reset_i\;
CPLL_RESET_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDFF00000100"
    )
        port map (
      I0 => pll_reset_asserted_reg_n_0,
      I1 => rx_state(3),
      I2 => rx_state(2),
      I3 => rx_state(0),
      I4 => rx_state(1),
      I5 => \^cpll_reset_i\,
      O => CPLL_RESET_i_1_n_0
    );
CPLL_RESET_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => CPLL_RESET_i_1_n_0,
      Q => \^cpll_reset_i\,
      R => AR(0)
    );
\FSM_sequential_rx_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFEFEF"
    )
        port map (
      I0 => \FSM_sequential_rx_state[0]_i_2_n_0\,
      I1 => \FSM_sequential_rx_state[0]_i_3_n_0\,
      I2 => rx_state(0),
      I3 => rx_state(1),
      I4 => rx_state(3),
      O => \FSM_sequential_rx_state[0]_i_1_n_0\
    );
\FSM_sequential_rx_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222AAAA00300000"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => reset_time_out_reg_n_0,
      I2 => time_tlock_max,
      I3 => rx_state(3),
      I4 => rx_state(2),
      I5 => rx_state(1),
      O => \FSM_sequential_rx_state[0]_i_2_n_0\
    );
\FSM_sequential_rx_state[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => rx_state(3),
      I1 => reset_time_out_reg_n_0,
      I2 => \^gt_rxuserrdy_i\,
      I3 => time_out_100us_reg_n_0,
      O => \FSM_sequential_rx_state[0]_i_3_n_0\
    );
\FSM_sequential_rx_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEEAAAAFAAAAA"
    )
        port map (
      I0 => \FSM_sequential_rx_state[1]_i_2_n_0\,
      I1 => \FSM_sequential_rx_state[1]_i_3_n_0\,
      I2 => rx_state(2),
      I3 => rx_state(3),
      I4 => rx_state(1),
      I5 => rx_state(0),
      O => \FSM_sequential_rx_state[1]_i_1_n_0\
    );
\FSM_sequential_rx_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AABF000F0000"
    )
        port map (
      I0 => reset_time_out_reg_n_0,
      I1 => time_tlock_max,
      I2 => rx_state(2),
      I3 => rx_state(3),
      I4 => rx_state(1),
      I5 => rx_state(0),
      O => \FSM_sequential_rx_state[1]_i_2_n_0\
    );
\FSM_sequential_rx_state[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^gt_rxuserrdy_i\,
      I1 => time_out_100us_reg_n_0,
      O => \FSM_sequential_rx_state[1]_i_3_n_0\
    );
\FSM_sequential_rx_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"010C0C0C01000C0C"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => rx_state(2),
      I2 => rx_state(3),
      I3 => rx_state(1),
      I4 => rx_state(0),
      I5 => \FSM_sequential_rx_state[2]_i_2_n_0\,
      O => \FSM_sequential_rx_state[2]_i_1_n_0\
    );
\FSM_sequential_rx_state[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_time_out_reg_n_0,
      I1 => time_tlock_max,
      O => \FSM_sequential_rx_state[2]_i_2_n_0\
    );
\FSM_sequential_rx_state[3]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => time_out_100us_reg_n_0,
      I1 => \^gt_rxuserrdy_i\,
      I2 => reset_time_out_reg_n_0,
      O => \FSM_sequential_rx_state[3]_i_10_n_0\
    );
\FSM_sequential_rx_state[3]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_time_out_reg_n_0,
      I1 => time_out_2ms_reg_n_0,
      O => \FSM_sequential_rx_state[3]_i_11_n_0\
    );
\FSM_sequential_rx_state[3]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(3),
      O => \FSM_sequential_rx_state[3]_i_12_n_0\
    );
\FSM_sequential_rx_state[3]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      I1 => wait_time_cnt_reg(7),
      I2 => wait_time_cnt_reg(4),
      I3 => wait_time_cnt_reg(5),
      I4 => wait_time_cnt_reg(9),
      I5 => wait_time_cnt_reg(8),
      O => \FSM_sequential_rx_state[3]_i_13_n_0\
    );
\FSM_sequential_rx_state[3]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      I1 => wait_time_cnt_reg(13),
      I2 => wait_time_cnt_reg(10),
      I3 => wait_time_cnt_reg(11),
      I4 => wait_time_cnt_reg(15),
      I5 => wait_time_cnt_reg(14),
      O => \FSM_sequential_rx_state[3]_i_14_n_0\
    );
\FSM_sequential_rx_state[3]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => rx_state(0),
      I1 => rx_state(1),
      I2 => rx_state(3),
      I3 => wait_time_cnt_reg(3),
      O => \FSM_sequential_rx_state[3]_i_15_n_0\
    );
\FSM_sequential_rx_state[3]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000008F888888"
    )
        port map (
      I0 => rx_state(3),
      I1 => \^gt_rxuserrdy_i\,
      I2 => rx_state(0),
      I3 => rx_state(2),
      I4 => reset_time_out_reg_0,
      I5 => rx_state(1),
      O => \FSM_sequential_rx_state[3]_i_16_n_0\
    );
\FSM_sequential_rx_state[3]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rx_state(1),
      I1 => rx_state(0),
      O => \FSM_sequential_rx_state[3]_i_17_n_0\
    );
\FSM_sequential_rx_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAAAEAEFAAAA"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_9_n_0\,
      I1 => \FSM_sequential_rx_state[3]_i_10_n_0\,
      I2 => rx_state(0),
      I3 => time_out_wait_bypass_s3,
      I4 => rx_state(3),
      I5 => rx_state(1),
      O => \FSM_sequential_rx_state[3]_i_2_n_0\
    );
\FSM_sequential_rx_state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000F440000"
    )
        port map (
      I0 => \FSM_sequential_rx_state[2]_i_2_n_0\,
      I1 => rx_state(2),
      I2 => \FSM_sequential_rx_state[3]_i_11_n_0\,
      I3 => rx_state(1),
      I4 => rx_state(0),
      I5 => rx_state(3),
      O => \FSM_sequential_rx_state[3]_i_3_n_0\
    );
\FSM_sequential_rx_state[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAABAA"
    )
        port map (
      I0 => \FSM_sequential_rx_state[0]_i_3_n_0\,
      I1 => rx_state(1),
      I2 => rx_state(2),
      I3 => init_wait_done_reg_n_0,
      I4 => rx_state(0),
      O => \FSM_sequential_rx_state[3]_i_4_n_0\
    );
\FSM_sequential_rx_state[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_13_n_0\,
      I1 => \FSM_sequential_rx_state[3]_i_14_n_0\,
      I2 => wait_time_cnt_reg(2),
      I3 => wait_time_cnt_reg(1),
      I4 => wait_time_cnt_reg(0),
      I5 => \FSM_sequential_rx_state[3]_i_15_n_0\,
      O => \FSM_sequential_rx_state[3]_i_7_n_0\
    );
\FSM_sequential_rx_state[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAEAFFAAAAEA"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_16_n_0\,
      I1 => mmcm_lock_reclocked,
      I2 => rx_state(2),
      I3 => rx_state(3),
      I4 => \FSM_sequential_rx_state[3]_i_17_n_0\,
      I5 => \^gt_rxuserrdy_i\,
      O => \FSM_sequential_rx_state[3]_i_8_n_0\
    );
\FSM_sequential_rx_state[3]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80800080"
    )
        port map (
      I0 => rx_state(0),
      I1 => rx_state(1),
      I2 => rx_state(2),
      I3 => time_out_2ms_reg_n_0,
      I4 => reset_time_out_reg_n_0,
      O => \FSM_sequential_rx_state[3]_i_9_n_0\
    );
\FSM_sequential_rx_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_cplllock_cdc_sync_n_2,
      D => \FSM_sequential_rx_state[0]_i_1_n_0\,
      Q => rx_state(0),
      R => AR(0)
    );
\FSM_sequential_rx_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_cplllock_cdc_sync_n_2,
      D => \FSM_sequential_rx_state[1]_i_1_n_0\,
      Q => rx_state(1),
      R => AR(0)
    );
\FSM_sequential_rx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_cplllock_cdc_sync_n_2,
      D => \FSM_sequential_rx_state[2]_i_1_n_0\,
      Q => rx_state(2),
      R => AR(0)
    );
\FSM_sequential_rx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_cplllock_cdc_sync_n_2,
      D => \FSM_sequential_rx_state[3]_i_2_n_0\,
      Q => rx_state(3),
      R => AR(0)
    );
RXDFEAGCHOLD_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00080000"
    )
        port map (
      I0 => time_out_adapt_reg_n_0,
      I1 => rx_state(1),
      I2 => rx_state(0),
      I3 => rx_state(2),
      I4 => rx_state(3),
      I5 => \^gt_rxdfelfhold_i\,
      O => RXDFEAGCHOLD_i_1_n_0
    );
RXDFEAGCHOLD_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => RXDFEAGCHOLD_i_1_n_0,
      Q => \^gt_rxdfelfhold_i\,
      R => AR(0)
    );
RXUSERRDY_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB4000"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(0),
      I2 => rx_state(2),
      I3 => rx_state(1),
      I4 => \^gt_rxuserrdy_i\,
      O => RXUSERRDY_i_1_n_0
    );
RXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => RXUSERRDY_i_1_n_0,
      Q => \^gt_rxuserrdy_i\,
      R => AR(0)
    );
\adapt_count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => \adapt_count[0]_i_3_n_0\,
      I1 => \adapt_count[0]_i_4_n_0\,
      I2 => \adapt_count[0]_i_5_n_0\,
      I3 => \adapt_count[0]_i_6_n_0\,
      I4 => \adapt_count[0]_i_7_n_0\,
      I5 => \adapt_count[0]_i_8_n_0\,
      O => adapt_count
    );
\adapt_count[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFD"
    )
        port map (
      I0 => adapt_count_reg(12),
      I1 => adapt_count_reg(13),
      I2 => adapt_count_reg(10),
      I3 => adapt_count_reg(11),
      I4 => adapt_count_reg(9),
      I5 => adapt_count_reg(8),
      O => \adapt_count[0]_i_3_n_0\
    );
\adapt_count[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => adapt_count_reg(18),
      I1 => adapt_count_reg(19),
      I2 => adapt_count_reg(17),
      I3 => adapt_count_reg(16),
      I4 => adapt_count_reg(15),
      I5 => adapt_count_reg(14),
      O => \adapt_count[0]_i_4_n_0\
    );
\adapt_count[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => adapt_count_reg(30),
      I1 => adapt_count_reg(31),
      I2 => adapt_count_reg(28),
      I3 => adapt_count_reg(29),
      I4 => adapt_count_reg(27),
      I5 => adapt_count_reg(26),
      O => \adapt_count[0]_i_5_n_0\
    );
\adapt_count[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => adapt_count_reg(24),
      I1 => adapt_count_reg(25),
      I2 => adapt_count_reg(22),
      I3 => adapt_count_reg(23),
      I4 => adapt_count_reg(21),
      I5 => adapt_count_reg(20),
      O => \adapt_count[0]_i_6_n_0\
    );
\adapt_count[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => adapt_count_reg(0),
      I1 => adapt_count_reg(1),
      O => \adapt_count[0]_i_7_n_0\
    );
\adapt_count[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => adapt_count_reg(6),
      I1 => adapt_count_reg(7),
      I2 => adapt_count_reg(4),
      I3 => adapt_count_reg(5),
      I4 => adapt_count_reg(3),
      I5 => adapt_count_reg(2),
      O => \adapt_count[0]_i_8_n_0\
    );
\adapt_count[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => adapt_count_reg(0),
      O => \adapt_count[0]_i_9_n_0\
    );
\adapt_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[0]_i_2_n_7\,
      Q => adapt_count_reg(0),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \adapt_count_reg[0]_i_2_n_0\,
      CO(2) => \adapt_count_reg[0]_i_2_n_1\,
      CO(1) => \adapt_count_reg[0]_i_2_n_2\,
      CO(0) => \adapt_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \adapt_count_reg[0]_i_2_n_4\,
      O(2) => \adapt_count_reg[0]_i_2_n_5\,
      O(1) => \adapt_count_reg[0]_i_2_n_6\,
      O(0) => \adapt_count_reg[0]_i_2_n_7\,
      S(3 downto 1) => adapt_count_reg(3 downto 1),
      S(0) => \adapt_count[0]_i_9_n_0\
    );
\adapt_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[8]_i_1_n_5\,
      Q => adapt_count_reg(10),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[8]_i_1_n_4\,
      Q => adapt_count_reg(11),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[12]_i_1_n_7\,
      Q => adapt_count_reg(12),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \adapt_count_reg[8]_i_1_n_0\,
      CO(3) => \adapt_count_reg[12]_i_1_n_0\,
      CO(2) => \adapt_count_reg[12]_i_1_n_1\,
      CO(1) => \adapt_count_reg[12]_i_1_n_2\,
      CO(0) => \adapt_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \adapt_count_reg[12]_i_1_n_4\,
      O(2) => \adapt_count_reg[12]_i_1_n_5\,
      O(1) => \adapt_count_reg[12]_i_1_n_6\,
      O(0) => \adapt_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => adapt_count_reg(15 downto 12)
    );
\adapt_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[12]_i_1_n_6\,
      Q => adapt_count_reg(13),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[12]_i_1_n_5\,
      Q => adapt_count_reg(14),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[12]_i_1_n_4\,
      Q => adapt_count_reg(15),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[16]_i_1_n_7\,
      Q => adapt_count_reg(16),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \adapt_count_reg[12]_i_1_n_0\,
      CO(3) => \adapt_count_reg[16]_i_1_n_0\,
      CO(2) => \adapt_count_reg[16]_i_1_n_1\,
      CO(1) => \adapt_count_reg[16]_i_1_n_2\,
      CO(0) => \adapt_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \adapt_count_reg[16]_i_1_n_4\,
      O(2) => \adapt_count_reg[16]_i_1_n_5\,
      O(1) => \adapt_count_reg[16]_i_1_n_6\,
      O(0) => \adapt_count_reg[16]_i_1_n_7\,
      S(3 downto 0) => adapt_count_reg(19 downto 16)
    );
\adapt_count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[16]_i_1_n_6\,
      Q => adapt_count_reg(17),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[16]_i_1_n_5\,
      Q => adapt_count_reg(18),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[16]_i_1_n_4\,
      Q => adapt_count_reg(19),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[0]_i_2_n_6\,
      Q => adapt_count_reg(1),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[20]_i_1_n_7\,
      Q => adapt_count_reg(20),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \adapt_count_reg[16]_i_1_n_0\,
      CO(3) => \adapt_count_reg[20]_i_1_n_0\,
      CO(2) => \adapt_count_reg[20]_i_1_n_1\,
      CO(1) => \adapt_count_reg[20]_i_1_n_2\,
      CO(0) => \adapt_count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \adapt_count_reg[20]_i_1_n_4\,
      O(2) => \adapt_count_reg[20]_i_1_n_5\,
      O(1) => \adapt_count_reg[20]_i_1_n_6\,
      O(0) => \adapt_count_reg[20]_i_1_n_7\,
      S(3 downto 0) => adapt_count_reg(23 downto 20)
    );
\adapt_count_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[20]_i_1_n_6\,
      Q => adapt_count_reg(21),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[20]_i_1_n_5\,
      Q => adapt_count_reg(22),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[20]_i_1_n_4\,
      Q => adapt_count_reg(23),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[24]_i_1_n_7\,
      Q => adapt_count_reg(24),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \adapt_count_reg[20]_i_1_n_0\,
      CO(3) => \adapt_count_reg[24]_i_1_n_0\,
      CO(2) => \adapt_count_reg[24]_i_1_n_1\,
      CO(1) => \adapt_count_reg[24]_i_1_n_2\,
      CO(0) => \adapt_count_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \adapt_count_reg[24]_i_1_n_4\,
      O(2) => \adapt_count_reg[24]_i_1_n_5\,
      O(1) => \adapt_count_reg[24]_i_1_n_6\,
      O(0) => \adapt_count_reg[24]_i_1_n_7\,
      S(3 downto 0) => adapt_count_reg(27 downto 24)
    );
\adapt_count_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[24]_i_1_n_6\,
      Q => adapt_count_reg(25),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[24]_i_1_n_5\,
      Q => adapt_count_reg(26),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[24]_i_1_n_4\,
      Q => adapt_count_reg(27),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[28]_i_1_n_7\,
      Q => adapt_count_reg(28),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \adapt_count_reg[24]_i_1_n_0\,
      CO(3) => \NLW_adapt_count_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \adapt_count_reg[28]_i_1_n_1\,
      CO(1) => \adapt_count_reg[28]_i_1_n_2\,
      CO(0) => \adapt_count_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \adapt_count_reg[28]_i_1_n_4\,
      O(2) => \adapt_count_reg[28]_i_1_n_5\,
      O(1) => \adapt_count_reg[28]_i_1_n_6\,
      O(0) => \adapt_count_reg[28]_i_1_n_7\,
      S(3 downto 0) => adapt_count_reg(31 downto 28)
    );
\adapt_count_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[28]_i_1_n_6\,
      Q => adapt_count_reg(29),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[0]_i_2_n_5\,
      Q => adapt_count_reg(2),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[28]_i_1_n_5\,
      Q => adapt_count_reg(30),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[28]_i_1_n_4\,
      Q => adapt_count_reg(31),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[0]_i_2_n_4\,
      Q => adapt_count_reg(3),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[4]_i_1_n_7\,
      Q => adapt_count_reg(4),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \adapt_count_reg[0]_i_2_n_0\,
      CO(3) => \adapt_count_reg[4]_i_1_n_0\,
      CO(2) => \adapt_count_reg[4]_i_1_n_1\,
      CO(1) => \adapt_count_reg[4]_i_1_n_2\,
      CO(0) => \adapt_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \adapt_count_reg[4]_i_1_n_4\,
      O(2) => \adapt_count_reg[4]_i_1_n_5\,
      O(1) => \adapt_count_reg[4]_i_1_n_6\,
      O(0) => \adapt_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => adapt_count_reg(7 downto 4)
    );
\adapt_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[4]_i_1_n_6\,
      Q => adapt_count_reg(5),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[4]_i_1_n_5\,
      Q => adapt_count_reg(6),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[4]_i_1_n_4\,
      Q => adapt_count_reg(7),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[8]_i_1_n_7\,
      Q => adapt_count_reg(8),
      R => recclk_mon_count_reset
    );
\adapt_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \adapt_count_reg[4]_i_1_n_0\,
      CO(3) => \adapt_count_reg[8]_i_1_n_0\,
      CO(2) => \adapt_count_reg[8]_i_1_n_1\,
      CO(1) => \adapt_count_reg[8]_i_1_n_2\,
      CO(0) => \adapt_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \adapt_count_reg[8]_i_1_n_4\,
      O(2) => \adapt_count_reg[8]_i_1_n_5\,
      O(1) => \adapt_count_reg[8]_i_1_n_6\,
      O(0) => \adapt_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => adapt_count_reg(11 downto 8)
    );
\adapt_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => adapt_count,
      D => \adapt_count_reg[8]_i_1_n_6\,
      Q => adapt_count_reg(9),
      R => recclk_mon_count_reset
    );
adapt_count_reset_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => sync_cplllock_cdc_sync_n_1,
      Q => recclk_mon_count_reset,
      S => AR(0)
    );
check_tlock_max_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(0),
      I2 => rx_state(1),
      I3 => rx_state(3),
      I4 => check_tlock_max_reg_n_0,
      O => check_tlock_max_i_1_n_0
    );
check_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => check_tlock_max_i_1_n_0,
      Q => check_tlock_max_reg_n_0,
      R => AR(0)
    );
flag2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^cpll_reset_i\,
      I1 => ack_flag,
      O => CPLL_RESET_reg_0
    );
gtrxreset_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0100"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(1),
      I2 => rx_state(2),
      I3 => rx_state(0),
      I4 => \^gt_tx_reset_i\,
      O => gtrxreset_i_i_1_n_0
    );
gtrxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_i_i_1_n_0,
      Q => \^gt_tx_reset_i\,
      R => AR(0)
    );
\init_wait_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \init_wait_count_reg__0\(0),
      O => \init_wait_count[0]_i_1_n_0\
    );
\init_wait_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \init_wait_count_reg__0\(0),
      I1 => \init_wait_count_reg__0\(1),
      O => p_0_in(1)
    );
\init_wait_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(2),
      O => p_0_in(2)
    );
\init_wait_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(3),
      O => p_0_in(3)
    );
\init_wait_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(3),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(1),
      I4 => \init_wait_count_reg__0\(4),
      O => p_0_in(4)
    );
\init_wait_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \init_wait_count_reg__0\(3),
      I1 => \init_wait_count_reg__0\(2),
      I2 => \init_wait_count_reg__0\(4),
      I3 => \init_wait_count_reg__0\(0),
      I4 => \init_wait_count_reg__0\(1),
      I5 => \init_wait_count_reg__0\(5),
      O => p_0_in(5)
    );
\init_wait_count[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \init_wait_count_reg__0\(4),
      I1 => \init_wait_count_reg__0\(2),
      I2 => \init_wait_count_reg__0\(3),
      I3 => \init_wait_count_reg__0\(5),
      I4 => \init_wait_count[6]_i_2_n_0\,
      I5 => \init_wait_count_reg__0\(6),
      O => p_0_in(6)
    );
\init_wait_count[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \init_wait_count_reg__0\(0),
      I1 => \init_wait_count_reg__0\(1),
      O => \init_wait_count[6]_i_2_n_0\
    );
\init_wait_count[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \init_wait_count_reg__0\(6),
      I1 => \init_wait_count_reg__0\(7),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count[7]_i_3_n_0\,
      I4 => \init_wait_count_reg__0\(1),
      O => init_wait_count
    );
\init_wait_count[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF4000"
    )
        port map (
      I0 => \init_wait_count[7]_i_3_n_0\,
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(6),
      I4 => \init_wait_count_reg__0\(7),
      O => p_0_in(7)
    );
\init_wait_count[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \init_wait_count_reg__0\(4),
      I1 => \init_wait_count_reg__0\(2),
      I2 => \init_wait_count_reg__0\(3),
      I3 => \init_wait_count_reg__0\(5),
      O => \init_wait_count[7]_i_3_n_0\
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => \init_wait_count[0]_i_1_n_0\,
      Q => \init_wait_count_reg__0\(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => p_0_in(1),
      Q => \init_wait_count_reg__0\(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => p_0_in(2),
      Q => \init_wait_count_reg__0\(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => p_0_in(3),
      Q => \init_wait_count_reg__0\(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => p_0_in(4),
      Q => \init_wait_count_reg__0\(4)
    );
\init_wait_count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => p_0_in(5),
      Q => \init_wait_count_reg__0\(5)
    );
\init_wait_count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => p_0_in(6),
      Q => \init_wait_count_reg__0\(6)
    );
\init_wait_count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => p_0_in(7),
      Q => \init_wait_count_reg__0\(7)
    );
init_wait_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
        port map (
      I0 => \init_wait_count[7]_i_3_n_0\,
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(7),
      I4 => \init_wait_count_reg__0\(6),
      I5 => init_wait_done_reg_n_0,
      O => init_wait_done_i_1_n_0
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      CLR => AR(0),
      D => init_wait_done_i_1_n_0,
      Q => init_wait_done_reg_n_0
    );
\mmcm_lock_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\mmcm_lock_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      O => \p_0_in__0\(1)
    );
\mmcm_lock_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      O => \mmcm_lock_count[2]_i_1_n_0\
    );
\mmcm_lock_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(2),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(1),
      I3 => \mmcm_lock_count_reg__0\(3),
      O => \mmcm_lock_count[3]_i_1_n_0\
    );
\mmcm_lock_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(3),
      I1 => \mmcm_lock_count_reg__0\(1),
      I2 => \mmcm_lock_count_reg__0\(0),
      I3 => \mmcm_lock_count_reg__0\(2),
      I4 => \mmcm_lock_count_reg__0\(4),
      O => \mmcm_lock_count[4]_i_1_n_0\
    );
\mmcm_lock_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(2),
      I2 => \mmcm_lock_count_reg__0\(0),
      I3 => \mmcm_lock_count_reg__0\(1),
      I4 => \mmcm_lock_count_reg__0\(3),
      I5 => \mmcm_lock_count_reg__0\(5),
      O => \mmcm_lock_count[5]_i_1_n_0\
    );
\mmcm_lock_count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \mmcm_lock_count[9]_i_4_n_0\,
      I1 => \mmcm_lock_count_reg__0\(6),
      O => \mmcm_lock_count[6]_i_1_n_0\
    );
\mmcm_lock_count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(6),
      I1 => \mmcm_lock_count[9]_i_4_n_0\,
      I2 => \mmcm_lock_count_reg__0\(7),
      O => \mmcm_lock_count[7]_i_1_n_0\
    );
\mmcm_lock_count[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \mmcm_lock_count[9]_i_4_n_0\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      O => \mmcm_lock_count[8]_i_1_n_0\
    );
\mmcm_lock_count[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \mmcm_lock_count[9]_i_4_n_0\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \mmcm_lock_count[9]_i_2_n_0\
    );
\mmcm_lock_count[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FF0800"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(8),
      I1 => \mmcm_lock_count_reg__0\(6),
      I2 => \mmcm_lock_count[9]_i_4_n_0\,
      I3 => \mmcm_lock_count_reg__0\(7),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \mmcm_lock_count[9]_i_3_n_0\
    );
\mmcm_lock_count[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(2),
      I2 => \mmcm_lock_count_reg__0\(0),
      I3 => \mmcm_lock_count_reg__0\(1),
      I4 => \mmcm_lock_count_reg__0\(3),
      I5 => \mmcm_lock_count_reg__0\(5),
      O => \mmcm_lock_count[9]_i_4_n_0\
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__0\(0),
      Q => \mmcm_lock_count_reg__0\(0),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__0\(1),
      Q => \mmcm_lock_count_reg__0\(1),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \mmcm_lock_count[2]_i_1_n_0\,
      Q => \mmcm_lock_count_reg__0\(2),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \mmcm_lock_count[3]_i_1_n_0\,
      Q => \mmcm_lock_count_reg__0\(3),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \mmcm_lock_count[4]_i_1_n_0\,
      Q => \mmcm_lock_count_reg__0\(4),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \mmcm_lock_count[5]_i_1_n_0\,
      Q => \mmcm_lock_count_reg__0\(5),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \mmcm_lock_count[6]_i_1_n_0\,
      Q => \mmcm_lock_count_reg__0\(6),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \mmcm_lock_count[7]_i_1_n_0\,
      Q => \mmcm_lock_count_reg__0\(7),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
\mmcm_lock_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \mmcm_lock_count[8]_i_1_n_0\,
      Q => \mmcm_lock_count_reg__0\(8),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
\mmcm_lock_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \mmcm_lock_count[9]_i_3_n_0\,
      Q => \mmcm_lock_count_reg__0\(9),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
mmcm_lock_reclocked_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(9),
      I1 => \mmcm_lock_count_reg__0\(8),
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count[9]_i_4_n_0\,
      I4 => \mmcm_lock_count_reg__0\(7),
      O => mmcm_lock_reclocked_i_2_n_0
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => sync_mmcm_lock_reclocked_cdc_sync_n_0,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
pll_reset_asserted_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FDFF0100"
    )
        port map (
      I0 => rx_state(1),
      I1 => rx_state(2),
      I2 => rx_state(3),
      I3 => rx_state(0),
      I4 => pll_reset_asserted_reg_n_0,
      O => pll_reset_asserted_i_1_n_0
    );
pll_reset_asserted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => pll_reset_asserted_i_1_n_0,
      Q => pll_reset_asserted_reg_n_0,
      R => AR(0)
    );
reset_time_out_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => sync_cplllock_cdc_sync_n_0,
      Q => reset_time_out_reg_n_0,
      S => AR(0)
    );
run_phase_alignment_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0010"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(1),
      I2 => rx_state(3),
      I3 => rx_state(0),
      I4 => run_phase_alignment_int,
      O => run_phase_alignment_int_i_1_n_0
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => run_phase_alignment_int_i_1_n_0,
      Q => run_phase_alignment_int,
      R => AR(0)
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => run_phase_alignment_int_s3,
      R => '0'
    );
rx_fsm_reset_done_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => rx_fsm_reset_done_int_0,
      I1 => rx_fsm_reset_done_int_i_3_n_0,
      I2 => rx_fsm_reset_done_int_i_4_n_0,
      I3 => rx_fsm_reset_done_int,
      O => rx_fsm_reset_done_int_i_1_n_0
    );
rx_fsm_reset_done_int_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => rx_state(0),
      I1 => time_out_1us_reg_n_0,
      I2 => rx_state(2),
      I3 => reset_time_out_reg_n_0,
      I4 => \^gt_rxuserrdy_i\,
      O => rx_fsm_reset_done_int_0
    );
rx_fsm_reset_done_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400040004040400"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_17_n_0\,
      I1 => rx_state(3),
      I2 => rx_state(2),
      I3 => \^gt_rxuserrdy_i\,
      I4 => time_out_100us_reg_n_0,
      I5 => reset_time_out_reg_n_0,
      O => rx_fsm_reset_done_int_i_3_n_0
    );
rx_fsm_reset_done_int_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020002020200020"
    )
        port map (
      I0 => rx_state(1),
      I1 => rx_state(0),
      I2 => rx_fsm_reset_done_int_i_5_n_0,
      I3 => \^gt_rxuserrdy_i\,
      I4 => time_out_1us_reg_n_0,
      I5 => reset_time_out_reg_n_0,
      O => rx_fsm_reset_done_int_i_4_n_0
    );
rx_fsm_reset_done_int_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(2),
      O => rx_fsm_reset_done_int_i_5_n_0
    );
rx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_fsm_reset_done_int_i_1_n_0,
      Q => rx_fsm_reset_done_int,
      R => AR(0)
    );
rx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => sync_rx_fsm_reset_done_int_cdc_sync_n_0,
      Q => rx_fsm_reset_done_int_s3,
      R => '0'
    );
rxresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rxresetdone_s2,
      Q => rxresetdone_s3,
      R => '0'
    );
sync_RXRESETDONE_cdc_sync: entity work.\simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_4\
     port map (
      init_clk_in => init_clk_in,
      \out\ => rxresetdone_s2,
      p_level_in_d1_cdc_from_reg_0 => p_level_in_d1_cdc_from_reg,
      rxfsm_rxresetdone_r => rxfsm_rxresetdone_r
    );
sync_cplllock_cdc_sync: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_5
     port map (
      E(0) => sync_cplllock_cdc_sync_n_2,
      \FSM_sequential_rx_state_reg[0]\ => \FSM_sequential_rx_state[3]_i_3_n_0\,
      \FSM_sequential_rx_state_reg[0]_0\ => \FSM_sequential_rx_state[3]_i_4_n_0\,
      \FSM_sequential_rx_state_reg[0]_1\ => \FSM_sequential_rx_state[3]_i_7_n_0\,
      \FSM_sequential_rx_state_reg[0]_2\ => time_out_2ms_reg_n_0,
      \FSM_sequential_rx_state_reg[0]_3\ => \FSM_sequential_rx_state[3]_i_12_n_0\,
      \FSM_sequential_rx_state_reg[0]_4\ => pll_reset_asserted_reg_n_0,
      \FSM_sequential_rx_state_reg[1]\ => sync_cplllock_cdc_sync_n_0,
      \FSM_sequential_rx_state_reg[1]_0\ => sync_cplllock_cdc_sync_n_1,
      Q(3 downto 0) => rx_state(3 downto 0),
      init_clk_in => init_clk_in,
      recclk_mon_count_reset => recclk_mon_count_reset,
      reset_time_out_reg => \FSM_sequential_rx_state[3]_i_8_n_0\,
      reset_time_out_reg_0 => reset_time_out_reg_n_0,
      reset_time_out_reg_1 => reset_time_out_reg_0,
      rxresetdone_s3 => rxresetdone_s3,
      s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg_0 => s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg
    );
sync_mmcm_lock_reclocked_cdc_sync: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_6
     port map (
      SR(0) => sync_mmcm_lock_reclocked_cdc_sync_n_1,
      init_clk_in => init_clk_in,
      mmcm_lock_reclocked => mmcm_lock_reclocked,
      mmcm_lock_reclocked_reg => sync_mmcm_lock_reclocked_cdc_sync_n_0,
      mmcm_lock_reclocked_reg_0 => mmcm_lock_reclocked_i_2_n_0
    );
sync_qplllock_cdc_sync: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_7
     port map (
      init_clk_in => init_clk_in
    );
sync_run_phase_alignment_int_cdc_sync: entity work.\simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\
     port map (
      init_clk_in => init_clk_in,
      \out\ => run_phase_alignment_int_s2,
      run_phase_alignment_int => run_phase_alignment_int,
      s_level_out_d6_reg_0 => p_level_in_d1_cdc_from_reg
    );
sync_rx_fsm_reset_done_int_cdc_sync: entity work.\simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\
     port map (
      init_clk_in => init_clk_in,
      \out\ => sync_rx_fsm_reset_done_int_cdc_sync_n_0,
      rx_fsm_reset_done_int => rx_fsm_reset_done_int,
      s_level_out_d6_reg_0 => p_level_in_d1_cdc_from_reg
    );
sync_time_out_wait_bypass_cdc_sync: entity work.\simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\
     port map (
      init_clk_in => init_clk_in,
      \out\ => time_out_wait_bypass_s2,
      p_level_in_d1_cdc_from_reg_0 => p_level_in_d1_cdc_from_reg,
      time_out_wait_bypass => time_out_wait_bypass
    );
time_out_100us_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0010"
    )
        port map (
      I0 => time_out_100us_i_2_n_0,
      I1 => time_out_100us_i_3_n_0,
      I2 => time_out_100us_i_4_n_0,
      I3 => time_tlock_max_i_2_n_0,
      I4 => time_out_100us_reg_n_0,
      O => time_out_100us_i_1_n_0
    );
time_out_100us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF7"
    )
        port map (
      I0 => time_out_counter_reg(9),
      I1 => time_out_counter_reg(8),
      I2 => time_out_counter_reg(2),
      I3 => time_out_counter_reg(3),
      I4 => time_out_counter_reg(1),
      I5 => time_out_counter_reg(0),
      O => time_out_100us_i_2_n_0
    );
time_out_100us_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => time_out_counter_reg(7),
      I1 => time_out_counter_reg(6),
      I2 => time_out_counter_reg(5),
      O => time_out_100us_i_3_n_0
    );
time_out_100us_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(10),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(12),
      I4 => time_out_counter_reg(11),
      O => time_out_100us_i_4_n_0
    );
time_out_100us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_100us_i_1_n_0,
      Q => time_out_100us_reg_n_0,
      R => reset_time_out_reg_n_0
    );
time_out_1us_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0002"
    )
        port map (
      I0 => time_out_1us_i_2_n_0,
      I1 => time_out_1us_i_3_n_0,
      I2 => time_out_1us_i_4_n_0,
      I3 => time_tlock_max_i_2_n_0,
      I4 => time_out_1us_reg_n_0,
      O => time_out_1us_i_1_n_0
    );
time_out_1us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      I2 => time_out_counter_reg(2),
      I3 => time_out_counter_reg(7),
      I4 => time_out_counter_reg(12),
      I5 => time_out_counter_reg(11),
      O => time_out_1us_i_2_n_0
    );
time_out_1us_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => time_out_counter_reg(3),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(0),
      O => time_out_1us_i_3_n_0
    );
time_out_1us_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(10),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(6),
      I4 => time_out_counter_reg(5),
      O => time_out_1us_i_4_n_0
    );
time_out_1us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_1us_i_1_n_0,
      Q => time_out_1us_reg_n_0,
      R => reset_time_out_reg_n_0
    );
time_out_2ms_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00020000"
    )
        port map (
      I0 => time_out_2ms_i_2_n_0,
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(16),
      I3 => time_out_counter_reg(17),
      I4 => \time_out_counter[0]_i_5_n_0\,
      I5 => time_out_2ms_reg_n_0,
      O => time_out_2ms_i_1_n_0
    );
time_out_2ms_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => time_out_counter_reg(7),
      I1 => time_out_counter_reg(12),
      I2 => time_out_counter_reg(11),
      I3 => time_out_counter_reg(18),
      I4 => time_out_counter_reg(15),
      O => time_out_2ms_i_2_n_0
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_2ms_i_1_n_0,
      Q => time_out_2ms_reg_n_0,
      R => reset_time_out_reg_n_0
    );
time_out_adapt_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00EA"
    )
        port map (
      I0 => time_out_adapt_reg_n_0,
      I1 => time_out_adapt_i_2_n_0,
      I2 => time_out_adapt_i_3_n_0,
      I3 => recclk_mon_count_reset,
      O => time_out_adapt_i_1_n_0
    );
time_out_adapt_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => time_out_adapt_i_4_n_0,
      I1 => time_out_adapt_i_5_n_0,
      I2 => time_out_adapt_i_6_n_0,
      I3 => time_out_adapt_i_7_n_0,
      I4 => adapt_count_reg(0),
      I5 => adapt_count_reg(1),
      O => time_out_adapt_i_2_n_0
    );
time_out_adapt_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => adapt_count_reg(28),
      I1 => adapt_count_reg(29),
      I2 => adapt_count_reg(26),
      I3 => adapt_count_reg(27),
      I4 => adapt_count_reg(31),
      I5 => adapt_count_reg(30),
      O => time_out_adapt_i_3_n_0
    );
time_out_adapt_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => adapt_count_reg(22),
      I1 => adapt_count_reg(23),
      I2 => adapt_count_reg(20),
      I3 => adapt_count_reg(21),
      I4 => adapt_count_reg(25),
      I5 => adapt_count_reg(24),
      O => time_out_adapt_i_4_n_0
    );
time_out_adapt_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => adapt_count_reg(17),
      I1 => adapt_count_reg(16),
      I2 => adapt_count_reg(14),
      I3 => adapt_count_reg(15),
      I4 => adapt_count_reg(19),
      I5 => adapt_count_reg(18),
      O => time_out_adapt_i_5_n_0
    );
time_out_adapt_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => adapt_count_reg(10),
      I1 => adapt_count_reg(11),
      I2 => adapt_count_reg(8),
      I3 => adapt_count_reg(9),
      I4 => adapt_count_reg(13),
      I5 => adapt_count_reg(12),
      O => time_out_adapt_i_6_n_0
    );
time_out_adapt_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => adapt_count_reg(4),
      I1 => adapt_count_reg(5),
      I2 => adapt_count_reg(2),
      I3 => adapt_count_reg(3),
      I4 => adapt_count_reg(7),
      I5 => adapt_count_reg(6),
      O => time_out_adapt_i_7_n_0
    );
time_out_adapt_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_adapt_i_1_n_0,
      Q => time_out_adapt_reg_n_0,
      R => '0'
    );
\time_out_counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFFFFFFFFFF"
    )
        port map (
      I0 => \time_out_counter[0]_i_3_n_0\,
      I1 => time_out_counter_reg(12),
      I2 => time_out_counter_reg(7),
      I3 => time_out_counter_reg(11),
      I4 => \time_out_counter[0]_i_4_n_0\,
      I5 => \time_out_counter[0]_i_5_n_0\,
      O => \time_out_counter[0]_i_1_n_0\
    );
\time_out_counter[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => time_out_counter_reg(17),
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(14),
      O => \time_out_counter[0]_i_3_n_0\
    );
\time_out_counter[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(18),
      O => \time_out_counter[0]_i_4_n_0\
    );
\time_out_counter[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => time_out_100us_i_2_n_0,
      I1 => time_out_counter_reg(5),
      I2 => time_out_counter_reg(6),
      I3 => time_out_counter_reg(13),
      I4 => time_out_counter_reg(10),
      I5 => time_out_counter_reg(4),
      O => \time_out_counter[0]_i_5_n_0\
    );
\time_out_counter[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => time_out_counter_reg(0),
      O => \time_out_counter[0]_i_6_n_0\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[0]_i_2_n_7\,
      Q => time_out_counter_reg(0),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \time_out_counter_reg[0]_i_2_n_0\,
      CO(2) => \time_out_counter_reg[0]_i_2_n_1\,
      CO(1) => \time_out_counter_reg[0]_i_2_n_2\,
      CO(0) => \time_out_counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \time_out_counter_reg[0]_i_2_n_4\,
      O(2) => \time_out_counter_reg[0]_i_2_n_5\,
      O(1) => \time_out_counter_reg[0]_i_2_n_6\,
      O(0) => \time_out_counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => time_out_counter_reg(3 downto 1),
      S(0) => \time_out_counter[0]_i_6_n_0\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[8]_i_1_n_5\,
      Q => time_out_counter_reg(10),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[8]_i_1_n_4\,
      Q => time_out_counter_reg(11),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[12]_i_1_n_7\,
      Q => time_out_counter_reg(12),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[8]_i_1_n_0\,
      CO(3) => \time_out_counter_reg[12]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[12]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[12]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[12]_i_1_n_4\,
      O(2) => \time_out_counter_reg[12]_i_1_n_5\,
      O(1) => \time_out_counter_reg[12]_i_1_n_6\,
      O(0) => \time_out_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(15 downto 12)
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[12]_i_1_n_6\,
      Q => time_out_counter_reg(13),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[12]_i_1_n_5\,
      Q => time_out_counter_reg(14),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[12]_i_1_n_4\,
      Q => time_out_counter_reg(15),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[16]_i_1_n_7\,
      Q => time_out_counter_reg(16),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[12]_i_1_n_0\,
      CO(3 downto 2) => \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \time_out_counter_reg[16]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\(3),
      O(2) => \time_out_counter_reg[16]_i_1_n_5\,
      O(1) => \time_out_counter_reg[16]_i_1_n_6\,
      O(0) => \time_out_counter_reg[16]_i_1_n_7\,
      S(3) => '0',
      S(2 downto 0) => time_out_counter_reg(18 downto 16)
    );
\time_out_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[16]_i_1_n_6\,
      Q => time_out_counter_reg(17),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[16]_i_1_n_5\,
      Q => time_out_counter_reg(18),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[0]_i_2_n_6\,
      Q => time_out_counter_reg(1),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[0]_i_2_n_5\,
      Q => time_out_counter_reg(2),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[0]_i_2_n_4\,
      Q => time_out_counter_reg(3),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[4]_i_1_n_7\,
      Q => time_out_counter_reg(4),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[0]_i_2_n_0\,
      CO(3) => \time_out_counter_reg[4]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[4]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[4]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[4]_i_1_n_4\,
      O(2) => \time_out_counter_reg[4]_i_1_n_5\,
      O(1) => \time_out_counter_reg[4]_i_1_n_6\,
      O(0) => \time_out_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(7 downto 4)
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[4]_i_1_n_6\,
      Q => time_out_counter_reg(5),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[4]_i_1_n_5\,
      Q => time_out_counter_reg(6),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[4]_i_1_n_4\,
      Q => time_out_counter_reg(7),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[8]_i_1_n_7\,
      Q => time_out_counter_reg(8),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[4]_i_1_n_0\,
      CO(3) => \time_out_counter_reg[8]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[8]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[8]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[8]_i_1_n_4\,
      O(2) => \time_out_counter_reg[8]_i_1_n_5\,
      O(1) => \time_out_counter_reg[8]_i_1_n_6\,
      O(0) => \time_out_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(11 downto 8)
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \time_out_counter[0]_i_1_n_0\,
      D => \time_out_counter_reg[8]_i_1_n_6\,
      Q => time_out_counter_reg(9),
      R => reset_time_out_reg_n_0
    );
time_out_wait_bypass_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AB00"
    )
        port map (
      I0 => time_out_wait_bypass,
      I1 => \wait_bypass_count[0]_i_4_n_0\,
      I2 => rx_fsm_reset_done_int_s3,
      I3 => run_phase_alignment_int_s3,
      O => time_out_wait_bypass_i_1_n_0
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => time_out_wait_bypass_i_1_n_0,
      Q => time_out_wait_bypass,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
time_tlock_max_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC8C8C888"
    )
        port map (
      I0 => time_tlock_max_i_2_n_0,
      I1 => check_tlock_max_reg_n_0,
      I2 => time_out_counter_reg(13),
      I3 => time_tlock_max_i_3_n_0,
      I4 => time_tlock_max_i_4_n_0,
      I5 => time_tlock_max,
      O => time_tlock_max_i_1_n_0
    );
time_tlock_max_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => time_out_counter_reg(18),
      I1 => time_out_counter_reg(15),
      I2 => time_out_counter_reg(14),
      I3 => time_out_counter_reg(16),
      I4 => time_out_counter_reg(17),
      O => time_tlock_max_i_2_n_0
    );
time_tlock_max_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(12),
      O => time_tlock_max_i_3_n_0
    );
time_tlock_max_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080800080008000"
    )
        port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      I2 => time_out_counter_reg(10),
      I3 => time_out_100us_i_3_n_0,
      I4 => time_tlock_max_i_5_n_0,
      I5 => time_out_counter_reg(4),
      O => time_tlock_max_i_4_n_0
    );
time_tlock_max_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(3),
      I3 => time_out_counter_reg(2),
      O => time_tlock_max_i_5_n_0
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_tlock_max_i_1_n_0,
      Q => time_tlock_max,
      R => reset_time_out_reg_n_0
    );
\wait_bypass_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_phase_alignment_int_s3,
      O => clear
    );
\wait_bypass_count[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \wait_bypass_count[0]_i_4_n_0\,
      I1 => rx_fsm_reset_done_int_s3,
      O => \wait_bypass_count[0]_i_2_n_0\
    );
\wait_bypass_count[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \wait_bypass_count[0]_i_6_n_0\,
      I1 => wait_bypass_count_reg(4),
      I2 => wait_bypass_count_reg(3),
      I3 => wait_bypass_count_reg(6),
      I4 => wait_bypass_count_reg(5),
      I5 => \wait_bypass_count[0]_i_7_n_0\,
      O => \wait_bypass_count[0]_i_4_n_0\
    );
\wait_bypass_count[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_bypass_count_reg(0),
      O => \wait_bypass_count[0]_i_5_n_0\
    );
\wait_bypass_count[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => wait_bypass_count_reg(8),
      I1 => wait_bypass_count_reg(7),
      I2 => wait_bypass_count_reg(9),
      I3 => wait_bypass_count_reg(10),
      O => \wait_bypass_count[0]_i_6_n_0\
    );
\wait_bypass_count[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
        port map (
      I0 => wait_bypass_count_reg(0),
      I1 => wait_bypass_count_reg(11),
      I2 => wait_bypass_count_reg(12),
      I3 => wait_bypass_count_reg(2),
      I4 => wait_bypass_count_reg(1),
      O => \wait_bypass_count[0]_i_7_n_0\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_7\,
      Q => wait_bypass_count_reg(0),
      R => clear
    );
\wait_bypass_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_bypass_count_reg[0]_i_3_n_0\,
      CO(2) => \wait_bypass_count_reg[0]_i_3_n_1\,
      CO(1) => \wait_bypass_count_reg[0]_i_3_n_2\,
      CO(0) => \wait_bypass_count_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \wait_bypass_count_reg[0]_i_3_n_4\,
      O(2) => \wait_bypass_count_reg[0]_i_3_n_5\,
      O(1) => \wait_bypass_count_reg[0]_i_3_n_6\,
      O(0) => \wait_bypass_count_reg[0]_i_3_n_7\,
      S(3 downto 1) => wait_bypass_count_reg(3 downto 1),
      S(0) => \wait_bypass_count[0]_i_5_n_0\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_5\,
      Q => wait_bypass_count_reg(10),
      R => clear
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_4\,
      Q => wait_bypass_count_reg(11),
      R => clear
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_7\,
      Q => wait_bypass_count_reg(12),
      R => clear
    );
\wait_bypass_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[8]_i_1_n_0\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \wait_bypass_count_reg[12]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => wait_bypass_count_reg(12)
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_6\,
      Q => wait_bypass_count_reg(1),
      R => clear
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_5\,
      Q => wait_bypass_count_reg(2),
      R => clear
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_4\,
      Q => wait_bypass_count_reg(3),
      R => clear
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_7\,
      Q => wait_bypass_count_reg(4),
      R => clear
    );
\wait_bypass_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[0]_i_3_n_0\,
      CO(3) => \wait_bypass_count_reg[4]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[4]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[4]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[4]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[4]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[4]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(7 downto 4)
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_6\,
      Q => wait_bypass_count_reg(5),
      R => clear
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_5\,
      Q => wait_bypass_count_reg(6),
      R => clear
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_4\,
      Q => wait_bypass_count_reg(7),
      R => clear
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_7\,
      Q => wait_bypass_count_reg(8),
      R => clear
    );
\wait_bypass_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[4]_i_1_n_0\,
      CO(3) => \wait_bypass_count_reg[8]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[8]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[8]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[8]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[8]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[8]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(11 downto 8)
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_6\,
      Q => wait_bypass_count_reg(9),
      R => clear
    );
\wait_time_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => rx_state(0),
      I1 => rx_state(1),
      I2 => rx_state(3),
      O => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(2),
      I1 => wait_time_cnt_reg(3),
      I2 => wait_time_cnt_reg(0),
      I3 => wait_time_cnt_reg(1),
      I4 => \wait_time_cnt[0]_i_4_n_0\,
      I5 => \wait_time_cnt[0]_i_5_n_0\,
      O => sel
    );
\wait_time_cnt[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(14),
      I1 => wait_time_cnt_reg(15),
      I2 => wait_time_cnt_reg(12),
      I3 => wait_time_cnt_reg(13),
      I4 => wait_time_cnt_reg(11),
      I5 => wait_time_cnt_reg(10),
      O => \wait_time_cnt[0]_i_4_n_0\
    );
\wait_time_cnt[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(8),
      I1 => wait_time_cnt_reg(9),
      I2 => wait_time_cnt_reg(6),
      I3 => wait_time_cnt_reg(7),
      I4 => wait_time_cnt_reg(5),
      I5 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[0]_i_5_n_0\
    );
\wait_time_cnt[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(3),
      O => \wait_time_cnt[0]_i_6_n_0\
    );
\wait_time_cnt[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(2),
      O => \wait_time_cnt[0]_i_7_n_0\
    );
\wait_time_cnt[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      O => \wait_time_cnt[0]_i_8_n_0\
    );
\wait_time_cnt[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(0),
      O => \wait_time_cnt[0]_i_9_n_0\
    );
\wait_time_cnt[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(15),
      O => \wait_time_cnt[12]_i_2_n_0\
    );
\wait_time_cnt[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(14),
      O => \wait_time_cnt[12]_i_3_n_0\
    );
\wait_time_cnt[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(13),
      O => \wait_time_cnt[12]_i_4_n_0\
    );
\wait_time_cnt[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      O => \wait_time_cnt[12]_i_5_n_0\
    );
\wait_time_cnt[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(7),
      O => \wait_time_cnt[4]_i_2_n_0\
    );
\wait_time_cnt[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      O => \wait_time_cnt[4]_i_3_n_0\
    );
\wait_time_cnt[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(5),
      O => \wait_time_cnt[4]_i_4_n_0\
    );
\wait_time_cnt[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[4]_i_5_n_0\
    );
\wait_time_cnt[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(11),
      O => \wait_time_cnt[8]_i_2_n_0\
    );
\wait_time_cnt[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(10),
      O => \wait_time_cnt[8]_i_3_n_0\
    );
\wait_time_cnt[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(9),
      O => \wait_time_cnt[8]_i_4_n_0\
    );
\wait_time_cnt[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(8),
      O => \wait_time_cnt[8]_i_5_n_0\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_7\,
      Q => wait_time_cnt_reg(0),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_time_cnt_reg[0]_i_3_n_0\,
      CO(2) => \wait_time_cnt_reg[0]_i_3_n_1\,
      CO(1) => \wait_time_cnt_reg[0]_i_3_n_2\,
      CO(0) => \wait_time_cnt_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[0]_i_3_n_4\,
      O(2) => \wait_time_cnt_reg[0]_i_3_n_5\,
      O(1) => \wait_time_cnt_reg[0]_i_3_n_6\,
      O(0) => \wait_time_cnt_reg[0]_i_3_n_7\,
      S(3) => \wait_time_cnt[0]_i_6_n_0\,
      S(2) => \wait_time_cnt[0]_i_7_n_0\,
      S(1) => \wait_time_cnt[0]_i_8_n_0\,
      S(0) => \wait_time_cnt[0]_i_9_n_0\
    );
\wait_time_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_5\,
      Q => wait_time_cnt_reg(10),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_4\,
      Q => wait_time_cnt_reg(11),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_7\,
      Q => wait_time_cnt_reg(12),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[8]_i_1_n_0\,
      CO(3) => \NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \wait_time_cnt_reg[12]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[12]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0111",
      O(3) => \wait_time_cnt_reg[12]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[12]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[12]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[12]_i_1_n_7\,
      S(3) => \wait_time_cnt[12]_i_2_n_0\,
      S(2) => \wait_time_cnt[12]_i_3_n_0\,
      S(1) => \wait_time_cnt[12]_i_4_n_0\,
      S(0) => \wait_time_cnt[12]_i_5_n_0\
    );
\wait_time_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_6\,
      Q => wait_time_cnt_reg(13),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_5\,
      Q => wait_time_cnt_reg(14),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_4\,
      Q => wait_time_cnt_reg(15),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_6\,
      Q => wait_time_cnt_reg(1),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_5\,
      Q => wait_time_cnt_reg(2),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_4\,
      Q => wait_time_cnt_reg(3),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_7\,
      Q => wait_time_cnt_reg(4),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[0]_i_3_n_0\,
      CO(3) => \wait_time_cnt_reg[4]_i_1_n_0\,
      CO(2) => \wait_time_cnt_reg[4]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[4]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[4]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[4]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[4]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[4]_i_1_n_7\,
      S(3) => \wait_time_cnt[4]_i_2_n_0\,
      S(2) => \wait_time_cnt[4]_i_3_n_0\,
      S(1) => \wait_time_cnt[4]_i_4_n_0\,
      S(0) => \wait_time_cnt[4]_i_5_n_0\
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_6\,
      Q => wait_time_cnt_reg(5),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_5\,
      Q => wait_time_cnt_reg(6),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_4\,
      Q => wait_time_cnt_reg(7),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_7\,
      Q => wait_time_cnt_reg(8),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[4]_i_1_n_0\,
      CO(3) => \wait_time_cnt_reg[8]_i_1_n_0\,
      CO(2) => \wait_time_cnt_reg[8]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[8]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[8]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[8]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[8]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[8]_i_1_n_7\,
      S(3) => \wait_time_cnt[8]_i_2_n_0\,
      S(2) => \wait_time_cnt[8]_i_3_n_0\,
      S(1) => \wait_time_cnt[8]_i_4_n_0\,
      S(0) => \wait_time_cnt[8]_i_5_n_0\
    );
\wait_time_cnt_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_6\,
      Q => wait_time_cnt_reg(9),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_GT_WRAPPER is
  port (
    init_clk_in_0 : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    rx_realign_i : out STD_LOGIC;
    tx_out_clk_i : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RXDISPERR : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RXNOTINTABLE : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rx_resetdone_out : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC;
    rxfsm_rxresetdone_r3_reg_0 : out STD_LOGIC;
    left_aligned_r_reg : out STD_LOGIC;
    left_aligned_r_reg_0 : out STD_LOGIC;
    init_clk_in_1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    init_clk_in_2 : out STD_LOGIC;
    hard_err_flop_r0 : out STD_LOGIC;
    left_aligned_r_reg_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    left_aligned_r_reg_2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC;
    drpwe_in : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt_qpllclk_quad1_out : in STD_LOGIC;
    gt_qpllrefclk_quad1_out : in STD_LOGIC;
    ena_comma_align_i : in STD_LOGIC;
    rx_polarity_i : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt_reset_out : in STD_LOGIC;
    GTRXRESET_OUT : in STD_LOGIC;
    link_reset_r : in STD_LOGIC;
    \word_aligned_control_bits_r_reg[1]\ : in STD_LOGIC;
    bucket_full_r : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_GT_WRAPPER : entity is "simplex_rx_aurora_8b10b_0_0_GT_WRAPPER";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_GT_WRAPPER;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_GT_WRAPPER is
  signal cpll_reset_i : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal gt0_rxresetdone_r3_reg_srl3_n_0 : STD_LOGIC;
  signal \gt0_simplex_rx_aurora_8b10b_0_0_i/ack_flag\ : STD_LOGIC;
  signal gt_rx_reset_i : STD_LOGIC;
  signal gt_rxdfelfhold_i : STD_LOGIC;
  signal gt_rxresetfsm_i_n_4 : STD_LOGIC;
  signal gt_rxuserrdy_i : STD_LOGIC;
  signal gt_tx_reset_i : STD_LOGIC;
  signal gtrxreset_pulse : STD_LOGIC;
  signal gtrxreset_pulse_i_1_n_0 : STD_LOGIC;
  signal gtrxreset_r1 : STD_LOGIC;
  signal gtrxreset_r2 : STD_LOGIC;
  signal gtrxreset_r3 : STD_LOGIC;
  signal gtrxreset_sync : STD_LOGIC;
  signal \^init_clk_in_0\ : STD_LOGIC;
  signal link_reset_r2 : STD_LOGIC;
  signal rx_cdrlock_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \rx_cdrlock_counter0_carry__0_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__0_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__0_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__0_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__1_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__1_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__1_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__1_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__2_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__2_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__2_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__2_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__3_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__3_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__3_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__3_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__4_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__4_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__4_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__4_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__5_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__5_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__5_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__5_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__6_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__6_n_3\ : STD_LOGIC;
  signal rx_cdrlock_counter0_carry_n_0 : STD_LOGIC;
  signal rx_cdrlock_counter0_carry_n_1 : STD_LOGIC;
  signal rx_cdrlock_counter0_carry_n_2 : STD_LOGIC;
  signal rx_cdrlock_counter0_carry_n_3 : STD_LOGIC;
  signal \rx_cdrlock_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_2_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_3_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_4_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_5_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_6_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_7_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_8_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_9_n_0\ : STD_LOGIC;
  signal rx_cdrlock_counter_0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal rx_cdrlocked_i_1_n_0 : STD_LOGIC;
  signal rx_cdrlocked_reg_n_0 : STD_LOGIC;
  signal \^rx_resetdone_out\ : STD_LOGIC;
  signal rxfsm_rxresetdone_r : STD_LOGIC;
  signal rxfsm_rxresetdone_r2 : STD_LOGIC;
  signal rxfsm_soft_reset_r : STD_LOGIC;
  signal rxfsm_soft_reset_r0_n_0 : STD_LOGIC;
  signal simplex_rx_aurora_8b10b_0_0_multi_gt_i_n_3 : STD_LOGIC;
  signal \NLW_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_rx_cdrlock_counter0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute srl_name : string;
  attribute srl_name of gt0_rxresetdone_r3_reg_srl3 : label is "inst/\simplex_rx_aurora_8b10b_0_0_core_i/gt_wrapper_i/gt0_rxresetdone_r3_reg_srl3 ";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of link_reset_r2_reg : label is "no";
  attribute equivalent_register_removal of rxfsm_rxresetdone_r2_reg : label is "no";
begin
  init_clk_in_0 <= \^init_clk_in_0\;
  rx_resetdone_out <= \^rx_resetdone_out\;
gt0_rxresetdone_r3_reg_srl3: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => p_level_in_d1_cdc_from_reg,
      D => simplex_rx_aurora_8b10b_0_0_multi_gt_i_n_3,
      Q => gt0_rxresetdone_r3_reg_srl3_n_0
    );
gt_rx_reset_i_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gt_tx_reset_i,
      Q => gt_rx_reset_i,
      R => '0'
    );
gt_rxresetdone_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rx_resetdone_out\,
      O => rxfsm_rxresetdone_r3_reg_0
    );
gt_rxresetfsm_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_rx_startup_fsm
     port map (
      AR(0) => rxfsm_soft_reset_r,
      CPLL_RESET_reg_0 => gt_rxresetfsm_i_n_4,
      ack_flag => \gt0_simplex_rx_aurora_8b10b_0_0_i/ack_flag\,
      cpll_reset_i => cpll_reset_i,
      gt_rxdfelfhold_i => gt_rxdfelfhold_i,
      gt_rxuserrdy_i => gt_rxuserrdy_i,
      gt_tx_reset_i => gt_tx_reset_i,
      init_clk_in => init_clk_in,
      p_level_in_d1_cdc_from_reg => p_level_in_d1_cdc_from_reg,
      reset_time_out_reg_0 => rx_cdrlocked_reg_n_0,
      rxfsm_rxresetdone_r => rxfsm_rxresetdone_r,
      s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg => \^init_clk_in_0\
    );
gtrxreset_cdc_sync: entity work.\simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync__parameterized0_3\
     port map (
      GTRXRESET_OUT => GTRXRESET_OUT,
      init_clk_in => init_clk_in,
      \out\ => gtrxreset_sync,
      p_level_in_d1_cdc_from_reg_0 => p_level_in_d1_cdc_from_reg
    );
gtrxreset_pulse_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gtrxreset_r2,
      I1 => gtrxreset_r3,
      O => gtrxreset_pulse_i_1_n_0
    );
gtrxreset_pulse_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_pulse_i_1_n_0,
      Q => gtrxreset_pulse,
      R => '0'
    );
gtrxreset_r1_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_sync,
      Q => gtrxreset_r1,
      R => '0'
    );
gtrxreset_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_r1,
      Q => gtrxreset_r2,
      R => '0'
    );
gtrxreset_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_r2,
      Q => gtrxreset_r3,
      R => '0'
    );
link_reset_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_r,
      Q => link_reset_r2,
      R => '0'
    );
rx_cdrlock_counter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => rx_cdrlock_counter0_carry_n_0,
      CO(2) => rx_cdrlock_counter0_carry_n_1,
      CO(1) => rx_cdrlock_counter0_carry_n_2,
      CO(0) => rx_cdrlock_counter0_carry_n_3,
      CYINIT => rx_cdrlock_counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => rx_cdrlock_counter(4 downto 1)
    );
\rx_cdrlock_counter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => rx_cdrlock_counter0_carry_n_0,
      CO(3) => \rx_cdrlock_counter0_carry__0_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__0_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__0_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => rx_cdrlock_counter(8 downto 5)
    );
\rx_cdrlock_counter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__0_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__1_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__1_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__1_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => rx_cdrlock_counter(12 downto 9)
    );
\rx_cdrlock_counter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__1_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__2_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__2_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__2_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => rx_cdrlock_counter(16 downto 13)
    );
\rx_cdrlock_counter0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__2_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__3_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__3_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__3_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => rx_cdrlock_counter(20 downto 17)
    );
\rx_cdrlock_counter0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__3_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__4_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__4_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__4_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3 downto 0) => rx_cdrlock_counter(24 downto 21)
    );
\rx_cdrlock_counter0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__4_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__5_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__5_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__5_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3 downto 0) => rx_cdrlock_counter(28 downto 25)
    );
\rx_cdrlock_counter0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \rx_cdrlock_counter0_carry__6_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_rx_cdrlock_counter0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => rx_cdrlock_counter(31 downto 29)
    );
\rx_cdrlock_counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => rx_cdrlock_counter(0),
      O => \rx_cdrlock_counter[0]_i_1_n_0\
    );
\rx_cdrlock_counter[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(10),
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlock_counter_0(10)
    );
\rx_cdrlock_counter[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(11),
      O => rx_cdrlock_counter_0(11)
    );
\rx_cdrlock_counter[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(12),
      O => rx_cdrlock_counter_0(12)
    );
\rx_cdrlock_counter[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(13),
      O => rx_cdrlock_counter_0(13)
    );
\rx_cdrlock_counter[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(14),
      O => rx_cdrlock_counter_0(14)
    );
\rx_cdrlock_counter[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(15),
      O => rx_cdrlock_counter_0(15)
    );
\rx_cdrlock_counter[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(16),
      O => rx_cdrlock_counter_0(16)
    );
\rx_cdrlock_counter[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(17),
      O => rx_cdrlock_counter_0(17)
    );
\rx_cdrlock_counter[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(18),
      O => rx_cdrlock_counter_0(18)
    );
\rx_cdrlock_counter[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(19),
      O => rx_cdrlock_counter_0(19)
    );
\rx_cdrlock_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(1),
      O => rx_cdrlock_counter_0(1)
    );
\rx_cdrlock_counter[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(20),
      O => rx_cdrlock_counter_0(20)
    );
\rx_cdrlock_counter[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(21),
      O => rx_cdrlock_counter_0(21)
    );
\rx_cdrlock_counter[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(22),
      O => rx_cdrlock_counter_0(22)
    );
\rx_cdrlock_counter[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(23),
      O => rx_cdrlock_counter_0(23)
    );
\rx_cdrlock_counter[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(24),
      O => rx_cdrlock_counter_0(24)
    );
\rx_cdrlock_counter[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(25),
      O => rx_cdrlock_counter_0(25)
    );
\rx_cdrlock_counter[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(26),
      O => rx_cdrlock_counter_0(26)
    );
\rx_cdrlock_counter[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(27),
      O => rx_cdrlock_counter_0(27)
    );
\rx_cdrlock_counter[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(28),
      O => rx_cdrlock_counter_0(28)
    );
\rx_cdrlock_counter[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(29),
      O => rx_cdrlock_counter_0(29)
    );
\rx_cdrlock_counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(2),
      O => rx_cdrlock_counter_0(2)
    );
\rx_cdrlock_counter[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(30),
      O => rx_cdrlock_counter_0(30)
    );
\rx_cdrlock_counter[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(31),
      O => rx_cdrlock_counter_0(31)
    );
\rx_cdrlock_counter[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => rx_cdrlock_counter(18),
      I1 => rx_cdrlock_counter(19),
      I2 => rx_cdrlock_counter(16),
      I3 => rx_cdrlock_counter(17),
      I4 => \rx_cdrlock_counter[31]_i_6_n_0\,
      O => \rx_cdrlock_counter[31]_i_2_n_0\
    );
\rx_cdrlock_counter[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => rx_cdrlock_counter(26),
      I1 => rx_cdrlock_counter(27),
      I2 => rx_cdrlock_counter(24),
      I3 => rx_cdrlock_counter(25),
      I4 => \rx_cdrlock_counter[31]_i_7_n_0\,
      O => \rx_cdrlock_counter[31]_i_3_n_0\
    );
\rx_cdrlock_counter[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => rx_cdrlock_counter(2),
      I1 => rx_cdrlock_counter(3),
      I2 => rx_cdrlock_counter(0),
      I3 => rx_cdrlock_counter(1),
      I4 => \rx_cdrlock_counter[31]_i_8_n_0\,
      O => \rx_cdrlock_counter[31]_i_4_n_0\
    );
\rx_cdrlock_counter[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => rx_cdrlock_counter(11),
      I1 => rx_cdrlock_counter(10),
      I2 => rx_cdrlock_counter(8),
      I3 => rx_cdrlock_counter(9),
      I4 => \rx_cdrlock_counter[31]_i_9_n_0\,
      O => \rx_cdrlock_counter[31]_i_5_n_0\
    );
\rx_cdrlock_counter[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rx_cdrlock_counter(21),
      I1 => rx_cdrlock_counter(20),
      I2 => rx_cdrlock_counter(23),
      I3 => rx_cdrlock_counter(22),
      O => \rx_cdrlock_counter[31]_i_6_n_0\
    );
\rx_cdrlock_counter[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rx_cdrlock_counter(29),
      I1 => rx_cdrlock_counter(28),
      I2 => rx_cdrlock_counter(31),
      I3 => rx_cdrlock_counter(30),
      O => \rx_cdrlock_counter[31]_i_7_n_0\
    );
\rx_cdrlock_counter[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => rx_cdrlock_counter(5),
      I1 => rx_cdrlock_counter(4),
      I2 => rx_cdrlock_counter(6),
      I3 => rx_cdrlock_counter(7),
      O => \rx_cdrlock_counter[31]_i_8_n_0\
    );
\rx_cdrlock_counter[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rx_cdrlock_counter(13),
      I1 => rx_cdrlock_counter(12),
      I2 => rx_cdrlock_counter(15),
      I3 => rx_cdrlock_counter(14),
      O => \rx_cdrlock_counter[31]_i_9_n_0\
    );
\rx_cdrlock_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(3),
      O => rx_cdrlock_counter_0(3)
    );
\rx_cdrlock_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(4),
      O => rx_cdrlock_counter_0(4)
    );
\rx_cdrlock_counter[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(5),
      O => rx_cdrlock_counter_0(5)
    );
\rx_cdrlock_counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(6),
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlock_counter_0(6)
    );
\rx_cdrlock_counter[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(7),
      O => rx_cdrlock_counter_0(7)
    );
\rx_cdrlock_counter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(8),
      O => rx_cdrlock_counter_0(8)
    );
\rx_cdrlock_counter[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(9),
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlock_counter_0(9)
    );
\rx_cdrlock_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \rx_cdrlock_counter[0]_i_1_n_0\,
      Q => rx_cdrlock_counter(0),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(10),
      Q => rx_cdrlock_counter(10),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(11),
      Q => rx_cdrlock_counter(11),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(12),
      Q => rx_cdrlock_counter(12),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(13),
      Q => rx_cdrlock_counter(13),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(14),
      Q => rx_cdrlock_counter(14),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(15),
      Q => rx_cdrlock_counter(15),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(16),
      Q => rx_cdrlock_counter(16),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(17),
      Q => rx_cdrlock_counter(17),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(18),
      Q => rx_cdrlock_counter(18),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(19),
      Q => rx_cdrlock_counter(19),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(1),
      Q => rx_cdrlock_counter(1),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(20),
      Q => rx_cdrlock_counter(20),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(21),
      Q => rx_cdrlock_counter(21),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(22),
      Q => rx_cdrlock_counter(22),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(23),
      Q => rx_cdrlock_counter(23),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(24),
      Q => rx_cdrlock_counter(24),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(25),
      Q => rx_cdrlock_counter(25),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(26),
      Q => rx_cdrlock_counter(26),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(27),
      Q => rx_cdrlock_counter(27),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(28),
      Q => rx_cdrlock_counter(28),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(29),
      Q => rx_cdrlock_counter(29),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(2),
      Q => rx_cdrlock_counter(2),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(30),
      Q => rx_cdrlock_counter(30),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(31),
      Q => rx_cdrlock_counter(31),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(3),
      Q => rx_cdrlock_counter(3),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(4),
      Q => rx_cdrlock_counter(4),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(5),
      Q => rx_cdrlock_counter(5),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(6),
      Q => rx_cdrlock_counter(6),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(7),
      Q => rx_cdrlock_counter(7),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(8),
      Q => rx_cdrlock_counter(8),
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter_0(9),
      Q => rx_cdrlock_counter(9),
      R => gt_rx_reset_i
    );
rx_cdrlocked_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => rx_cdrlocked_reg_n_0,
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlocked_i_1_n_0
    );
rx_cdrlocked_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlocked_i_1_n_0,
      Q => rx_cdrlocked_reg_n_0,
      R => gt_rx_reset_i
    );
rxfsm_rxresetdone_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rxfsm_rxresetdone_r,
      Q => rxfsm_rxresetdone_r2,
      R => '0'
    );
rxfsm_rxresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => rxfsm_rxresetdone_r2,
      Q => \^rx_resetdone_out\,
      R => '0'
    );
rxfsm_rxresetdone_r_reg: unisim.vcomponents.FDRE
     port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => gt0_rxresetdone_r3_reg_srl3_n_0,
      Q => rxfsm_rxresetdone_r,
      R => '0'
    );
rxfsm_soft_reset_r0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => link_reset_r2,
      I1 => gt_reset_out,
      I2 => gtrxreset_pulse,
      O => rxfsm_soft_reset_r0_n_0
    );
rxfsm_soft_reset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => rxfsm_soft_reset_r0_n_0,
      Q => rxfsm_soft_reset_r,
      R => '0'
    );
simplex_rx_aurora_8b10b_0_0_multi_gt_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_multi_gt
     port map (
      D(1 downto 0) => D(1 downto 0),
      RXDISPERR(1 downto 0) => RXDISPERR(1 downto 0),
      RXNOTINTABLE(1 downto 0) => RXNOTINTABLE(1 downto 0),
      SR(0) => gt_rx_reset_i,
      ack_flag => \gt0_simplex_rx_aurora_8b10b_0_0_i/ack_flag\,
      bucket_full_r => bucket_full_r,
      cpll_reset_i => cpll_reset_i,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      ena_comma_align_i => ena_comma_align_i,
      flag2_reg => gt_rxresetfsm_i_n_4,
      gt_qpllclk_quad1_out => gt_qpllclk_quad1_out,
      gt_qpllrefclk_quad1_out => gt_qpllrefclk_quad1_out,
      gt_refclk1 => gt_refclk1,
      gt_rxdfelfhold_i => gt_rxdfelfhold_i,
      gt_rxuserrdy_i => gt_rxuserrdy_i,
      gt_tx_reset_i => gt_tx_reset_i,
      hard_err_flop_r0 => hard_err_flop_r0,
      init_clk_in => init_clk_in,
      init_clk_in_0 => \^init_clk_in_0\,
      init_clk_in_1 => simplex_rx_aurora_8b10b_0_0_multi_gt_i_n_3,
      init_clk_in_2(1 downto 0) => init_clk_in_1(1 downto 0),
      init_clk_in_3 => init_clk_in_2,
      left_aligned_r_reg => left_aligned_r_reg,
      left_aligned_r_reg_0 => left_aligned_r_reg_0,
      left_aligned_r_reg_1(7 downto 0) => left_aligned_r_reg_1(7 downto 0),
      left_aligned_r_reg_2(7 downto 0) => left_aligned_r_reg_2(7 downto 0),
      loopback(2 downto 0) => loopback(2 downto 0),
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i,
      rxn => rxn,
      rxp => rxp,
      s_level_out_d1_simplex_rx_aurora_8b10b_0_0_cdc_to_reg => p_level_in_d1_cdc_from_reg,
      tx_out_clk_i => tx_out_clk_i,
      \word_aligned_control_bits_r_reg[1]\ => \word_aligned_control_bits_r_reg[1]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_AURORA_LANE_SIMPLEX_V5 is
  port (
    rx_lane_up : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    ena_comma_align_i : out STD_LOGIC;
    rx_scp_i : out STD_LOGIC;
    rx_ecp_i : out STD_LOGIC;
    bucket_full_r : out STD_LOGIC;
    hard_err_reset_i : out STD_LOGIC;
    GOT_V : out STD_LOGIC;
    HARD_ERR : out STD_LOGIC;
    RX_PAD : out STD_LOGIC;
    rx_polarity_i : out STD_LOGIC;
    left_aligned_r_reg : out STD_LOGIC;
    rx_pe_data_v_i : out STD_LOGIC;
    in_frame_r_reg : out STD_LOGIC;
    RX_PE_DATA_V_reg : out STD_LOGIC;
    RX_ECP_reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \soft_err_r_reg[1]\ : out STD_LOGIC;
    first_v_received_r_reg : in STD_LOGIC;
    \rx_pe_data_r_reg[0]\ : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    ready_r_reg0 : in STD_LOGIC;
    \word_aligned_control_bits_r_reg[1]\ : in STD_LOGIC;
    \word_aligned_control_bits_r_reg[0]\ : in STD_LOGIC;
    hard_err_flop_r0 : in STD_LOGIC;
    in_frame_r : in STD_LOGIC;
    START_RX : in STD_LOGIC;
    storage_v_r : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    left_aligned_r_reg_0 : in STD_LOGIC;
    rx_realign_i : in STD_LOGIC;
    rx_channel_up : in STD_LOGIC;
    RXDISPERR : in STD_LOGIC_VECTOR ( 1 downto 0 );
    RXNOTINTABLE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \word_aligned_data_r_reg[8]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_data_r_reg[0]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \soft_err_r_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_AURORA_LANE_SIMPLEX_V5 : entity is "simplex_rx_aurora_8b10b_0_0_RX_AURORA_LANE_SIMPLEX_V5";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_AURORA_LANE_SIMPLEX_V5;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_AURORA_LANE_SIMPLEX_V5 is
  signal RX_CC : STD_LOGIC;
  signal RX_NEG : STD_LOGIC;
  signal counter2_r0 : STD_LOGIC;
  signal \^ena_comma_align_i\ : STD_LOGIC;
  signal ready_r : STD_LOGIC;
  signal rx_lane_init_sm_simplex_i_n_4 : STD_LOGIC;
begin
  ena_comma_align_i <= \^ena_comma_align_i\;
rx_err_detect_simplex_gtp_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_ERR_DETECT_SIMPLEX_V5
     port map (
      HARD_ERR => HARD_ERR,
      SR(0) => rx_lane_init_sm_simplex_i_n_4,
      bucket_full_r => bucket_full_r,
      hard_err_flop_r0 => hard_err_flop_r0,
      hard_err_flop_r_reg_0 => \rx_pe_data_r_reg[0]\,
      hard_err_reset_i => hard_err_reset_i,
      \soft_err_r_reg[0]_0\(1 downto 0) => \soft_err_r_reg[0]\(1 downto 0),
      \soft_err_r_reg[1]_0\ => \soft_err_r_reg[1]\
    );
rx_lane_init_sm_simplex_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LANE_INIT_SM_SIMPLEX
     port map (
      D(1 downto 0) => D(1 downto 0),
      RXDISPERR(1 downto 0) => RXDISPERR(1 downto 0),
      RXNOTINTABLE(1 downto 0) => RXNOTINTABLE(1 downto 0),
      RX_NEG => RX_NEG,
      SR(0) => rx_lane_init_sm_simplex_i_n_4,
      align_r_reg_0 => \^ena_comma_align_i\,
      \counter1_r_reg[0]_0\ => \rx_pe_data_r_reg[0]\,
      counter2_r0 => counter2_r0,
      lane_up_flop_i_0 => first_v_received_r_reg,
      ready_r => ready_r,
      ready_r_reg0 => ready_r_reg0,
      rx_lane_up => rx_lane_up,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i
    );
simplex_rx_aurora_8b10b_0_0_hotplug_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_hotplug
     port map (
      D(0) => RX_CC,
      init_clk_in => init_clk_in,
      link_reset_out => link_reset_out,
      p_level_in_d1_cdc_from_reg => \rx_pe_data_r_reg[0]\,
      \rx_cc_extend_r_reg[7]_0\ => first_v_received_r_reg
    );
sym_dec_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SYM_DEC
     port map (
      D(0) => RX_CC,
      GOT_V => GOT_V,
      Q(15 downto 0) => Q(15 downto 0),
      RX_ECP_reg_0 => rx_ecp_i,
      RX_ECP_reg_1 => RX_ECP_reg,
      RX_NEG => RX_NEG,
      RX_PAD => RX_PAD,
      RX_PE_DATA_V_reg_0 => RX_PE_DATA_V_reg,
      START_RX => START_RX,
      counter2_r0 => counter2_r0,
      ena_comma_align_i => \^ena_comma_align_i\,
      first_v_received_r_reg_0 => first_v_received_r_reg,
      in_frame_r => in_frame_r,
      in_frame_r_reg => in_frame_r_reg,
      left_aligned_r_reg_0 => left_aligned_r_reg,
      left_aligned_r_reg_1(0) => D(0),
      left_aligned_r_reg_2 => left_aligned_r_reg_0,
      ready_r => ready_r,
      rx_channel_up => rx_channel_up,
      \rx_pe_data_r_reg[0]_0\ => \rx_pe_data_r_reg[0]\,
      rx_pe_data_v_i => rx_pe_data_v_i,
      rx_scp_i => rx_scp_i,
      storage_v_r => storage_v_r,
      \word_aligned_control_bits_r_reg[0]_0\ => \word_aligned_control_bits_r_reg[0]\,
      \word_aligned_control_bits_r_reg[1]_0\ => \word_aligned_control_bits_r_reg[1]\,
      \word_aligned_data_r_reg[0]_0\(7 downto 0) => \word_aligned_data_r_reg[0]\(7 downto 0),
      \word_aligned_data_r_reg[8]_0\(7 downto 0) => \word_aligned_data_r_reg[8]\(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_core is
  port (
    rx_lane_up : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    init_clk_in_0 : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    tx_out_clk_i : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    link_reset_out : out STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    SYSTEM_RESET_reg : out STD_LOGIC;
    rx_channel_up : out STD_LOGIC;
    rx_hard_err : out STD_LOGIC;
    rx_aligned : out STD_LOGIC;
    frame_err : out STD_LOGIC;
    m_axi_rx_tvalid : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 15 );
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rx_tlast : out STD_LOGIC;
    in0 : in STD_LOGIC;
    storage_v_r_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC;
    drpwe_in : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt_qpllclk_quad1_out : in STD_LOGIC;
    gt_qpllrefclk_quad1_out : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt_reset_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_core : entity is "simplex_rx_aurora_8b10b_0_0_core";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_core;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_core is
  signal GOT_V : STD_LOGIC;
  signal GTRXRESET_OUT : STD_LOGIC;
  signal HARD_ERR : STD_LOGIC;
  signal RX_PAD : STD_LOGIC;
  signal RX_PE_DATA : STD_LOGIC_VECTOR ( 0 to 15 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal START_RX : STD_LOGIC;
  signal \^system_reset_reg\ : STD_LOGIC;
  signal ena_comma_align_i : STD_LOGIC;
  signal gt_wrapper_i_n_28 : STD_LOGIC;
  signal gt_wrapper_i_n_29 : STD_LOGIC;
  signal gt_wrapper_i_n_30 : STD_LOGIC;
  signal gt_wrapper_i_n_33 : STD_LOGIC;
  signal gt_wrapper_i_n_35 : STD_LOGIC;
  signal gt_wrapper_i_n_36 : STD_LOGIC;
  signal gt_wrapper_i_n_37 : STD_LOGIC;
  signal gt_wrapper_i_n_38 : STD_LOGIC;
  signal gt_wrapper_i_n_39 : STD_LOGIC;
  signal gt_wrapper_i_n_40 : STD_LOGIC;
  signal gt_wrapper_i_n_41 : STD_LOGIC;
  signal gt_wrapper_i_n_42 : STD_LOGIC;
  signal gt_wrapper_i_n_43 : STD_LOGIC;
  signal gt_wrapper_i_n_44 : STD_LOGIC;
  signal gt_wrapper_i_n_45 : STD_LOGIC;
  signal gt_wrapper_i_n_46 : STD_LOGIC;
  signal gt_wrapper_i_n_47 : STD_LOGIC;
  signal gt_wrapper_i_n_48 : STD_LOGIC;
  signal gt_wrapper_i_n_49 : STD_LOGIC;
  signal gt_wrapper_i_n_50 : STD_LOGIC;
  signal hard_err_reset_i : STD_LOGIC;
  signal \^init_clk_in_0\ : STD_LOGIC;
  signal \^link_reset_out\ : STD_LOGIC;
  signal link_reset_r : STD_LOGIC;
  signal reset_channel_i : STD_LOGIC;
  signal rx_aurora_lane_simplex_v5_0_i_n_11 : STD_LOGIC;
  signal rx_aurora_lane_simplex_v5_0_i_n_13 : STD_LOGIC;
  signal rx_aurora_lane_simplex_v5_0_i_n_14 : STD_LOGIC;
  signal rx_aurora_lane_simplex_v5_0_i_n_15 : STD_LOGIC;
  signal rx_aurora_lane_simplex_v5_0_i_n_32 : STD_LOGIC;
  signal \rx_channel_init_sm_simplex_i/wait_for_lane_up_r0\ : STD_LOGIC;
  signal \^rx_channel_up\ : STD_LOGIC;
  signal rx_char_is_comma_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rx_disp_err_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rx_ecp_i : STD_LOGIC;
  signal \rx_err_detect_simplex_gtp_i/bucket_full_r\ : STD_LOGIC;
  signal \rx_err_detect_simplex_gtp_i/hard_err_flop_r0\ : STD_LOGIC;
  signal \rx_err_detect_simplex_gtp_i/p_2_out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rx_lane_init_sm_simplex_i/ready_r_reg0\ : STD_LOGIC;
  signal \^rx_lane_up\ : STD_LOGIC;
  signal \rx_ll_pdu_datapath_i/in_frame_r\ : STD_LOGIC;
  signal \rx_ll_pdu_datapath_i/storage_v_r\ : STD_LOGIC;
  signal rx_not_in_table_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rx_pe_data_v_i : STD_LOGIC;
  signal rx_polarity_i : STD_LOGIC;
  signal rx_realign_i : STD_LOGIC;
  signal rx_scp_i : STD_LOGIC;
begin
  SR(0) <= \^sr\(0);
  SYSTEM_RESET_reg <= \^system_reset_reg\;
  init_clk_in_0 <= \^init_clk_in_0\;
  link_reset_out <= \^link_reset_out\;
  rx_channel_up <= \^rx_channel_up\;
  rx_lane_up <= \^rx_lane_up\;
core_reset_logic_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RESET_LOGIC
     port map (
      SR(0) => \^system_reset_reg\,
      gt_rxresetdone_r2_reg_0 => gt_wrapper_i_n_28,
      in0 => in0,
      init_clk_in => init_clk_in,
      link_reset_out => \^link_reset_out\,
      link_reset_r => link_reset_r,
      reset_channel_i => reset_channel_i,
      s_level_out_d6_reg => storage_v_r_reg,
      tx_lock_comb_r_reg_0 => \^init_clk_in_0\,
      wait_for_lane_up_r0 => \rx_channel_init_sm_simplex_i/wait_for_lane_up_r0\
    );
gt_wrapper_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_GT_WRAPPER
     port map (
      D(1 downto 0) => rx_char_is_comma_i(1 downto 0),
      GTRXRESET_OUT => GTRXRESET_OUT,
      RXDISPERR(1 downto 0) => rx_disp_err_i(1 downto 0),
      RXNOTINTABLE(1 downto 0) => rx_not_in_table_i(1 downto 0),
      bucket_full_r => \rx_err_detect_simplex_gtp_i/bucket_full_r\,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      ena_comma_align_i => ena_comma_align_i,
      gt_qpllclk_quad1_out => gt_qpllclk_quad1_out,
      gt_qpllrefclk_quad1_out => gt_qpllrefclk_quad1_out,
      gt_refclk1 => gt_refclk1,
      gt_reset_out => gt_reset_out,
      hard_err_flop_r0 => \rx_err_detect_simplex_gtp_i/hard_err_flop_r0\,
      init_clk_in => init_clk_in,
      init_clk_in_0 => \^init_clk_in_0\,
      init_clk_in_1(1 downto 0) => \rx_err_detect_simplex_gtp_i/p_2_out\(1 downto 0),
      init_clk_in_2 => gt_wrapper_i_n_33,
      left_aligned_r_reg => gt_wrapper_i_n_29,
      left_aligned_r_reg_0 => gt_wrapper_i_n_30,
      left_aligned_r_reg_1(7) => gt_wrapper_i_n_35,
      left_aligned_r_reg_1(6) => gt_wrapper_i_n_36,
      left_aligned_r_reg_1(5) => gt_wrapper_i_n_37,
      left_aligned_r_reg_1(4) => gt_wrapper_i_n_38,
      left_aligned_r_reg_1(3) => gt_wrapper_i_n_39,
      left_aligned_r_reg_1(2) => gt_wrapper_i_n_40,
      left_aligned_r_reg_1(1) => gt_wrapper_i_n_41,
      left_aligned_r_reg_1(0) => gt_wrapper_i_n_42,
      left_aligned_r_reg_2(7) => gt_wrapper_i_n_43,
      left_aligned_r_reg_2(6) => gt_wrapper_i_n_44,
      left_aligned_r_reg_2(5) => gt_wrapper_i_n_45,
      left_aligned_r_reg_2(4) => gt_wrapper_i_n_46,
      left_aligned_r_reg_2(3) => gt_wrapper_i_n_47,
      left_aligned_r_reg_2(2) => gt_wrapper_i_n_48,
      left_aligned_r_reg_2(1) => gt_wrapper_i_n_49,
      left_aligned_r_reg_2(0) => gt_wrapper_i_n_50,
      link_reset_r => link_reset_r,
      loopback(2 downto 0) => loopback(2 downto 0),
      p_level_in_d1_cdc_from_reg => storage_v_r_reg,
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i,
      rx_resetdone_out => rx_resetdone_out,
      rxfsm_rxresetdone_r3_reg_0 => gt_wrapper_i_n_28,
      rxn => rxn,
      rxp => rxp,
      tx_out_clk_i => tx_out_clk_i,
      \word_aligned_control_bits_r_reg[1]\ => rx_aurora_lane_simplex_v5_0_i_n_11
    );
hpcnt_reset_cdc_sync: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_1
     port map (
      in0 => in0,
      init_clk_in => init_clk_in
    );
rx_aurora_lane_simplex_v5_0_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_AURORA_LANE_SIMPLEX_V5
     port map (
      D(1 downto 0) => rx_char_is_comma_i(1 downto 0),
      GOT_V => GOT_V,
      HARD_ERR => HARD_ERR,
      Q(15) => RX_PE_DATA(0),
      Q(14) => RX_PE_DATA(1),
      Q(13) => RX_PE_DATA(2),
      Q(12) => RX_PE_DATA(3),
      Q(11) => RX_PE_DATA(4),
      Q(10) => RX_PE_DATA(5),
      Q(9) => RX_PE_DATA(6),
      Q(8) => RX_PE_DATA(7),
      Q(7) => RX_PE_DATA(8),
      Q(6) => RX_PE_DATA(9),
      Q(5) => RX_PE_DATA(10),
      Q(4) => RX_PE_DATA(11),
      Q(3) => RX_PE_DATA(12),
      Q(2) => RX_PE_DATA(13),
      Q(1) => RX_PE_DATA(14),
      Q(0) => RX_PE_DATA(15),
      RXDISPERR(1 downto 0) => rx_disp_err_i(1 downto 0),
      RXNOTINTABLE(1 downto 0) => rx_not_in_table_i(1 downto 0),
      RX_ECP_reg => rx_aurora_lane_simplex_v5_0_i_n_15,
      RX_PAD => RX_PAD,
      RX_PE_DATA_V_reg => rx_aurora_lane_simplex_v5_0_i_n_14,
      START_RX => START_RX,
      bucket_full_r => \rx_err_detect_simplex_gtp_i/bucket_full_r\,
      ena_comma_align_i => ena_comma_align_i,
      first_v_received_r_reg => \^sr\(0),
      hard_err_flop_r0 => \rx_err_detect_simplex_gtp_i/hard_err_flop_r0\,
      hard_err_reset_i => hard_err_reset_i,
      in_frame_r => \rx_ll_pdu_datapath_i/in_frame_r\,
      in_frame_r_reg => rx_aurora_lane_simplex_v5_0_i_n_13,
      init_clk_in => init_clk_in,
      left_aligned_r_reg => rx_aurora_lane_simplex_v5_0_i_n_11,
      left_aligned_r_reg_0 => gt_wrapper_i_n_33,
      link_reset_out => \^link_reset_out\,
      ready_r_reg0 => \rx_lane_init_sm_simplex_i/ready_r_reg0\,
      rx_channel_up => \^rx_channel_up\,
      rx_ecp_i => rx_ecp_i,
      rx_lane_up => \^rx_lane_up\,
      \rx_pe_data_r_reg[0]\ => storage_v_r_reg,
      rx_pe_data_v_i => rx_pe_data_v_i,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i,
      rx_scp_i => rx_scp_i,
      \soft_err_r_reg[0]\(1 downto 0) => \rx_err_detect_simplex_gtp_i/p_2_out\(1 downto 0),
      \soft_err_r_reg[1]\ => rx_aurora_lane_simplex_v5_0_i_n_32,
      storage_v_r => \rx_ll_pdu_datapath_i/storage_v_r\,
      \word_aligned_control_bits_r_reg[0]\ => gt_wrapper_i_n_30,
      \word_aligned_control_bits_r_reg[1]\ => gt_wrapper_i_n_29,
      \word_aligned_data_r_reg[0]\(7) => gt_wrapper_i_n_43,
      \word_aligned_data_r_reg[0]\(6) => gt_wrapper_i_n_44,
      \word_aligned_data_r_reg[0]\(5) => gt_wrapper_i_n_45,
      \word_aligned_data_r_reg[0]\(4) => gt_wrapper_i_n_46,
      \word_aligned_data_r_reg[0]\(3) => gt_wrapper_i_n_47,
      \word_aligned_data_r_reg[0]\(2) => gt_wrapper_i_n_48,
      \word_aligned_data_r_reg[0]\(1) => gt_wrapper_i_n_49,
      \word_aligned_data_r_reg[0]\(0) => gt_wrapper_i_n_50,
      \word_aligned_data_r_reg[8]\(7) => gt_wrapper_i_n_35,
      \word_aligned_data_r_reg[8]\(6) => gt_wrapper_i_n_36,
      \word_aligned_data_r_reg[8]\(5) => gt_wrapper_i_n_37,
      \word_aligned_data_r_reg[8]\(4) => gt_wrapper_i_n_38,
      \word_aligned_data_r_reg[8]\(3) => gt_wrapper_i_n_39,
      \word_aligned_data_r_reg[8]\(2) => gt_wrapper_i_n_40,
      \word_aligned_data_r_reg[8]\(1) => gt_wrapper_i_n_41,
      \word_aligned_data_r_reg[8]\(0) => gt_wrapper_i_n_42
    );
rx_global_logic_simplex_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX
     port map (
      CHANNEL_SOFT_ERR_reg => rx_aurora_lane_simplex_v5_0_i_n_32,
      GOT_V => GOT_V,
      GTRXRESET_OUT => GTRXRESET_OUT,
      HARD_ERR => HARD_ERR,
      SR(0) => \^sr\(0),
      START_RX => START_RX,
      \free_count_r_reg[13]\ => storage_v_r_reg,
      \gtrxreset_extend_r_reg[0]\(0) => \^system_reset_reg\,
      hard_err_reset_i => hard_err_reset_i,
      power_down => power_down,
      ready_r_reg0 => \rx_lane_init_sm_simplex_i/ready_r_reg0\,
      reset_channel_i => reset_channel_i,
      rx_aligned => rx_aligned,
      rx_channel_up => \^rx_channel_up\,
      rx_hard_err => rx_hard_err,
      rx_lane_up => \^rx_lane_up\,
      soft_err => soft_err,
      wait_for_lane_up_r0 => \rx_channel_init_sm_simplex_i/wait_for_lane_up_r0\
    );
rx_ll_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_RX_LL
     port map (
      D(15) => RX_PE_DATA(0),
      D(14) => RX_PE_DATA(1),
      D(13) => RX_PE_DATA(2),
      D(12) => RX_PE_DATA(3),
      D(11) => RX_PE_DATA(4),
      D(10) => RX_PE_DATA(5),
      D(9) => RX_PE_DATA(6),
      D(8) => RX_PE_DATA(7),
      D(7) => RX_PE_DATA(8),
      D(6) => RX_PE_DATA(9),
      D(5) => RX_PE_DATA(10),
      D(4) => RX_PE_DATA(11),
      D(3) => RX_PE_DATA(12),
      D(2) => RX_PE_DATA(13),
      D(1) => RX_PE_DATA(14),
      D(0) => RX_PE_DATA(15),
      RX_EOF_N_reg => rx_aurora_lane_simplex_v5_0_i_n_15,
      RX_PAD => RX_PAD,
      RX_SRC_RDY_N_reg_inv => rx_aurora_lane_simplex_v5_0_i_n_14,
      START_RX => START_RX,
      frame_err => frame_err,
      in_frame_r => \rx_ll_pdu_datapath_i/in_frame_r\,
      in_frame_r_reg => rx_aurora_lane_simplex_v5_0_i_n_13,
      m_axi_rx_tdata(0 to 15) => m_axi_rx_tdata(0 to 15),
      m_axi_rx_tkeep(0) => m_axi_rx_tkeep(0),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      rx_ecp_i => rx_ecp_i,
      rx_pe_data_v_i => rx_pe_data_v_i,
      rx_scp_i => rx_scp_i,
      storage_v_r => \rx_ll_pdu_datapath_i/storage_v_r\,
      storage_v_r_reg => storage_v_r_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_support is
  port (
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
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_lock : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    gt_reset_out : out STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    drpen_in : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drprdy_out : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drpwe_in : in STD_LOGIC;
    gt0_qplllock_out : out STD_LOGIC;
    gt0_qpllrefclklost_out : out STD_LOGIC;
    gt_qpllclk_quad1_out : out STD_LOGIC;
    gt_qpllrefclk_quad1_out : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_support : entity is "simplex_rx_aurora_8b10b_0_0_support";
end simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_support;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_support is
  signal \<const1>\ : STD_LOGIC;
  signal \^gt_qpllclk_quad1_out\ : STD_LOGIC;
  signal \^gt_qpllrefclk_quad1_out\ : STD_LOGIC;
  signal \^gt_reset_out\ : STD_LOGIC;
  signal gt_reset_sync_init_clk : STD_LOGIC;
  signal \^m_axi_rx_tkeep\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal reset_sync_user_clk : STD_LOGIC;
  signal \^rx_channel_up\ : STD_LOGIC;
  signal system_reset_i : STD_LOGIC;
  signal tx_out_clk_i : STD_LOGIC;
  signal \^user_clk_out\ : STD_LOGIC;
begin
  gt_qpllclk_quad1_out <= \^gt_qpllclk_quad1_out\;
  gt_qpllrefclk_quad1_out <= \^gt_qpllrefclk_quad1_out\;
  gt_reset_out <= \^gt_reset_out\;
  m_axi_rx_tkeep(0) <= \<const1>\;
  m_axi_rx_tkeep(1) <= \^m_axi_rx_tkeep\(1);
  rx_channel_up <= \^rx_channel_up\;
  rx_verify <= \^rx_channel_up\;
  sync_clk_out <= \^user_clk_out\;
  user_clk_out <= \^user_clk_out\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
clock_module_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_CLOCK_MODULE
     port map (
      init_clk_in => \^user_clk_out\,
      tx_out_clk_i => tx_out_clk_i
    );
gt_common_support: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_gt_common_wrapper
     port map (
      gt0_qplllock_out => gt0_qplllock_out,
      gt0_qpllrefclklost_out => gt0_qpllrefclklost_out,
      gt_qpllclk_quad1_out => \^gt_qpllclk_quad1_out\,
      gt_qpllrefclk_quad1_out => \^gt_qpllrefclk_quad1_out\,
      gt_refclk1 => gt_refclk1,
      init_clk_in => init_clk_in
    );
gt_reset_cdc_sync: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync
     port map (
      D(0) => gt_reset_sync_init_clk,
      gt_reset => gt_reset,
      init_clk_in => init_clk_in
    );
reset_sync_user_clk_cdc_sync: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_cdc_sync_0
     port map (
      D(0) => reset_sync_user_clk,
      rx_system_reset => rx_system_reset,
      s_level_out_d6_reg_0 => \^user_clk_out\
    );
simplex_rx_aurora_8b10b_0_0_core_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_core
     port map (
      SR(0) => rx_reset,
      SYSTEM_RESET_reg => sys_reset_out,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      frame_err => frame_err,
      gt_qpllclk_quad1_out => \^gt_qpllclk_quad1_out\,
      gt_qpllrefclk_quad1_out => \^gt_qpllrefclk_quad1_out\,
      gt_refclk1 => gt_refclk1,
      gt_reset_out => \^gt_reset_out\,
      in0 => system_reset_i,
      init_clk_in => init_clk_in,
      init_clk_in_0 => tx_lock,
      link_reset_out => link_reset_out,
      loopback(2 downto 0) => loopback(2 downto 0),
      m_axi_rx_tdata(0 to 15) => m_axi_rx_tdata(0 to 15),
      m_axi_rx_tkeep(0) => \^m_axi_rx_tkeep\(1),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      rx_aligned => rx_aligned,
      rx_channel_up => \^rx_channel_up\,
      rx_hard_err => rx_hard_err,
      rx_lane_up => rx_lane_up,
      rx_resetdone_out => rx_resetdone_out,
      rxn => rxn,
      rxp => rxp,
      soft_err => soft_err,
      storage_v_r_reg => \^user_clk_out\,
      tx_out_clk_i => tx_out_clk_i
    );
support_reset_logic_i: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC
     port map (
      CLK => \^user_clk_out\,
      D(0) => reset_sync_user_clk,
      \debounce_gt_rst_r_reg[0]_0\(0) => gt_reset_sync_init_clk,
      gt_reset_out => \^gt_reset_out\,
      in0 => system_reset_i,
      init_clk_in => init_clk_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_rx_aurora_8b10b_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of simplex_rx_aurora_8b10b_0_0 : entity is true;
end simplex_rx_aurora_8b10b_0_0;

architecture STRUCTURE of simplex_rx_aurora_8b10b_0_0 is
  signal NLW_inst_drprdy_out_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_drpdo_out_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
inst: entity work.simplex_rx_aurora_8b10b_0_0_simplex_rx_aurora_8b10b_0_0_support
     port map (
      drpaddr_in(8 downto 0) => B"000000000",
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => B"0000000000000000",
      drpdo_out(15 downto 0) => NLW_inst_drpdo_out_UNCONNECTED(15 downto 0),
      drpen_in => '0',
      drprdy_out => NLW_inst_drprdy_out_UNCONNECTED,
      drpwe_in => '0',
      frame_err => frame_err,
      gt0_qplllock_out => gt0_qplllock_out,
      gt0_qpllrefclklost_out => gt0_qpllrefclklost_out,
      gt_qpllclk_quad1_out => gt_qpllclk_quad1_out,
      gt_qpllrefclk_quad1_out => gt_qpllrefclk_quad1_out,
      gt_refclk1 => gt_refclk1,
      gt_reset => gt_reset,
      gt_reset_out => gt_reset_out,
      init_clk_in => init_clk_in,
      link_reset_out => link_reset_out,
      loopback(2 downto 0) => loopback(2 downto 0),
      m_axi_rx_tdata(0 to 15) => m_axi_rx_tdata(0 to 15),
      m_axi_rx_tkeep(0 to 1) => m_axi_rx_tkeep(0 to 1),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      rx_aligned => rx_aligned,
      rx_channel_up => rx_channel_up,
      rx_hard_err => rx_hard_err,
      rx_lane_up => rx_lane_up,
      rx_reset => rx_reset,
      rx_resetdone_out => rx_resetdone_out,
      rx_system_reset => rx_system_reset,
      rx_verify => rx_verify,
      rxn => rxn,
      rxp => rxp,
      soft_err => soft_err,
      sync_clk_out => sync_clk_out,
      sys_reset_out => sys_reset_out,
      tx_lock => tx_lock,
      user_clk_out => user_clk_out
    );
end STRUCTURE;
