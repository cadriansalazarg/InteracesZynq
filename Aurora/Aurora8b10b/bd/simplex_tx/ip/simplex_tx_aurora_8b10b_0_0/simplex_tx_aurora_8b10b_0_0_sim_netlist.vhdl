-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Tue Jul  7 23:11:06 2020
-- Host        : carlositcr-HP-ProBook-640-G1 running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/carlositcr/Vivado_Projects/Aurora/project_1/project_1.srcs/sources_1/bd/simplex_tx/ip/simplex_tx_aurora_8b10b_0_0/simplex_tx_aurora_8b10b_0_0_sim_netlist.vhdl
-- Design      : simplex_tx_aurora_8b10b_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z045ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_AXI_TO_LL is
  port (
    new_pkt_r_reg_0 : out STD_LOGIC;
    new_pkt_r : in STD_LOGIC;
    new_pkt_r_reg_1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_AXI_TO_LL : entity is "simplex_tx_aurora_8b10b_0_0_AXI_TO_LL";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_AXI_TO_LL;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_AXI_TO_LL is
begin
new_pkt_r_reg: unisim.vcomponents.FDRE
     port map (
      C => new_pkt_r_reg_1,
      CE => '1',
      D => new_pkt_r,
      Q => new_pkt_r_reg_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_CLOCK_MODULE is
  port (
    init_clk_in : out STD_LOGIC;
    tx_out_clk_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_CLOCK_MODULE : entity is "simplex_tx_aurora_8b10b_0_0_CLOCK_MODULE";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_CLOCK_MODULE;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_CLOCK_MODULE is
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_IDLE_AND_VER_GEN is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_a_i : out STD_LOGIC;
    gen_k_flop_0_i_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_r_flop_0_i_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tx_system_reset_c : in STD_LOGIC;
    prev_cycle_gen_ver_r_reg_0 : in STD_LOGIC;
    gen_ver_i : in STD_LOGIC;
    tx_reset : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_IDLE_AND_VER_GEN : entity is "simplex_tx_aurora_8b10b_0_0_IDLE_AND_VER_GEN";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_IDLE_AND_VER_GEN;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_IDLE_AND_VER_GEN is
  signal \downcounter_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[3]\ : STD_LOGIC;
  signal gen_a_flop_c : STD_LOGIC;
  signal gen_k_flop_c_0 : STD_LOGIC;
  signal gen_k_flop_c_1 : STD_LOGIC;
  signal gen_r_flop_c_0 : STD_LOGIC;
  signal gen_r_flop_c_1 : STD_LOGIC;
  signal gen_v_flop_c_0 : STD_LOGIC;
  signal gen_ver_word_1_r : STD_LOGIC;
  signal gen_ver_word_2_r_reg_n_0 : STD_LOGIC;
  signal insert_ver_c : STD_LOGIC;
  signal lfsr_last_flop_r : STD_LOGIC;
  signal \lfsr_shift_register_r_reg[2]_srl3_n_0\ : STD_LOGIC;
  signal lfsr_taps_c : STD_LOGIC;
  signal lfsr_taps_r : STD_LOGIC;
  signal prev_cycle_gen_ver_r : STD_LOGIC;
  signal recycle_gen_ver_c : STD_LOGIC;
  signal ver_counter_r_1 : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gen_a_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of gen_a_flop_0_i : label is "FD";
  attribute BOX_TYPE of gen_k_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_k_flop_0_i : label is "FD";
  attribute BOX_TYPE of gen_k_flop_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_k_flop_1_i : label is "FD";
  attribute BOX_TYPE of gen_r_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_r_flop_0_i : label is "FD";
  attribute BOX_TYPE of gen_r_flop_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_r_flop_1_i : label is "FD";
  attribute BOX_TYPE of gen_v_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_v_flop_0_i : label is "FD";
  attribute BOX_TYPE of gen_v_flop_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_v_flop_1_i : label is "FD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of gen_v_flop_1_i_i_1 : label is "soft_lutpair24";
  attribute BOX_TYPE of lfsr_last_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of lfsr_last_flop_i : label is "FDR";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \lfsr_shift_register_r_reg[2]_srl3\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/idle_and_ver_gen_i/lfsr_shift_register_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \lfsr_shift_register_r_reg[2]_srl3\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/idle_and_ver_gen_i/lfsr_shift_register_r_reg[2]_srl3 ";
  attribute BOX_TYPE of lfsr_taps_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of lfsr_taps_i : label is "FDR";
  attribute BOX_TYPE of ver_counter_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of ver_counter_0_i : label is "SRL16";
  attribute srl_name of ver_counter_0_i : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/idle_and_ver_gen_i/ver_counter_0_i ";
  attribute SOFT_HLUTNM of ver_counter_0_i_i_1 : label is "soft_lutpair24";
  attribute BOX_TYPE of ver_counter_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of ver_counter_1_i : label is "SRL16";
  attribute srl_name of ver_counter_1_i : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/idle_and_ver_gen_i/ver_counter_1_i ";
begin
\downcounter_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010101010101001"
    )
        port map (
      I0 => tx_reset,
      I1 => SR(0),
      I2 => \downcounter_r_reg_n_0_[0]\,
      I3 => \downcounter_r_reg_n_0_[1]\,
      I4 => \downcounter_r_reg_n_0_[2]\,
      I5 => \downcounter_r_reg_n_0_[3]\,
      O => \downcounter_r[0]_i_1_n_0\
    );
\downcounter_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000E1E1E1E0"
    )
        port map (
      I0 => \downcounter_r_reg_n_0_[2]\,
      I1 => \downcounter_r_reg_n_0_[3]\,
      I2 => \downcounter_r_reg_n_0_[1]\,
      I3 => lfsr_taps_r,
      I4 => \downcounter_r_reg_n_0_[0]\,
      I5 => tx_system_reset_c,
      O => \downcounter_r[1]_i_1_n_0\
    );
\downcounter_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF0000000000FE"
    )
        port map (
      I0 => \downcounter_r_reg_n_0_[0]\,
      I1 => \downcounter_r_reg_n_0_[1]\,
      I2 => gen_k_flop_c_0,
      I3 => tx_system_reset_c,
      I4 => \downcounter_r_reg_n_0_[2]\,
      I5 => \downcounter_r_reg_n_0_[3]\,
      O => \downcounter_r[2]_i_1_n_0\
    );
\downcounter_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1111111111111110"
    )
        port map (
      I0 => \downcounter_r_reg_n_0_[3]\,
      I1 => tx_system_reset_c,
      I2 => \downcounter_r_reg_n_0_[1]\,
      I3 => \downcounter_r_reg_n_0_[0]\,
      I4 => \downcounter_r_reg_n_0_[2]\,
      I5 => lfsr_last_flop_r,
      O => \downcounter_r[3]_i_1_n_0\
    );
\downcounter_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => \downcounter_r[0]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[0]\,
      R => '0'
    );
\downcounter_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => \downcounter_r[1]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[1]\,
      R => '0'
    );
\downcounter_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => \downcounter_r[2]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[2]\,
      R => '0'
    );
\downcounter_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => \downcounter_r[3]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[3]\,
      R => '0'
    );
gen_a_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => gen_a_flop_c,
      Q => gen_a_i,
      R => '0'
    );
gen_a_flop_0_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \downcounter_r_reg_n_0_[3]\,
      I1 => \downcounter_r_reg_n_0_[2]\,
      I2 => \downcounter_r_reg_n_0_[1]\,
      I3 => \downcounter_r_reg_n_0_[0]\,
      I4 => gen_ver_word_1_r,
      O => gen_a_flop_c
    );
gen_k_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => gen_k_flop_c_1,
      Q => gen_k_flop_0_i_0(1),
      R => '0'
    );
gen_k_flop_0_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAA8"
    )
        port map (
      I0 => lfsr_taps_r,
      I1 => \downcounter_r_reg_n_0_[0]\,
      I2 => \downcounter_r_reg_n_0_[1]\,
      I3 => \downcounter_r_reg_n_0_[2]\,
      I4 => \downcounter_r_reg_n_0_[3]\,
      I5 => gen_ver_word_1_r,
      O => gen_k_flop_c_1
    );
gen_k_flop_1_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => gen_k_flop_c_0,
      Q => gen_k_flop_0_i_0(0),
      R => '0'
    );
gen_r_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => gen_r_flop_c_1,
      Q => gen_r_flop_0_i_0(1),
      R => '0'
    );
gen_r_flop_0_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1111111111111110"
    )
        port map (
      I0 => lfsr_taps_r,
      I1 => gen_ver_word_1_r,
      I2 => \downcounter_r_reg_n_0_[3]\,
      I3 => \downcounter_r_reg_n_0_[2]\,
      I4 => \downcounter_r_reg_n_0_[1]\,
      I5 => \downcounter_r_reg_n_0_[0]\,
      O => gen_r_flop_c_1
    );
gen_r_flop_1_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => gen_r_flop_c_0,
      Q => gen_r_flop_0_i_0(0),
      R => '0'
    );
gen_r_flop_1_i_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => gen_k_flop_c_0,
      O => gen_r_flop_c_0
    );
gen_v_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => recycle_gen_ver_c,
      Q => D(1),
      R => '0'
    );
gen_v_flop_0_i_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => gen_ver_word_2_r_reg_n_0,
      I1 => gen_ver_i,
      O => recycle_gen_ver_c
    );
gen_v_flop_1_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => gen_v_flop_c_0,
      Q => D(0),
      R => '0'
    );
gen_v_flop_1_i_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => gen_ver_word_1_r,
      I1 => gen_ver_i,
      I2 => gen_ver_word_2_r_reg_n_0,
      O => gen_v_flop_c_0
    );
gen_ver_word_2_r_reg: unisim.vcomponents.FDRE
     port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => gen_ver_word_1_r,
      Q => gen_ver_word_2_r_reg_n_0,
      R => '0'
    );
lfsr_last_flop_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => gen_k_flop_c_0,
      Q => lfsr_last_flop_r,
      R => tx_system_reset_c
    );
\lfsr_shift_register_r_reg[2]_srl3\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => prev_cycle_gen_ver_r_reg_0,
      D => lfsr_taps_r,
      Q => \lfsr_shift_register_r_reg[2]_srl3_n_0\
    );
\lfsr_shift_register_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => \lfsr_shift_register_r_reg[2]_srl3_n_0\,
      Q => gen_k_flop_c_0,
      R => '0'
    );
lfsr_taps_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => lfsr_taps_c,
      Q => lfsr_taps_r,
      R => tx_system_reset_c
    );
lfsr_taps_i_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => lfsr_last_flop_r,
      I1 => gen_k_flop_c_0,
      O => lfsr_taps_c
    );
prev_cycle_gen_ver_r_reg: unisim.vcomponents.FDRE
     port map (
      C => prev_cycle_gen_ver_r_reg_0,
      CE => '1',
      D => gen_ver_i,
      Q => prev_cycle_gen_ver_r,
      R => '0'
    );
ver_counter_0_i: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => prev_cycle_gen_ver_r_reg_0,
      D => insert_ver_c,
      Q => ver_counter_r_1
    );
ver_counter_0_i_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C4"
    )
        port map (
      I0 => prev_cycle_gen_ver_r,
      I1 => gen_ver_i,
      I2 => gen_ver_word_2_r_reg_n_0,
      O => insert_ver_c
    );
ver_counter_1_i: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => prev_cycle_gen_ver_r_reg_0,
      D => ver_counter_r_1,
      Q => gen_ver_word_1_r
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE is
  port (
    Q : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \prepare_count_r_reg[9]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE : entity is "simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE is
  signal DO_CC0_n_0 : STD_LOGIC;
  signal DO_CC_i_1_n_0 : STD_LOGIC;
  signal \cc_count_r_reg_n_0_[5]\ : STD_LOGIC;
  signal cc_idle_count_done_c : STD_LOGIC;
  signal count_13d_flop_r_reg_r_n_0 : STD_LOGIC;
  signal \count_13d_srl_r_reg[10]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0\ : STD_LOGIC;
  signal \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0\ : STD_LOGIC;
  signal \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0\ : STD_LOGIC;
  signal count_13d_srl_r_reg_gate_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_0_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_1_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_2_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_3_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_4_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_5_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_6_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_7_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_8_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_9_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_n_0 : STD_LOGIC;
  signal count_16d_flop_r : STD_LOGIC;
  signal count_16d_flop_r_i_1_n_0 : STD_LOGIC;
  signal count_16d_srl_r0 : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[9]\ : STD_LOGIC;
  signal count_24d_flop_r : STD_LOGIC;
  signal count_24d_flop_r_i_1_n_0 : STD_LOGIC;
  signal count_24d_srl_r0 : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[16]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[17]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[18]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[19]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[20]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[21]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[22]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[9]\ : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_3_out : STD_LOGIC_VECTOR ( 5 to 5 );
  signal \prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_n_0\ : STD_LOGIC;
  signal \prepare_count_r_reg[8]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6_n_0\ : STD_LOGIC;
  signal prepare_count_r_reg_gate_n_0 : STD_LOGIC;
  signal reset_r : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/standard_cc_module_i/count_13d_srl_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/standard_cc_module_i/count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8 ";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of count_16d_flop_r_i_1 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of count_24d_flop_r_i_1 : label is "soft_lutpair13";
  attribute srl_bus_name of \prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/standard_cc_module_i/prepare_count_r_reg ";
  attribute srl_name of \prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/standard_cc_module_i/prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5 ";
  attribute SOFT_HLUTNM of \prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_i_1\ : label is "soft_lutpair13";
begin
DO_CC0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => p_2_in(0),
      I1 => \cc_count_r_reg_n_0_[5]\,
      I2 => p_2_in(3),
      I3 => p_2_in(4),
      I4 => p_2_in(1),
      I5 => p_2_in(2),
      O => DO_CC0_n_0
    );
DO_CC_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => DO_CC0_n_0,
      I1 => p_3_out(5),
      I2 => reset_r,
      O => DO_CC_i_1_n_0
    );
DO_CC_reg: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => DO_CC_i_1_n_0,
      Q => Q,
      R => SR(0)
    );
\cc_count_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => p_3_out(5),
      Q => p_2_in(4),
      R => SR(0)
    );
\cc_count_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => p_2_in(4),
      Q => p_2_in(3),
      R => SR(0)
    );
\cc_count_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => p_2_in(3),
      Q => p_2_in(2),
      R => SR(0)
    );
\cc_count_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => p_2_in(2),
      Q => p_2_in(1),
      R => SR(0)
    );
\cc_count_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => p_2_in(1),
      Q => p_2_in(0),
      R => SR(0)
    );
\cc_count_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => p_2_in(0),
      Q => \cc_count_r_reg_n_0_[5]\,
      R => SR(0)
    );
count_13d_flop_r_reg_r: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => '1',
      Q => count_13d_flop_r_reg_r_n_0,
      R => SR(0)
    );
\count_13d_srl_r_reg[10]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0\,
      Q => \count_13d_srl_r_reg[10]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0\,
      R => '0'
    );
\count_13d_srl_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_gate_n_0,
      Q => count_16d_srl_r0,
      R => SR(0)
    );
\count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => \prepare_count_r_reg[9]_0\,
      D => \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0\,
      Q => \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0\
    );
\count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => count_16d_srl_r0,
      I1 => reset_r,
      O => \count_13d_srl_r_reg[9]_srl11___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0\
    );
count_13d_srl_r_reg_gate: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count_13d_srl_r_reg[10]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0\,
      I1 => count_13d_srl_r_reg_r_9_n_0,
      O => count_13d_srl_r_reg_gate_n_0
    );
count_13d_srl_r_reg_r: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_flop_r_reg_r_n_0,
      Q => count_13d_srl_r_reg_r_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_0: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_n_0,
      Q => count_13d_srl_r_reg_r_0_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_1: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_0_n_0,
      Q => count_13d_srl_r_reg_r_1_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_2: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_1_n_0,
      Q => count_13d_srl_r_reg_r_2_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_3: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_2_n_0,
      Q => count_13d_srl_r_reg_r_3_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_4: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_3_n_0,
      Q => count_13d_srl_r_reg_r_4_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_5: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_4_n_0,
      Q => count_13d_srl_r_reg_r_5_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_6: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_5_n_0,
      Q => count_13d_srl_r_reg_r_6_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_7: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_6_n_0,
      Q => count_13d_srl_r_reg_r_7_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_8: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_7_n_0,
      Q => count_13d_srl_r_reg_r_8_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_9: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_13d_srl_r_reg_r_8_n_0,
      Q => count_13d_srl_r_reg_r_9_n_0,
      R => SR(0)
    );
count_16d_flop_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBF8"
    )
        port map (
      I0 => \count_16d_srl_r_reg_n_0_[14]\,
      I1 => count_16d_srl_r0,
      I2 => reset_r,
      I3 => count_16d_flop_r,
      O => count_16d_flop_r_i_1_n_0
    );
count_16d_flop_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_16d_flop_r_i_1_n_0,
      Q => count_16d_flop_r,
      R => SR(0)
    );
\count_16d_srl_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => count_16d_flop_r,
      Q => \count_16d_srl_r_reg_n_0_[0]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[9]\,
      Q => \count_16d_srl_r_reg_n_0_[10]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[10]\,
      Q => \count_16d_srl_r_reg_n_0_[11]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[11]\,
      Q => \count_16d_srl_r_reg_n_0_[12]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[12]\,
      Q => \count_16d_srl_r_reg_n_0_[13]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[13]\,
      Q => \count_16d_srl_r_reg_n_0_[14]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[0]\,
      Q => \count_16d_srl_r_reg_n_0_[1]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[1]\,
      Q => \count_16d_srl_r_reg_n_0_[2]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[2]\,
      Q => \count_16d_srl_r_reg_n_0_[3]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[3]\,
      Q => \count_16d_srl_r_reg_n_0_[4]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[4]\,
      Q => \count_16d_srl_r_reg_n_0_[5]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[5]\,
      Q => \count_16d_srl_r_reg_n_0_[6]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[6]\,
      Q => \count_16d_srl_r_reg_n_0_[7]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[7]\,
      Q => \count_16d_srl_r_reg_n_0_[8]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[8]\,
      Q => \count_16d_srl_r_reg_n_0_[9]\,
      R => SR(0)
    );
count_24d_flop_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFFF80"
    )
        port map (
      I0 => \count_24d_srl_r_reg_n_0_[22]\,
      I1 => count_16d_srl_r0,
      I2 => \count_16d_srl_r_reg_n_0_[14]\,
      I3 => reset_r,
      I4 => count_24d_flop_r,
      O => count_24d_flop_r_i_1_n_0
    );
count_24d_flop_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => count_24d_flop_r_i_1_n_0,
      Q => count_24d_flop_r,
      R => SR(0)
    );
\count_24d_srl_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_16d_srl_r0,
      I1 => \count_16d_srl_r_reg_n_0_[14]\,
      O => count_24d_srl_r0
    );
\count_24d_srl_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => count_24d_flop_r,
      Q => \count_24d_srl_r_reg_n_0_[0]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[9]\,
      Q => \count_24d_srl_r_reg_n_0_[10]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[10]\,
      Q => \count_24d_srl_r_reg_n_0_[11]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[11]\,
      Q => \count_24d_srl_r_reg_n_0_[12]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[12]\,
      Q => \count_24d_srl_r_reg_n_0_[13]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[13]\,
      Q => \count_24d_srl_r_reg_n_0_[14]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[14]\,
      Q => \count_24d_srl_r_reg_n_0_[15]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[15]\,
      Q => \count_24d_srl_r_reg_n_0_[16]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[16]\,
      Q => \count_24d_srl_r_reg_n_0_[17]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[17]\,
      Q => \count_24d_srl_r_reg_n_0_[18]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[18]\,
      Q => \count_24d_srl_r_reg_n_0_[19]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[0]\,
      Q => \count_24d_srl_r_reg_n_0_[1]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[19]\,
      Q => \count_24d_srl_r_reg_n_0_[20]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[20]\,
      Q => \count_24d_srl_r_reg_n_0_[21]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[21]\,
      Q => \count_24d_srl_r_reg_n_0_[22]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[1]\,
      Q => \count_24d_srl_r_reg_n_0_[2]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[2]\,
      Q => \count_24d_srl_r_reg_n_0_[3]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[3]\,
      Q => \count_24d_srl_r_reg_n_0_[4]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[4]\,
      Q => \count_24d_srl_r_reg_n_0_[5]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[5]\,
      Q => \count_24d_srl_r_reg_n_0_[6]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[6]\,
      Q => \count_24d_srl_r_reg_n_0_[7]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[7]\,
      Q => \count_24d_srl_r_reg_n_0_[8]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[8]\,
      Q => \count_24d_srl_r_reg_n_0_[9]\,
      R => SR(0)
    );
\prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => \prepare_count_r_reg[9]_0\,
      D => cc_idle_count_done_c,
      Q => \prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_n_0\
    );
\prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_16d_srl_r0,
      I1 => \count_16d_srl_r_reg_n_0_[14]\,
      I2 => \count_24d_srl_r_reg_n_0_[22]\,
      O => cc_idle_count_done_c
    );
\prepare_count_r_reg[8]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => \prepare_count_r_reg[7]_srl8___simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_n_0\,
      Q => \prepare_count_r_reg[8]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6_n_0\,
      R => '0'
    );
\prepare_count_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => prepare_count_r_reg_gate_n_0,
      Q => p_3_out(5),
      R => SR(0)
    );
prepare_count_r_reg_gate: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \prepare_count_r_reg[8]_simplex_tx_aurora_8b10b_0_0_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6_n_0\,
      I1 => count_13d_srl_r_reg_r_6_n_0,
      O => prepare_count_r_reg_gate_n_0
    );
reset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \prepare_count_r_reg[9]_0\,
      CE => '1',
      D => SR(0),
      Q => reset_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SYM_GEN is
  port (
    TXCHARISK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    TXDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    GEN_PAD : in STD_LOGIC;
    gen_a_r_reg_0 : in STD_LOGIC;
    TX_PE_DATA_V : in STD_LOGIC;
    gen_k_fsm_r_reg_0 : in STD_LOGIC;
    gen_cc_i : in STD_LOGIC;
    GEN_ECP : in STD_LOGIC;
    GEN_SCP : in STD_LOGIC;
    gen_a_i : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_v_r_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_r_r_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_k_r_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SYM_GEN : entity is "simplex_tx_aurora_8b10b_0_0_SYM_GEN";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SYM_GEN;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SYM_GEN is
  signal \TX_CHAR_IS_K[0]_i_1_n_0\ : STD_LOGIC;
  signal TX_CHAR_IS_K_reg04_out : STD_LOGIC;
  signal \TX_DATA[0]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[10]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[11]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[12]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[12]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_5_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_6_n_0\ : STD_LOGIC;
  signal \TX_DATA[1]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[2]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[3]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[4]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[4]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[5]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[6]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[6]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_5_n_0\ : STD_LOGIC;
  signal \TX_DATA[8]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[9]_i_1_n_0\ : STD_LOGIC;
  signal TX_DATA_reg0 : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gen_a_r : STD_LOGIC;
  signal gen_cc_r : STD_LOGIC;
  signal gen_ecp_r : STD_LOGIC;
  signal gen_k_fsm_r : STD_LOGIC;
  signal \gen_k_r_reg_n_0_[1]\ : STD_LOGIC;
  signal gen_pad_r : STD_LOGIC;
  signal \gen_r_r_reg_n_0_[1]\ : STD_LOGIC;
  signal gen_scp_r : STD_LOGIC;
  signal \gen_sp_data_r_reg_n_0_[1]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in1_in : STD_LOGIC;
  signal p_0_in4_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[9]\ : STD_LOGIC;
  signal tx_pe_data_v_r : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \TX_CHAR_IS_K[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \TX_CHAR_IS_K[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \TX_DATA[10]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \TX_DATA[12]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \TX_DATA[13]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \TX_DATA[13]_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \TX_DATA[15]_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \TX_DATA[15]_i_4\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \TX_DATA[5]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \TX_DATA[7]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \TX_DATA[7]_i_3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \TX_DATA[7]_i_5\ : label is "soft_lutpair17";
begin
\TX_CHAR_IS_K[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAEAF"
    )
        port map (
      I0 => gen_cc_r,
      I1 => gen_pad_r,
      I2 => \gen_sp_data_r_reg_n_0_[1]\,
      I3 => tx_pe_data_v_r,
      I4 => p_3_in,
      O => \TX_CHAR_IS_K[0]_i_1_n_0\
    );
\TX_CHAR_IS_K[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAAB"
    )
        port map (
      I0 => gen_cc_r,
      I1 => p_2_in,
      I2 => p_0_in1_in,
      I3 => tx_pe_data_v_r,
      O => TX_CHAR_IS_K_reg04_out
    );
\TX_CHAR_IS_K_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => \TX_CHAR_IS_K[0]_i_1_n_0\,
      Q => TXCHARISK(1),
      R => '0'
    );
\TX_CHAR_IS_K_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => TX_CHAR_IS_K_reg04_out,
      Q => TXCHARISK(0),
      R => '0'
    );
\TX_DATA[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAEAAAEAAFFAAAA"
    )
        port map (
      I0 => gen_scp_r,
      I1 => \tx_pe_data_r_reg_n_0_[15]\,
      I2 => gen_pad_r,
      I3 => gen_ecp_r,
      I4 => gen_cc_r,
      I5 => tx_pe_data_v_r,
      O => \TX_DATA[0]_i_1_n_0\
    );
\TX_DATA[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => data0(2),
      I2 => \TX_DATA[12]_i_2_n_0\,
      O => \TX_DATA[10]_i_1_n_0\
    );
\TX_DATA[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFFEEFEEEFFEEFF"
    )
        port map (
      I0 => gen_ecp_r,
      I1 => gen_scp_r,
      I2 => data0(3),
      I3 => gen_cc_r,
      I4 => gen_k_fsm_r,
      I5 => tx_pe_data_v_r,
      O => \TX_DATA[11]_i_1_n_0\
    );
\TX_DATA[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => data0(4),
      I2 => \TX_DATA[12]_i_2_n_0\,
      O => \TX_DATA[12]_i_1_n_0\
    );
\TX_DATA[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF5554"
    )
        port map (
      I0 => \TX_DATA[15]_i_4_n_0\,
      I1 => p_0_in4_in,
      I2 => gen_a_r,
      I3 => p_0_in,
      I4 => \TX_DATA[15]_i_3_n_0\,
      O => \TX_DATA[12]_i_2_n_0\
    );
\TX_DATA[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFE0"
    )
        port map (
      I0 => p_0_in4_in,
      I1 => gen_a_r,
      I2 => \TX_DATA[13]_i_2_n_0\,
      I3 => \TX_DATA[13]_i_3_n_0\,
      I4 => \TX_DATA[15]_i_6_n_0\,
      O => \TX_DATA[13]_i_1_n_0\
    );
\TX_DATA[13]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => p_0_in1_in,
      I2 => gen_scp_r,
      O => \TX_DATA[13]_i_2_n_0\
    );
\TX_DATA[13]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F011"
    )
        port map (
      I0 => p_0_in,
      I1 => p_0_in1_in,
      I2 => data0(5),
      I3 => tx_pe_data_v_r,
      I4 => gen_scp_r,
      O => \TX_DATA[13]_i_3_n_0\
    );
\TX_DATA[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFBAAA"
    )
        port map (
      I0 => \TX_DATA[14]_i_2_n_0\,
      I1 => gen_k_fsm_r,
      I2 => tx_pe_data_v_r,
      I3 => data0(6),
      I4 => \TX_DATA[14]_i_3_n_0\,
      I5 => \TX_DATA[14]_i_4_n_0\,
      O => \TX_DATA[14]_i_1_n_0\
    );
\TX_DATA[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1110111011101111"
    )
        port map (
      I0 => gen_k_fsm_r,
      I1 => tx_pe_data_v_r,
      I2 => gen_a_r,
      I3 => p_2_in,
      I4 => p_0_in4_in,
      I5 => p_0_in,
      O => \TX_DATA[14]_i_2_n_0\
    );
\TX_DATA[14]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => gen_ecp_r,
      I1 => gen_scp_r,
      O => \TX_DATA[14]_i_3_n_0\
    );
\TX_DATA[14]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
        port map (
      I0 => p_0_in1_in,
      I1 => tx_pe_data_v_r,
      I2 => gen_k_fsm_r,
      I3 => gen_cc_r,
      O => \TX_DATA[14]_i_4_n_0\
    );
\TX_DATA[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \TX_DATA[15]_i_3_n_0\,
      I1 => \TX_DATA[15]_i_4_n_0\,
      I2 => p_0_in,
      I3 => gen_a_r,
      I4 => p_0_in4_in,
      O => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBAAA"
    )
        port map (
      I0 => \TX_DATA[15]_i_5_n_0\,
      I1 => gen_scp_r,
      I2 => tx_pe_data_v_r,
      I3 => data0(7),
      I4 => \TX_DATA[15]_i_6_n_0\,
      O => \TX_DATA[15]_i_2_n_0\
    );
\TX_DATA[15]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => gen_cc_r,
      I1 => gen_k_fsm_r,
      I2 => gen_scp_r,
      I3 => gen_ecp_r,
      O => \TX_DATA[15]_i_3_n_0\
    );
\TX_DATA[15]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => p_0_in1_in,
      I2 => p_2_in,
      O => \TX_DATA[15]_i_4_n_0\
    );
\TX_DATA[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000045"
    )
        port map (
      I0 => gen_a_r,
      I1 => p_0_in4_in,
      I2 => p_0_in,
      I3 => gen_scp_r,
      I4 => p_0_in1_in,
      I5 => tx_pe_data_v_r,
      O => \TX_DATA[15]_i_5_n_0\
    );
\TX_DATA[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F8F8F8F8F8F8F88"
    )
        port map (
      I0 => p_2_in,
      I1 => \TX_DATA[13]_i_2_n_0\,
      I2 => gen_scp_r,
      I3 => gen_cc_r,
      I4 => gen_k_fsm_r,
      I5 => gen_ecp_r,
      O => \TX_DATA[15]_i_6_n_0\
    );
\TX_DATA[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFCCFFFFCFCCEEEE"
    )
        port map (
      I0 => gen_cc_r,
      I1 => \TX_DATA[14]_i_3_n_0\,
      I2 => gen_pad_r,
      I3 => \tx_pe_data_r_reg_n_0_[14]\,
      I4 => tx_pe_data_v_r,
      I5 => \gen_sp_data_r_reg_n_0_[1]\,
      O => \TX_DATA[1]_i_1_n_0\
    );
\TX_DATA[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF0000FFE4"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => gen_cc_r,
      I2 => \tx_pe_data_r_reg_n_0_[13]\,
      I3 => \TX_DATA[4]_i_2_n_0\,
      I4 => gen_scp_r,
      I5 => gen_ecp_r,
      O => \TX_DATA[2]_i_1_n_0\
    );
\TX_DATA[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF5FFFCFFF5"
    )
        port map (
      I0 => gen_cc_r,
      I1 => \tx_pe_data_r_reg_n_0_[12]\,
      I2 => gen_ecp_r,
      I3 => gen_scp_r,
      I4 => tx_pe_data_v_r,
      I5 => gen_pad_r,
      O => \TX_DATA[3]_i_1_n_0\
    );
\TX_DATA[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFAFFFE"
    )
        port map (
      I0 => \TX_DATA[4]_i_2_n_0\,
      I1 => gen_cc_r,
      I2 => gen_scp_r,
      I3 => gen_ecp_r,
      I4 => tx_pe_data_v_r,
      I5 => \tx_pe_data_r_reg_n_0_[11]\,
      O => \TX_DATA[4]_i_1_n_0\
    );
\TX_DATA[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF000011101110"
    )
        port map (
      I0 => p_3_in,
      I1 => \gen_sp_data_r_reg_n_0_[1]\,
      I2 => \gen_k_r_reg_n_0_[1]\,
      I3 => \gen_r_r_reg_n_0_[1]\,
      I4 => gen_pad_r,
      I5 => tx_pe_data_v_r,
      O => \TX_DATA[4]_i_2_n_0\
    );
\TX_DATA[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[10]\,
      I1 => tx_pe_data_v_r,
      I2 => gen_pad_r,
      I3 => \TX_DATA[7]_i_4_n_0\,
      O => \TX_DATA[5]_i_1_n_0\
    );
\TX_DATA[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0E0E0E0F"
    )
        port map (
      I0 => p_3_in,
      I1 => \gen_sp_data_r_reg_n_0_[1]\,
      I2 => tx_pe_data_v_r,
      I3 => \gen_r_r_reg_n_0_[1]\,
      I4 => \gen_k_r_reg_n_0_[1]\,
      I5 => \TX_DATA[6]_i_2_n_0\,
      O => \TX_DATA[6]_i_1_n_0\
    );
\TX_DATA[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF2FFF2FFFFFFF0"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[9]\,
      I1 => gen_pad_r,
      I2 => gen_ecp_r,
      I3 => gen_scp_r,
      I4 => gen_cc_r,
      I5 => tx_pe_data_v_r,
      O => \TX_DATA[6]_i_2_n_0\
    );
\TX_DATA[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \gen_k_r_reg_n_0_[1]\,
      I1 => \gen_r_r_reg_n_0_[1]\,
      I2 => gen_cc_r,
      I3 => gen_scp_r,
      I4 => gen_ecp_r,
      I5 => \TX_DATA[7]_i_3_n_0\,
      O => TX_DATA_reg0
    );
\TX_DATA[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FAEA"
    )
        port map (
      I0 => \TX_DATA[7]_i_4_n_0\,
      I1 => gen_pad_r,
      I2 => tx_pe_data_v_r,
      I3 => \tx_pe_data_r_reg_n_0_[8]\,
      O => \TX_DATA[7]_i_2_n_0\
    );
\TX_DATA[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => p_3_in,
      I1 => tx_pe_data_v_r,
      I2 => \gen_sp_data_r_reg_n_0_[1]\,
      O => \TX_DATA[7]_i_3_n_0\
    );
\TX_DATA[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF11111101"
    )
        port map (
      I0 => \gen_sp_data_r_reg_n_0_[1]\,
      I1 => tx_pe_data_v_r,
      I2 => \gen_r_r_reg_n_0_[1]\,
      I3 => p_3_in,
      I4 => \gen_k_r_reg_n_0_[1]\,
      I5 => \TX_DATA[7]_i_5_n_0\,
      O => \TX_DATA[7]_i_4_n_0\
    );
\TX_DATA[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF4"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => gen_cc_r,
      I2 => gen_scp_r,
      I3 => gen_ecp_r,
      O => \TX_DATA[7]_i_5_n_0\
    );
\TX_DATA[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EFEEEEEE"
    )
        port map (
      I0 => gen_ecp_r,
      I1 => gen_cc_r,
      I2 => gen_k_fsm_r,
      I3 => tx_pe_data_v_r,
      I4 => data0(0),
      I5 => gen_scp_r,
      O => \TX_DATA[8]_i_1_n_0\
    );
\TX_DATA[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333333300002230"
    )
        port map (
      I0 => data0(1),
      I1 => \TX_DATA[14]_i_3_n_0\,
      I2 => p_0_in1_in,
      I3 => tx_pe_data_v_r,
      I4 => gen_k_fsm_r,
      I5 => gen_cc_r,
      O => \TX_DATA[9]_i_1_n_0\
    );
\TX_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => TX_DATA_reg0,
      D => \TX_DATA[0]_i_1_n_0\,
      Q => TXDATA(8),
      R => '0'
    );
\TX_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[10]_i_1_n_0\,
      Q => TXDATA(2),
      R => '0'
    );
\TX_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[11]_i_1_n_0\,
      Q => TXDATA(3),
      R => '0'
    );
\TX_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[12]_i_1_n_0\,
      Q => TXDATA(4),
      R => '0'
    );
\TX_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[13]_i_1_n_0\,
      Q => TXDATA(5),
      R => '0'
    );
\TX_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[14]_i_1_n_0\,
      Q => TXDATA(6),
      R => '0'
    );
\TX_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[15]_i_2_n_0\,
      Q => TXDATA(7),
      R => '0'
    );
\TX_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => TX_DATA_reg0,
      D => \TX_DATA[1]_i_1_n_0\,
      Q => TXDATA(9),
      R => '0'
    );
\TX_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => TX_DATA_reg0,
      D => \TX_DATA[2]_i_1_n_0\,
      Q => TXDATA(10),
      R => '0'
    );
\TX_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => TX_DATA_reg0,
      D => \TX_DATA[3]_i_1_n_0\,
      Q => TXDATA(11),
      R => '0'
    );
\TX_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => TX_DATA_reg0,
      D => \TX_DATA[4]_i_1_n_0\,
      Q => TXDATA(12),
      R => '0'
    );
\TX_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => TX_DATA_reg0,
      D => \TX_DATA[5]_i_1_n_0\,
      Q => TXDATA(13),
      R => '0'
    );
\TX_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => TX_DATA_reg0,
      D => \TX_DATA[6]_i_1_n_0\,
      Q => TXDATA(14),
      R => '0'
    );
\TX_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => TX_DATA_reg0,
      D => \TX_DATA[7]_i_2_n_0\,
      Q => TXDATA(15),
      R => '0'
    );
\TX_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[8]_i_1_n_0\,
      Q => TXDATA(0),
      R => '0'
    );
\TX_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[9]_i_1_n_0\,
      Q => TXDATA(1),
      R => '0'
    );
gen_a_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => gen_a_i,
      Q => gen_a_r,
      R => '0'
    );
gen_cc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => gen_cc_i,
      Q => gen_cc_r,
      R => '0'
    );
gen_ecp_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => GEN_ECP,
      Q => gen_ecp_r,
      R => '0'
    );
gen_k_fsm_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => gen_k_fsm_r_reg_0,
      Q => gen_k_fsm_r,
      R => '0'
    );
\gen_k_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => \gen_k_r_reg[0]_0\(1),
      Q => p_0_in4_in,
      R => '0'
    );
\gen_k_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => \gen_k_r_reg[0]_0\(0),
      Q => \gen_k_r_reg_n_0_[1]\,
      R => '0'
    );
gen_pad_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => GEN_PAD,
      Q => gen_pad_r,
      R => '0'
    );
\gen_r_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => \gen_r_r_reg[0]_0\(1),
      Q => p_0_in,
      R => '0'
    );
\gen_r_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => \gen_r_r_reg[0]_0\(0),
      Q => \gen_r_r_reg_n_0_[1]\,
      R => '0'
    );
gen_scp_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => GEN_SCP,
      Q => gen_scp_r,
      R => '0'
    );
\gen_sp_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => D(1),
      Q => p_0_in1_in,
      R => '0'
    );
\gen_sp_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => D(0),
      Q => \gen_sp_data_r_reg_n_0_[1]\,
      R => '0'
    );
\gen_v_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => \gen_v_r_reg[0]_0\(1),
      Q => p_2_in,
      R => '0'
    );
\gen_v_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => \gen_v_r_reg[0]_0\(0),
      Q => p_3_in,
      R => '0'
    );
\tx_pe_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(15),
      Q => data0(7),
      R => '0'
    );
\tx_pe_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(5),
      Q => \tx_pe_data_r_reg_n_0_[10]\,
      R => '0'
    );
\tx_pe_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(4),
      Q => \tx_pe_data_r_reg_n_0_[11]\,
      R => '0'
    );
\tx_pe_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(3),
      Q => \tx_pe_data_r_reg_n_0_[12]\,
      R => '0'
    );
\tx_pe_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(2),
      Q => \tx_pe_data_r_reg_n_0_[13]\,
      R => '0'
    );
\tx_pe_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(1),
      Q => \tx_pe_data_r_reg_n_0_[14]\,
      R => '0'
    );
\tx_pe_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(0),
      Q => \tx_pe_data_r_reg_n_0_[15]\,
      R => '0'
    );
\tx_pe_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(14),
      Q => data0(6),
      R => '0'
    );
\tx_pe_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(13),
      Q => data0(5),
      R => '0'
    );
\tx_pe_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(12),
      Q => data0(4),
      R => '0'
    );
\tx_pe_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(11),
      Q => data0(3),
      R => '0'
    );
\tx_pe_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(10),
      Q => data0(2),
      R => '0'
    );
\tx_pe_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(9),
      Q => data0(1),
      R => '0'
    );
\tx_pe_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(8),
      Q => data0(0),
      R => '0'
    );
\tx_pe_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(7),
      Q => \tx_pe_data_r_reg_n_0_[8]\,
      R => '0'
    );
\tx_pe_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => Q(6),
      Q => \tx_pe_data_r_reg_n_0_[9]\,
      R => '0'
    );
tx_pe_data_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_a_r_reg_0,
      CE => '1',
      D => TX_PE_DATA_V,
      Q => tx_pe_data_v_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_ERR_DETECT_SIMPLEX is
  port (
    reset_channel_i : out STD_LOGIC;
    tx_hard_err : out STD_LOGIC;
    tx_lane_up : in STD_LOGIC;
    lane_up_r_reg_0 : in STD_LOGIC;
    CHANNEL_HARD_ERR_reg_0 : in STD_LOGIC;
    power_down : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_ERR_DETECT_SIMPLEX : entity is "simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_ERR_DETECT_SIMPLEX";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_ERR_DETECT_SIMPLEX;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_ERR_DETECT_SIMPLEX is
  signal RESET_CHANNEL_i_1_n_0 : STD_LOGIC;
  signal hard_err_r_reg_srl2_n_0 : STD_LOGIC;
  signal lane_up_r : STD_LOGIC;
  attribute srl_name : string;
  attribute srl_name of hard_err_r_reg_srl2 : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/tx_channel_err_detect_simplex_i/hard_err_r_reg_srl2 ";
begin
CHANNEL_HARD_ERR_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => lane_up_r_reg_0,
      CE => '1',
      D => hard_err_r_reg_srl2_n_0,
      Q => tx_hard_err,
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
      C => lane_up_r_reg_0,
      CE => '1',
      D => RESET_CHANNEL_i_1_n_0,
      Q => reset_channel_i,
      R => '0'
    );
hard_err_r_reg_srl2: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => lane_up_r_reg_0,
      D => CHANNEL_HARD_ERR_reg_0,
      Q => hard_err_r_reg_srl2_n_0
    );
lane_up_r_reg: unisim.vcomponents.FDRE
     port map (
      C => lane_up_r_reg_0,
      CE => '1',
      D => tx_lane_up,
      Q => lane_up_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_INIT_SM_SIMPLEX is
  port (
    tx_channel_up : out STD_LOGIC;
    tx_reset_lanes_i : out STD_LOGIC;
    gen_ver_i : out STD_LOGIC;
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_channel_up_i_0 : out STD_LOGIC;
    \free_count_r_reg[14]_0\ : in STD_LOGIC;
    tx_verify : in STD_LOGIC;
    wait_for_lane_up_r0 : in STD_LOGIC;
    hard_err_reset_i : in STD_LOGIC;
    tx_reset : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset_channel_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_INIT_SM_SIMPLEX : entity is "simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_INIT_SM_SIMPLEX";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_INIT_SM_SIMPLEX;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_INIT_SM_SIMPLEX is
  signal \free_count_r[10]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[10]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[10]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[10]_i_5_n_0\ : STD_LOGIC;
  signal \free_count_r[14]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[14]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[14]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[14]_i_5_n_0\ : STD_LOGIC;
  signal \free_count_r[2]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[2]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[2]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[6]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[6]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[6]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[6]_i_5_n_0\ : STD_LOGIC;
  signal free_count_r_reg : STD_LOGIC_VECTOR ( 0 to 14 );
  signal \free_count_r_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r_reg[10]_i_1_n_1\ : STD_LOGIC;
  signal \free_count_r_reg[10]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[10]_i_1_n_4\ : STD_LOGIC;
  signal \free_count_r_reg[10]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[10]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[10]_i_1_n_7\ : STD_LOGIC;
  signal \free_count_r_reg[14]_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r_reg[14]_i_1_n_1\ : STD_LOGIC;
  signal \free_count_r_reg[14]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[14]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[14]_i_1_n_4\ : STD_LOGIC;
  signal \free_count_r_reg[14]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[14]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[14]_i_1_n_7\ : STD_LOGIC;
  signal \free_count_r_reg[2]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[2]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[2]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[2]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[2]_i_1_n_7\ : STD_LOGIC;
  signal \free_count_r_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r_reg[6]_i_1_n_1\ : STD_LOGIC;
  signal \free_count_r_reg[6]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[6]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[6]_i_1_n_4\ : STD_LOGIC;
  signal \free_count_r_reg[6]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[6]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[6]_i_1_n_7\ : STD_LOGIC;
  signal \^gen_ver_i\ : STD_LOGIC;
  signal next_ready_c : STD_LOGIC;
  signal next_verify_c : STD_LOGIC;
  signal ready_r : STD_LOGIC;
  signal ready_r2 : STD_LOGIC;
  signal reset_lanes_c : STD_LOGIC;
  signal \^tx_channel_up\ : STD_LOGIC;
  signal \^tx_reset_lanes_i\ : STD_LOGIC;
  signal tx_verify_r : STD_LOGIC;
  signal verify_watchdog_r0 : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_2_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_3_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg_n_0_[15]\ : STD_LOGIC;
  signal wait_for_lane_up_r : STD_LOGIC;
  signal \NLW_free_count_r_reg[2]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_free_count_r_reg[2]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ready_r_i_1__0\ : label is "soft_lutpair25";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of reset_lanes_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_lanes_flop_i : label is "FD";
  attribute BOX_TYPE of tx_channel_up_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of tx_channel_up_i : label is "FD";
  attribute SOFT_HLUTNM of verify_r_i_1 : label is "soft_lutpair25";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \verify_watchdog_r_reg[14]_srl15\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/tx_channel_init_sm_simplex_i/verify_watchdog_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \verify_watchdog_r_reg[14]_srl15\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/tx_global_logic_simplex_i/tx_channel_init_sm_simplex_i/verify_watchdog_r_reg[14]_srl15 ";
begin
  gen_ver_i <= \^gen_ver_i\;
  tx_channel_up <= \^tx_channel_up\;
  tx_reset_lanes_i <= \^tx_reset_lanes_i\;
GEN_ECP_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^tx_channel_up\,
      O => tx_channel_up_i_0
    );
\free_count_r[10]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(7),
      O => \free_count_r[10]_i_2_n_0\
    );
\free_count_r[10]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(8),
      O => \free_count_r[10]_i_3_n_0\
    );
\free_count_r[10]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(9),
      O => \free_count_r[10]_i_4_n_0\
    );
\free_count_r[10]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(10),
      O => \free_count_r[10]_i_5_n_0\
    );
\free_count_r[14]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(11),
      O => \free_count_r[14]_i_2_n_0\
    );
\free_count_r[14]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(12),
      O => \free_count_r[14]_i_3_n_0\
    );
\free_count_r[14]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(13),
      O => \free_count_r[14]_i_4_n_0\
    );
\free_count_r[14]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(14),
      O => \free_count_r[14]_i_5_n_0\
    );
\free_count_r[2]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(0),
      O => \free_count_r[2]_i_2_n_0\
    );
\free_count_r[2]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(1),
      O => \free_count_r[2]_i_3_n_0\
    );
\free_count_r[2]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(2),
      O => \free_count_r[2]_i_4_n_0\
    );
\free_count_r[6]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(3),
      O => \free_count_r[6]_i_2_n_0\
    );
\free_count_r[6]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(4),
      O => \free_count_r[6]_i_3_n_0\
    );
\free_count_r[6]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(5),
      O => \free_count_r[6]_i_4_n_0\
    );
\free_count_r[6]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(6),
      O => \free_count_r[6]_i_5_n_0\
    );
\free_count_r_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[2]_i_1_n_5\,
      Q => free_count_r_reg(0),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[10]_i_1_n_7\,
      Q => free_count_r_reg(10),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[10]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \free_count_r_reg[14]_i_1_n_0\,
      CO(3) => \free_count_r_reg[10]_i_1_n_0\,
      CO(2) => \free_count_r_reg[10]_i_1_n_1\,
      CO(1) => \free_count_r_reg[10]_i_1_n_2\,
      CO(0) => \free_count_r_reg[10]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \free_count_r_reg[10]_i_1_n_4\,
      O(2) => \free_count_r_reg[10]_i_1_n_5\,
      O(1) => \free_count_r_reg[10]_i_1_n_6\,
      O(0) => \free_count_r_reg[10]_i_1_n_7\,
      S(3) => \free_count_r[10]_i_2_n_0\,
      S(2) => \free_count_r[10]_i_3_n_0\,
      S(1) => \free_count_r[10]_i_4_n_0\,
      S(0) => \free_count_r[10]_i_5_n_0\
    );
\free_count_r_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[14]_i_1_n_4\,
      Q => free_count_r_reg(11),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[14]_i_1_n_5\,
      Q => free_count_r_reg(12),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[14]_i_1_n_6\,
      Q => free_count_r_reg(13),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[14]_i_1_n_7\,
      Q => free_count_r_reg(14),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[14]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \free_count_r_reg[14]_i_1_n_0\,
      CO(2) => \free_count_r_reg[14]_i_1_n_1\,
      CO(1) => \free_count_r_reg[14]_i_1_n_2\,
      CO(0) => \free_count_r_reg[14]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \free_count_r_reg[14]_i_1_n_4\,
      O(2) => \free_count_r_reg[14]_i_1_n_5\,
      O(1) => \free_count_r_reg[14]_i_1_n_6\,
      O(0) => \free_count_r_reg[14]_i_1_n_7\,
      S(3) => \free_count_r[14]_i_2_n_0\,
      S(2) => \free_count_r[14]_i_3_n_0\,
      S(1) => \free_count_r[14]_i_4_n_0\,
      S(0) => \free_count_r[14]_i_5_n_0\
    );
\free_count_r_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[2]_i_1_n_6\,
      Q => free_count_r_reg(1),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[2]_i_1_n_7\,
      Q => free_count_r_reg(2),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[2]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \free_count_r_reg[6]_i_1_n_0\,
      CO(3 downto 2) => \NLW_free_count_r_reg[2]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \free_count_r_reg[2]_i_1_n_2\,
      CO(0) => \free_count_r_reg[2]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0011",
      O(3) => \NLW_free_count_r_reg[2]_i_1_O_UNCONNECTED\(3),
      O(2) => \free_count_r_reg[2]_i_1_n_5\,
      O(1) => \free_count_r_reg[2]_i_1_n_6\,
      O(0) => \free_count_r_reg[2]_i_1_n_7\,
      S(3) => '0',
      S(2) => \free_count_r[2]_i_2_n_0\,
      S(1) => \free_count_r[2]_i_3_n_0\,
      S(0) => \free_count_r[2]_i_4_n_0\
    );
\free_count_r_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[6]_i_1_n_4\,
      Q => free_count_r_reg(3),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[6]_i_1_n_5\,
      Q => free_count_r_reg(4),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[6]_i_1_n_6\,
      Q => free_count_r_reg(5),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[6]_i_1_n_7\,
      Q => free_count_r_reg(6),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[6]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \free_count_r_reg[10]_i_1_n_0\,
      CO(3) => \free_count_r_reg[6]_i_1_n_0\,
      CO(2) => \free_count_r_reg[6]_i_1_n_1\,
      CO(1) => \free_count_r_reg[6]_i_1_n_2\,
      CO(0) => \free_count_r_reg[6]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \free_count_r_reg[6]_i_1_n_4\,
      O(2) => \free_count_r_reg[6]_i_1_n_5\,
      O(1) => \free_count_r_reg[6]_i_1_n_6\,
      O(0) => \free_count_r_reg[6]_i_1_n_7\,
      S(3) => \free_count_r[6]_i_2_n_0\,
      S(2) => \free_count_r[6]_i_3_n_0\,
      S(1) => \free_count_r[6]_i_4_n_0\,
      S(0) => \free_count_r[6]_i_5_n_0\
    );
\free_count_r_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[10]_i_1_n_4\,
      Q => free_count_r_reg(7),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[10]_i_1_n_5\,
      Q => free_count_r_reg(8),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => \free_count_r_reg[10]_i_1_n_6\,
      Q => free_count_r_reg(9),
      S => wait_for_lane_up_r0
    );
ready_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[14]_0\,
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
      I0 => \^gen_ver_i\,
      I1 => tx_verify_r,
      I2 => ready_r,
      O => next_ready_c
    );
ready_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[14]_0\,
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
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => reset_lanes_c,
      Q => \^tx_reset_lanes_i\,
      R => '0'
    );
reset_lanes_flop_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEEFEEEFEEEFE"
    )
        port map (
      I0 => tx_reset,
      I1 => SR(0),
      I2 => reset_channel_i,
      I3 => wait_for_lane_up_r,
      I4 => \^gen_ver_i\,
      I5 => \verify_watchdog_r_reg_n_0_[15]\,
      O => reset_lanes_c
    );
rst_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^tx_reset_lanes_i\,
      I1 => hard_err_reset_i,
      O => SS(0)
    );
tx_channel_up_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => ready_r2,
      Q => \^tx_channel_up\,
      R => '0'
    );
tx_verify_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => tx_verify,
      Q => tx_verify_r,
      R => '0'
    );
verify_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => tx_verify_r,
      I1 => \^gen_ver_i\,
      I2 => wait_for_lane_up_r,
      O => next_verify_c
    );
verify_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[14]_0\,
      CE => '1',
      D => next_verify_c,
      Q => \^gen_ver_i\,
      R => wait_for_lane_up_r0
    );
\verify_watchdog_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => verify_watchdog_r0,
      CLK => \free_count_r_reg[14]_0\,
      D => \^gen_ver_i\,
      Q => \verify_watchdog_r_reg[14]_srl15_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00020000FFFFFFFF"
    )
        port map (
      I0 => \verify_watchdog_r_reg[14]_srl15_i_2_n_0\,
      I1 => free_count_r_reg(14),
      I2 => free_count_r_reg(13),
      I3 => free_count_r_reg(12),
      I4 => \verify_watchdog_r_reg[14]_srl15_i_3_n_0\,
      I5 => \^gen_ver_i\,
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
      C => \free_count_r_reg[14]_0\,
      CE => verify_watchdog_r0,
      D => \verify_watchdog_r_reg[14]_srl15_n_0\,
      Q => \verify_watchdog_r_reg_n_0_[15]\,
      R => '0'
    );
wait_for_lane_up_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \free_count_r_reg[14]_0\,
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_ERR_DETECT_SIMPLEX is
  port (
    hard_err_reset_i : out STD_LOGIC;
    hard_err_flop_r_reg_0 : out STD_LOGIC;
    hard_err_flop_r_reg_1 : in STD_LOGIC;
    hard_err_flop_r_reg_2 : in STD_LOGIC;
    ENABLE_ERR_DETECT : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_ERR_DETECT_SIMPLEX : entity is "simplex_tx_aurora_8b10b_0_0_TX_ERR_DETECT_SIMPLEX";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_ERR_DETECT_SIMPLEX;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_ERR_DETECT_SIMPLEX is
  signal \^hard_err_reset_i\ : STD_LOGIC;
begin
  hard_err_reset_i <= \^hard_err_reset_i\;
hard_err_flop_r_reg: unisim.vcomponents.FDRE
     port map (
      C => hard_err_flop_r_reg_2,
      CE => '1',
      D => hard_err_flop_r_reg_1,
      Q => \^hard_err_reset_i\,
      R => '0'
    );
hard_err_r_reg_srl2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^hard_err_reset_i\,
      I1 => ENABLE_ERR_DETECT,
      O => hard_err_flop_r_reg_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LANE_INIT_SM_SIMPLEX is
  port (
    tx_lane_up : out STD_LOGIC;
    ENABLE_ERR_DETECT : out STD_LOGIC;
    odd_word_r_reg_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tx_reset_lanes_i : in STD_LOGIC;
    \counter1_r_reg[0]_0\ : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_aligned : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LANE_INIT_SM_SIMPLEX : entity is "simplex_tx_aurora_8b10b_0_0_TX_LANE_INIT_SM_SIMPLEX";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LANE_INIT_SM_SIMPLEX;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LANE_INIT_SM_SIMPLEX is
  signal align_r : STD_LOGIC;
  signal count_8d_done_r : STD_LOGIC;
  signal \counter1_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[3]\ : STD_LOGIC;
  signal gtp_tx_reset_i : STD_LOGIC;
  signal next_align_c : STD_LOGIC;
  signal next_ready_c : STD_LOGIC;
  signal next_rst_c : STD_LOGIC;
  signal odd_word_r : STD_LOGIC;
  signal odd_word_r_i_1_n_0 : STD_LOGIC;
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ready_r : STD_LOGIC;
  signal tx_aligned_r : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of align_r_i_1 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \counter1_r[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \counter1_r[1]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of gen_k_fsm_r_i_1 : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \gen_sp_data_r[0]_i_1\ : label is "soft_lutpair23";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of lane_up_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of lane_up_flop_i : label is "FDR";
  attribute SOFT_HLUTNM of ready_r_i_1 : label is "soft_lutpair22";
begin
ENABLE_ERR_DETECT_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => ready_r,
      Q => ENABLE_ERR_DETECT,
      R => '0'
    );
align_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => tx_aligned_r,
      I1 => align_r,
      I2 => count_8d_done_r,
      I3 => gtp_tx_reset_i,
      O => next_align_c
    );
align_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => next_align_c,
      Q => align_r,
      R => SS(0)
    );
\counter1_r[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[1]\,
      I1 => \counter1_r_reg_n_0_[3]\,
      I2 => \counter1_r_reg_n_0_[2]\,
      I3 => count_8d_done_r,
      O => \p_0_in__1\(3)
    );
\counter1_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[2]\,
      I1 => \counter1_r_reg_n_0_[3]\,
      I2 => \counter1_r_reg_n_0_[1]\,
      O => \p_0_in__1\(2)
    );
\counter1_r[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[3]\,
      I1 => \counter1_r_reg_n_0_[2]\,
      O => \p_0_in__1\(1)
    );
\counter1_r[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[3]\,
      O => \p_0_in__1\(0)
    );
\counter1_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => \p_0_in__1\(3),
      Q => count_8d_done_r,
      R => SS(0)
    );
\counter1_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => \p_0_in__1\(2),
      Q => \counter1_r_reg_n_0_[1]\,
      R => SS(0)
    );
\counter1_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => \p_0_in__1\(1),
      Q => \counter1_r_reg_n_0_[2]\,
      R => SS(0)
    );
\counter1_r_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => \p_0_in__1\(0),
      Q => \counter1_r_reg_n_0_[3]\,
      S => SS(0)
    );
gen_k_fsm_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => odd_word_r,
      I1 => ready_r,
      O => odd_word_r_reg_0
    );
\gen_sp_data_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => odd_word_r,
      I1 => ready_r,
      O => D(1)
    );
\gen_sp_data_r[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ready_r,
      O => D(0)
    );
lane_up_flop_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => ready_r,
      Q => tx_lane_up,
      R => tx_reset_lanes_i
    );
odd_word_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => odd_word_r,
      O => odd_word_r_i_1_n_0
    );
odd_word_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => odd_word_r_i_1_n_0,
      Q => odd_word_r,
      R => '0'
    );
ready_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => tx_aligned_r,
      I1 => align_r,
      I2 => ready_r,
      O => next_ready_c
    );
ready_r_reg: unisim.vcomponents.FDRE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => next_ready_c,
      Q => ready_r,
      R => SS(0)
    );
rst_r_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gtp_tx_reset_i,
      I1 => count_8d_done_r,
      O => next_rst_c
    );
rst_r_reg: unisim.vcomponents.FDSE
     port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => next_rst_c,
      Q => gtp_tx_reset_i,
      S => SS(0)
    );
tx_aligned_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => \counter1_r_reg[0]_0\,
      CE => '1',
      D => tx_aligned,
      Q => tx_aligned_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_CONTROL is
  port (
    gen_cc_i : out STD_LOGIC;
    do_cc_r : out STD_LOGIC;
    GEN_ECP : out STD_LOGIC;
    GEN_SCP : out STD_LOGIC;
    TX_DST_RDY_N_reg_0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    new_pkt_r_reg : out STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    s_axi_tx_tvalid_0 : out STD_LOGIC;
    sof_r_reg_0 : in STD_LOGIC;
    data_r_reg_0 : in STD_LOGIC;
    Q : in STD_LOGIC;
    sof_data_eof_1_r_reg_0 : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    in_frame_r_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_CONTROL : entity is "simplex_tx_aurora_8b10b_0_0_TX_LL_CONTROL";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_CONTROL;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_CONTROL is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GEN_ECP0 : STD_LOGIC;
  signal GEN_SCP0 : STD_LOGIC;
  signal TX_DST_RDY_N_i_2_n_0 : STD_LOGIC;
  signal TX_DST_RDY_N_i_3_n_0 : STD_LOGIC;
  signal \^tx_dst_rdy_n_reg_0\ : STD_LOGIC;
  signal data_eof_1_r : STD_LOGIC;
  signal data_eof_2_r : STD_LOGIC;
  signal data_eof_3_r : STD_LOGIC;
  signal data_r : STD_LOGIC;
  signal \^do_cc_r\ : STD_LOGIC;
  signal idle_r : STD_LOGIC;
  signal next_data_c : STD_LOGIC;
  signal next_data_eof_1_c : STD_LOGIC;
  signal next_idle_c : STD_LOGIC;
  signal next_sof_c : STD_LOGIC;
  signal next_sof_data_eof_1_c : STD_LOGIC;
  signal \^s_axi_tx_tvalid_0\ : STD_LOGIC;
  signal sof_data_eof_1_r : STD_LOGIC;
  signal sof_data_eof_2_r : STD_LOGIC;
  signal sof_data_eof_3_r : STD_LOGIC;
  signal sof_r : STD_LOGIC;
  signal sof_r_i_2_n_0 : STD_LOGIC;
  signal tx_dst_rdy_n_c : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of GEN_ECP_i_2 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of GEN_SCP_i_1 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of data_eof_1_r_i_1 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of data_r_i_1 : label is "soft_lutpair27";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gen_cc_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of gen_cc_flop_0_i : label is "FDR";
  attribute SOFT_HLUTNM of in_frame_r_i_1 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of s_axi_tx_tready_INST_0 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of sof_data_eof_1_r_i_1 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of sof_r_i_1 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of sof_r_i_2 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of storage_pad_r_i_2 : label is "soft_lutpair26";
begin
  E(0) <= \^e\(0);
  TX_DST_RDY_N_reg_0 <= \^tx_dst_rdy_n_reg_0\;
  do_cc_r <= \^do_cc_r\;
  s_axi_tx_tvalid_0 <= \^s_axi_tx_tvalid_0\;
GEN_ECP_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => data_eof_3_r,
      I1 => sof_data_eof_3_r,
      I2 => \^do_cc_r\,
      O => GEN_ECP0
    );
GEN_ECP_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => '1',
      D => GEN_ECP0,
      Q => GEN_ECP,
      R => data_r_reg_0
    );
GEN_SCP_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => sof_data_eof_1_r,
      I1 => \^do_cc_r\,
      I2 => sof_r,
      O => GEN_SCP0
    );
GEN_SCP_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => '1',
      D => GEN_SCP0,
      Q => GEN_SCP,
      R => data_r_reg_0
    );
TX_DST_RDY_N_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
        port map (
      I0 => Q,
      I1 => data_eof_1_r,
      I2 => \^do_cc_r\,
      I3 => sof_data_eof_2_r,
      I4 => sof_data_eof_1_r,
      I5 => TX_DST_RDY_N_i_2_n_0,
      O => tx_dst_rdy_n_c
    );
TX_DST_RDY_N_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA0000FF30"
    )
        port map (
      I0 => data_eof_2_r,
      I1 => sof_data_eof_1_r_reg_0,
      I2 => sof_r_i_2_n_0,
      I3 => TX_DST_RDY_N_i_3_n_0,
      I4 => \^s_axi_tx_tvalid_0\,
      I5 => \^do_cc_r\,
      O => TX_DST_RDY_N_i_2_n_0
    );
TX_DST_RDY_N_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sof_r,
      I1 => data_r,
      O => TX_DST_RDY_N_i_3_n_0
    );
TX_DST_RDY_N_reg: unisim.vcomponents.FDSE
     port map (
      C => sof_r_reg_0,
      CE => '1',
      D => tx_dst_rdy_n_c,
      Q => \^tx_dst_rdy_n_reg_0\,
      S => data_r_reg_0
    );
data_eof_1_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00E00000"
    )
        port map (
      I0 => data_r,
      I1 => sof_r,
      I2 => s_axi_tx_tlast,
      I3 => \^tx_dst_rdy_n_reg_0\,
      I4 => s_axi_tx_tvalid,
      O => next_data_eof_1_c
    );
data_eof_1_r_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => \^e\(0),
      D => next_data_eof_1_c,
      Q => data_eof_1_r,
      R => data_r_reg_0
    );
data_eof_2_r_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => \^e\(0),
      D => data_eof_1_r,
      Q => data_eof_2_r,
      R => data_r_reg_0
    );
data_eof_3_r_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => \^e\(0),
      D => data_eof_2_r,
      Q => data_eof_3_r,
      R => data_r_reg_0
    );
data_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE0EEEEE"
    )
        port map (
      I0 => data_r,
      I1 => sof_r,
      I2 => s_axi_tx_tlast,
      I3 => \^tx_dst_rdy_n_reg_0\,
      I4 => s_axi_tx_tvalid,
      O => next_data_c
    );
data_r_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => \^e\(0),
      D => next_data_c,
      Q => data_r,
      R => data_r_reg_0
    );
do_cc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => '1',
      D => Q,
      Q => \^do_cc_r\,
      R => '0'
    );
gen_cc_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sof_r_reg_0,
      CE => '1',
      D => \^do_cc_r\,
      Q => gen_cc_i,
      R => '0'
    );
idle_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFEFEFEFEFEF00"
    )
        port map (
      I0 => sof_data_eof_1_r_reg_0,
      I1 => \^tx_dst_rdy_n_reg_0\,
      I2 => s_axi_tx_tvalid,
      I3 => idle_r,
      I4 => sof_data_eof_3_r,
      I5 => data_eof_3_r,
      O => next_idle_c
    );
idle_r_reg: unisim.vcomponents.FDSE
     port map (
      C => sof_r_reg_0,
      CE => \^e\(0),
      D => next_idle_c,
      Q => idle_r,
      S => data_r_reg_0
    );
in_frame_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F3FF0100"
    )
        port map (
      I0 => sof_data_eof_1_r_reg_0,
      I1 => s_axi_tx_tlast,
      I2 => \^tx_dst_rdy_n_reg_0\,
      I3 => s_axi_tx_tvalid,
      I4 => in_frame_r_reg,
      O => new_pkt_r_reg
    );
s_axi_tx_tready_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^tx_dst_rdy_n_reg_0\,
      O => s_axi_tx_tready
    );
sof_data_eof_1_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11111110"
    )
        port map (
      I0 => sof_data_eof_1_r_reg_0,
      I1 => \^s_axi_tx_tvalid_0\,
      I2 => idle_r,
      I3 => sof_data_eof_3_r,
      I4 => data_eof_3_r,
      O => next_sof_data_eof_1_c
    );
sof_data_eof_1_r_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => \^e\(0),
      D => next_sof_data_eof_1_c,
      Q => sof_data_eof_1_r,
      R => data_r_reg_0
    );
sof_data_eof_2_r_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => \^e\(0),
      D => sof_data_eof_1_r,
      Q => sof_data_eof_2_r,
      R => data_r_reg_0
    );
sof_data_eof_3_r_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => \^e\(0),
      D => sof_data_eof_2_r,
      Q => sof_data_eof_3_r,
      R => data_r_reg_0
    );
sof_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => s_axi_tx_tlast,
      I1 => s_axi_tx_tvalid,
      I2 => \^tx_dst_rdy_n_reg_0\,
      I3 => sof_data_eof_1_r_reg_0,
      I4 => sof_r_i_2_n_0,
      O => next_sof_c
    );
sof_r_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => data_eof_3_r,
      I1 => sof_data_eof_3_r,
      I2 => idle_r,
      O => sof_r_i_2_n_0
    );
sof_r_reg: unisim.vcomponents.FDRE
     port map (
      C => sof_r_reg_0,
      CE => \^e\(0),
      D => next_sof_c,
      Q => sof_r,
      R => data_r_reg_0
    );
storage_pad_r_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => s_axi_tx_tvalid,
      I1 => \^tx_dst_rdy_n_reg_0\,
      I2 => s_axi_tx_tlast,
      O => \^s_axi_tx_tvalid_0\
    );
\storage_r[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^do_cc_r\,
      O => \^e\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_DATAPATH is
  port (
    GEN_PAD : out STD_LOGIC;
    TX_PE_DATA_V : out STD_LOGIC;
    in_frame_r_reg_0 : out STD_LOGIC;
    \TX_PE_DATA_reg[0]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gen_pad_r_reg_0 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_frame_r_reg_1 : in STD_LOGIC;
    in_frame_r_reg_2 : in STD_LOGIC;
    do_cc_r : in STD_LOGIC;
    storage_pad_r_reg_0 : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    tx_dst_rdy : in STD_LOGIC;
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 );
    storage_pad_r_reg_1 : in STD_LOGIC;
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_DATAPATH : entity is "simplex_tx_aurora_8b10b_0_0_TX_LL_DATAPATH";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_DATAPATH;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_DATAPATH is
  signal GEN_PAD_i_1_n_0 : STD_LOGIC;
  signal TX_PE_DATA_V_i_1_n_0 : STD_LOGIC;
  signal gen_pad_r : STD_LOGIC;
  signal in_frame_c : STD_LOGIC;
  signal \^in_frame_r_reg_0\ : STD_LOGIC;
  signal storage_pad_r : STD_LOGIC;
  signal storage_pad_r0 : STD_LOGIC;
  signal storage_r : STD_LOGIC_VECTOR ( 0 to 15 );
  signal storage_v_r : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[9]\ : STD_LOGIC;
  signal tx_pe_data_v_r : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of GEN_PAD_i_1 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of TX_PE_DATA_V_i_1 : label is "soft_lutpair31";
begin
  in_frame_r_reg_0 <= \^in_frame_r_reg_0\;
GEN_PAD_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gen_pad_r,
      I1 => do_cc_r,
      O => GEN_PAD_i_1_n_0
    );
GEN_PAD_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => GEN_PAD_i_1_n_0,
      Q => GEN_PAD,
      R => '0'
    );
TX_PE_DATA_V_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => do_cc_r,
      O => TX_PE_DATA_V_i_1_n_0
    );
TX_PE_DATA_V_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => TX_PE_DATA_V_i_1_n_0,
      Q => TX_PE_DATA_V,
      R => '0'
    );
\TX_PE_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[0]\,
      Q => \TX_PE_DATA_reg[0]_0\(15),
      R => '0'
    );
\TX_PE_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[10]\,
      Q => \TX_PE_DATA_reg[0]_0\(5),
      R => '0'
    );
\TX_PE_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[11]\,
      Q => \TX_PE_DATA_reg[0]_0\(4),
      R => '0'
    );
\TX_PE_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[12]\,
      Q => \TX_PE_DATA_reg[0]_0\(3),
      R => '0'
    );
\TX_PE_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[13]\,
      Q => \TX_PE_DATA_reg[0]_0\(2),
      R => '0'
    );
\TX_PE_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[14]\,
      Q => \TX_PE_DATA_reg[0]_0\(1),
      R => '0'
    );
\TX_PE_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[15]\,
      Q => \TX_PE_DATA_reg[0]_0\(0),
      R => '0'
    );
\TX_PE_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[1]\,
      Q => \TX_PE_DATA_reg[0]_0\(14),
      R => '0'
    );
\TX_PE_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[2]\,
      Q => \TX_PE_DATA_reg[0]_0\(13),
      R => '0'
    );
\TX_PE_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[3]\,
      Q => \TX_PE_DATA_reg[0]_0\(12),
      R => '0'
    );
\TX_PE_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[4]\,
      Q => \TX_PE_DATA_reg[0]_0\(11),
      R => '0'
    );
\TX_PE_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[5]\,
      Q => \TX_PE_DATA_reg[0]_0\(10),
      R => '0'
    );
\TX_PE_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[6]\,
      Q => \TX_PE_DATA_reg[0]_0\(9),
      R => '0'
    );
\TX_PE_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[7]\,
      Q => \TX_PE_DATA_reg[0]_0\(8),
      R => '0'
    );
\TX_PE_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[8]\,
      Q => \TX_PE_DATA_reg[0]_0\(7),
      R => '0'
    );
\TX_PE_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => \tx_pe_data_r_reg_n_0_[9]\,
      Q => \TX_PE_DATA_reg[0]_0\(6),
      R => '0'
    );
gen_pad_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_pad_r,
      Q => gen_pad_r,
      R => '0'
    );
in_frame_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => '1',
      D => in_frame_r_reg_2,
      Q => \^in_frame_r_reg_0\,
      R => in_frame_r_reg_1
    );
storage_pad_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000B0"
    )
        port map (
      I0 => \^in_frame_r_reg_0\,
      I1 => storage_pad_r_reg_0,
      I2 => s_axi_tx_tkeep(0),
      I3 => s_axi_tx_tkeep(1),
      I4 => storage_pad_r_reg_1,
      O => storage_pad_r0
    );
storage_pad_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_pad_r0,
      Q => storage_pad_r,
      R => '0'
    );
\storage_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(0),
      Q => storage_r(0),
      R => '0'
    );
\storage_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(10),
      Q => storage_r(10),
      R => '0'
    );
\storage_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(11),
      Q => storage_r(11),
      R => '0'
    );
\storage_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(12),
      Q => storage_r(12),
      R => '0'
    );
\storage_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(13),
      Q => storage_r(13),
      R => '0'
    );
\storage_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(14),
      Q => storage_r(14),
      R => '0'
    );
\storage_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(15),
      Q => storage_r(15),
      R => '0'
    );
\storage_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(1),
      Q => storage_r(1),
      R => '0'
    );
\storage_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(2),
      Q => storage_r(2),
      R => '0'
    );
\storage_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(3),
      Q => storage_r(3),
      R => '0'
    );
\storage_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(4),
      Q => storage_r(4),
      R => '0'
    );
\storage_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(5),
      Q => storage_r(5),
      R => '0'
    );
\storage_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(6),
      Q => storage_r(6),
      R => '0'
    );
\storage_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(7),
      Q => storage_r(7),
      R => '0'
    );
\storage_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(8),
      Q => storage_r(8),
      R => '0'
    );
\storage_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => s_axi_tx_tdata(9),
      Q => storage_r(9),
      R => '0'
    );
storage_v_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D0"
    )
        port map (
      I0 => storage_pad_r_reg_0,
      I1 => \^in_frame_r_reg_0\,
      I2 => s_axi_tx_tvalid,
      I3 => tx_dst_rdy,
      O => in_frame_c
    );
storage_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => in_frame_c,
      Q => storage_v_r,
      R => '0'
    );
\tx_pe_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(0),
      Q => \tx_pe_data_r_reg_n_0_[0]\,
      R => '0'
    );
\tx_pe_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(10),
      Q => \tx_pe_data_r_reg_n_0_[10]\,
      R => '0'
    );
\tx_pe_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(11),
      Q => \tx_pe_data_r_reg_n_0_[11]\,
      R => '0'
    );
\tx_pe_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(12),
      Q => \tx_pe_data_r_reg_n_0_[12]\,
      R => '0'
    );
\tx_pe_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(13),
      Q => \tx_pe_data_r_reg_n_0_[13]\,
      R => '0'
    );
\tx_pe_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(14),
      Q => \tx_pe_data_r_reg_n_0_[14]\,
      R => '0'
    );
\tx_pe_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(15),
      Q => \tx_pe_data_r_reg_n_0_[15]\,
      R => '0'
    );
\tx_pe_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(1),
      Q => \tx_pe_data_r_reg_n_0_[1]\,
      R => '0'
    );
\tx_pe_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(2),
      Q => \tx_pe_data_r_reg_n_0_[2]\,
      R => '0'
    );
\tx_pe_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(3),
      Q => \tx_pe_data_r_reg_n_0_[3]\,
      R => '0'
    );
\tx_pe_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(4),
      Q => \tx_pe_data_r_reg_n_0_[4]\,
      R => '0'
    );
\tx_pe_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(5),
      Q => \tx_pe_data_r_reg_n_0_[5]\,
      R => '0'
    );
\tx_pe_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(6),
      Q => \tx_pe_data_r_reg_n_0_[6]\,
      R => '0'
    );
\tx_pe_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(7),
      Q => \tx_pe_data_r_reg_n_0_[7]\,
      R => '0'
    );
\tx_pe_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(8),
      Q => \tx_pe_data_r_reg_n_0_[8]\,
      R => '0'
    );
\tx_pe_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_r(9),
      Q => \tx_pe_data_r_reg_n_0_[9]\,
      R => '0'
    );
tx_pe_data_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_pad_r_reg_0,
      CE => E(0),
      D => storage_v_r,
      Q => tx_pe_data_v_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_reset : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
    );
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_0 is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_system_reset : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_0 : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_0;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_0 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
  p_level_in_int <= tx_system_reset;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
    );
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_3 is
  port (
    \FSM_sequential_tx_state_reg[0]\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    in0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    reset_time_out : in STD_LOGIC;
    txresetdone_s3 : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[0]_1\ : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[0]_2\ : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[0]_3\ : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[0]_4\ : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[0]_5\ : in STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_3 : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_3;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_3 is
  signal \FSM_sequential_tx_state[3]_i_3_n_0\ : STD_LOGIC;
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal reset_time_out_0 : STD_LOGIC;
  signal reset_time_out_i_3_n_0 : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
\FSM_sequential_tx_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFEE"
    )
        port map (
      I0 => \FSM_sequential_tx_state[3]_i_3_n_0\,
      I1 => \FSM_sequential_tx_state_reg[0]_0\,
      I2 => \FSM_sequential_tx_state_reg[0]_1\,
      I3 => \FSM_sequential_tx_state_reg[0]_2\,
      I4 => \FSM_sequential_tx_state_reg[0]_3\,
      I5 => \FSM_sequential_tx_state_reg[0]_4\,
      O => E(0)
    );
\FSM_sequential_tx_state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000404000000400"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => s_level_out_d6,
      I3 => \FSM_sequential_tx_state_reg[0]_5\,
      I4 => Q(2),
      I5 => Q(1),
      O => \FSM_sequential_tx_state[3]_i_3_n_0\
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
    );
reset_time_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFBFBAA080808AA"
    )
        port map (
      I0 => reset_time_out_0,
      I1 => Q(0),
      I2 => Q(3),
      I3 => Q(2),
      I4 => Q(1),
      I5 => reset_time_out,
      O => \FSM_sequential_tx_state_reg[0]\
    );
reset_time_out_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAAAAFFBAAAAAAA"
    )
        port map (
      I0 => reset_time_out_i_3_n_0,
      I1 => Q(3),
      I2 => txresetdone_s3,
      I3 => Q(1),
      I4 => Q(2),
      I5 => Q(0),
      O => reset_time_out_0
    );
reset_time_out_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0075007500FF0075"
    )
        port map (
      I0 => Q(0),
      I1 => Q(2),
      I2 => s_level_out_d6,
      I3 => Q(3),
      I4 => mmcm_lock_reclocked,
      I5 => Q(1),
      O => reset_time_out_i_3_n_0
    );
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_4 is
  port (
    mmcm_lock_reclocked_reg : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    init_clk_in : in STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    mmcm_lock_reclocked_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_4 : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_4;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_4 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
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
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_5 is
  port (
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_5 : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_5;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_5 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0\ is
  port (
    AS : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_reset_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0\ : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0\;

architecture STRUCTURE of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
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
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_1\ is
  port (
    p_level_in_d1_cdc_from_reg_0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_1\ : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_1\;

architecture STRUCTURE of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_1\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg_0,
      CE => '1',
      D => '0',
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\ is
  port (
    \out\ : out STD_LOGIC;
    tx_lock_comb_r : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\ : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\;

architecture STRUCTURE of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
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
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\ is
  port (
    \out\ : out STD_LOGIC;
    txfsm_txresetdone_r : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg_0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\ : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\;

architecture STRUCTURE of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => p_level_in_d1_cdc_from_reg_0,
      CE => '1',
      D => txfsm_txresetdone_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_6\ is
  port (
    \out\ : out STD_LOGIC;
    run_phase_alignment_int : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_6\ : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_6\;

architecture STRUCTURE of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_6\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
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
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_7\ is
  port (
    \out\ : out STD_LOGIC;
    time_out_wait_bypass : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg_0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_7\ : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_7\;

architecture STRUCTURE of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_7\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
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
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\ is
  port (
    tx_resetdone_out : out STD_LOGIC;
    s_level_out_d6_reg_0 : out STD_LOGIC;
    tx_fsm_reset_done_int : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg_1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\ : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\;

architecture STRUCTURE of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
  tx_resetdone_out <= s_level_out_d6;
gt_txresetdone_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_level_out_d6,
      O => s_level_out_d6_reg_0
    );
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => tx_fsm_reset_done_int,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_1,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_1,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_1,
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
      C => s_level_out_d6_reg_1,
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
      C => s_level_out_d6_reg_1,
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
      C => s_level_out_d6_reg_1,
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
entity \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\ is
  port (
    \out\ : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\ : entity is "simplex_tx_aurora_8b10b_0_0_cdc_sync";
end \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\;

architecture STRUCTURE of \simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  signal s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to : signal is "{no}";
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
  attribute ASYNC_REG_boolean of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : label is "{no}";
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
      O => s_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to
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
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_simplex_tx_aurora_8b10b_0_0_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => '0',
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to,
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt is
  port (
    in0 : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    tx_out_clk_i : out STD_LOGIC;
    init_clk_in_0 : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ack_flag : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC;
    ENABLE_ERR_DETECT_reg : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC;
    drpwe_in : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    gt_tx_reset_i : in STD_LOGIC;
    gt_qpllclk_quad1_out : in STD_LOGIC;
    gt_qpllrefclk_quad1_out : in STD_LOGIC;
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : in STD_LOGIC;
    power_down : in STD_LOGIC;
    gt_txuserrdy_i : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TXDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TXCHARISK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    flag2_reg_0 : in STD_LOGIC;
    cpll_reset_i : in STD_LOGIC;
    ENABLE_ERR_DETECT : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt : entity is "simplex_tx_aurora_8b10b_0_0_gt";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt is
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
  signal gtxe2_i_n_10 : STD_LOGIC;
  signal gtxe2_i_n_11 : STD_LOGIC;
  signal gtxe2_i_n_154 : STD_LOGIC;
  signal gtxe2_i_n_155 : STD_LOGIC;
  signal gtxe2_i_n_156 : STD_LOGIC;
  signal gtxe2_i_n_157 : STD_LOGIC;
  signal gtxe2_i_n_158 : STD_LOGIC;
  signal gtxe2_i_n_159 : STD_LOGIC;
  signal gtxe2_i_n_16 : STD_LOGIC;
  signal gtxe2_i_n_160 : STD_LOGIC;
  signal gtxe2_i_n_161 : STD_LOGIC;
  signal gtxe2_i_n_162 : STD_LOGIC;
  signal gtxe2_i_n_163 : STD_LOGIC;
  signal gtxe2_i_n_164 : STD_LOGIC;
  signal gtxe2_i_n_165 : STD_LOGIC;
  signal gtxe2_i_n_166 : STD_LOGIC;
  signal gtxe2_i_n_167 : STD_LOGIC;
  signal gtxe2_i_n_168 : STD_LOGIC;
  signal gtxe2_i_n_169 : STD_LOGIC;
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
  signal gtxe2_i_n_191 : STD_LOGIC;
  signal gtxe2_i_n_192 : STD_LOGIC;
  signal gtxe2_i_n_199 : STD_LOGIC;
  signal gtxe2_i_n_200 : STD_LOGIC;
  signal gtxe2_i_n_207 : STD_LOGIC;
  signal gtxe2_i_n_208 : STD_LOGIC;
  signal gtxe2_i_n_215 : STD_LOGIC;
  signal gtxe2_i_n_216 : STD_LOGIC;
  signal gtxe2_i_n_23 : STD_LOGIC;
  signal gtxe2_i_n_265 : STD_LOGIC;
  signal gtxe2_i_n_268 : STD_LOGIC;
  signal gtxe2_i_n_27 : STD_LOGIC;
  signal gtxe2_i_n_31 : STD_LOGIC;
  signal gtxe2_i_n_313 : STD_LOGIC;
  signal gtxe2_i_n_38 : STD_LOGIC;
  signal gtxe2_i_n_39 : STD_LOGIC;
  signal gtxe2_i_n_4 : STD_LOGIC;
  signal gtxe2_i_n_78 : STD_LOGIC;
  signal gtxe2_i_n_79 : STD_LOGIC;
  signal gtxe2_i_n_81 : STD_LOGIC;
  signal gtxe2_i_n_82 : STD_LOGIC;
  signal gtxe2_i_n_83 : STD_LOGIC;
  signal gtxe2_i_n_84 : STD_LOGIC;
  signal gtxe2_i_n_9 : STD_LOGIC;
  signal \^in0\ : STD_LOGIC;
  signal tx_buf_err_i : STD_LOGIC;
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
  attribute srl_bus_name of \cpllpd_wait_reg[31]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg ";
  attribute srl_name : string;
  attribute srl_name of \cpllpd_wait_reg[31]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg[31]_srl32 ";
  attribute srl_bus_name of \cpllpd_wait_reg[63]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg ";
  attribute srl_name of \cpllpd_wait_reg[63]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg[63]_srl32 ";
  attribute srl_bus_name of \cpllpd_wait_reg[94]_srl31\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg ";
  attribute srl_name of \cpllpd_wait_reg[94]_srl31\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllpd_wait_reg[94]_srl31 ";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \cpllpd_wait_reg[95]\ : label is "no";
  attribute srl_bus_name of \cpllreset_wait_reg[126]_srl31\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[126]_srl31\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg[126]_srl31 ";
  attribute equivalent_register_removal of \cpllreset_wait_reg[127]\ : label is "no";
  attribute srl_bus_name of \cpllreset_wait_reg[31]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[31]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg[31]_srl32 ";
  attribute srl_bus_name of \cpllreset_wait_reg[63]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[63]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg[63]_srl32 ";
  attribute srl_bus_name of \cpllreset_wait_reg[95]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[95]_srl32\ : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/simplex_tx_aurora_8b10b_0_0_multi_gt_i/gt0_simplex_tx_aurora_8b10b_0_0_i/cpllreset_wait_reg[95]_srl32 ";
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
begin
  ack_flag <= \^ack_flag\;
  in0 <= \^in0\;
  gtxe2_i_n_265 <= 'Z';
  gtxe2_i_n_268 <= 'Z';
  gtxe2_i_n_313 <= 'Z';
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
      CPLLLOCK => \^in0\,
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
      GTRXRESET => '0',
      GTSOUTHREFCLK0 => '0',
      GTSOUTHREFCLK1 => '0',
      GTTXRESET => gt_tx_reset_i,
      GTXRXN => '0',
      GTXRXP => '0',
      GTXTXN => txn,
      GTXTXP => txp,
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
      RXBUFSTATUS(2) => gtxe2_i_n_82,
      RXBUFSTATUS(1) => gtxe2_i_n_83,
      RXBUFSTATUS(0) => gtxe2_i_n_84,
      RXBYTEISALIGNED => gtxe2_i_n_9,
      RXBYTEREALIGN => gtxe2_i_n_10,
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
      RXCHARISCOMMA(1) => gtxe2_i_n_191,
      RXCHARISCOMMA(0) => gtxe2_i_n_192,
      RXCHARISK(7 downto 2) => NLW_gtxe2_i_RXCHARISK_UNCONNECTED(7 downto 2),
      RXCHARISK(1) => gtxe2_i_n_199,
      RXCHARISK(0) => gtxe2_i_n_200,
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
      RXDATA(15) => gtxe2_i_n_154,
      RXDATA(14) => gtxe2_i_n_155,
      RXDATA(13) => gtxe2_i_n_156,
      RXDATA(12) => gtxe2_i_n_157,
      RXDATA(11) => gtxe2_i_n_158,
      RXDATA(10) => gtxe2_i_n_159,
      RXDATA(9) => gtxe2_i_n_160,
      RXDATA(8) => gtxe2_i_n_161,
      RXDATA(7) => gtxe2_i_n_162,
      RXDATA(6) => gtxe2_i_n_163,
      RXDATA(5) => gtxe2_i_n_164,
      RXDATA(4) => gtxe2_i_n_165,
      RXDATA(3) => gtxe2_i_n_166,
      RXDATA(2) => gtxe2_i_n_167,
      RXDATA(1) => gtxe2_i_n_168,
      RXDATA(0) => gtxe2_i_n_169,
      RXDATAVALID => NLW_gtxe2_i_RXDATAVALID_UNCONNECTED,
      RXDDIEN => '0',
      RXDFEAGCHOLD => gtxe2_i_n_265,
      RXDFEAGCOVRDEN => '0',
      RXDFECM1EN => '0',
      RXDFELFHOLD => gtxe2_i_n_268,
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
      RXDISPERR(1) => gtxe2_i_n_207,
      RXDISPERR(0) => gtxe2_i_n_208,
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
      RXMCOMMAALIGNEN => '0',
      RXMONITOROUT(6) => gtxe2_i_n_170,
      RXMONITOROUT(5) => gtxe2_i_n_171,
      RXMONITOROUT(4) => gtxe2_i_n_172,
      RXMONITOROUT(3) => gtxe2_i_n_173,
      RXMONITOROUT(2) => gtxe2_i_n_174,
      RXMONITOROUT(1) => gtxe2_i_n_175,
      RXMONITOROUT(0) => gtxe2_i_n_176,
      RXMONITORSEL(1 downto 0) => B"00",
      RXNOTINTABLE(7 downto 2) => NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED(7 downto 2),
      RXNOTINTABLE(1) => gtxe2_i_n_215,
      RXNOTINTABLE(0) => gtxe2_i_n_216,
      RXOOBRESET => '0',
      RXOSHOLD => '0',
      RXOSOVRDEN => '0',
      RXOUTCLK => gtxe2_i_n_23,
      RXOUTCLKFABRIC => NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED,
      RXOUTCLKPCS => NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED,
      RXOUTCLKSEL(2 downto 0) => B"010",
      RXPCOMMAALIGNEN => '0',
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
      RXPOLARITY => '0',
      RXPRBSCNTRESET => '0',
      RXPRBSERR => gtxe2_i_n_27,
      RXPRBSSEL(2 downto 0) => B"000",
      RXQPIEN => '0',
      RXQPISENN => NLW_gtxe2_i_RXQPISENN_UNCONNECTED,
      RXQPISENP => NLW_gtxe2_i_RXQPISENP_UNCONNECTED,
      RXRATE(2 downto 0) => B"000",
      RXRATEDONE => NLW_gtxe2_i_RXRATEDONE_UNCONNECTED,
      RXRESETDONE => gtxe2_i_n_31,
      RXSLIDE => '0',
      RXSTARTOFSEQ => NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED,
      RXSTATUS(2 downto 0) => NLW_gtxe2_i_RXSTATUS_UNCONNECTED(2 downto 0),
      RXSYSCLKSEL(1 downto 0) => B"00",
      RXUSERRDY => gtxe2_i_n_313,
      RXUSRCLK => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg,
      RXUSRCLK2 => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg,
      RXVALID => NLW_gtxe2_i_RXVALID_UNCONNECTED,
      SETERRSTATUS => '0',
      TSTIN(19 downto 0) => B"11111111111111111111",
      TSTOUT(9 downto 0) => NLW_gtxe2_i_TSTOUT_UNCONNECTED(9 downto 0),
      TX8B10BBYPASS(7 downto 0) => B"00000000",
      TX8B10BEN => '1',
      TXBUFDIFFCTRL(2 downto 0) => B"100",
      TXBUFSTATUS(1) => tx_buf_err_i,
      TXBUFSTATUS(0) => gtxe2_i_n_81,
      TXCHARDISPMODE(7 downto 0) => B"00000000",
      TXCHARDISPVAL(7 downto 0) => B"00000000",
      TXCHARISK(7 downto 2) => B"000000",
      TXCHARISK(1 downto 0) => TXCHARISK(1 downto 0),
      TXCOMFINISH => NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED,
      TXCOMINIT => '0',
      TXCOMSAS => '0',
      TXCOMWAKE => '0',
      TXDATA(63 downto 16) => B"000000000000000000000000000000000000000000000000",
      TXDATA(15 downto 0) => TXDATA(15 downto 0),
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
      TXELECIDLE => power_down,
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
      TXRESETDONE => init_clk_in_0,
      TXSEQUENCE(6 downto 0) => B"0000000",
      TXSTARTSEQ => '0',
      TXSWING => '0',
      TXSYSCLKSEL(1 downto 0) => B"00",
      TXUSERRDY => gt_txuserrdy_i,
      TXUSRCLK => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg,
      TXUSRCLK2 => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg
    );
hard_err_flop_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => tx_buf_err_i,
      I1 => ENABLE_ERR_DETECT,
      O => ENABLE_ERR_DETECT_reg
    );
pll_not_locked_out_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^in0\,
      O => pll_not_locked_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt_common_wrapper is
  port (
    gt0_qplllock_out : out STD_LOGIC;
    gt_qpllclk_quad1_out : out STD_LOGIC;
    gt_qpllrefclk_quad1_out : out STD_LOGIC;
    gt0_qpllrefclklost_out : out STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt_common_wrapper : entity is "simplex_tx_aurora_8b10b_0_0_gt_common_wrapper";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt_common_wrapper;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt_common_wrapper is
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_RESET_LOGIC is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    wait_for_lane_up_r0 : out STD_LOGIC;
    new_pkt_r : out STD_LOGIC;
    tx_system_reset_c : out STD_LOGIC;
    system_reset_i : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg : in STD_LOGIC;
    in0 : in STD_LOGIC;
    gt_txresetdone_r2_reg_0 : in STD_LOGIC;
    tx_reset : in STD_LOGIC;
    reset_channel_i : in STD_LOGIC;
    tx_channel_up : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    tx_dst_rdy : in STD_LOGIC;
    new_pkt_r_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_RESET_LOGIC : entity is "simplex_tx_aurora_8b10b_0_0_RESET_LOGIC";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_RESET_LOGIC;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_RESET_LOGIC is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SYSTEM_RESET0_n_0 : STD_LOGIC;
  signal gt_txresetdone_r : STD_LOGIC;
  signal gt_txresetdone_r2 : STD_LOGIC;
  signal gt_txresetdone_r3 : STD_LOGIC;
  signal link_reset_sync : STD_LOGIC;
  signal tx_lock_comb_r : STD_LOGIC;
  signal tx_lock_sync : STD_LOGIC;
  signal \^tx_system_reset_c\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of lfsr_last_flop_i_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of wait_for_lane_up_r_i_1 : label is "soft_lutpair0";
begin
  SR(0) <= \^sr\(0);
  tx_system_reset_c <= \^tx_system_reset_c\;
SYSTEM_RESET0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => tx_lock_sync,
      I1 => system_reset_i,
      I2 => gt_txresetdone_r3,
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
gt_txresetdone_r2_reg: unisim.vcomponents.FDCE
     port map (
      C => s_level_out_d6_reg,
      CE => '1',
      CLR => gt_txresetdone_r2_reg_0,
      D => gt_txresetdone_r,
      Q => gt_txresetdone_r2
    );
gt_txresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => s_level_out_d6_reg,
      CE => '1',
      D => gt_txresetdone_r2,
      Q => gt_txresetdone_r3,
      R => '0'
    );
gt_txresetdone_r_reg: unisim.vcomponents.FDCE
     port map (
      C => s_level_out_d6_reg,
      CE => '1',
      CLR => gt_txresetdone_r2_reg_0,
      D => '1',
      Q => gt_txresetdone_r
    );
lfsr_last_flop_i_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => tx_reset,
      I1 => \^sr\(0),
      O => \^tx_system_reset_c\
    );
link_reset_cdc_sync: entity work.\simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_9\
     port map (
      init_clk_in => init_clk_in,
      \out\ => link_reset_sync,
      s_level_out_d6_reg_0 => s_level_out_d6_reg
    );
new_pkt_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444044400000400"
    )
        port map (
      I0 => \^tx_system_reset_c\,
      I1 => tx_channel_up,
      I2 => s_axi_tx_tlast,
      I3 => s_axi_tx_tvalid,
      I4 => tx_dst_rdy,
      I5 => new_pkt_r_reg,
      O => new_pkt_r
    );
tx_lock_cdc_sync: entity work.\simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_10\
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
      D => in0,
      Q => tx_lock_comb_r,
      R => '0'
    );
wait_for_lane_up_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^sr\(0),
      I1 => tx_reset,
      I2 => reset_channel_i,
      O => wait_for_lane_up_r0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC is
  port (
    gt_reset_out : out STD_LOGIC;
    system_reset_i : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \debounce_gt_rst_r_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC : entity is "simplex_tx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC is
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
gt_rst_r_cdc_sync: entity work.\simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0\
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
      Q => system_reset_i,
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5 is
  port (
    tx_lane_up : out STD_LOGIC;
    TXCHARISK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ENABLE_ERR_DETECT : out STD_LOGIC;
    hard_err_reset_i : out STD_LOGIC;
    hard_err_flop_r_reg : out STD_LOGIC;
    TXDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    tx_reset_lanes_i : in STD_LOGIC;
    \counter1_r_reg[0]\ : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_aligned : in STD_LOGIC;
    GEN_PAD : in STD_LOGIC;
    TX_PE_DATA_V : in STD_LOGIC;
    gen_cc_i : in STD_LOGIC;
    GEN_ECP : in STD_LOGIC;
    GEN_SCP : in STD_LOGIC;
    gen_a_i : in STD_LOGIC;
    hard_err_flop_r_reg_0 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_r_r_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_k_r_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5 : entity is "simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5 is
  signal \^enable_err_detect\ : STD_LOGIC;
  signal send_sp_c : STD_LOGIC;
  signal tx_lane_init_sm_simplex_i_n_2 : STD_LOGIC;
  signal tx_lane_init_sm_simplex_i_n_3 : STD_LOGIC;
begin
  ENABLE_ERR_DETECT <= \^enable_err_detect\;
sym_gen_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SYM_GEN
     port map (
      D(1) => tx_lane_init_sm_simplex_i_n_3,
      D(0) => send_sp_c,
      GEN_ECP => GEN_ECP,
      GEN_PAD => GEN_PAD,
      GEN_SCP => GEN_SCP,
      Q(15 downto 0) => Q(15 downto 0),
      TXCHARISK(1 downto 0) => TXCHARISK(1 downto 0),
      TXDATA(15 downto 0) => TXDATA(15 downto 0),
      TX_PE_DATA_V => TX_PE_DATA_V,
      gen_a_i => gen_a_i,
      gen_a_r_reg_0 => \counter1_r_reg[0]\,
      gen_cc_i => gen_cc_i,
      gen_k_fsm_r_reg_0 => tx_lane_init_sm_simplex_i_n_2,
      \gen_k_r_reg[0]_0\(1 downto 0) => \gen_k_r_reg[0]\(1 downto 0),
      \gen_r_r_reg[0]_0\(1 downto 0) => \gen_r_r_reg[0]\(1 downto 0),
      \gen_v_r_reg[0]_0\(1 downto 0) => D(1 downto 0)
    );
tx_err_detect_simplex_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_ERR_DETECT_SIMPLEX
     port map (
      ENABLE_ERR_DETECT => \^enable_err_detect\,
      hard_err_flop_r_reg_0 => hard_err_flop_r_reg,
      hard_err_flop_r_reg_1 => hard_err_flop_r_reg_0,
      hard_err_flop_r_reg_2 => \counter1_r_reg[0]\,
      hard_err_reset_i => hard_err_reset_i
    );
tx_lane_init_sm_simplex_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LANE_INIT_SM_SIMPLEX
     port map (
      D(1) => tx_lane_init_sm_simplex_i_n_3,
      D(0) => send_sp_c,
      ENABLE_ERR_DETECT => \^enable_err_detect\,
      SS(0) => SS(0),
      \counter1_r_reg[0]_0\ => \counter1_r_reg[0]\,
      odd_word_r_reg_0 => tx_lane_init_sm_simplex_i_n_2,
      tx_aligned => tx_aligned,
      tx_lane_up => tx_lane_up,
      tx_reset_lanes_i => tx_reset_lanes_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX is
  port (
    tx_channel_up : out STD_LOGIC;
    tx_reset_lanes_i : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_a_i : out STD_LOGIC;
    gen_k_flop_0_i : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_r_flop_0_i : out STD_LOGIC_VECTOR ( 1 downto 0 );
    reset_channel_i : out STD_LOGIC;
    tx_hard_err : out STD_LOGIC;
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_channel_up_i : out STD_LOGIC;
    \free_count_r_reg[14]\ : in STD_LOGIC;
    tx_system_reset_c : in STD_LOGIC;
    tx_verify : in STD_LOGIC;
    wait_for_lane_up_r0 : in STD_LOGIC;
    tx_lane_up : in STD_LOGIC;
    CHANNEL_HARD_ERR_reg : in STD_LOGIC;
    power_down : in STD_LOGIC;
    hard_err_reset_i : in STD_LOGIC;
    tx_reset : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX : entity is "simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX is
  signal gen_ver_i : STD_LOGIC;
  signal \^reset_channel_i\ : STD_LOGIC;
begin
  reset_channel_i <= \^reset_channel_i\;
idle_and_ver_gen_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_IDLE_AND_VER_GEN
     port map (
      D(1 downto 0) => D(1 downto 0),
      SR(0) => SR(0),
      gen_a_i => gen_a_i,
      gen_k_flop_0_i_0(1 downto 0) => gen_k_flop_0_i(1 downto 0),
      gen_r_flop_0_i_0(1 downto 0) => gen_r_flop_0_i(1 downto 0),
      gen_ver_i => gen_ver_i,
      prev_cycle_gen_ver_r_reg_0 => \free_count_r_reg[14]\,
      tx_reset => tx_reset,
      tx_system_reset_c => tx_system_reset_c
    );
tx_channel_err_detect_simplex_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_ERR_DETECT_SIMPLEX
     port map (
      CHANNEL_HARD_ERR_reg_0 => CHANNEL_HARD_ERR_reg,
      lane_up_r_reg_0 => \free_count_r_reg[14]\,
      power_down => power_down,
      reset_channel_i => \^reset_channel_i\,
      tx_hard_err => tx_hard_err,
      tx_lane_up => tx_lane_up
    );
tx_channel_init_sm_simplex_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_CHANNEL_INIT_SM_SIMPLEX
     port map (
      SR(0) => SR(0),
      SS(0) => SS(0),
      \free_count_r_reg[14]_0\ => \free_count_r_reg[14]\,
      gen_ver_i => gen_ver_i,
      hard_err_reset_i => hard_err_reset_i,
      reset_channel_i => \^reset_channel_i\,
      tx_channel_up => tx_channel_up,
      tx_channel_up_i_0 => tx_channel_up_i,
      tx_reset => tx_reset,
      tx_reset_lanes_i => tx_reset_lanes_i,
      tx_verify => tx_verify,
      wait_for_lane_up_r0 => wait_for_lane_up_r0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL is
  port (
    gen_cc_i : out STD_LOGIC;
    GEN_PAD : out STD_LOGIC;
    TX_PE_DATA_V : out STD_LOGIC;
    GEN_ECP : out STD_LOGIC;
    GEN_SCP : out STD_LOGIC;
    tx_dst_rdy : out STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    \TX_PE_DATA_reg[0]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gen_pad_r_reg : in STD_LOGIC;
    in_frame_r_reg : in STD_LOGIC;
    Q : in STD_LOGIC;
    storage_pad_r_reg : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 );
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL : entity is "simplex_tx_aurora_8b10b_0_0_TX_LL";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL is
  signal do_cc_r : STD_LOGIC;
  signal pdu_ok_c : STD_LOGIC;
  signal \^tx_dst_rdy\ : STD_LOGIC;
  signal tx_ll_control_i_n_6 : STD_LOGIC;
  signal tx_ll_control_i_n_8 : STD_LOGIC;
  signal tx_ll_datapath_i_n_2 : STD_LOGIC;
begin
  tx_dst_rdy <= \^tx_dst_rdy\;
tx_ll_control_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_CONTROL
     port map (
      E(0) => pdu_ok_c,
      GEN_ECP => GEN_ECP,
      GEN_SCP => GEN_SCP,
      Q => Q,
      TX_DST_RDY_N_reg_0 => \^tx_dst_rdy\,
      data_r_reg_0 => in_frame_r_reg,
      do_cc_r => do_cc_r,
      gen_cc_i => gen_cc_i,
      in_frame_r_reg => tx_ll_datapath_i_n_2,
      new_pkt_r_reg => tx_ll_control_i_n_6,
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => s_axi_tx_tready,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      s_axi_tx_tvalid_0 => tx_ll_control_i_n_8,
      sof_data_eof_1_r_reg_0 => storage_pad_r_reg,
      sof_r_reg_0 => gen_pad_r_reg
    );
tx_ll_datapath_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL_DATAPATH
     port map (
      E(0) => pdu_ok_c,
      GEN_PAD => GEN_PAD,
      TX_PE_DATA_V => TX_PE_DATA_V,
      \TX_PE_DATA_reg[0]_0\(15 downto 0) => \TX_PE_DATA_reg[0]\(15 downto 0),
      do_cc_r => do_cc_r,
      gen_pad_r_reg_0 => gen_pad_r_reg,
      in_frame_r_reg_0 => tx_ll_datapath_i_n_2,
      in_frame_r_reg_1 => in_frame_r_reg,
      in_frame_r_reg_2 => tx_ll_control_i_n_6,
      s_axi_tx_tdata(0 to 15) => s_axi_tx_tdata(0 to 15),
      s_axi_tx_tkeep(0 to 1) => s_axi_tx_tkeep(0 to 1),
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      storage_pad_r_reg_0 => storage_pad_r_reg,
      storage_pad_r_reg_1 => tx_ll_control_i_n_8,
      tx_dst_rdy => \^tx_dst_rdy\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_multi_gt is
  port (
    in0 : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    tx_out_clk_i : out STD_LOGIC;
    init_clk_in_0 : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ack_flag : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC;
    ENABLE_ERR_DETECT_reg : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC;
    drpwe_in : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    gt_tx_reset_i : in STD_LOGIC;
    gt_qpllclk_quad1_out : in STD_LOGIC;
    gt_qpllrefclk_quad1_out : in STD_LOGIC;
    s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg : in STD_LOGIC;
    power_down : in STD_LOGIC;
    gt_txuserrdy_i : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TXDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TXCHARISK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    flag2_reg : in STD_LOGIC;
    cpll_reset_i : in STD_LOGIC;
    ENABLE_ERR_DETECT : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_multi_gt : entity is "simplex_tx_aurora_8b10b_0_0_multi_gt";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_multi_gt;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_multi_gt is
begin
gt0_simplex_tx_aurora_8b10b_0_0_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt
     port map (
      ENABLE_ERR_DETECT => ENABLE_ERR_DETECT,
      ENABLE_ERR_DETECT_reg => ENABLE_ERR_DETECT_reg,
      TXCHARISK(1 downto 0) => TXCHARISK(1 downto 0),
      TXDATA(15 downto 0) => TXDATA(15 downto 0),
      ack_flag => ack_flag,
      cpll_reset_i => cpll_reset_i,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      flag2_reg_0 => flag2_reg,
      gt_qpllclk_quad1_out => gt_qpllclk_quad1_out,
      gt_qpllrefclk_quad1_out => gt_qpllrefclk_quad1_out,
      gt_refclk1 => gt_refclk1,
      gt_tx_reset_i => gt_tx_reset_i,
      gt_txuserrdy_i => gt_txuserrdy_i,
      in0 => in0,
      init_clk_in => init_clk_in,
      init_clk_in_0 => init_clk_in_0,
      loopback(2 downto 0) => loopback(2 downto 0),
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg => s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg,
      tx_out_clk_i => tx_out_clk_i,
      txn => txn,
      txp => txp
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_tx_startup_fsm is
  port (
    tx_resetdone_out : out STD_LOGIC;
    gt_tx_reset_i : out STD_LOGIC;
    cpll_reset_i : out STD_LOGIC;
    gt_txuserrdy_i : out STD_LOGIC;
    CPLL_RESET_reg_0 : out STD_LOGIC;
    s_level_out_d6_reg : out STD_LOGIC;
    in0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    s_level_out_d6_reg_0 : in STD_LOGIC;
    txfsm_txresetdone_r : in STD_LOGIC;
    \init_wait_count_reg[0]_0\ : in STD_LOGIC;
    ack_flag : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_tx_startup_fsm : entity is "simplex_tx_aurora_8b10b_0_0_tx_startup_fsm";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_tx_startup_fsm;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_tx_startup_fsm is
  signal CPLL_RESET_i_1_n_0 : STD_LOGIC;
  signal \FSM_sequential_tx_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_11_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_12_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_13_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_14_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_9_n_0\ : STD_LOGIC;
  signal TXUSERRDY_i_1_n_0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \^cpll_reset_i\ : STD_LOGIC;
  signal \^gt_tx_reset_i\ : STD_LOGIC;
  signal \^gt_txuserrdy_i\ : STD_LOGIC;
  signal gttxreset_i_i_1_n_0 : STD_LOGIC;
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
  signal reset_time_out : STD_LOGIC;
  signal run_phase_alignment_int : STD_LOGIC;
  signal run_phase_alignment_int_i_1_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal run_phase_alignment_int_s3 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal sync_cplllock_cdc_sync_n_0 : STD_LOGIC;
  signal sync_cplllock_cdc_sync_n_1 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_cdc_sync_n_0 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_cdc_sync_n_1 : STD_LOGIC;
  signal time_out_2ms_i_1_n_0 : STD_LOGIC;
  signal time_out_2ms_i_2_n_0 : STD_LOGIC;
  signal time_out_2ms_reg_n_0 : STD_LOGIC;
  signal time_out_500us_i_1_n_0 : STD_LOGIC;
  signal time_out_500us_i_2_n_0 : STD_LOGIC;
  signal time_out_500us_reg_n_0 : STD_LOGIC;
  signal time_out_counter : STD_LOGIC;
  signal \time_out_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_7_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_8_n_0\ : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
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
  signal \time_out_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
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
  signal time_tlock_max_i_1_n_0 : STD_LOGIC;
  signal time_tlock_max_i_2_n_0 : STD_LOGIC;
  signal time_tlock_max_i_3_n_0 : STD_LOGIC;
  signal time_tlock_max_reg_n_0 : STD_LOGIC;
  signal tx_fsm_reset_done_int : STD_LOGIC;
  signal tx_fsm_reset_done_int_i_1_n_0 : STD_LOGIC;
  signal tx_fsm_reset_done_int_s3 : STD_LOGIC;
  signal \^tx_resetdone_out\ : STD_LOGIC;
  signal tx_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal txresetdone_s2 : STD_LOGIC;
  signal txresetdone_s3 : STD_LOGIC;
  signal \wait_bypass_count[0]_i_2_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_7_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_8_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_9_n_0\ : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \wait_bypass_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[16]_i_1_n_7\ : STD_LOGIC;
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
  signal \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[3]_i_10\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[3]_i_14\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[3]_i_5\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[3]_i_6\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[3]_i_8\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[3]_i_9\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[0]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[1]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[2]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[3]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \init_wait_count[6]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \mmcm_lock_count[8]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of mmcm_lock_reclocked_i_2 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of time_out_2ms_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \time_out_counter[0]_i_8\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of time_tlock_max_i_2 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of tx_fsm_reset_done_int_i_1 : label is "soft_lutpair4";
begin
  cpll_reset_i <= \^cpll_reset_i\;
  gt_tx_reset_i <= \^gt_tx_reset_i\;
  gt_txuserrdy_i <= \^gt_txuserrdy_i\;
  tx_resetdone_out <= \^tx_resetdone_out\;
CPLL_RESET_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF700000004"
    )
        port map (
      I0 => pll_reset_asserted_reg_n_0,
      I1 => tx_state(0),
      I2 => tx_state(3),
      I3 => tx_state(2),
      I4 => tx_state(1),
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
      R => \init_wait_count_reg[0]_0\
    );
\FSM_sequential_tx_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFEFEFEFFFEFEF"
    )
        port map (
      I0 => \FSM_sequential_tx_state[3]_i_6_n_0\,
      I1 => tx_state(3),
      I2 => tx_state(0),
      I3 => \FSM_sequential_tx_state[2]_i_2_n_0\,
      I4 => tx_state(2),
      I5 => tx_state(1),
      O => \FSM_sequential_tx_state[0]_i_1_n_0\
    );
\FSM_sequential_tx_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11441104"
    )
        port map (
      I0 => tx_state(3),
      I1 => tx_state(0),
      I2 => tx_state(2),
      I3 => tx_state(1),
      I4 => \FSM_sequential_tx_state[2]_i_2_n_0\,
      O => \FSM_sequential_tx_state[1]_i_1_n_0\
    );
\FSM_sequential_tx_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"003400F0000400F0"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => tx_state(1),
      I2 => tx_state(2),
      I3 => tx_state(3),
      I4 => tx_state(0),
      I5 => \FSM_sequential_tx_state[2]_i_2_n_0\,
      O => \FSM_sequential_tx_state[2]_i_1_n_0\
    );
\FSM_sequential_tx_state[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => time_tlock_max_reg_n_0,
      I1 => reset_time_out,
      I2 => mmcm_lock_reclocked,
      O => \FSM_sequential_tx_state[2]_i_2_n_0\
    );
\FSM_sequential_tx_state[3]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_time_out,
      I1 => time_tlock_max_reg_n_0,
      O => \FSM_sequential_tx_state[3]_i_10_n_0\
    );
\FSM_sequential_tx_state[3]_i_11\: unisim.vcomponents.LUT6
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
      O => \FSM_sequential_tx_state[3]_i_11_n_0\
    );
\FSM_sequential_tx_state[3]_i_12\: unisim.vcomponents.LUT6
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
      O => \FSM_sequential_tx_state[3]_i_12_n_0\
    );
\FSM_sequential_tx_state[3]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      I1 => wait_time_cnt_reg(0),
      I2 => wait_time_cnt_reg(3),
      I3 => wait_time_cnt_reg(2),
      O => \FSM_sequential_tx_state[3]_i_13_n_0\
    );
\FSM_sequential_tx_state[3]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => tx_state(1),
      I1 => tx_state(2),
      O => \FSM_sequential_tx_state[3]_i_14_n_0\
    );
\FSM_sequential_tx_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555500F30000"
    )
        port map (
      I0 => time_out_wait_bypass_s3,
      I1 => time_out_500us_reg_n_0,
      I2 => reset_time_out,
      I3 => \FSM_sequential_tx_state[3]_i_9_n_0\,
      I4 => tx_state(0),
      I5 => tx_state(3),
      O => \FSM_sequential_tx_state[3]_i_2_n_0\
    );
\FSM_sequential_tx_state[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0000000B0B0000"
    )
        port map (
      I0 => mmcm_lock_reclocked,
      I1 => \FSM_sequential_tx_state[3]_i_10_n_0\,
      I2 => \FSM_sequential_tx_state[3]_i_5_n_0\,
      I3 => txresetdone_s3,
      I4 => tx_state(2),
      I5 => tx_state(1),
      O => \FSM_sequential_tx_state[3]_i_4_n_0\
    );
\FSM_sequential_tx_state[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => tx_state(3),
      I1 => tx_state(0),
      O => \FSM_sequential_tx_state[3]_i_5_n_0\
    );
\FSM_sequential_tx_state[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2020F000"
    )
        port map (
      I0 => time_out_500us_reg_n_0,
      I1 => reset_time_out,
      I2 => tx_state(1),
      I3 => time_out_2ms_reg_n_0,
      I4 => tx_state(2),
      O => \FSM_sequential_tx_state[3]_i_6_n_0\
    );
\FSM_sequential_tx_state[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => \FSM_sequential_tx_state[3]_i_11_n_0\,
      I1 => \FSM_sequential_tx_state[3]_i_12_n_0\,
      I2 => \FSM_sequential_tx_state[3]_i_13_n_0\,
      I3 => tx_state(3),
      I4 => tx_state(0),
      I5 => \FSM_sequential_tx_state[3]_i_14_n_0\,
      O => \FSM_sequential_tx_state[3]_i_7_n_0\
    );
\FSM_sequential_tx_state[3]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01010100"
    )
        port map (
      I0 => tx_state(0),
      I1 => tx_state(1),
      I2 => tx_state(2),
      I3 => tx_state(3),
      I4 => init_wait_done_reg_n_0,
      O => \FSM_sequential_tx_state[3]_i_8_n_0\
    );
\FSM_sequential_tx_state[3]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => tx_state(1),
      I1 => tx_state(2),
      O => \FSM_sequential_tx_state[3]_i_9_n_0\
    );
\FSM_sequential_tx_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_cplllock_cdc_sync_n_1,
      D => \FSM_sequential_tx_state[0]_i_1_n_0\,
      Q => tx_state(0),
      R => \init_wait_count_reg[0]_0\
    );
\FSM_sequential_tx_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_cplllock_cdc_sync_n_1,
      D => \FSM_sequential_tx_state[1]_i_1_n_0\,
      Q => tx_state(1),
      R => \init_wait_count_reg[0]_0\
    );
\FSM_sequential_tx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_cplllock_cdc_sync_n_1,
      D => \FSM_sequential_tx_state[2]_i_1_n_0\,
      Q => tx_state(2),
      R => \init_wait_count_reg[0]_0\
    );
\FSM_sequential_tx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_cplllock_cdc_sync_n_1,
      D => \FSM_sequential_tx_state[3]_i_2_n_0\,
      Q => tx_state(3),
      R => \init_wait_count_reg[0]_0\
    );
TXUSERRDY_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD2000"
    )
        port map (
      I0 => tx_state(0),
      I1 => tx_state(3),
      I2 => tx_state(2),
      I3 => tx_state(1),
      I4 => \^gt_txuserrdy_i\,
      O => TXUSERRDY_i_1_n_0
    );
TXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => TXUSERRDY_i_1_n_0,
      Q => \^gt_txuserrdy_i\,
      R => \init_wait_count_reg[0]_0\
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
gttxreset_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0100"
    )
        port map (
      I0 => tx_state(3),
      I1 => tx_state(1),
      I2 => tx_state(2),
      I3 => tx_state(0),
      I4 => \^gt_tx_reset_i\,
      O => gttxreset_i_i_1_n_0
    );
gttxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => gttxreset_i_i_1_n_0,
      Q => \^gt_tx_reset_i\,
      R => \init_wait_count_reg[0]_0\
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
      CLR => \init_wait_count_reg[0]_0\,
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
      CLR => \init_wait_count_reg[0]_0\,
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
      CLR => \init_wait_count_reg[0]_0\,
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
      CLR => \init_wait_count_reg[0]_0\,
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
      CLR => \init_wait_count_reg[0]_0\,
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
      CLR => \init_wait_count_reg[0]_0\,
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
      CLR => \init_wait_count_reg[0]_0\,
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
      CLR => \init_wait_count_reg[0]_0\,
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
      CLR => \init_wait_count_reg[0]_0\,
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
      INIT => X"CCCCCC5C"
    )
        port map (
      I0 => tx_state(1),
      I1 => pll_reset_asserted_reg_n_0,
      I2 => tx_state(0),
      I3 => tx_state(3),
      I4 => tx_state(2),
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
      R => \init_wait_count_reg[0]_0\
    );
reset_time_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => sync_cplllock_cdc_sync_n_0,
      Q => reset_time_out,
      R => \init_wait_count_reg[0]_0\
    );
run_phase_alignment_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0002"
    )
        port map (
      I0 => tx_state(3),
      I1 => tx_state(0),
      I2 => tx_state(2),
      I3 => tx_state(1),
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
      R => \init_wait_count_reg[0]_0\
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => run_phase_alignment_int_s3,
      R => '0'
    );
sync_TXRESETDONE_cdc_sync: entity work.\simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_2\
     port map (
      init_clk_in => init_clk_in,
      \out\ => txresetdone_s2,
      p_level_in_d1_cdc_from_reg_0 => s_level_out_d6_reg_0,
      txfsm_txresetdone_r => txfsm_txresetdone_r
    );
sync_cplllock_cdc_sync: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_3
     port map (
      E(0) => sync_cplllock_cdc_sync_n_1,
      \FSM_sequential_tx_state_reg[0]\ => sync_cplllock_cdc_sync_n_0,
      \FSM_sequential_tx_state_reg[0]_0\ => \FSM_sequential_tx_state[3]_i_4_n_0\,
      \FSM_sequential_tx_state_reg[0]_1\ => \FSM_sequential_tx_state[3]_i_5_n_0\,
      \FSM_sequential_tx_state_reg[0]_2\ => \FSM_sequential_tx_state[3]_i_6_n_0\,
      \FSM_sequential_tx_state_reg[0]_3\ => \FSM_sequential_tx_state[3]_i_7_n_0\,
      \FSM_sequential_tx_state_reg[0]_4\ => \FSM_sequential_tx_state[3]_i_8_n_0\,
      \FSM_sequential_tx_state_reg[0]_5\ => pll_reset_asserted_reg_n_0,
      Q(3 downto 0) => tx_state(3 downto 0),
      in0 => in0,
      init_clk_in => init_clk_in,
      mmcm_lock_reclocked => mmcm_lock_reclocked,
      reset_time_out => reset_time_out,
      txresetdone_s3 => txresetdone_s3
    );
sync_mmcm_lock_reclocked_cdc_sync: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_4
     port map (
      SR(0) => sync_mmcm_lock_reclocked_cdc_sync_n_1,
      init_clk_in => init_clk_in,
      mmcm_lock_reclocked => mmcm_lock_reclocked,
      mmcm_lock_reclocked_reg => sync_mmcm_lock_reclocked_cdc_sync_n_0,
      mmcm_lock_reclocked_reg_0 => mmcm_lock_reclocked_i_2_n_0
    );
sync_qplllock_cdc_sync: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_5
     port map (
      init_clk_in => init_clk_in
    );
sync_run_phase_alignment_int_cdc_sync: entity work.\simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_6\
     port map (
      init_clk_in => init_clk_in,
      \out\ => run_phase_alignment_int_s2,
      run_phase_alignment_int => run_phase_alignment_int,
      s_level_out_d6_reg_0 => s_level_out_d6_reg_0
    );
sync_time_out_wait_bypass_cdc_sync: entity work.\simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_7\
     port map (
      init_clk_in => init_clk_in,
      \out\ => time_out_wait_bypass_s2,
      p_level_in_d1_cdc_from_reg_0 => s_level_out_d6_reg_0,
      time_out_wait_bypass => time_out_wait_bypass
    );
sync_tx_fsm_reset_done_int_cdc_sync: entity work.\simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_8\
     port map (
      init_clk_in => init_clk_in,
      s_level_out_d6_reg_0 => s_level_out_d6_reg,
      s_level_out_d6_reg_1 => s_level_out_d6_reg_0,
      tx_fsm_reset_done_int => tx_fsm_reset_done_int,
      tx_resetdone_out => \^tx_resetdone_out\
    );
time_out_2ms_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AE"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => time_out_2ms_i_2_n_0,
      I2 => \time_out_counter[0]_i_3_n_0\,
      I3 => reset_time_out,
      O => time_out_2ms_i_1_n_0
    );
time_out_2ms_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(17),
      I2 => time_out_counter_reg(9),
      I3 => time_out_counter_reg(11),
      I4 => time_out_counter_reg(4),
      I5 => \time_out_counter[0]_i_4_n_0\,
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
      R => '0'
    );
time_out_500us_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAEAAA"
    )
        port map (
      I0 => time_out_500us_reg_n_0,
      I1 => time_out_500us_i_2_n_0,
      I2 => time_out_counter_reg(4),
      I3 => time_out_counter_reg(9),
      I4 => \time_out_counter[0]_i_3_n_0\,
      I5 => reset_time_out,
      O => time_out_500us_i_1_n_0
    );
time_out_500us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(15),
      I2 => time_out_counter_reg(10),
      I3 => time_out_counter_reg(11),
      I4 => time_out_counter_reg(17),
      I5 => time_out_counter_reg(16),
      O => time_out_500us_i_2_n_0
    );
time_out_500us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_500us_i_1_n_0,
      Q => time_out_500us_reg_n_0,
      R => '0'
    );
\time_out_counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFBFFFF"
    )
        port map (
      I0 => \time_out_counter[0]_i_3_n_0\,
      I1 => time_out_counter_reg(11),
      I2 => \time_out_counter[0]_i_4_n_0\,
      I3 => time_out_counter_reg(9),
      I4 => \time_out_counter[0]_i_5_n_0\,
      I5 => time_out_counter_reg(4),
      O => time_out_counter
    );
\time_out_counter[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => time_out_counter_reg(6),
      I1 => time_out_counter_reg(13),
      I2 => \time_out_counter[0]_i_7_n_0\,
      I3 => \time_out_counter[0]_i_8_n_0\,
      O => \time_out_counter[0]_i_3_n_0\
    );
\time_out_counter[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(10),
      O => \time_out_counter[0]_i_4_n_0\
    );
\time_out_counter[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(17),
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
\time_out_counter[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => time_out_counter_reg(7),
      I1 => time_out_counter_reg(5),
      I2 => time_out_counter_reg(8),
      I3 => time_out_counter_reg(12),
      O => \time_out_counter[0]_i_7_n_0\
    );
\time_out_counter[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => time_out_counter_reg(1),
      I1 => time_out_counter_reg(0),
      I2 => time_out_counter_reg(3),
      I3 => time_out_counter_reg(2),
      O => \time_out_counter[0]_i_8_n_0\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_7\,
      Q => time_out_counter_reg(0),
      R => reset_time_out
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
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_5\,
      Q => time_out_counter_reg(10),
      R => reset_time_out
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_4\,
      Q => time_out_counter_reg(11),
      R => reset_time_out
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_7\,
      Q => time_out_counter_reg(12),
      R => reset_time_out
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
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_6\,
      Q => time_out_counter_reg(13),
      R => reset_time_out
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_5\,
      Q => time_out_counter_reg(14),
      R => reset_time_out
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_4\,
      Q => time_out_counter_reg(15),
      R => reset_time_out
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1_n_7\,
      Q => time_out_counter_reg(16),
      R => reset_time_out
    );
\time_out_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[12]_i_1_n_0\,
      CO(3 downto 1) => \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \time_out_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \time_out_counter_reg[16]_i_1_n_6\,
      O(0) => \time_out_counter_reg[16]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => time_out_counter_reg(17 downto 16)
    );
\time_out_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1_n_6\,
      Q => time_out_counter_reg(17),
      R => reset_time_out
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_6\,
      Q => time_out_counter_reg(1),
      R => reset_time_out
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_5\,
      Q => time_out_counter_reg(2),
      R => reset_time_out
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_4\,
      Q => time_out_counter_reg(3),
      R => reset_time_out
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_7\,
      Q => time_out_counter_reg(4),
      R => reset_time_out
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
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_6\,
      Q => time_out_counter_reg(5),
      R => reset_time_out
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_5\,
      Q => time_out_counter_reg(6),
      R => reset_time_out
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_4\,
      Q => time_out_counter_reg(7),
      R => reset_time_out
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_7\,
      Q => time_out_counter_reg(8),
      R => reset_time_out
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
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_6\,
      Q => time_out_counter_reg(9),
      R => reset_time_out
    );
time_out_wait_bypass_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AB00"
    )
        port map (
      I0 => time_out_wait_bypass,
      I1 => \wait_bypass_count[0]_i_4_n_0\,
      I2 => tx_fsm_reset_done_int_s3,
      I3 => run_phase_alignment_int_s3,
      O => time_out_wait_bypass_i_1_n_0
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
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
      INIT => X"00000000AABAAAAA"
    )
        port map (
      I0 => time_tlock_max_reg_n_0,
      I1 => time_tlock_max_i_2_n_0,
      I2 => time_out_counter_reg(4),
      I3 => \time_out_counter[0]_i_4_n_0\,
      I4 => time_tlock_max_i_3_n_0,
      I5 => reset_time_out,
      O => time_tlock_max_i_1_n_0
    );
time_tlock_max_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(3),
      I2 => time_out_counter_reg(0),
      I3 => time_out_counter_reg(1),
      I4 => \time_out_counter[0]_i_7_n_0\,
      O => time_tlock_max_i_2_n_0
    );
time_tlock_max_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => time_out_counter_reg(13),
      I1 => time_out_counter_reg(11),
      I2 => time_out_counter_reg(9),
      I3 => time_out_counter_reg(6),
      I4 => time_out_counter_reg(17),
      I5 => time_out_counter_reg(16),
      O => time_tlock_max_i_3_n_0
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_tlock_max_i_1_n_0,
      Q => time_tlock_max_reg_n_0,
      R => '0'
    );
tx_fsm_reset_done_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF1000"
    )
        port map (
      I0 => tx_state(1),
      I1 => tx_state(2),
      I2 => tx_state(0),
      I3 => tx_state(3),
      I4 => tx_fsm_reset_done_int,
      O => tx_fsm_reset_done_int_i_1_n_0
    );
tx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => tx_fsm_reset_done_int_i_1_n_0,
      Q => tx_fsm_reset_done_int,
      R => \init_wait_count_reg[0]_0\
    );
tx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => '1',
      D => \^tx_resetdone_out\,
      Q => tx_fsm_reset_done_int_s3,
      R => '0'
    );
txresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => txresetdone_s2,
      Q => txresetdone_s3,
      R => '0'
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
      I1 => tx_fsm_reset_done_int_s3,
      O => \wait_bypass_count[0]_i_2_n_0\
    );
\wait_bypass_count[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_bypass_count[0]_i_6_n_0\,
      I1 => \wait_bypass_count[0]_i_7_n_0\,
      I2 => \wait_bypass_count[0]_i_8_n_0\,
      I3 => \wait_bypass_count[0]_i_9_n_0\,
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
      INIT => X"7FFF"
    )
        port map (
      I0 => wait_bypass_count_reg(4),
      I1 => wait_bypass_count_reg(3),
      I2 => wait_bypass_count_reg(6),
      I3 => wait_bypass_count_reg(5),
      O => \wait_bypass_count[0]_i_6_n_0\
    );
\wait_bypass_count[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
        port map (
      I0 => wait_bypass_count_reg(0),
      I1 => wait_bypass_count_reg(16),
      I2 => wait_bypass_count_reg(15),
      I3 => wait_bypass_count_reg(2),
      I4 => wait_bypass_count_reg(1),
      O => \wait_bypass_count[0]_i_7_n_0\
    );
\wait_bypass_count[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => wait_bypass_count_reg(12),
      I1 => wait_bypass_count_reg(11),
      I2 => wait_bypass_count_reg(13),
      I3 => wait_bypass_count_reg(14),
      O => \wait_bypass_count[0]_i_8_n_0\
    );
\wait_bypass_count[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => wait_bypass_count_reg(7),
      I1 => wait_bypass_count_reg(8),
      I2 => wait_bypass_count_reg(9),
      I3 => wait_bypass_count_reg(10),
      O => \wait_bypass_count[0]_i_9_n_0\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_7\,
      Q => wait_bypass_count_reg(12),
      R => clear
    );
\wait_bypass_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[8]_i_1_n_0\,
      CO(3) => \wait_bypass_count_reg[12]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[12]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[12]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[12]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[12]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[12]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(15 downto 12)
    );
\wait_bypass_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_6\,
      Q => wait_bypass_count_reg(13),
      R => clear
    );
\wait_bypass_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_5\,
      Q => wait_bypass_count_reg(14),
      R => clear
    );
\wait_bypass_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_4\,
      Q => wait_bypass_count_reg(15),
      R => clear
    );
\wait_bypass_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[16]_i_1_n_7\,
      Q => wait_bypass_count_reg(16),
      R => clear
    );
\wait_bypass_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[12]_i_1_n_0\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \wait_bypass_count_reg[16]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => wait_bypass_count_reg(16)
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
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
      C => s_level_out_d6_reg_0,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_6\,
      Q => wait_bypass_count_reg(9),
      R => clear
    );
\wait_time_cnt[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0070"
    )
        port map (
      I0 => tx_state(2),
      I1 => tx_state(1),
      I2 => tx_state(0),
      I3 => tx_state(3),
      O => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      I1 => wait_time_cnt_reg(0),
      I2 => wait_time_cnt_reg(3),
      I3 => wait_time_cnt_reg(2),
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
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_GT_WRAPPER is
  port (
    tx_resetdone_out : out STD_LOGIC;
    in0 : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    tx_out_clk_i : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    pll_not_locked_out : out STD_LOGIC;
    ENABLE_ERR_DETECT_reg : out STD_LOGIC;
    s_level_out_d6_reg : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC;
    drpwe_in : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    gt_qpllclk_quad1_out : in STD_LOGIC;
    gt_qpllrefclk_quad1_out : in STD_LOGIC;
    p_level_in_d1_cdc_from_reg : in STD_LOGIC;
    power_down : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TXDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TXCHARISK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \init_wait_count_reg[0]\ : in STD_LOGIC;
    ENABLE_ERR_DETECT : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_GT_WRAPPER : entity is "simplex_tx_aurora_8b10b_0_0_GT_WRAPPER";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_GT_WRAPPER;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_GT_WRAPPER is
  signal cpll_reset_i : STD_LOGIC;
  signal \gt0_simplex_tx_aurora_8b10b_0_0_i/ack_flag\ : STD_LOGIC;
  signal gt0_txresetdone_r3_reg_srl3_n_0 : STD_LOGIC;
  signal gt_tx_reset_i : STD_LOGIC;
  signal gt_txresetfsm_i_n_4 : STD_LOGIC;
  signal gt_txuserrdy_i : STD_LOGIC;
  signal \^in0\ : STD_LOGIC;
  signal simplex_tx_aurora_8b10b_0_0_multi_gt_i_n_5 : STD_LOGIC;
  signal txfsm_txresetdone_r : STD_LOGIC;
  attribute srl_name : string;
  attribute srl_name of gt0_txresetdone_r3_reg_srl3 : label is "inst/\simplex_tx_aurora_8b10b_0_0_core_i/gt_wrapper_i/gt0_txresetdone_r3_reg_srl3 ";
begin
  in0 <= \^in0\;
gt0_txresetdone_r3_reg_srl3: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => p_level_in_d1_cdc_from_reg,
      D => simplex_tx_aurora_8b10b_0_0_multi_gt_i_n_5,
      Q => gt0_txresetdone_r3_reg_srl3_n_0
    );
gt_txresetfsm_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_tx_startup_fsm
     port map (
      CPLL_RESET_reg_0 => gt_txresetfsm_i_n_4,
      ack_flag => \gt0_simplex_tx_aurora_8b10b_0_0_i/ack_flag\,
      cpll_reset_i => cpll_reset_i,
      gt_tx_reset_i => gt_tx_reset_i,
      gt_txuserrdy_i => gt_txuserrdy_i,
      in0 => \^in0\,
      init_clk_in => init_clk_in,
      \init_wait_count_reg[0]_0\ => \init_wait_count_reg[0]\,
      s_level_out_d6_reg => s_level_out_d6_reg,
      s_level_out_d6_reg_0 => p_level_in_d1_cdc_from_reg,
      tx_resetdone_out => tx_resetdone_out,
      txfsm_txresetdone_r => txfsm_txresetdone_r
    );
gtrxreset_cdc_sync: entity work.\simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync__parameterized0_1\
     port map (
      init_clk_in => init_clk_in,
      p_level_in_d1_cdc_from_reg_0 => p_level_in_d1_cdc_from_reg
    );
simplex_tx_aurora_8b10b_0_0_multi_gt_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_multi_gt
     port map (
      ENABLE_ERR_DETECT => ENABLE_ERR_DETECT,
      ENABLE_ERR_DETECT_reg => ENABLE_ERR_DETECT_reg,
      TXCHARISK(1 downto 0) => TXCHARISK(1 downto 0),
      TXDATA(15 downto 0) => TXDATA(15 downto 0),
      ack_flag => \gt0_simplex_tx_aurora_8b10b_0_0_i/ack_flag\,
      cpll_reset_i => cpll_reset_i,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      flag2_reg => gt_txresetfsm_i_n_4,
      gt_qpllclk_quad1_out => gt_qpllclk_quad1_out,
      gt_qpllrefclk_quad1_out => gt_qpllrefclk_quad1_out,
      gt_refclk1 => gt_refclk1,
      gt_tx_reset_i => gt_tx_reset_i,
      gt_txuserrdy_i => gt_txuserrdy_i,
      in0 => \^in0\,
      init_clk_in => init_clk_in,
      init_clk_in_0 => simplex_tx_aurora_8b10b_0_0_multi_gt_i_n_5,
      loopback(2 downto 0) => loopback(2 downto 0),
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      s_level_out_d1_simplex_tx_aurora_8b10b_0_0_cdc_to_reg => p_level_in_d1_cdc_from_reg,
      tx_out_clk_i => tx_out_clk_i,
      txn => txn,
      txp => txp
    );
txfsm_txresetdone_r_reg: unisim.vcomponents.FDRE
     port map (
      C => p_level_in_d1_cdc_from_reg,
      CE => '1',
      D => gt0_txresetdone_r3_reg_srl3_n_0,
      Q => txfsm_txresetdone_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_core is
  port (
    tx_lane_up : out STD_LOGIC;
    tx_resetdone_out : out STD_LOGIC;
    in0 : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    tx_out_clk_i : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    tx_channel_up : out STD_LOGIC;
    SYSTEM_RESET_reg : out STD_LOGIC;
    tx_hard_err : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    system_reset_i : in STD_LOGIC;
    gen_pad_r_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC;
    drpwe_in : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    gt_qpllclk_quad1_out : in STD_LOGIC;
    gt_qpllrefclk_quad1_out : in STD_LOGIC;
    power_down : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    tx_aligned : in STD_LOGIC;
    tx_verify : in STD_LOGIC;
    \init_wait_count_reg[0]\ : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 );
    tx_reset : in STD_LOGIC;
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_core : entity is "simplex_tx_aurora_8b10b_0_0_core";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_core;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_core is
  signal ENABLE_ERR_DETECT : STD_LOGIC;
  signal GEN_ECP : STD_LOGIC;
  signal GEN_PAD : STD_LOGIC;
  signal GEN_SCP : STD_LOGIC;
  signal \^system_reset_reg\ : STD_LOGIC;
  signal TX_PE_DATA : STD_LOGIC_VECTOR ( 0 to 15 );
  signal TX_PE_DATA_V : STD_LOGIC;
  signal axi_to_ll_pdu_i_n_0 : STD_LOGIC;
  signal do_cc_i : STD_LOGIC;
  signal gen_a_i : STD_LOGIC;
  signal gen_cc_i : STD_LOGIC;
  signal gen_k_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal gen_r_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal gen_v_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal gt_wrapper_i_n_23 : STD_LOGIC;
  signal gt_wrapper_i_n_24 : STD_LOGIC;
  signal hard_err_reset_i : STD_LOGIC;
  signal \^in0\ : STD_LOGIC;
  signal new_pkt_r : STD_LOGIC;
  signal reset_channel_i : STD_LOGIC;
  signal tx_aurora_lane_simplex_v5_0_i_n_5 : STD_LOGIC;
  signal \tx_channel_init_sm_simplex_i/wait_for_lane_up_r0\ : STD_LOGIC;
  signal \^tx_channel_up\ : STD_LOGIC;
  signal tx_char_is_k_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal tx_data_i : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal tx_dst_rdy : STD_LOGIC;
  signal tx_global_logic_simplex_i_n_12 : STD_LOGIC;
  signal \tx_lane_init_sm_simplex_i/ready_r_reg0\ : STD_LOGIC;
  signal \^tx_lane_up\ : STD_LOGIC;
  signal tx_reset_lanes_i : STD_LOGIC;
  signal tx_system_reset_c : STD_LOGIC;
begin
  SYSTEM_RESET_reg <= \^system_reset_reg\;
  in0 <= \^in0\;
  tx_channel_up <= \^tx_channel_up\;
  tx_lane_up <= \^tx_lane_up\;
axi_to_ll_pdu_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_AXI_TO_LL
     port map (
      new_pkt_r => new_pkt_r,
      new_pkt_r_reg_0 => axi_to_ll_pdu_i_n_0,
      new_pkt_r_reg_1 => gen_pad_r_reg
    );
core_reset_logic_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_RESET_LOGIC
     port map (
      SR(0) => \^system_reset_reg\,
      gt_txresetdone_r2_reg_0 => gt_wrapper_i_n_24,
      in0 => \^in0\,
      init_clk_in => init_clk_in,
      new_pkt_r => new_pkt_r,
      new_pkt_r_reg => axi_to_ll_pdu_i_n_0,
      reset_channel_i => reset_channel_i,
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      s_level_out_d6_reg => gen_pad_r_reg,
      system_reset_i => system_reset_i,
      tx_channel_up => \^tx_channel_up\,
      tx_dst_rdy => tx_dst_rdy,
      tx_reset => tx_reset,
      tx_system_reset_c => tx_system_reset_c,
      wait_for_lane_up_r0 => \tx_channel_init_sm_simplex_i/wait_for_lane_up_r0\
    );
gt_wrapper_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_GT_WRAPPER
     port map (
      ENABLE_ERR_DETECT => ENABLE_ERR_DETECT,
      ENABLE_ERR_DETECT_reg => gt_wrapper_i_n_23,
      TXCHARISK(1 downto 0) => tx_char_is_k_i(1 downto 0),
      TXDATA(15 downto 0) => tx_data_i(15 downto 0),
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      gt_qpllclk_quad1_out => gt_qpllclk_quad1_out,
      gt_qpllrefclk_quad1_out => gt_qpllrefclk_quad1_out,
      gt_refclk1 => gt_refclk1,
      in0 => \^in0\,
      init_clk_in => init_clk_in,
      \init_wait_count_reg[0]\ => \init_wait_count_reg[0]\,
      loopback(2 downto 0) => loopback(2 downto 0),
      p_level_in_d1_cdc_from_reg => gen_pad_r_reg,
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      s_level_out_d6_reg => gt_wrapper_i_n_24,
      tx_out_clk_i => tx_out_clk_i,
      tx_resetdone_out => tx_resetdone_out,
      txn => txn,
      txp => txp
    );
standard_cc_module_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_STANDARD_CC_MODULE
     port map (
      Q => do_cc_i,
      SR(0) => \^system_reset_reg\,
      \prepare_count_r_reg[9]_0\ => gen_pad_r_reg
    );
tx_aurora_lane_simplex_v5_0_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_AURORA_LANE_SIMPLEX_V5
     port map (
      D(1) => gen_v_i(0),
      D(0) => gen_v_i(1),
      ENABLE_ERR_DETECT => ENABLE_ERR_DETECT,
      GEN_ECP => GEN_ECP,
      GEN_PAD => GEN_PAD,
      GEN_SCP => GEN_SCP,
      Q(15) => TX_PE_DATA(0),
      Q(14) => TX_PE_DATA(1),
      Q(13) => TX_PE_DATA(2),
      Q(12) => TX_PE_DATA(3),
      Q(11) => TX_PE_DATA(4),
      Q(10) => TX_PE_DATA(5),
      Q(9) => TX_PE_DATA(6),
      Q(8) => TX_PE_DATA(7),
      Q(7) => TX_PE_DATA(8),
      Q(6) => TX_PE_DATA(9),
      Q(5) => TX_PE_DATA(10),
      Q(4) => TX_PE_DATA(11),
      Q(3) => TX_PE_DATA(12),
      Q(2) => TX_PE_DATA(13),
      Q(1) => TX_PE_DATA(14),
      Q(0) => TX_PE_DATA(15),
      SS(0) => \tx_lane_init_sm_simplex_i/ready_r_reg0\,
      TXCHARISK(1 downto 0) => tx_char_is_k_i(1 downto 0),
      TXDATA(15 downto 0) => tx_data_i(15 downto 0),
      TX_PE_DATA_V => TX_PE_DATA_V,
      \counter1_r_reg[0]\ => gen_pad_r_reg,
      gen_a_i => gen_a_i,
      gen_cc_i => gen_cc_i,
      \gen_k_r_reg[0]\(1) => gen_k_i(0),
      \gen_k_r_reg[0]\(0) => gen_k_i(1),
      \gen_r_r_reg[0]\(1) => gen_r_i(0),
      \gen_r_r_reg[0]\(0) => gen_r_i(1),
      hard_err_flop_r_reg => tx_aurora_lane_simplex_v5_0_i_n_5,
      hard_err_flop_r_reg_0 => gt_wrapper_i_n_23,
      hard_err_reset_i => hard_err_reset_i,
      tx_aligned => tx_aligned,
      tx_lane_up => \^tx_lane_up\,
      tx_reset_lanes_i => tx_reset_lanes_i
    );
tx_global_logic_simplex_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_GLOBAL_LOGIC_SIMPLEX
     port map (
      CHANNEL_HARD_ERR_reg => tx_aurora_lane_simplex_v5_0_i_n_5,
      D(1) => gen_v_i(0),
      D(0) => gen_v_i(1),
      SR(0) => \^system_reset_reg\,
      SS(0) => \tx_lane_init_sm_simplex_i/ready_r_reg0\,
      \free_count_r_reg[14]\ => gen_pad_r_reg,
      gen_a_i => gen_a_i,
      gen_k_flop_0_i(1) => gen_k_i(0),
      gen_k_flop_0_i(0) => gen_k_i(1),
      gen_r_flop_0_i(1) => gen_r_i(0),
      gen_r_flop_0_i(0) => gen_r_i(1),
      hard_err_reset_i => hard_err_reset_i,
      power_down => power_down,
      reset_channel_i => reset_channel_i,
      tx_channel_up => \^tx_channel_up\,
      tx_channel_up_i => tx_global_logic_simplex_i_n_12,
      tx_hard_err => tx_hard_err,
      tx_lane_up => \^tx_lane_up\,
      tx_reset => tx_reset,
      tx_reset_lanes_i => tx_reset_lanes_i,
      tx_system_reset_c => tx_system_reset_c,
      tx_verify => tx_verify,
      wait_for_lane_up_r0 => \tx_channel_init_sm_simplex_i/wait_for_lane_up_r0\
    );
tx_ll_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_TX_LL
     port map (
      GEN_ECP => GEN_ECP,
      GEN_PAD => GEN_PAD,
      GEN_SCP => GEN_SCP,
      Q => do_cc_i,
      TX_PE_DATA_V => TX_PE_DATA_V,
      \TX_PE_DATA_reg[0]\(15) => TX_PE_DATA(0),
      \TX_PE_DATA_reg[0]\(14) => TX_PE_DATA(1),
      \TX_PE_DATA_reg[0]\(13) => TX_PE_DATA(2),
      \TX_PE_DATA_reg[0]\(12) => TX_PE_DATA(3),
      \TX_PE_DATA_reg[0]\(11) => TX_PE_DATA(4),
      \TX_PE_DATA_reg[0]\(10) => TX_PE_DATA(5),
      \TX_PE_DATA_reg[0]\(9) => TX_PE_DATA(6),
      \TX_PE_DATA_reg[0]\(8) => TX_PE_DATA(7),
      \TX_PE_DATA_reg[0]\(7) => TX_PE_DATA(8),
      \TX_PE_DATA_reg[0]\(6) => TX_PE_DATA(9),
      \TX_PE_DATA_reg[0]\(5) => TX_PE_DATA(10),
      \TX_PE_DATA_reg[0]\(4) => TX_PE_DATA(11),
      \TX_PE_DATA_reg[0]\(3) => TX_PE_DATA(12),
      \TX_PE_DATA_reg[0]\(2) => TX_PE_DATA(13),
      \TX_PE_DATA_reg[0]\(1) => TX_PE_DATA(14),
      \TX_PE_DATA_reg[0]\(0) => TX_PE_DATA(15),
      gen_cc_i => gen_cc_i,
      gen_pad_r_reg => gen_pad_r_reg,
      in_frame_r_reg => tx_global_logic_simplex_i_n_12,
      s_axi_tx_tdata(0 to 15) => s_axi_tx_tdata(0 to 15),
      s_axi_tx_tkeep(0 to 1) => s_axi_tx_tkeep(0 to 1),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => s_axi_tx_tready,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      storage_pad_r_reg => axi_to_ll_pdu_i_n_0,
      tx_dst_rdy => tx_dst_rdy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_support is
  port (
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 );
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    tx_hard_err : out STD_LOGIC;
    tx_lane_up : out STD_LOGIC;
    tx_channel_up : out STD_LOGIC;
    tx_aligned : in STD_LOGIC;
    tx_verify : in STD_LOGIC;
    tx_reset : in STD_LOGIC;
    user_clk_out : out STD_LOGIC;
    sync_clk_out : out STD_LOGIC;
    gt_reset : in STD_LOGIC;
    tx_system_reset : in STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_lock : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    tx_resetdone_out : out STD_LOGIC;
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
  attribute ORIG_REF_NAME of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_support : entity is "simplex_tx_aurora_8b10b_0_0_support";
end simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_support;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_support is
  signal \^gt_qpllclk_quad1_out\ : STD_LOGIC;
  signal \^gt_qpllrefclk_quad1_out\ : STD_LOGIC;
  signal \^gt_reset_out\ : STD_LOGIC;
  signal gt_reset_sync_init_clk : STD_LOGIC;
  signal reset_sync_user_clk : STD_LOGIC;
  signal system_reset_i : STD_LOGIC;
  signal tx_out_clk_i : STD_LOGIC;
  signal \^user_clk_out\ : STD_LOGIC;
begin
  gt_qpllclk_quad1_out <= \^gt_qpllclk_quad1_out\;
  gt_qpllrefclk_quad1_out <= \^gt_qpllrefclk_quad1_out\;
  gt_reset_out <= \^gt_reset_out\;
  sync_clk_out <= \^user_clk_out\;
  user_clk_out <= \^user_clk_out\;
clock_module_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_CLOCK_MODULE
     port map (
      init_clk_in => \^user_clk_out\,
      tx_out_clk_i => tx_out_clk_i
    );
gt_common_support: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_gt_common_wrapper
     port map (
      gt0_qplllock_out => gt0_qplllock_out,
      gt0_qpllrefclklost_out => gt0_qpllrefclklost_out,
      gt_qpllclk_quad1_out => \^gt_qpllclk_quad1_out\,
      gt_qpllrefclk_quad1_out => \^gt_qpllrefclk_quad1_out\,
      gt_refclk1 => gt_refclk1,
      init_clk_in => init_clk_in
    );
gt_reset_cdc_sync: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync
     port map (
      D(0) => gt_reset_sync_init_clk,
      gt_reset => gt_reset,
      init_clk_in => init_clk_in
    );
reset_sync_user_clk_cdc_sync: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_cdc_sync_0
     port map (
      D(0) => reset_sync_user_clk,
      s_level_out_d6_reg_0 => \^user_clk_out\,
      tx_system_reset => tx_system_reset
    );
simplex_tx_aurora_8b10b_0_0_core_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_core
     port map (
      SYSTEM_RESET_reg => sys_reset_out,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      gen_pad_r_reg => \^user_clk_out\,
      gt_qpllclk_quad1_out => \^gt_qpllclk_quad1_out\,
      gt_qpllrefclk_quad1_out => \^gt_qpllrefclk_quad1_out\,
      gt_refclk1 => gt_refclk1,
      in0 => tx_lock,
      init_clk_in => init_clk_in,
      \init_wait_count_reg[0]\ => \^gt_reset_out\,
      loopback(2 downto 0) => loopback(2 downto 0),
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      s_axi_tx_tdata(0 to 15) => s_axi_tx_tdata(0 to 15),
      s_axi_tx_tkeep(0 to 1) => s_axi_tx_tkeep(0 to 1),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => s_axi_tx_tready,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      system_reset_i => system_reset_i,
      tx_aligned => tx_aligned,
      tx_channel_up => tx_channel_up,
      tx_hard_err => tx_hard_err,
      tx_lane_up => tx_lane_up,
      tx_out_clk_i => tx_out_clk_i,
      tx_reset => tx_reset,
      tx_resetdone_out => tx_resetdone_out,
      tx_verify => tx_verify,
      txn => txn,
      txp => txp
    );
support_reset_logic_i: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_SUPPORT_RESET_LOGIC
     port map (
      CLK => \^user_clk_out\,
      D(0) => reset_sync_user_clk,
      \debounce_gt_rst_r_reg[0]_0\(0) => gt_reset_sync_init_clk,
      gt_reset_out => \^gt_reset_out\,
      init_clk_in => init_clk_in,
      system_reset_i => system_reset_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity simplex_tx_aurora_8b10b_0_0 is
  port (
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 );
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    tx_hard_err : out STD_LOGIC;
    tx_lane_up : out STD_LOGIC;
    tx_channel_up : out STD_LOGIC;
    tx_aligned : in STD_LOGIC;
    tx_verify : in STD_LOGIC;
    tx_reset : in STD_LOGIC;
    user_clk_out : out STD_LOGIC;
    sync_clk_out : out STD_LOGIC;
    gt_reset : in STD_LOGIC;
    tx_system_reset : in STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    gt_reset_out : out STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_lock : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    tx_resetdone_out : out STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    gt0_qplllock_out : out STD_LOGIC;
    gt0_qpllrefclklost_out : out STD_LOGIC;
    gt_qpllclk_quad1_out : out STD_LOGIC;
    gt_qpllrefclk_quad1_out : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of simplex_tx_aurora_8b10b_0_0 : entity is true;
end simplex_tx_aurora_8b10b_0_0;

architecture STRUCTURE of simplex_tx_aurora_8b10b_0_0 is
  signal NLW_inst_drprdy_out_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_drpdo_out_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
inst: entity work.simplex_tx_aurora_8b10b_0_0_simplex_tx_aurora_8b10b_0_0_support
     port map (
      drpaddr_in(8 downto 0) => B"000000000",
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => B"0000000000000000",
      drpdo_out(15 downto 0) => NLW_inst_drpdo_out_UNCONNECTED(15 downto 0),
      drpen_in => '0',
      drprdy_out => NLW_inst_drprdy_out_UNCONNECTED,
      drpwe_in => '0',
      gt0_qplllock_out => gt0_qplllock_out,
      gt0_qpllrefclklost_out => gt0_qpllrefclklost_out,
      gt_qpllclk_quad1_out => gt_qpllclk_quad1_out,
      gt_qpllrefclk_quad1_out => gt_qpllrefclk_quad1_out,
      gt_refclk1 => gt_refclk1,
      gt_reset => gt_reset,
      gt_reset_out => gt_reset_out,
      init_clk_in => init_clk_in,
      loopback(2 downto 0) => loopback(2 downto 0),
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      s_axi_tx_tdata(0 to 15) => s_axi_tx_tdata(0 to 15),
      s_axi_tx_tkeep(0 to 1) => s_axi_tx_tkeep(0 to 1),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => s_axi_tx_tready,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      sync_clk_out => sync_clk_out,
      sys_reset_out => sys_reset_out,
      tx_aligned => tx_aligned,
      tx_channel_up => tx_channel_up,
      tx_hard_err => tx_hard_err,
      tx_lane_up => tx_lane_up,
      tx_lock => tx_lock,
      tx_reset => tx_reset,
      tx_resetdone_out => tx_resetdone_out,
      tx_system_reset => tx_system_reset,
      tx_verify => tx_verify,
      txn => txn,
      txp => txp,
      user_clk_out => user_clk_out
    );
end STRUCTURE;
