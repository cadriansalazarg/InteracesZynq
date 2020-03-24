################################################################
# Block diagram build script
################################################################

## Todo este script fue constuido usando los siguientes tres tutoriales:
## https://www.xilinx.com/support/documentation/application_notes/xapp1170-zynq-hls.pdf
## https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug871-vivado-high-level-synthesis-tutorial.pdf
## http://www.fpgadeveloper.com/2014/08/using-the-axi-dma-in-vivado.html

set design_name Vvd_Prjct_DMA_IP

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

# Se agrega el Zynq al proyecto

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

# Se carga el IP en la biblioteca de repositorios

set_property  ip_repo_paths  ../hls/hls_loop_back_axi_stream_prj/solution1/impl/ip [current_project]
update_ip_catalog



# Se agrega el IP
open_bd_design {Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.srcs/sources_1/bd/Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.bd}
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:loopback:1.0 loopback_0
endgroup



# Se agrega el DMA

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
endgroup

# Se conecta con la memoria RAM

apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_dma_0/S_AXI_LITE} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_dma_0/S_AXI_LITE]


apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

# Se habilita que sea la Zynq igual al del ZEDBOARD
startgroup
set_property -dict [list CONFIG.preset {ZedBoard}] [get_bd_cells processing_system7_0]
endgroup

# Se habilita los puertos de Slave de HP del Zynq

startgroup
set_property -dict [list CONFIG.PCW_USE_S_AXI_HP0 {1}] [get_bd_cells processing_system7_0]
endgroup

# Se autoconecta todo

apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/axi_dma_0/M_AXI_SG} Slave {/processing_system7_0/S_AXI_HP0} intc_ip {Auto} master_apm {0}}  [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_xbar {/processing_system7_0/FCLK_CLK0 (100 MHz)} Master {/axi_dma_0/M_AXI_MM2S} Slave {/processing_system7_0/S_AXI_HP0} intc_ip {/axi_smc} master_apm {0}}  [get_bd_intf_pins axi_dma_0/M_AXI_MM2S]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_xbar {/processing_system7_0/FCLK_CLK0 (100 MHz)} Master {/axi_dma_0/M_AXI_S2MM} Slave {/processing_system7_0/S_AXI_HP0} intc_ip {/axi_smc} master_apm {0}}  [get_bd_intf_pins axi_dma_0/M_AXI_S2MM]
endgroup


## Se conectan individualmente las señales de entrada del IP al DMA

connect_bd_net [get_bd_pins axi_dma_0/m_axis_mm2s_tdata] [get_bd_pins loopback_0/input_r_TDATA]
connect_bd_net [get_bd_pins loopback_0/input_r_TLAST] [get_bd_pins axi_dma_0/m_axis_mm2s_tlast]
connect_bd_net [get_bd_pins loopback_0/input_r_TREADY] [get_bd_pins axi_dma_0/m_axis_mm2s_tready]
connect_bd_net [get_bd_pins loopback_0/input_r_TVALID] [get_bd_pins axi_dma_0/m_axis_mm2s_tvalid]


# Se conectan individualmente las señales de la salida del IP al DMA

connect_bd_net [get_bd_pins loopback_0/output_r_TVALID] [get_bd_pins axi_dma_0/s_axis_s2mm_tvalid]
connect_bd_net [get_bd_pins loopback_0/output_r_TREADY] [get_bd_pins axi_dma_0/s_axis_s2mm_tready]
connect_bd_net [get_bd_pins loopback_0/output_r_TDATA] [get_bd_pins axi_dma_0/s_axis_s2mm_tdata]
connect_bd_net [get_bd_pins loopback_0/output_r_TLAST] [get_bd_pins axi_dma_0/s_axis_s2mm_tlast]

# se interconecta el AXI Lite del IP al AXI INTERCONNECT

update_compile_order -fileset sources_1
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_slave {Auto} Clk_xbar {/processing_system7_0/FCLK_CLK0 (100 MHz)} Master {/processing_system7_0/M_AXI_GP0} Slave {/loopback_0/s_axi_AXILiteS} intc_ip {/ps7_0_axi_periph} master_apm {0}}  [get_bd_intf_pins loopback_0/s_axi_AXILiteS]


## Se quita los registros de control de status del DMA

startgroup
set_property -dict [list CONFIG.c_sg_include_stscntrl_strm {0}] [get_bd_cells axi_dma_0]
endgroup


# Se desabilita el modo Scatter/Gather del DMA, esto estará bajo testeo

startgroup
set_property -dict [list CONFIG.c_include_sg {0}] [get_bd_cells axi_dma_0]
delete_bd_objs [get_bd_intf_nets axi_dma_0_M_AXI_SG]
endgroup


# Se habilitan las interrupciones del Zynq

startgroup
set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]
endgroup


# Se agrega el elemento concat, para agregar las tres interrupciones y poderlas conectar al puerto de interrupciones del Zynq

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup

# Por defecto aparecen dos puertos, pero como se tienen dos interrupciones del DMA más una interrupción del IP, se le extiende el número de puertos a 3 al bloque concat

set_property -dict [list CONFIG.NUM_PORTS {3}] [get_bd_cells xlconcat_0]

# Se conecta el puerto de interrupción del Zynq a la salida del módulo concat

connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins processing_system7_0/IRQ_F2P]

# Se conectan las tres interrupciones a los puertos de entrada del módulo concat, dos del DMA y una del HLS

connect_bd_net [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins loopback_0/interrupt] [get_bd_pins xlconcat_0/In2]

# Se regenera el layout para que este de forma estándar sin importar la PC

regenerate_bd_layout


# Se guarda el diseño

save_bd_design

# Se valida el diseño

validate_bd_design


# Se guarda nuevamente el diseño

save_bd_design


# Se le da la opción de Generate Output Product


generate_target all [get_files  Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.srcs/sources_1/bd/Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.bd]

catch { config_ip_cache -export [get_ips -all Vvd_Prjct_DMA_IP_processing_system7_0_0] }
catch { config_ip_cache -export [get_ips -all Vvd_Prjct_DMA_IP_loopback_0_0] }
catch { config_ip_cache -export [get_ips -all Vvd_Prjct_DMA_IP_axi_dma_0_0] }
catch { config_ip_cache -export [get_ips -all Vvd_Prjct_DMA_IP_xbar_0] }
catch { config_ip_cache -export [get_ips -all Vvd_Prjct_DMA_IP_rst_ps7_0_50M_0] }
catch { config_ip_cache -export [get_ips -all Vvd_Prjct_DMA_IP_axi_smc_0] }
catch { config_ip_cache -export [get_ips -all Vvd_Prjct_DMA_IP_auto_pc_0] }

export_ip_user_files -of_objects [get_files Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.srcs/sources_1/bd/Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.bd] -no_script -sync -force -quiet

create_ip_run [get_files -of_objects [get_fileset sources_1] Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.srcs/sources_1/bd/Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.bd]

launch_runs -jobs 8 {Vvd_Prjct_DMA_IP_processing_system7_0_0_synth_1 Vvd_Prjct_DMA_IP_loopback_0_0_synth_1 Vvd_Prjct_DMA_IP_axi_dma_0_0_synth_1 Vvd_Prjct_DMA_IP_xbar_0_synth_1 Vvd_Prjct_DMA_IP_rst_ps7_0_50M_0_synth_1 Vvd_Prjct_DMA_IP_axi_smc_0_synth_1 Vvd_Prjct_DMA_IP_auto_pc_0_synth_1}

export_simulation -of_objects [get_files Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.srcs/sources_1/bd/Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.bd] -directory Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.ip_user_files/sim_scripts -ip_user_files_dir Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.ip_user_files -ipstatic_source_dir Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.ip_user_files/ipstatic -lib_map_path [list {modelsim=Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.cache/compile_simlib/modelsim} {questa=Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.cache/compile_simlib/questa} {ies=Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.cache/compile_simlib/ies} {xcelium=Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.cache/compile_simlib/xcelium} {vcs=Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.cache/compile_simlib/vcs} {riviera=Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet



# Se le da la opción de Create HDL Wrapper

make_wrapper -files [get_files Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.srcs/sources_1/bd/Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.bd] -top
add_files -norecurse Vvd_Prjct_DMA_IP/Vvd_Prjct_DMA_IP.srcs/sources_1/bd/Vvd_Prjct_DMA_IP/hdl/Vvd_Prjct_DMA_IP_wrapper.v


# Se sintetiza el diseño

launch_runs synth_1 -jobs 8

# Se implementa el diseño

launch_runs impl_1 -jobs 8

# Se genera el bitstream

launch_runs impl_1 -to_step write_bitstream -jobs 8
