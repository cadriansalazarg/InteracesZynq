############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode ap_fifo "Aurora_to_fifo_IP_fpga1_block" out_fifo
set_directive_data_pack "Aurora_to_fifo_IP_fpga1_block" out_fifo
set_directive_interface -mode ap_fifo "Aurora_to_fifo_IP_fpga1_block" input_fifo
set_directive_interface -mode ap_ctrl_chain -register "Aurora_to_fifo_IP_fpga1_block"
set_directive_interface -mode ap_none "Aurora_to_fifo_IP_fpga1_block" SequenceError



set_directive_array_partition -type complete -dim 1 "Aurora_to_fifo_IP_fpga1_block" input_buff
