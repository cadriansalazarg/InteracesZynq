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


# Se conecta el Zynq a la memoria
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]


# Se le configuran la Zynq para que opere con la plantilla de la ZedBoard y se configura el puerto de interrupciones
startgroup
set_property -dict [list CONFIG.preset {ZedBoard}] [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]
endgroup


# Se configura el tamaño y la profundidad de la FIFO en el FIFO Generator
set_property -dict [list CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {16} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {16} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Data_Count_Width {4} CONFIG.Write_Data_Count_Width {4} CONFIG.Read_Data_Count_Width {4} CONFIG.Full_Threshold_Assert_Value {14} CONFIG.Full_Threshold_Negate_Value {13} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]

# Se configura el modo de lectura del FIFO Generator con la opción First Word Fall Through, es imprescindible que se use este modo de lectura 
# cuando se pretende comunicar un IP customizado elaborado en Vivado HLS, cuyas interfaces de I/O son de tipo ap_fifo, y se pretenda comunicar
# esta con el IP Fifo Generator.
startgroup
set_property -dict [list CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {5} CONFIG.Write_Data_Count_Width {5} CONFIG.Read_Data_Count_Width {5} CONFIG.Full_Threshold_Assert_Value {15} CONFIG.Full_Threshold_Negate_Value {14} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_0]
endgroup

# Se auto interconecta todo lo que es posible interconectar de forma automática
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/customized_IP_block_0/s_axi_AXILiteS} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins customized_IP_block_0/s_axi_AXILiteS]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_0/clk]
endgroup

# Se conecta manualmente la interrupción
connect_bd_net [get_bd_pins customized_IP_block_0/interrupt] [get_bd_pins processing_system7_0/IRQ_F2P]

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

# Se regenera el layout

update_compile_order -fileset sources_1
regenerate_bd_layout

save_bd_design

validate_bd_design

save_bd_design

generate_target all [get_files  project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]

make_wrapper -files [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse project_1/project_1.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1

launch_runs impl_1 -to_step write_bitstream -jobs 32
