############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_data_pack "fifo_to_Aurora_IP" in_fifo

set_directive_interface -mode ap_fifo "fifo_to_Aurora_IP" in_fifo

set_directive_interface -mode axis -register -register_mode off "fifo_to_Aurora_IP" output

set_directive_interface -mode ap_ctrl_chain "fifo_to_Aurora_IP"

set_directive_interface -mode ap_stable "fifo_to_Aurora_IP" id_next_fpga


# Directivas 
set_directive_array_partition -type complete -dim 1 "fifo_to_Aurora_IP" output_buff




