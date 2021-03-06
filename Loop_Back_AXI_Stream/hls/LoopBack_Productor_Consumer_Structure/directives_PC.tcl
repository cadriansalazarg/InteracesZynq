############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
#set_directive_interface -mode axis -register -register_mode both "loopback" input
#set_directive_interface -mode axis -register_mode off "loopback" output
#set_directive_interface -mode s_axilite "loopback" 

set_directive_interface -mode axis -register -register_mode both "loopback" input
set_directive_interface -mode axis -register -register_mode both "loopback" output
set_directive_interface -mode s_axilite "loopback" 

############################################################
# Directiva de Dataflow utilizada

set_directive_dataflow "loopback"

############################################################
# Directiva para el fifo utilizado para enviar los datos entre el productor y el consumidor, necesario para usar el dataflow
# Siempre se le tiene que definir la profundidad, en este caso se le pone el valor de 64, pero deberá ser ajustado adecuadamente
# para evitar desbordamiento

set_directive_stream -depth 64 -dim 1 "loopback" bus_local

############################################################
# Se agrega la directiva de pipeline a ambos for, tanto el del coonsumidor como el del productor, esto solo se puede hacer dado que
# ambos for están balanceados.

set_directive_pipeline "productor/Loop_Productor"
set_directive_pipeline "consumidor/Loop_Consumidor"
