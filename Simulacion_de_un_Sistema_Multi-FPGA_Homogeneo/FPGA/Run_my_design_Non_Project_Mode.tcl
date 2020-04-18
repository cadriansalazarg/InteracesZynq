##Template taken from: https://www.xilinx.com/video/hardware/using-the-non-project-batch-flow.html
## Run: vivado -mode batch -source Run_my_design_Non_Project_Mode.tcl

## Asemble the Design Source files

exec rm -rf Report_Files Netlist_Files vivado*

read_verilog [ glob ./src_Verilog/*v ]
read_xdc [ glob ./constrs/*xdc ]



## Run Synthesis and Implementacion
set outputDirFiles ./Report_Files
file mkdir $outputDirFiles

set outputDirNetlistFiles ./Netlist_Files
file mkdir $outputDirNetlistFiles


synth_design -top top_Design -part xc7z020clg484-1
write_checkpoint -force $outputDirFiles/post_synth
report_utilization -file $outputDirFiles/post_synth_util.rpt
report_timing -sort_by group -max_paths 5 -path_type summary -file  $outputDirFiles/post_synth_timing.rpt

opt_design
#power_opt_design
place_design
write_checkpoint -force $outputDirFiles/post_place
#phys_opt_design
route_design
write_checkpoint -force $outputDirFiles/post_route

#Generate reports
report_timing_summary -file  $outputDirFiles/post_route_timing_summary.rpt
report_timing -sort_by group -max_paths 100 -path_type summary -file  $outputDirFiles/post_route_timing.rpt
report_utilization -file $outputDirFiles/post_route_util.rpt
report_drc -file $outputDirFiles/post_imp_drc.rpt


write_verilog -force -mode timesim -sdf_anno true -sdf_file $outputDirNetlistFiles/Top_FPGA.sdf $outputDirNetlistFiles/Top_FPGA_netlist.v 
write_sdf -force $outputDirNetlistFiles/Top_FPGA.sdf


exec rm -rf vivado*

# Generate Bit File
#write_bitstream -file $outputDir/design.bit
