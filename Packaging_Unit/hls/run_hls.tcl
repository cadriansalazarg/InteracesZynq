# Create a Vivado HLS project
open_project -reset hls_packaging_block_hw_prj
set_top packaging_IP_block
add_files packaging_IP.cpp -cflags "-std=c++11 -Wno-unknown-pragmas"
add_files -tb packaging_IP_tb.cpp -cflags "-std=c++11 -Wno-unknown-pragmas" 

open_solution -reset "Optimized"
set_part  {xc7z020clg484-1} 
create_clock -period 5 -name default  

config_compile  
config_rtl -encoding gray 
set_clock_uncertainty 2

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
