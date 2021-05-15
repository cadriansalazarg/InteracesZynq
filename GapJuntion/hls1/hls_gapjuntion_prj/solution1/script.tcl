############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hls_gapjuntion_prj
set_top GapJunctionIP
add_files gjip.cpp -cflags "-std=c++0x -Wno-unknown-pragmas"
add_files -tb gjip_test.cpp -cflags "-std=c++0x -Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z045ffg900-2}
create_clock -period 5 -name default
#source "./hls_gapjuntion_prj/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
