start_gui
create_project project_1 project_1 -part xc7z020clg484-1
set_property board_part em.avnet.com:zed:part0:1.4 [current_project]
add_files -norecurse src_Verilog/Library.sv
update_compile_order -fileset sources_1
add_files -norecurse src_Verilog/fifo.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V.v
add_files -norecurse src_Verilog/inverter.v
update_compile_order -fileset sources_1



update_compile_order -fileset sources_1
set_property  ip_repo_paths  ../hls/hls_sumador_prj/solution1/impl/ip [current_project]
update_ip_catalog
create_ip -name sumador_stream -vendor xilinx.com -library hls -version 1.0 -module_name sumador_stream_0
update_compile_order -fileset sources_1

create_bd_design "design_1"

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V prll_bs_gnrtr_n_rbtr_0
create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4
create_bd_cell -type module -reference inverter inverter_5

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_1
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_2
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_3
endgroup

apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

startgroup
set_property -dict [list CONFIG.preset {ZedBoard}] [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:sumador_stream:1.0 sumador_stream_0
endgroup

set_property -dict [list CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {16} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {16} CONFIG.Data_Count_Width {4} CONFIG.Write_Data_Count_Width {4} CONFIG.Read_Data_Count_Width {4} CONFIG.Full_Threshold_Assert_Value {14} CONFIG.Full_Threshold_Negate_Value {13}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {16} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {16} CONFIG.Data_Count_Width {4} CONFIG.Write_Data_Count_Width {4} CONFIG.Read_Data_Count_Width {4} CONFIG.Full_Threshold_Assert_Value {14} CONFIG.Full_Threshold_Negate_Value {13}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {16} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {16} CONFIG.Data_Count_Width {4} CONFIG.Write_Data_Count_Width {4} CONFIG.Read_Data_Count_Width {4} CONFIG.Full_Threshold_Assert_Value {14} CONFIG.Full_Threshold_Negate_Value {13}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {16} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {16} CONFIG.Data_Count_Width {4} CONFIG.Write_Data_Count_Width {4} CONFIG.Read_Data_Count_Width {4} CONFIG.Full_Threshold_Assert_Value {14} CONFIG.Full_Threshold_Negate_Value {13}] [get_bd_cells fifo_generator_3]

startgroup
set_property -dict [list CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {5} CONFIG.Write_Data_Count_Width {5} CONFIG.Read_Data_Count_Width {5} CONFIG.Full_Threshold_Assert_Value {15} CONFIG.Full_Threshold_Negate_Value {14} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_0]
endgroup

startgroup
set_property -dict [list CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {5} CONFIG.Write_Data_Count_Width {5} CONFIG.Read_Data_Count_Width {5} CONFIG.Full_Threshold_Assert_Value {15} CONFIG.Full_Threshold_Negate_Value {14} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_1]
endgroup

startgroup
set_property -dict [list CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {5} CONFIG.Write_Data_Count_Width {5} CONFIG.Read_Data_Count_Width {5} CONFIG.Full_Threshold_Assert_Value {15} CONFIG.Full_Threshold_Negate_Value {14} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_2]
endgroup

startgroup
set_property -dict [list CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {5} CONFIG.Write_Data_Count_Width {5} CONFIG.Read_Data_Count_Width {5} CONFIG.Full_Threshold_Assert_Value {15} CONFIG.Full_Threshold_Negate_Value {14} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_3]
endgroup

set_property location {1 -395 149} [get_bd_cells processing_system7_0]
set_property location {1 -321 539} [get_bd_cells sumador_stream_0]
set_property location {2 41 211} [get_bd_cells inverter_1]
set_property location {4 383 331} [get_bd_cells inverter_3]
set_property location {3 224 744} [get_bd_cells inverter_2]
set_property location {3 211 818} [get_bd_cells inverter_5]
set_property location {5 673 726} [get_bd_cells fifo_generator_2]
set_property location {6 949 534} [get_bd_cells inverter_0]
set_property location {6 951 952} [get_bd_cells inverter_4]
set_property location {7 1271 444} [get_bd_cells fifo_generator_1]
set_property location {7 1245 764} [get_bd_cells prll_bs_gnrtr_n_rbtr_0]
set_property location {8 1672 525} [get_bd_cells fifo_generator_0]
set_property location {8 1669 895} [get_bd_cells fifo_generator_3]

connect_bd_net [get_bd_pins sumador_stream_0/interrupt] [get_bd_pins processing_system7_0/IRQ_F2P]
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_1/A]
connect_bd_net [get_bd_pins inverter_1/Y] [get_bd_pins sumador_stream_0/out_fifo_drvr_0_V_full_n]
connect_bd_net [get_bd_pins sumador_stream_0/out_fifo_drvr_0_V_write] [get_bd_pins fifo_generator_1/wr_en]
connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins sumador_stream_0/out_fifo_drvr_0_V_din]

connect_bd_net [get_bd_pins fifo_generator_1/empty] [get_bd_pins inverter_0/A]
connect_bd_net [get_bd_pins fifo_generator_1/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_0_0]
connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_0_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_0_0] [get_bd_pins fifo_generator_1/rd_en]

connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_0_0] [get_bd_pins fifo_generator_0/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_0_0] [get_bd_pins fifo_generator_0/wr_en]
connect_bd_net [get_bd_pins fifo_generator_0/empty] [get_bd_pins inverter_3/A]
connect_bd_net [get_bd_pins inverter_3/Y] [get_bd_pins sumador_stream_0/in_fifo_drvr_0_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_0/rd_en] [get_bd_pins sumador_stream_0/in_fifo_drvr_0_V_read]
connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins sumador_stream_0/in_fifo_drvr_0_V_dout]
connect_bd_net [get_bd_pins sumador_stream_0/out_fifo_drvr_1_V_din] [get_bd_pins fifo_generator_2/din]
connect_bd_net [get_bd_pins fifo_generator_2/wr_en] [get_bd_pins sumador_stream_0/out_fifo_drvr_1_V_write]
connect_bd_net [get_bd_pins fifo_generator_2/full] [get_bd_pins inverter_2/A]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins sumador_stream_0/out_fifo_drvr_1_V_full_n]
connect_bd_net [get_bd_pins fifo_generator_2/empty] [get_bd_pins inverter_5/A]
connect_bd_net [get_bd_pins inverter_5/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_0_1]
connect_bd_net [get_bd_pins fifo_generator_2/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_0_1]
connect_bd_net [get_bd_pins fifo_generator_2/rd_en] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_0_1]
connect_bd_net [get_bd_pins fifo_generator_3/empty] [get_bd_pins inverter_4/A]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins sumador_stream_0/in_fifo_drvr_1_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_3/dout] [get_bd_pins sumador_stream_0/in_fifo_drvr_1_V_dout]

save_bd_design


update_compile_order -fileset sources_1
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_0_1] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins fifo_generator_3/wr_en] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_0_1]
connect_bd_net [get_bd_pins fifo_generator_3/rd_en] [get_bd_pins sumador_stream_0/in_fifo_drvr_1_V_read]



startgroup
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_0/clk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_1/clk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_2/clk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_3/clk]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/sumador_stream_0/s_axi_AXILiteS} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins sumador_stream_0/s_axi_AXILiteS]
endgroup

save_bd_design

connect_bd_net [get_bd_pins fifo_generator_1/srst] [get_bd_pins rst_ps7_0_100M/peripheral_reset]
connect_bd_net [get_bd_pins fifo_generator_2/srst] [get_bd_pins rst_ps7_0_100M/peripheral_reset]
connect_bd_net [get_bd_pins fifo_generator_3/srst] [get_bd_pins rst_ps7_0_100M/peripheral_reset]
connect_bd_net [get_bd_pins fifo_generator_0/srst] [get_bd_pins rst_ps7_0_100M/peripheral_reset]
delete_bd_objs [get_bd_nets rst_ps7_0_100M_peripheral_aresetn]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset] [get_bd_pins rst_ps7_0_100M/peripheral_reset]

connect_bd_net [get_bd_pins sumador_stream_0/ap_rst_n] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]
connect_bd_net [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]
connect_bd_net [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]
connect_bd_net [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]

update_compile_order -fileset sources_1
regenerate_bd_layout

save_bd_design

validate_bd_design

save_bd_design



generate_target all [get_files  project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]

catch { config_ip_cache -export [get_ips -all design_1_processing_system7_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_1_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_2_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_3_0] }
catch { config_ip_cache -export [get_ips -all design_1_sumador_stream_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_rst_ps7_0_100M_0] }
catch { config_ip_cache -export [get_ips -all design_1_auto_pc_0] }

export_ip_user_files -of_objects [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]
launch_runs -jobs 8 {design_1_processing_system7_0_0_synth_1 design_1_prll_bs_gnrtr_n_rbtr_0_0_synth_1 design_1_inverter_0_0_synth_1 design_1_inverter_1_0_synth_1 design_1_inverter_2_0_synth_1 design_1_inverter_3_0_synth_1 design_1_inverter_4_0_synth_1 design_1_inverter_5_0_synth_1 design_1_fifo_generator_0_0_synth_1 design_1_fifo_generator_1_0_synth_1 design_1_fifo_generator_2_0_synth_1 design_1_fifo_generator_3_0_synth_1 design_1_sumador_stream_0_0_synth_1 design_1_rst_ps7_0_100M_0_synth_1 design_1_auto_pc_0_synth_1}

export_simulation -of_objects [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -directory project_1/project_1.ip_user_files/sim_scripts -ip_user_files_dir project_1/project_1.ip_user_files -ipstatic_source_dir project_1/project_1.ip_user_files/ipstatic -lib_map_path [list {modelsim=project_1/project_1.cache/compile_simlib/modelsim} {questa=project_1/project_1.cache/compile_simlib/questa} {ies=project_1/project_1.cache/compile_simlib/ies} {xcelium=project_1/project_1.cache/compile_simlib/xcelium} {vcs=project_1/project_1.cache/compile_simlib/vcs} {riviera=project_1/project_1.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet

update_compile_order -fileset sources_1


### Se le da la opción de create HDL Wrapper

make_wrapper -files [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse project_1/project_1.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
update_compile_order -fileset sources_1

## Se coloca el módulo design como top

set_property top design_1_wrapper [current_fileset]
update_compile_order -fileset sources_1


## Se sintetiza el diseño

launch_runs synth_1 -jobs 8

## Se implementa y se sintetiza el diseño

launch_runs impl_1 -to_step write_bitstream -jobs 8
