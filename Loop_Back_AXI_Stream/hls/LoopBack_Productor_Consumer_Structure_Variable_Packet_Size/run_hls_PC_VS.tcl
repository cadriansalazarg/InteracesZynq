############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2013 Xilinx Inc. All rights reserved.
############################################################

# Create a Vivado HLS project
open_project -reset hls_loop_back_axi_stream_prj
set_top loopback
add_files loopback_PC_VS.cpp -cflags "-std=c++11 -Wno-unknown-pragmas" 
add_files -tb loopback_PC_VS_tb.cpp -cflags "-std=c++11 -Wno-unknown-pragmas" 

# Solution1 *************************
open_solution -reset "solution1"
set_part  {xc7z020clg484-1} 
create_clock -period 10 -name default  
source "directives_PC_VS.tcl"

# Run C simulation
csim_design
# Run Synthesis
csynth_design
# Run RTL verification
cosim_design
# Create the IP package
export_design

############################################################
# Se ejecuta al final este comando el cual copia el proyecto una ruta más atrás, de esta forma, cuando se jala el proyecto 
# desde Vivado todo se va encontrar en una misma ruta sin importar la versión del hardware que se ejecute.
exec cp -r hls_loop_back_axi_stream_prj/ ../hls_loop_back_axi_stream_prj/

exit



