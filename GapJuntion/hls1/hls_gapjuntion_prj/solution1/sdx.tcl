# ==============================================================
# File generated on Thu May 13 05:04:35 CST 2021
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../../gjip_test.cpp -cflags { -std=c++0x -Wno-unknown-pragmas}
add_files gjip.cpp -cflags {-std=c++0x -Wno-unknown-pragmas}
set_part xc7z045ffg900-2
create_clock -name default -period 5
config_compile -no_signed_zeros=0
config_compile -unsafe_math_optimizations=0
config_schedule -effort=high
config_schedule -enable_dsp_full_reg=0
config_schedule -relax_ii_for_timing=1
config_schedule -verbose=0
config_bind -effort=high
