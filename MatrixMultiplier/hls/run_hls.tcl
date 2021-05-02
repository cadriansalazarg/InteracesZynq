##############################################
# Project settings

# Create a project
open_project -reset hls_matrixmul_prj

# The source file and test bench
add_files matrixmul.cpp -cflags "-std=c++11 -Wno-unknown-pragmas" 
add_files -tb matrixmul_test.cpp -cflags "-std=c++11 -Wno-unknown-pragmas" 

# Specify the top-level function for synthesis
set_top Wrapper_Matrix_Multiplier

###########################
# Solution settings

# Solution1 *************************
open_solution -reset "solution1"

# Tarjeta Zynq ZC706
set_part {xc7z045ffg900-2}
create_clock -period 5 -name default

# Tarjeta ZedBoard
#set_part  {xc7z020clg484-1}   
#create_clock -period 10 -name default  
source "directives.tcl"

# Run C simulation
csim_design

# Run Synthesis
csynth_design

# Run RTL verification
cosim_design

# Create the IP package
export_design


exit

