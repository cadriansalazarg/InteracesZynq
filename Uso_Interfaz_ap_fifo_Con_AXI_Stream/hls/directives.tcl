############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################

set_directive_interface -mode ap_ctrl_chain -register "customized_IP_block"
set_directive_interface -mode ap_fifo "customized_IP_block" out_fifo
set_directive_interface -mode ap_fifo "customized_IP_block" in_fifo

set_directive_interface -mode axis -register -register_mode both "customized_IP_block" input
set_directive_interface -mode axis -register_mode off "customized_IP_block" output

set_directive_pipeline "productor/Loop_Productor"
set_directive_pipeline "consumidor/Loop_Consumidor"

set_directive_dataflow "customized_IP_block"


