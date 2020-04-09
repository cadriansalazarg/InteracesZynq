## Para lanzar este script, Vivado siempre deberá ejecutarse en la raíz de la carpeta Vivado, de lo contrario, si se hace dentro de la carpeta script,
## elproyecto se caerá ya que no encontrará ni el IP personalizado ni los archivos fuentes de Verilog.

## Comando Linux ejecutado dentro de un tcl file para borrar algún proyecto anterior que impida que este sea lanzado
exec rm -rf project_1/ vivado.*

create_project project_1 project_1 -part xc7z020clg484-1

set_property board_part em.avnet.com:zed:part0:1.4 [current_project]

add_files -norecurse {src_Verilog/inverter.v}

update_compile_order -fileset sources_1

update_compile_order -fileset sources_1

set_property  ip_repo_paths  ../hls/hls_customized_hw_prj/solution1/impl/ip [current_project]
update_ip_catalog


create_bd_design "design_1"

update_compile_order -fileset sources_1


## Se agrega el Zynq
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

## Se agrega el Ip customizado
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:customized_IP_block:1.0 customized_IP_block_0
endgroup

# Se agrega el IP propietario FIFO Generator 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_0
endgroup

# Se agrega dos inversores
create_bd_cell -type module -reference inverter inverter_0

create_bd_cell -type module -reference inverter inverter_1


# Se agrega el AXI DMA

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
endgroup

# Se agrega el bloque concat el cual se usará para conectar las dos interrupciones del DMA

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup

# Se agrega un bloque de una constante con un valor igual a 1, para conectar a un valor lógico uno, el puerto ap_start

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
endgroup

# Se agrega el AXI Timer para las mediciones de tiempo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0
endgroup

# Se conecta el Zynq a la memoria
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]


# Se le configuran la Zynq para que opere con la plantilla de la ZedBoard y se configura el puerto de interrupciones
startgroup
set_property -dict [list CONFIG.preset {ZedBoard}] [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]
endgroup

# Se habilita el puerto de HP en la Zynq
startgroup
set_property -dict [list CONFIG.PCW_USE_S_AXI_HP0 {1}] [get_bd_cells processing_system7_0]
endgroup


# Se configura el tamaño y la profundidad de la FIFO en el FIFO Generator
#set_property -dict [list CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {2048} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {2048} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Data_Count_Width {4} CONFIG.Write_Data_Count_Width {4} CONFIG.Read_Data_Count_Width {4} CONFIG.Full_Threshold_Assert_Value {14} CONFIG.Full_Threshold_Negate_Value {13} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]



# Se configura el modo de lectura del FIFO Generator con la opción First Word Fall Through, es imprescindible que se use este modo de lectura 
# cuando se pretende comunicar un IP customizado elaborado en Vivado HLS, cuyas interfaces de I/O son de tipo ap_fifo, y se pretenda comunicar
# esta con el IP Fifo Generator.
#startgroup
#set_property -dict [list CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {12} CONFIG.Write_Data_Count_Width {5} CONFIG.Read_Data_Count_Width {5} CONFIG.Full_Threshold_Assert_Value {15} CONFIG.Full_Threshold_Negate_Value {14} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_0]
#endgroup


set_property -dict [list CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {2048} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {2048} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {12} CONFIG.Write_Data_Count_Width {12} CONFIG.Read_Data_Count_Width {12} CONFIG.Full_Threshold_Assert_Value {2047} CONFIG.Full_Threshold_Negate_Value {2046} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_0]


# Se desabilita el modo Scatter/Gather del DMA, esto estará bajo testeo
startgroup
set_property -dict [list CONFIG.c_include_sg {0}] [get_bd_cells axi_dma_0]
delete_bd_objs [get_bd_intf_nets axi_dma_0_M_AXI_SG]
endgroup

# Se ajusta el valor de Width Register Length Buffer a 16, se supone que el máximo tamaño de datos que va a enviar plasticNet es 
# 8kB, por lo tanto, dado que  8kB es equivalente 8192B, lo que implica que son 65536 bits, y considerando que un entero tiene 32 bits,
# esto significa que se pueden enviar un máximo de 2048 enteros. El Width Register Length Buffer define el tamaño en bits del buffer
# que voy a utilizar, por lo tanto, si este parámetro se coloca en 16, el total de bits que voy a poder enviar es 2^16,lo cual es equivalente
# a 65536 bits. Por lo tanto, eeste párametro debe ajustarse a 16, considerando que el máximo mensaje a enviar por PlasticNet es 8kB.

# Leer el tutorial DMA completo para entender como funciona https://www.xilinx.com/support/documentation/ip_documentation/axi_dma/v7_1/pg021_axi_dma.pdf

# Una guía muy útil se muestra en: https://forums.xilinx.com/t5/Processor-System-Design/Axi-DMA-correct-parameters/td-p/639576
# Aquí se explican estos parámetros y como setearlos adecuadamente

startgroup
set_property -dict [list CONFIG.c_sg_length_width {16}] [get_bd_cells axi_dma_0]
endgroup


# Se configura el tamaño del concat a tres puertos de entrada, ya que se van a usar tres interrupciones, dos del DMA y una del AXI Timer
startgroup
set_property -dict [list CONFIG.NUM_PORTS {3}] [get_bd_cells xlconcat_0]
endgroup

# Se auto interconecta todo lo que es posible interconectar de forma automática

startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/axi_dma_0/M_AXI_MM2S} Slave {/processing_system7_0/S_AXI_HP0} intc_ip {Auto} master_apm {0}}  [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_0/clk]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_dma_0/S_AXI_LITE} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_xbar {/processing_system7_0/FCLK_CLK0 (100 MHz)} Master {/axi_dma_0/M_AXI_S2MM} Slave {/processing_system7_0/S_AXI_HP0} intc_ip {/axi_smc} master_apm {0}}  [get_bd_intf_pins axi_dma_0/M_AXI_S2MM]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_slave {Auto} Clk_xbar {/processing_system7_0/FCLK_CLK0 (100 MHz)} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_timer_0/S_AXI} intc_ip {/ps7_0_axi_periph} master_apm {0}}  [get_bd_intf_pins axi_timer_0/S_AXI]
endgroup

# Se conecta manualmente las tres: dos interrupciones del dma en  dos entradas del bloque concat y una interrupción del AXI Timer en el puerto de entrada restante y la salida del bloque concat, se conecta a la entrada de interrupciones del Zynq
connect_bd_net [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins axi_timer_0/interrupt] [get_bd_pins xlconcat_0/In2]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins processing_system7_0/IRQ_F2P]


# Se conecta manualmente el reset del IP FIFO generator, Oberve que el FIFO generator tienen el reset invertido con respecto a los demás módulos
connect_bd_net [get_bd_pins rst_ps7_0_100M/peripheral_reset] [get_bd_pins fifo_generator_0/srst]

# Se conecta el puerto de datos de salida del FIFO del IP customizado, a la entrada del IP FIFO Generator
connect_bd_net [get_bd_pins customized_IP_block_0/out_fifo_V_din] [get_bd_pins fifo_generator_0/din]


# La bandera de  salida full, del IP FIFO Generator, se conecta a la entrada de un inversor.
# Nota: Se invierte está bandera ya que el HLS genera una bandera llamada, no full, y el 
# IP de Xilinx, el FIFO Generator, requiere una bandera full. Por lo tanto, se invierte para
# que exista compatibilidad
connect_bd_net [get_bd_pins customized_IP_block_0/out_fifo_V_full_n] [get_bd_pins inverter_1/Y]

connect_bd_net [get_bd_pins inverter_1/A] [get_bd_pins fifo_generator_0/full]

# Se interconecta la bandera del write
connect_bd_net [get_bd_pins fifo_generator_0/wr_en] [get_bd_pins customized_IP_block_0/out_fifo_V_write]


# Se interconecta la salida de todos del sumador a la salida del FIFO GEnerator
connect_bd_net [get_bd_pins customized_IP_block_0/in_fifo_V_dout] [get_bd_pins fifo_generator_0/dout]

# Se conecta la bandera de read entre el IP pérsonalizado y el FIFO Generator
connect_bd_net [get_bd_pins customized_IP_block_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]


# La bandera de  salida empty, del IP FIFO Generator, se conecta a la entrada de un inversor.
# Nota: Se invierte está bandera ya que el HLS genera una bandera llamada, no empty, y el 
# IP de Xilinx, el FIFO Generator, requiere una bandera empty. Por lo tanto, se invierte para
# que exista compatibilidad
connect_bd_net [get_bd_pins fifo_generator_0/empty] [get_bd_pins inverter_0/A]

connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins customized_IP_block_0/in_fifo_V_empty_n]


## Se conectan individualmente las señales de entrada del IP con el puerto del DMA llamado S_AXIS_S2MM
connect_bd_net [get_bd_pins customized_IP_block_0/input_r_TDATA] [get_bd_pins axi_dma_0/m_axis_mm2s_tdata] 
connect_bd_net [get_bd_pins customized_IP_block_0/input_r_TLAST] [get_bd_pins axi_dma_0/m_axis_mm2s_tlast]
connect_bd_net [get_bd_pins customized_IP_block_0/input_r_TREADY] [get_bd_pins axi_dma_0/m_axis_mm2s_tready]
connect_bd_net [get_bd_pins customized_IP_block_0/input_r_TVALID] [get_bd_pins axi_dma_0/m_axis_mm2s_tvalid]

# Se conectan individualmente las señales de la salida del IP con el puerto del DMA llamado 
connect_bd_net [get_bd_pins customized_IP_block_0/output_r_TVALID] [get_bd_pins axi_dma_0/s_axis_s2mm_tvalid]
connect_bd_net [get_bd_pins customized_IP_block_0/output_r_TREADY] [get_bd_pins axi_dma_0/s_axis_s2mm_tready]
connect_bd_net [get_bd_pins customized_IP_block_0/output_r_TDATA] [get_bd_pins axi_dma_0/s_axis_s2mm_tdata]
connect_bd_net [get_bd_pins customized_IP_block_0/output_r_TLAST] [get_bd_pins axi_dma_0/s_axis_s2mm_tlast]

# se interconecta el reloj y el reset del IP 
connect_bd_net [get_bd_pins customized_IP_block_0/ap_clk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins customized_IP_block_0/ap_rst_n] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]

# Se interconecta la señal de 1 al puerto de ap_start del IP y se interconecta el puerto ap_ready junto con el puerto ap_continue
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins customized_IP_block_0/ap_start]
connect_bd_net [get_bd_pins customized_IP_block_0/ap_continue] [get_bd_pins customized_IP_block_0/ap_ready]

# Se regenera el layout

update_compile_order -fileset sources_1
regenerate_bd_layout

save_bd_design

validate_bd_design

save_bd_design

## Create output products

generate_target all [get_files  project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]

catch { config_ip_cache -export [get_ips -all design_1_processing_system7_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_customized_IP_block_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_axi_dma_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_axi_timer_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_axi_smc_0] }
catch { config_ip_cache -export [get_ips -all design_1_rst_ps7_0_100M_0] }
catch { config_ip_cache -export [get_ips -all design_1_xbar_0] }
catch { config_ip_cache -export [get_ips -all design_1_auto_pc_0] }

export_ip_user_files -of_objects [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]
launch_runs -jobs 8 {design_1_processing_system7_0_0_synth_1 design_1_customized_IP_block_0_0_synth_1 design_1_fifo_generator_0_0_synth_1 design_1_inverter_0_0_synth_1 design_1_inverter_1_0_synth_1 design_1_axi_dma_0_0_synth_1 design_1_axi_timer_0_0_synth_1 design_1_axi_smc_0_synth_1 design_1_rst_ps7_0_100M_0_synth_1 design_1_xbar_0_synth_1 design_1_auto_pc_0_synth_1}

export_simulation -of_objects [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -directory project_1/project_1.ip_user_files/sim_scripts -ip_user_files_dir project_1.ip_user_files -ipstatic_source_dir project_1/project_1.ip_user_files/ipstatic -lib_map_path [list {modelsim=project_1/project_1.cache/compile_simlib/modelsim} {questa=project_1/project_1.cache/compile_simlib/questa} {ies=project_1/project_1.cache/compile_simlib/ies} {xcelium=project_1/project_1.cache/compile_simlib/xcelium} {vcs=project_1/project_1.cache/compile_simlib/vcs} {riviera=project_1/project_1.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet


## Create HDL Wrapper

make_wrapper -files [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse project_1/project_1.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1


## Se sintetiza el diseño

launch_runs synth_1 -jobs 8

## Se implementa el diseño y se genera el bitstream

launch_runs impl_1 -to_step write_bitstream -jobs 8
