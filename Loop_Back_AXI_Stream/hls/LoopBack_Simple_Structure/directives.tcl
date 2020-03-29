############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode axis -register -register_mode both "loopback" input
set_directive_interface -mode axis -register_mode off "loopback" output
set_directive_interface -mode s_axilite "loopback" 


# Se el aplica pipeline a los dos for que tiene la estructura
set_directive_pipeline "loopback/Productor"
set_directive_pipeline "loopback/Consumidor"


############################################################
# Directiva de Dataflow utilizada

set_directive_dataflow "loopback"
