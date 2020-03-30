################################################################
# Block diagram build script
################################################################

set design_name zedboard_axi_dma

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/$design_name"]"


create_project $design_name $origin_dir/$design_name -part xc7z020clg484-1

set_property board_part em.avnet.com:zed:part0:1.4 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

create_bd_design $design_name

current_bd_design $design_name

set parentCell [get_bd_cells /]

# Get object for parentCell
set parentObj [get_bd_cells $parentCell]
if { $parentObj == "" } {
   puts "ERROR: Unable to find parent cell <$parentCell>!"
   return
}

# Make sure parentObj is hier blk
set parentType [get_property TYPE $parentObj]
if { $parentType ne "hier" } {
   puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
   return
}

# Save current instance; Restore later
set oldCurInst [current_bd_instance .]

# Set parent object as current
current_bd_instance $parentObj

# Add the Processor System and apply board preset
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7 processing_system7_0
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

# Configure the PS: Generate 100MHz clock, Enable GP0 and HP0, Enable interrupts
set_property -dict [list CONFIG.PCW_USE_S_AXI_HP0 {1} CONFIG.PCW_USE_M_AXI_GP0 {1} CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]

# Connect the FCLK_CLK0 to the PS GP0
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK]

# Add the concat for the interrupts
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat xlconcat_0
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins processing_system7_0/IRQ_F2P]
set_property -dict [list CONFIG.NUM_PORTS {2}] [get_bd_cells xlconcat_0]

# Add the AXI DMA and run connection automation
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma axi_dma_0
set_property -dict [list CONFIG.c_sg_include_stscntrl_strm {0}] [get_bd_cells axi_dma_0]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/processing_system7_0/M_AXI_GP0" Clk "Auto" }  [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/axi_dma_0/M_AXI_SG" Clk "Auto" }  [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Slave "/processing_system7_0/S_AXI_HP0" Clk "Auto" }  [get_bd_intf_pins axi_dma_0/M_AXI_MM2S]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Slave "/processing_system7_0/S_AXI_HP0" Clk "Auto" }  [get_bd_intf_pins axi_dma_0/M_AXI_S2MM]

# Add the AXI-Streaming Data FIFO
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo axis_data_fifo_0
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]
connect_bd_net -net [get_bd_nets processing_system7_0_FCLK_CLK0] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0]

# Connect interrupts

connect_bd_net [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins xlconcat_0/In1]


# Restore current instance
current_bd_instance $oldCurInst

save_bd_design


regenerate_bd_layout

save_bd_design

validate_bd_design

save_bd_design



delete_bd_objs [get_bd_intf_nets axis_data_fifo_0_M_AXIS]
connect_bd_net [get_bd_pins axis_data_fifo_0/m_axis_tdata] [get_bd_pins axi_dma_0/s_axis_s2mm_tdata]
connect_bd_net [get_bd_pins axis_data_fifo_0/m_axis_tkeep] [get_bd_pins axi_dma_0/s_axis_s2mm_tkeep]
connect_bd_net [get_bd_pins axis_data_fifo_0/m_axis_tlast] [get_bd_pins axi_dma_0/s_axis_s2mm_tlast]
connect_bd_net [get_bd_pins axis_data_fifo_0/m_axis_tready] [get_bd_pins axi_dma_0/s_axis_s2mm_tready]
connect_bd_net [get_bd_pins axis_data_fifo_0/m_axis_tvalid] [get_bd_pins axi_dma_0/s_axis_s2mm_tvalid]




delete_bd_objs [get_bd_intf_nets axi_dma_0_M_AXIS_MM2S]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tdata] [get_bd_pins axi_dma_0/m_axis_mm2s_tdata]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tkeep] [get_bd_pins axi_dma_0/m_axis_mm2s_tkeep]
connect_bd_net [get_bd_pins axi_dma_0/m_axis_mm2s_tlast] [get_bd_pins axis_data_fifo_0/s_axis_tlast]
connect_bd_net [get_bd_pins axi_dma_0/m_axis_mm2s_tready] [get_bd_pins axis_data_fifo_0/s_axis_tready]
connect_bd_net [get_bd_pins axi_dma_0/m_axis_mm2s_tvalid] [get_bd_pins axis_data_fifo_0/s_axis_tvalid]


validate_bd_design

regenerate_bd_layout

save_bd_design


generate_target all [get_files  $origin_dir/$design_name/zedboard_axi_dma.srcs/sources_1/bd/zedboard_axi_dma/zedboard_axi_dma.bd]


catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_processing_system7_0_0] }
catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_axi_dma_0_0] }
catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_rst_ps7_0_102M_0] }
catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_xbar_0] }
catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_axis_data_fifo_0_0] }
catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_auto_pc_0] }
catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_auto_us_0] }
catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_auto_us_1] }
catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_auto_us_2] }
catch { config_ip_cache -export [get_ips -all zedboard_axi_dma_auto_pc_1] }
export_ip_user_files -of_objects [get_files $origin_dir/$design_name/zedboard_axi_dma.srcs/sources_1/bd/zedboard_axi_dma/zedboard_axi_dma.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] $origin_dir/$design_name/zedboard_axi_dma.srcs/sources_1/bd/zedboard_axi_dma/zedboard_axi_dma.bd]
launch_runs -jobs 8 {zedboard_axi_dma_processing_system7_0_0_synth_1 zedboard_axi_dma_axi_dma_0_0_synth_1 zedboard_axi_dma_rst_ps7_0_102M_0_synth_1 zedboard_axi_dma_xbar_0_synth_1 zedboard_axi_dma_axis_data_fifo_0_0_synth_1 zedboard_axi_dma_auto_pc_0_synth_1 zedboard_axi_dma_auto_us_0_synth_1 zedboard_axi_dma_auto_us_1_synth_1 zedboard_axi_dma_auto_us_2_synth_1 zedboard_axi_dma_auto_pc_1_synth_1}


update_compile_order -fileset sources_1

generate_target all [get_files  $origin_dir/$design_name/zedboard_axi_dma.srcs/sources_1/bd/zedboard_axi_dma/zedboard_axi_dma.bd]


export_ip_user_files -of_objects [get_files $origin_dir/$design_name/zedboard_axi_dma.srcs/sources_1/bd/zedboard_axi_dma/zedboard_axi_dma.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] $origin_dir/$design_name/zedboard_axi_dma.srcs/sources_1/bd/zedboard_axi_dma/zedboard_axi_dma.bd]
export_simulation -of_objects [get_files $origin_dir/$design_name/zedboard_axi_dma.srcs/sources_1/bd/zedboard_axi_dma/zedboard_axi_dma.bd] -directory $origin_dir/$design_name/zedboard_axi_dma.ip_user_files/sim_scripts -ip_user_files_dir $origin_dir/$design_name/zedboard_axi_dma.ip_user_files -ipstatic_source_dir $origin_dir/$design_name/zedboard_axi_dma.ip_user_files/ipstatic -lib_map_path [list {modelsim=$origin_dir/$design_name/zedboard_axi_dma.cache/compile_simlib/modelsim} {questa=$origin_dir/$design_name/zedboard_axi_dma.cache/compile_simlib/questa} {ies=$origin_dir/$design_name/zedboard_axi_dma.cache/compile_simlib/ies} {xcelium=$origin_dir/$design_name/zedboard_axi_dma.cache/compile_simlib/xcelium} {vcs=$origin_dir/$design_name/zedboard_axi_dma.cache/compile_simlib/vcs} {riviera=$origin_dir/$design_name/zedboard_axi_dma.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet


update_compile_order -fileset sources_1
make_wrapper -files [get_files $origin_dir/$design_name/zedboard_axi_dma.srcs/sources_1/bd/zedboard_axi_dma/zedboard_axi_dma.bd] -top
add_files -norecurse $origin_dir/$design_name/zedboard_axi_dma.srcs/sources_1/bd/zedboard_axi_dma/hdl/zedboard_axi_dma_wrapper.v




launch_runs synth_1 -jobs 8


launch_runs impl_1 -to_step write_bitstream -jobs 8

