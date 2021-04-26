############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_pipeline "packaging_IP_block/Loop_Consumidor"
set_directive_interface -mode ap_fifo "packaging_IP_block" out_fifo
set_directive_interface -mode axis -register -register_mode both "packaging_IP_block" input
set_directive_interface -mode ap_ctrl_chain -register "packaging_IP_block"
set_directive_pipeline "packaging_IP_block/Loop_Productor"
set_directive_pipeline "packaging_IP_block/Loop1"

set_directive_interface -mode ap_stable "packaging_IP_block" fpga_id



#Uncomment to use this optimization, change factor to be a submultiple of ((PACKET_SIZE_BYTES-8)/8)
#set_directive_array_partition -type block -factor 9 -dim 1 "packaging_IP_block" packet_data.MESSAGE
