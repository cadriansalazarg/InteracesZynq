############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hls_gapjuntion_prj
set_top GapJunctionIP
add_files modules/calc/calc.cpp
add_files modules/blockControl/blockControl.cpp
add_files modules/acc/acc.cpp
add_files modules/V_read/V_read.cpp
add_files Stream.cpp
add_files modules/I_calc/I_calc.cpp
add_files -tb StreamTest.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z045ffg900-2}
create_clock -period 5 -name default
config_export -format ip_catalog
#source "./hls_gapjuntion_prj/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
