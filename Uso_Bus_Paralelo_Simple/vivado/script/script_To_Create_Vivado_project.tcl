# Se elimina en caso de que exista la carpeta del proyecto anterior para evitar conflictos por intentar crear un proyecto ya existente
exec rm -rf project_1/ vivado.*

# Se crea el proyecto
create_project project_1 project_1 -part xc7z020clg484-1

# Se escoge que la tarjeta sea la ZedBoard
set_property board_part em.avnet.com:zed:part0:1.4 [current_project]

# Se agrega la biblioteca de buses de Verilog, Nótese que tanto el el archivo Library.sv, como fifo.sv, se toman 
# directamente de la carpeta Buses_Serial_Paralelo, es decir, justo donde se encuentra contenido el código fuente de los
# buses. Por otra parte, el Wraper del bus, tanto en System verilog como en Verilog, se encuentra dentro de la subcarpeta
# contenida dentro de este proyecto llamada src_Verilog
add_files -norecurse ../../Buses_Serial_Paralelo/src_Verilog/Library.sv

update_compile_order -fileset sources_1
add_files -norecurse ../../Buses_Serial_Paralelo/src_Verilog/fifo.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V.v

# Se agrega el inversor en Verilog
add_files -norecurse src_Verilog/inverter.v
update_compile_order -fileset sources_1

# agrega el ip core
set_property  ip_repo_paths  ../hls/hls_customized_hw_prj/solution1/impl/ip [current_project]
update_ip_catalog

# Se crea el block design
create_bd_design "design_1"

# Se agrega el procesador Zynq
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V prll_bs_gnrtr_n_rbtr_0

create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4
create_bd_cell -type module -reference inverter inverter_5

########################################## Importante ############################################################################################

# Aunque la polaridad del puerto de reset del bus, establece en el HDL que el sistema  hace un reset cuando el puerto de reset está en alto, 
# por defecto al exportar el IP del bus, Vivado interpreta que el bus se resetea con 0, y esto genera problemas, ya que el puerto cuando se 
# interconecta automáticamente todo, será colocado en el puerto de reset con la polaridad incorrecta
# Por está razón, se cambia la polaridad del reset del bus
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /prll_bs_gnrtr_n_rbtr_0/reset]

##################################################################################################################################################


# Se agregan cuatro bloques del FIFO, para ello se utiliza el IP de Xilinx FIFO Generator
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

# Se agrega el IP customizado de Xilinx
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:customized_IP_block:1.0 customized_IP_block_0
endgroup


# Se agrega el AXI Timer
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0
endgroup

# Se agrega el bloque concat, con el objetivo de concatenar las dos interrupciones que se conectarán a la Zynq, la del custom IP block y la del AXI Timer
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup

# Se le da la opción Run Block Automation para conectar el Zynq con la RAM
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]


# Se la da la opción Run Connection Automation para interconectar de forma automática todo lo que la herramienta reconoce que debe interconectar
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_0/clk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_1/clk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_2/clk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_3/clk]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/customized_IP_block_0/s_axi_AXILiteS} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins customized_IP_block_0/s_axi_AXILiteS]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_timer_0/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_timer_0/S_AXI]
endgroup

# Se modifica el Zynq para que responda a la plantilla de la ZedBoard y se habilitan las interrupciones
startgroup
set_property -dict [list CONFIG.preset {ZedBoard}] [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]
endgroup


# Se configura adecuadamente los IPs FIFO Generator, para manejar palabras de 32 bits, una profundidad de 512 elementos y con modo de lectura First Word Fall Through
startgroup
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
endgroup

# Se conectan a las dos entradas del módulo concat, la salida de interrupción del IP y la salida de la interrupción del AXI Timer, luego se interconecta la salida del módulo concat al puerto de interrupciones de entrada del Zynq
connect_bd_net [get_bd_pins customized_IP_block_0/interrupt] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins axi_timer_0/interrupt] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins processing_system7_0/IRQ_F2P]

############## Interconexiónde la ruta de datos entre el driver 0 y el bus paralelo ############################

# Se realiza la interconexión entre el puerto de salida del IP llamado out_fifo_drvr0 y el canal de escritura de la FIFO 1
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_1/A]
connect_bd_net [get_bd_pins inverter_1/Y] [get_bd_pins customized_IP_block_0/out_fifo_drvr_0_V_full_n]
connect_bd_net [get_bd_pins customized_IP_block_0/out_fifo_drvr_0_V_write] [get_bd_pins fifo_generator_1/wr_en]
connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins customized_IP_block_0/out_fifo_drvr_0_V_din]

# realiza la conexión entre la salida de la FIFO 1 y la entrada al bus paralelo del driver 0
connect_bd_net [get_bd_pins fifo_generator_1/empty] [get_bd_pins inverter_0/A]
connect_bd_net [get_bd_pins fifo_generator_1/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_0_bus_0]
connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_0_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_0_bus_0] [get_bd_pins fifo_generator_1/rd_en]

# Se realiza la conexión del puerto de salida del drvr 0 en el bus paralelo  y el FIFO. Nóte que el bus paralelo no tiene bandera de full por lo tanto no se utiliza. Se utilizó el FIFO 0
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_0_bus_0] [get_bd_pins fifo_generator_0/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_0_bus_0] [get_bd_pins fifo_generator_0/wr_en]

# Finalmente se interconecta al puerto de  salida de la FIFO 0 con el puerto de entrada en el IP llamado in_fifo_drvr_0
connect_bd_net [get_bd_pins fifo_generator_0/empty] [get_bd_pins inverter_3/A]
connect_bd_net [get_bd_pins inverter_3/Y] [get_bd_pins customized_IP_block_0/in_fifo_drvr_0_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_0/rd_en] [get_bd_pins customized_IP_block_0/in_fifo_drvr_0_V_read]
connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins customized_IP_block_0/in_fifo_drvr_0_V_dout]

############## Interconexiónde la ruta de datos entre el driver 1 y el bus paralelo ############################

# Se realiza la interconexión entre el puerto de salida del IP llamado out_fifo_drvr1 y el canal de escritura de la FIFO 2
connect_bd_net [get_bd_pins customized_IP_block_0/out_fifo_drvr_1_V_din] [get_bd_pins fifo_generator_2/din]
connect_bd_net [get_bd_pins fifo_generator_2/wr_en] [get_bd_pins customized_IP_block_0/out_fifo_drvr_1_V_write]
connect_bd_net [get_bd_pins fifo_generator_2/full] [get_bd_pins inverter_2/A]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins customized_IP_block_0/out_fifo_drvr_1_V_full_n]

# realiza la conexión entre la salida de la FIFO 2 y la entrada al bus paralelo del driver 1
connect_bd_net [get_bd_pins fifo_generator_2/empty] [get_bd_pins inverter_5/A]
connect_bd_net [get_bd_pins inverter_5/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_1_bus_0]
connect_bd_net [get_bd_pins fifo_generator_2/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_1_bus_0]
connect_bd_net [get_bd_pins fifo_generator_2/rd_en] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_1_bus_0]

# Se realiza la conexión del puerto de salida del drvr 1 en el bus paralelo  y el FIFO. Nóte que el bus paralelo no tiene bandera de full por lo tanto no se utiliza. Se utilizó el FIFO 3
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_1_bus_0] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins fifo_generator_3/wr_en] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_1_bus_0]

# Finalmente se interconecta al puerto de  salida de la FIFO 3 con el puerto de entrada en el IP llamado in_fifo_drvr_1
connect_bd_net [get_bd_pins fifo_generator_3/empty] [get_bd_pins inverter_4/A]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins customized_IP_block_0/in_fifo_drvr_1_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_3/dout] [get_bd_pins customized_IP_block_0/in_fifo_drvr_1_V_dout]
connect_bd_net [get_bd_pins fifo_generator_3/rd_en] [get_bd_pins customized_IP_block_0/in_fifo_drvr_1_V_read]



# Se conectan el puerto de reset de los FIFOs. Nótese que, como la polaridad del reset en los FIFOs está invertida con respecto a todos los otros bloques del diseño, se utiliza el reset que contiene la polaridad invertida
connect_bd_net [get_bd_pins fifo_generator_1/srst] [get_bd_pins rst_ps7_0_100M/peripheral_reset]
connect_bd_net [get_bd_pins fifo_generator_2/srst] [get_bd_pins rst_ps7_0_100M/peripheral_reset]
connect_bd_net [get_bd_pins fifo_generator_3/srst] [get_bd_pins rst_ps7_0_100M/peripheral_reset]
connect_bd_net [get_bd_pins fifo_generator_0/srst] [get_bd_pins rst_ps7_0_100M/peripheral_reset]

# Se autogenera el layout
regenerate_bd_layout

# Se guarda el diseño
save_bd_design

# Se valida el diseño
validate_bd_design

# Se guarda el diseño
save_bd_design

# Se le da la opción de Generate Output Products
generate_target all [get_files  project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]

catch { config_ip_cache -export [get_ips -all design_1_processing_system7_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_1_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_2_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_3_0] }
catch { config_ip_cache -export [get_ips -all design_1_customized_IP_block_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_axi_timer_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_rst_ps7_0_100M_0] }
catch { config_ip_cache -export [get_ips -all design_1_xbar_0] }
catch { config_ip_cache -export [get_ips -all design_1_auto_pc_0] }

export_ip_user_files -of_objects [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]
launch_runs -jobs 8 {design_1_processing_system7_0_0_synth_1 design_1_prll_bs_gnrtr_n_rbtr_0_0_synth_1 design_1_inverter_0_0_synth_1 design_1_inverter_1_0_synth_1 design_1_inverter_2_0_synth_1 design_1_inverter_3_0_synth_1 design_1_inverter_4_0_synth_1 design_1_inverter_5_0_synth_1 design_1_fifo_generator_0_0_synth_1 design_1_fifo_generator_1_0_synth_1 design_1_fifo_generator_2_0_synth_1 design_1_fifo_generator_3_0_synth_1 design_1_customized_IP_block_0_0_synth_1 design_1_axi_timer_0_0_synth_1 design_1_rst_ps7_0_100M_0_synth_1 design_1_xbar_0_synth_1 design_1_auto_pc_0_synth_1}

export_simulation -of_objects [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -directory project_1/project_1.ip_user_files/sim_scripts -ip_user_files_dir project_1/project_1.ip_user_files -ipstatic_source_dir project_1/project_1.ip_user_files/ipstatic -lib_map_path [list {modelsim=project_1/project_1.cache/compile_simlib/modelsim} {questa=project_1/project_1.cache/compile_simlib/questa} {ies=project_1/project_1.cache/compile_simlib/ies} {xcelium=project_1/project_1.cache/compile_simlib/xcelium} {vcs=project_1/project_1.cache/compile_simlib/vcs} {riviera=project_1/project_1.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet

# Se le da la opción de Create HDL Wrapper
make_wrapper -files [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse project_1/project_1.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v

# Se coloca como módulo principal del proyecto, el creado en el Block design llamado  design_1_wrapper
set_property top design_1_wrapper [current_fileset]
update_compile_order -fileset sources_1

# Se sintetiza el diseño
launch_runs synth_1 -jobs 8

# Se implementa el diseño y se genera el bitstream
launch_runs impl_1 -to_step write_bitstream -jobs 8
