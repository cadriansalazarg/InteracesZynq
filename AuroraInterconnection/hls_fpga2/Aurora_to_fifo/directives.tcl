############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################

set_directive_interface -mode ap_fifo "Aurora_to_fifo_IP_fpga2_block" out_fifo
set_directive_data_pack "Aurora_to_fifo_IP_fpga2_block" out_fifo

set_directive_interface -mode axis -register -register_mode both "Aurora_to_fifo_IP_fpga2_block" input
set_directive_interface -mode ap_ctrl_chain -register "Aurora_to_fifo_IP_fpga2_block"

set_directive_array_partition -type complete -dim 1 "Aurora_to_fifo_IP_fpga2_block" input_buff



#Uncomment to use this optimization, change factor to be a submultiple of ((PACKET_SIZE_BYTES-8)/8)
#set_directive_array_partition -type block -factor 9 -dim 1 "packaging_IP_block" packet_data.MESSAGE
