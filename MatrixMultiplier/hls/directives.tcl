############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
#set_directive_interface -mode axis -register -register_mode both "loopback" input
#set_directive_interface -mode axis -register_mode off "loopback" output
#set_directive_interface -mode s_axilite "loopback" 

set_directive_interface -mode ap_fifo "Wrapper_Matrix_Multiplier" out_fifo
set_directive_interface -mode ap_fifo "Wrapper_Matrix_Multiplier" in_fifo

set_directive_interface -mode ap_ctrl_chain "Wrapper_Matrix_Multiplier"
set_directive_interface -mode ap_stable "Wrapper_Matrix_Multiplier" bus_id
set_directive_interface -mode ap_stable "Wrapper_Matrix_Multiplier" fpga_id
set_directive_interface -mode ap_stable "Wrapper_Matrix_Multiplier" uid

############################################################
# Directiva para el fifo utilizado para enviar los datos entre el productor y el consumidor, necesario para usar el dataflow
# Siempre se le tiene que definir la profundidad, en este caso se le pone el valor de 256, pero deberá ser ajustado adecuadamente
# para evitar desbordamiento. La simulación falla si este buffer no se coloca del tamaño adecuada. Debe ser una potencia de 2, de tamaño 
# superior al resultado MAT_A_ROWS * MAT_A_COLS + MAT_B_ROWS * MAT_B_COLS, Por lo tanto revisar matrixmul.h

set_directive_stream -depth 256 -dim 1 "Wrapper_Matrix_Multiplier" bus_local

# Este FIFO no debe alterarse, siempre es 2.
set_directive_stream -depth 2 -dim 1 "Wrapper_Matrix_Multiplier" bus_local_header 


#####################################################################################################
#####################################################################################################
#####################################################################################################
################################# OPTIMIZACIONES AVANZADAS ##########################################
#####################################################################################################
#####################################################################################################
#####################################################################################################

# Siempre se debe observar el área cuando se aplican esta directivas
# La mejora en tiempo es significativa pero no se debe permitir que el 
# área supere el 50%. 
# En caso de que se supere, estas directivas mostradas abajo pueden ser 
# simplemente comentadas.





############################################################
# Directiva de Dataflow utilizada

set_directive_dataflow "Wrapper_Matrix_Multiplier"



############################################################
# Se agrega la directiva de pipeline a ambos for, tanto el del coonsumidor como el del productor, esto solo se puede hacer dado que
# ambos for están balanceados.

set_directive_pipeline "productor/Loop_Productor"
set_directive_pipeline "consumidor/Loop_Reorganizing_Data_MatrixA"
set_directive_pipeline "consumidor/Loop_Reorganizing_Data_MatrixB"
set_directive_pipeline "consumidor/Loop_Consumidor"

set_directive_pipeline -rewind "matrixmul/Col"
