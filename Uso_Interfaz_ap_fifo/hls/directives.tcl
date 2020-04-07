############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################

set_directive_interface -mode s_axilite -register "customized_IP_block"
set_directive_interface -mode ap_fifo "customized_IP_block" out_fifo
set_directive_interface -mode ap_fifo "customized_IP_block" in_fifo
set_directive_interface -mode s_axilite -register "customized_IP_block" input_axi_lite
set_directive_interface -mode s_axilite -register "customized_IP_block" output_axi_lite
set_directive_pipeline "customized_IP_block/SendData_To_FIFO"
set_directive_pipeline "customized_IP_block/Receive_From_FIFO"
