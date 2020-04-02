exec rm -rf project_vivado_Axi_lite/ vivado.*

create_project project_vivado_Axi_lite project_vivado_Axi_lite -part xc7z020clg484-1

set_property board_part em.avnet.com:zed:part0:1.4 [current_project]

# Se agrega el IP creado en el HLS

set_property  ip_repo_paths  ../hls/FirstTest/solution1/impl/ip [current_project]
update_ip_catalog

# Se crea un espacio de diseño en el block design

create_bd_design "design_1"
update_compile_order -fileset sources_1

# Se agrega el Zynq

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

# Se agrega el IP del sumamdor

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:adder:1.0 adder_0
endgroup

apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]


# Se agrega el AXI Timer

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0
endgroup

# Se agrega el bloque concat para interconectar la interrupció´n del IP y la del AXI Timer a las interrupciones del Zynq

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup

# Se interconectan todos los bloques

startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/adder_0/s_axi_AXILiteS} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins adder_0/s_axi_AXILiteS]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_timer_0/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_timer_0/S_AXI]
endgroup

# Se cambia la Zynq a que por defecto este configurada para la ZedBoard y se agrega el puerto de interrupciones

startgroup
set_property -dict [list CONFIG.preset {ZedBoard}] [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]
endgroup

# Se interconectan a la entrada del concat, la interrupción del IP y la interrupción del Timer y luego la salida del concat se conecta al puerto de entrada de interrupciones del Zynq

connect_bd_net [get_bd_pins adder_0/interrupt] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins axi_timer_0/interrupt] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins processing_system7_0/IRQ_F2P]

# Se regenera el layout

regenerate_bd_layout

# Se guarda el diseño

save_bd_design

# Se valida el diseño

validate_bd_design

# Se guarda el diseño

save_bd_design

# Se le da la opción de Generate Output Products

generate_target all [get_files  project_vivado_Axi_lite/project_vivado_Axi_lite.srcs/sources_1/bd/design_1/design_1.bd]
catch { config_ip_cache -export [get_ips -all design_1_processing_system7_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_adder_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_axi_timer_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_xbar_0] }
catch { config_ip_cache -export [get_ips -all design_1_rst_ps7_0_100M_0] }
catch { config_ip_cache -export [get_ips -all design_1_auto_pc_0] }
export_ip_user_files -of_objects [get_files project_vivado_Axi_lite/project_vivado_Axi_lite.srcs/sources_1/bd/design_1/design_1.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] project_vivado_Axi_lite/project_vivado_Axi_lite.srcs/sources_1/bd/design_1/design_1.bd]
launch_runs -jobs 32 {design_1_processing_system7_0_0_synth_1 design_1_adder_0_0_synth_1 design_1_axi_timer_0_0_synth_1 design_1_xbar_0_synth_1 design_1_rst_ps7_0_100M_0_synth_1 design_1_auto_pc_0_synth_1}
export_simulation -of_objects [get_files project_vivado_Axi_lite/project_vivado_Axi_lite.srcs/sources_1/bd/design_1/design_1.bd] -directory project_vivado_Axi_lite/project_vivado_Axi_lite.ip_user_files/sim_scripts -ip_user_files_dir project_vivado_Axi_lite/project_vivado_Axi_lite.ip_user_files -ipstatic_source_dir project_vivado_Axi_lite/project_vivado_Axi_lite.ip_user_files/ipstatic -lib_map_path [list {modelsim=project_vivado_Axi_lite/project_vivado_Axi_lite.cache/compile_simlib/modelsim} {questa=project_vivado_Axi_lite/project_vivado_Axi_lite.cache/compile_simlib/questa} {ies=project_vivado_Axi_lite.cache/compile_simlib/ies} {xcelium=project_vivado_Axi_lite/project_vivado_Axi_lite.cache/compile_simlib/xcelium} {vcs=project_vivado_Axi_lite/project_vivado_Axi_lite.cache/compile_simlib/vcs} {riviera=project_vivado_Axi_lite/project_vivado_Axi_lite.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet

# Se le da la opción de Create HDL Wrapper

make_wrapper -files [get_files project_vivado_Axi_lite/project_vivado_Axi_lite.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse project_vivado_Axi_lite/project_vivado_Axi_lite.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v


# Se sintetiza el diseño

launch_runs synth_1 -jobs 32

# Se implementa el diseño y se genera el bitstream

launch_runs impl_1 -to_step write_bitstream -jobs 32

