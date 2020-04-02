############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project -reset FirstTest
set_top adder
add_files adder.c 
add_files -tb adder_tb.c 



open_solution -reset "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
source "directives.tcl"


csim_design
csynth_design
cosim_design
export_design -format ip_catalog

exit
