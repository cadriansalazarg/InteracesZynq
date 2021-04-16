# Se elimina en caso de que exista la carpeta del proyecto anterior para evitar conflictos por intentar crear un proyecto ya existente
exec rm -rf project_1/ vivado.*

# Se crea el proyecto
create_project project_1 project_1 -part xc7z045ffg900-2

# Se escoge que la tarjeta sea la ZedBoard
set_property board_part xilinx.com:zc706:part0:1.4 [current_project]

# Se agrega la biblioteca de buses de Verilog, Nótese que tanto el el archivo Library.sv, como fifo.sv, se toman 
# directamente de la carpeta Buses_Serial_Paralelo, es decir, justo donde se encuentra contenido el código fuente de los
# buses. Por otra parte, el Wraper del bus, tanto en System verilog como en Verilog, se encuentra dentro de la subcarpeta
# contenida dentro de este proyecto llamada src_Verilog
add_files -norecurse ../../Buses_Serial_Paralelo/src_Verilog/Library.sv

update_compile_order -fileset sources_1
add_files -norecurse ../../Buses_Serial_Paralelo/src_Verilog/fifo.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V.v

add_files -norecurse ../../FIFO_to_Custom_IP_Interconnection/src_Verilog/Custom_IP_to_FIFO.v
add_files -norecurse ../../FIFO_to_Custom_IP_Interconnection/src_Verilog/FIFO_to_Custom_IP.v

add_files -norecurse ../../AuroraInterconnection/src_Verilog/Aurora_init.v
add_files -norecurse ../../AuroraInterconnection/src_Verilog/Aurora_to_fifo.v
add_files -norecurse ../../AuroraInterconnection/src_Verilog/fifo_to_Aurora.v

# Se agrega el inversor en Verilog
add_files -norecurse src_Verilog/inverter.v
update_compile_order -fileset sources_1

# agrega el ip core
#set_property  ip_repo_paths  ../hls/hls_customized_hw_prj/solution1/impl/ip [current_project]
#update_ip_catalog

# se agrega el IP Core del multiplicador de matrices
update_compile_order -fileset sources_1
set_property  ip_repo_paths  ../hls/hls_matrixmul_prj/solution1/impl/ip [current_project]
update_ip_catalog

# Se crea el block design
create_bd_design "design_1"

# Se agrega el procesador Zynq
#startgroup
#create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
#endgroup

# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V prll_bs_gnrtr_n_rbtr_0

#set_property -dict [list CONFIG.bits {128}] [get_bd_cells prll_bs_gnrtr_n_rbtr_0]


create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_6
create_bd_cell -type module -reference inverter inverter_7

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


startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_4
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_5
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_6
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_7
endgroup

# Se configura adecuadamente los IPs FIFO Generator, para manejar palabras de 32 bits, una profundidad de 512 elementos y con modo de lectura First Word Fall Through
startgroup
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
endgroup


############## Interconexiónde la ruta de datos entre el driver 0 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 1 y la entrada al bus paralelo del driver 0
connect_bd_net [get_bd_pins fifo_generator_1/empty] [get_bd_pins inverter_1/A]
connect_bd_net [get_bd_pins fifo_generator_1/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_0_bus_0]
connect_bd_net [get_bd_pins inverter_1/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_0_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_0_bus_0] [get_bd_pins fifo_generator_1/rd_en]


# Se realiza la conexión del puerto de salida del drvr 0 en el bus paralelo  y el FIFO 0. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_0_bus_0] [get_bd_pins fifo_generator_0/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_0_bus_0] [get_bd_pins fifo_generator_0/wr_en]



############## Interconexión de la ruta de datos entre el driver 1 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 3 y la entrada al bus paralelo del driver 1
connect_bd_net [get_bd_pins fifo_generator_3/empty] [get_bd_pins inverter_3/A]
connect_bd_net [get_bd_pins fifo_generator_3/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_1_bus_0]
connect_bd_net [get_bd_pins inverter_3/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_1_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_1_bus_0] [get_bd_pins fifo_generator_3/rd_en]


# Se realiza la conexión del puerto de salida del drvr 1 en el bus paralelo  y el FIFO 2. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_1_bus_0] [get_bd_pins fifo_generator_2/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_1_bus_0] [get_bd_pins fifo_generator_2/wr_en]



############## Interconexión de la ruta de datos entre el driver 2 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 5 y la entrada al bus paralelo del driver 2
connect_bd_net [get_bd_pins fifo_generator_5/empty] [get_bd_pins inverter_5/A]
connect_bd_net [get_bd_pins fifo_generator_5/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_2_bus_0]
connect_bd_net [get_bd_pins inverter_5/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_2_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_2_bus_0] [get_bd_pins fifo_generator_5/rd_en]


# Se realiza la conexión del puerto de salida del drvr 2 en el bus paralelo  y el FIFO 4. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_2_bus_0] [get_bd_pins fifo_generator_4/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_2_bus_0] [get_bd_pins fifo_generator_4/wr_en]


############## Interconexión de las banderas empty con el inversor para generar not empty ############################
# Esto se hace por compatibilidad con el HLS y su interfaz ap_fifo
connect_bd_net [get_bd_pins fifo_generator_0/empty] [get_bd_pins inverter_0/A]
connect_bd_net [get_bd_pins fifo_generator_2/empty] [get_bd_pins inverter_2/A]
connect_bd_net [get_bd_pins fifo_generator_4/empty] [get_bd_pins inverter_4/A]
connect_bd_net [get_bd_pins fifo_generator_6/empty] [get_bd_pins inverter_6/A]



############## Interconexiónde la ruta de datos entre el driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]


############################### Interconexión con el multiplicador ###########################################################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 0 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 Wrapper_Matrix_Multi_0
endgroup

# Se agregan los dos módulos en Verilog que permiten conectar el FIFO Generator con el IP Core custom del multiplicador
create_bd_cell -type module -reference FIFO_to_Custom_IP FIFO_to_Custom_IP_0
create_bd_cell -type module -reference Custom_IP_to_FIFO Custom_IP_to_FIFO_0

#Se realizan las conexiones entre los FIFOs y esotos dos módulos
connect_bd_net [get_bd_pins Custom_IP_to_FIFO_0/din] [get_bd_pins fifo_generator_1/din]
connect_bd_net [get_bd_pins Custom_IP_to_FIFO_0/wr_en] [get_bd_pins fifo_generator_1/wr_en]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_BS_ID_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_BS_ID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_BS_ID_write] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_BS_ID_write]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_FPGA_ID_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_FPGA_ID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_PCKG_ID_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_PCKG_ID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_TX_UID_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_TX_UID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_RX_UID_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_RX_UID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_VALID_PACKET_BYTES_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_VALID_PACKET_BYTES_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_MESSAGE_0_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_MESSAGE_0_din]


connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_MESSAGE_1_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_MESSAGE_1_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_MESSAGE_2_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_MESSAGE_2_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_MESSAGE_3_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_MESSAGE_3_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_MESSAGE_4_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_MESSAGE_4_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/out_fifo_V_MESSAGE_5_din] [get_bd_pins Custom_IP_to_FIFO_0/out_fifo_V_MESSAGE_5_din]

connect_bd_net [get_bd_pins FIFO_to_Custom_IP_0/rd_en] [get_bd_pins fifo_generator_0/rd_en] 
connect_bd_net [get_bd_pins FIFO_to_Custom_IP_0/empty] [get_bd_pins fifo_generator_0/empty]
connect_bd_net [get_bd_pins FIFO_to_Custom_IP_0/dout] [get_bd_pins fifo_generator_0/dout]

connect_bd_net [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_BS_ID_dout] [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_BS_ID_dout]
connect_bd_net [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_BS_ID_empty_n] [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_BS_ID_empty_n]
connect_bd_net [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_BS_ID_read] [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_BS_ID_read]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_FPGA_ID_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_FPGA_ID_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_FPGA_ID_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_FPGA_ID_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_PCKG_ID_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_PCKG_ID_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_PCKG_ID_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_PCKG_ID_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_TX_UID_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_TX_UID_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_TX_UID_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_TX_UID_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_RX_UID_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_RX_UID_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_RX_UID_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_RX_UID_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_VALID_PACKET_BYTES_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_VALID_PACKET_BYTES_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_VALID_PACKET_BYTES_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_VALID_PACKET_BYTES_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_0_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_0_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_0_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_0_empty_n] 

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_1_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_1_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_1_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_1_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_2_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_2_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_2_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_2_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_3_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_3_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_3_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_3_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_4_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_4_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_4_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_4_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_5_dout] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_5_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_0/in_fifo_V_MESSAGE_5_empty_n] [get_bd_pins FIFO_to_Custom_IP_0/in_fifo_V_MESSAGE_5_empty_n]




############################### Interconexión con el multiplicador ###########################################################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 0 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 Wrapper_Matrix_Multi_1
endgroup

# Se agregan los dos módulos en Verilog que permiten conectar el FIFO Generator con el IP Core custom del multiplicador
create_bd_cell -type module -reference FIFO_to_Custom_IP FIFO_to_Custom_IP_1
create_bd_cell -type module -reference Custom_IP_to_FIFO Custom_IP_to_FIFO_1

#Se realizan las conexiones entre los FIFOs y esotos dos módulos
connect_bd_net [get_bd_pins Custom_IP_to_FIFO_1/din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Custom_IP_to_FIFO_1/wr_en] [get_bd_pins fifo_generator_3/wr_en]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_BS_ID_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_BS_ID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_BS_ID_write] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_BS_ID_write]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_FPGA_ID_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_FPGA_ID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_PCKG_ID_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_PCKG_ID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_TX_UID_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_TX_UID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_RX_UID_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_RX_UID_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_VALID_PACKET_BYTES_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_VALID_PACKET_BYTES_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_MESSAGE_0_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_MESSAGE_0_din]


connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_MESSAGE_1_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_MESSAGE_1_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_MESSAGE_2_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_MESSAGE_2_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_MESSAGE_3_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_MESSAGE_3_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_MESSAGE_4_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_MESSAGE_4_din]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/out_fifo_V_MESSAGE_5_din] [get_bd_pins Custom_IP_to_FIFO_1/out_fifo_V_MESSAGE_5_din]

connect_bd_net [get_bd_pins FIFO_to_Custom_IP_1/rd_en] [get_bd_pins fifo_generator_2/rd_en] 
connect_bd_net [get_bd_pins FIFO_to_Custom_IP_1/empty] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins FIFO_to_Custom_IP_1/dout] [get_bd_pins fifo_generator_2/dout]

connect_bd_net [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_BS_ID_dout] [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_BS_ID_dout]
connect_bd_net [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_BS_ID_empty_n] [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_BS_ID_empty_n]
connect_bd_net [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_BS_ID_read] [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_BS_ID_read]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_FPGA_ID_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_FPGA_ID_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_FPGA_ID_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_FPGA_ID_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_PCKG_ID_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_PCKG_ID_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_PCKG_ID_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_PCKG_ID_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_TX_UID_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_TX_UID_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_TX_UID_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_TX_UID_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_RX_UID_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_RX_UID_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_RX_UID_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_RX_UID_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_VALID_PACKET_BYTES_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_VALID_PACKET_BYTES_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_VALID_PACKET_BYTES_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_VALID_PACKET_BYTES_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_0_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_0_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_0_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_0_empty_n] 

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_1_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_1_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_1_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_1_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_2_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_2_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_2_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_2_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_3_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_3_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_3_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_3_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_4_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_4_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_4_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_4_empty_n]

connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_5_dout] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_5_dout]
connect_bd_net [get_bd_pins Wrapper_Matrix_Multi_1/in_fifo_V_MESSAGE_5_empty_n] [get_bd_pins FIFO_to_Custom_IP_1/in_fifo_V_MESSAGE_5_empty_n]


############################### Se agrega el Aurora 8b10b ###########################################################

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

## Se configuran las propiedades del Aurora, revisar con David
set_property -dict [list CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]

startgroup
set_property -dict [list CONFIG.C_LANE_WIDTH {4}] [get_bd_cells aurora_8b10b_0]
endgroup


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
create_bd_cell -type module -reference Aurora_to_fifo Aurora_to_fifo_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_to_fifo_0/reset_TX_RX_Block]

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
create_bd_cell -type module -reference fifo_to_Aurora fifo_to_Aurora_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /fifo_to_Aurora_0/reset_TX_RX_Block]

# Se realizan las interconexiones

connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]

connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins fifo_to_Aurora_0/reset_TX_RX_Block]
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins Aurora_to_fifo_0/reset_TX_RX_Block]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/empty] [get_bd_pins fifo_generator_6/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/dout] [get_bd_pins fifo_generator_6/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/rd_en] [get_bd_pins fifo_generator_6/rd_en]


connect_bd_net [get_bd_pins fifo_to_Aurora_0/s_axi_tx_tdata] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/s_axi_tx_tlast] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/s_axi_tx_tvalid] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/s_axi_tx_tready] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/full] [get_bd_pins fifo_generator_7/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/din] [get_bd_pins fifo_generator_7/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/wr_en] [get_bd_pins fifo_generator_7/wr_en]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/m_axi_rx_tdata] [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/m_axi_rx_tlast] [get_bd_pins aurora_8b10b_0/m_axi_rx_tlast]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/m_axi_rx_tvalid] [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid]


startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xlconstant_0]

connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]










































# Se realiza la interconexión entre el puerto de salida del IP llamado out_fifo_drvr0 y el canal de escritura de la FIFO 1
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_1/A]

startgroup
make_bd_pins_external  [get_bd_cells inverter_1]
make_bd_intf_pins_external  [get_bd_cells inverter_1]
endgroup
set_property name full_n_drvr0 [get_bd_ports Y_0]


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


