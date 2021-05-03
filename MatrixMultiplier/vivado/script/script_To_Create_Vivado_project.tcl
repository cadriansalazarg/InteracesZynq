# Descripción de la aplicación
# Se configura el bus paralelo para tener 4 driver.

# En el driver 0, el puerto D_pop_drvr_0 se conecta al puerto de salida del IP_Core Wrapper_Multi_0 en su terminal out_fifo
# Esta conexión se realiza a través del FIFO_Generator_1
# En el driver 0, el puerto de entrada del IP_Core Wrapper_Multi_0 en su terminal in_fifo se conecta al puerto D_push_dvr_0
# Esta conexión se realiza a través del FIFO_Generator_0

# En el driver 1, el puerto D_pop_drvr_1 se conecta al puerto de salida del IP_Core Wrapper_Multi_1 en su terminal out_fifo
# Esta conexión se realiza a través del FIFO_Generator_3
# En el driver 1, el puerto de entrada del IP_Core Wrapper_Multi_1 en su terminal in_fifo se conecta al puerto D_push_dvr_1
# Esta conexión se realiza a través del FIFO_Generator_2

# En el driver 2, el puerto D_pop_drvr_2 se conecta al puerto de entrada del módulo llamado din
# Esta conexión se realiza a través del FIFO_Generator_5
# En el driver 2, el puerto D_push_drvr_2 se conecta al puerto de salida del módulo llamado dout
# Esta conexión se realiza a través del FIFO_Generator_4

# En el driver 3, el puerto D_pop_drvr_3 se conecta al puerto de recepción de datos m_axi_rx del Aurora 8b10b, a través del HDL Aurora_to_fifo
# Esta conexión se realiza a través del FIFO_Generator_7
# En el driver 3, el puerto de transmisión de datos s_axi_tx del Aurora se conecta con el puerto D_push_drvr_3, a través del HDL fifo_to_Aurora
# Esta conexión se realiza a través del FIFO_Generator_6


# Se elimina en caso de que exista la carpeta del proyecto anterior para evitar conflictos por intentar crear un proyecto ya existente
exec rm -rf project_1/ vivado.*

# Se crea el proyecto
create_project project_1 project_1 -part xc7z045ffg900-2

# Se selecciona la tarjeta ZC706
set_property board_part xilinx.com:zc706:part0:1.4 [current_project]

# Se agrega los constrainst contenidos en el archivo de pines
add_files -fileset constrs_1 -norecurse constraints/pines.xdc

# Se agrega el testbench y se pone como principal
add_files -fileset sim_1 -norecurse TestBench/testbench.sv

set_property top testbench [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Se agrega la biblioteca de buses de Verilog, Nótese que tanto el el archivo Library.sv, como fifo.sv, se toman 
# directamente de la carpeta Buses_Serial_Paralelo, es decir, justo donde se encuentra contenido el código fuente de los
# buses. Por otra parte, el Wraper del bus, tanto en System verilog como en Verilog, se encuentra dentro de la subcarpeta
# contenida dentro de este proyecto llamada src_Verilog
add_files -norecurse ../../Buses_Serial_Paralelo/src_Verilog/Library.sv

update_compile_order -fileset sources_1
add_files -norecurse ../../Buses_Serial_Paralelo/src_Verilog/fifo.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V.v


add_files -norecurse ../../AuroraInterconnection/src_Verilog/Aurora_init.v
add_files -norecurse ../../AuroraInterconnection/src_Verilog/Aurora_to_fifo.v
add_files -norecurse ../../AuroraInterconnection/src_Verilog/fifo_to_Aurora.v

# Se agrega el inversor en Verilog
add_files -norecurse src_Verilog/inverter.v
update_compile_order -fileset sources_1


# se agrega el IP Core del multiplicador de matrices
update_compile_order -fileset sources_1
set_property  ip_repo_paths  ../hls/hls_matrixmul_prj/solution1/impl/ip [current_project]
update_ip_catalog

# Se crea el block design
create_bd_design "design_1"

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
create_bd_cell -type module -reference inverter inverter_8


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

# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 0, 1, 2, 3, 4, 5, los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto al par de fifos conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 6 y 7, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
endgroup


set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]




############## Interconexión de la los FIFOs del driver 0 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 1 y la entrada al bus paralelo del driver 0
connect_bd_net [get_bd_pins fifo_generator_1/empty] [get_bd_pins inverter_1/A]
connect_bd_net [get_bd_pins fifo_generator_1/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_0_bus_0]
connect_bd_net [get_bd_pins inverter_1/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_0_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_0_bus_0] [get_bd_pins fifo_generator_1/rd_en]


# Se realiza la conexión del puerto de salida del drvr 0 en el bus paralelo  y el FIFO 0. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_0_bus_0] [get_bd_pins fifo_generator_0/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_0_bus_0] [get_bd_pins fifo_generator_0/wr_en]



############## Interconexión de la los FIFOs del driver 1 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 3 y la entrada al bus paralelo del driver 1
connect_bd_net [get_bd_pins fifo_generator_3/empty] [get_bd_pins inverter_3/A]
connect_bd_net [get_bd_pins fifo_generator_3/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_1_bus_0]
connect_bd_net [get_bd_pins inverter_3/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_1_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_1_bus_0] [get_bd_pins fifo_generator_3/rd_en]


# Se realiza la conexión del puerto de salida del drvr 1 en el bus paralelo  y el FIFO 2. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_1_bus_0] [get_bd_pins fifo_generator_2/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_1_bus_0] [get_bd_pins fifo_generator_2/wr_en]



############## Interconexión de la los FIFOs del driver 2 y el bus paralelo ############################

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
connect_bd_net [get_bd_pins fifo_generator_4/empty] [get_bd_pins inverter_4/A]

############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]


############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 0 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 0 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

connect_bd_net [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_0/A] [get_bd_pins fifo_generator_1/full]
connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_0/empty] [get_bd_pins inverter_2/A]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {3}] [get_bd_cells xlconstant_1]

connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_2]

connect_bd_net [get_bd_pins xlconstant_2/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_8
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_8]

connect_bd_net [get_bd_pins xlconstant_8/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_5
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xlconstant_5]


connect_bd_net [get_bd_pins xlconstant_5/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]












############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 1 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 1 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup


connect_bd_net [get_bd_pins fifo_generator_2/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]
connect_bd_net [get_bd_pins fifo_generator_2/empty] [get_bd_pins inverter_6/A]
connect_bd_net [get_bd_pins inverter_6/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_3/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins fifo_generator_3/full] [get_bd_pins inverter_8/A]
connect_bd_net [get_bd_pins inverter_8/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {3}] [get_bd_cells xlconstant_3]

connect_bd_net [get_bd_pins xlconstant_3/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_4
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_4]

connect_bd_net [get_bd_pins xlconstant_4/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_9
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xlconstant_9]

connect_bd_net [get_bd_pins xlconstant_9/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xlconstant_5/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]


############################### Se agrega el Aurora 8b10b ###########################################################

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_6
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_6]

connect_bd_net [get_bd_pins xlconstant_6/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_7
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_7]

connect_bd_net [get_bd_pins xlconstant_7/dout] [get_bd_pins aurora_8b10b_0/power_down]


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

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/user_clk] 

# Se agrega el clocking wizard

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0
endgroup


set_property -dict [list CONFIG.PRIM_IN_FREQ.VALUE_SRC USER] [get_bd_cells clk_wiz_0]
set_property -dict [list CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} CONFIG.PRIM_IN_FREQ {200.000} CONFIG.CLKOUT2_USED {true} CONFIG.CLKOUT3_USED {true} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {125.000} CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {200.000} CONFIG.USE_LOCKED {false} CONFIG.CLKIN1_JITTER_PS {50.0} CONFIG.MMCM_DIVCLK_DIVIDE {1} CONFIG.MMCM_CLKFBOUT_MULT_F {5.000} CONFIG.MMCM_CLKIN1_PERIOD {5.000} CONFIG.MMCM_CLKIN2_PERIOD {10.0} CONFIG.MMCM_CLKOUT0_DIVIDE_F {8.000} CONFIG.MMCM_CLKOUT1_DIVIDE {10} CONFIG.MMCM_CLKOUT2_DIVIDE {5} CONFIG.NUM_OUT_CLKS {3} CONFIG.CLKOUT1_JITTER {107.523} CONFIG.CLKOUT1_PHASE_ERROR {89.971} CONFIG.CLKOUT2_JITTER {112.316} CONFIG.CLKOUT2_PHASE_ERROR {89.971} CONFIG.CLKOUT3_JITTER {98.146} CONFIG.CLKOUT3_PHASE_ERROR {89.971}] [get_bd_cells clk_wiz_0]
set_property -dict [list CONFIG.USE_RESET {false}] [get_bd_cells clk_wiz_0]


# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_0/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_0/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_0/init_clk_in] 

# Se conecta el init_clk al módulo Aurora_init
connect_bd_net [get_bd_pins Aurora_init_0/init_clk] [get_bd_pins clk_wiz_0/clk_out2]

# Se conecta el user_clk al módulo Aurora_init
connect_bd_net [get_bd_pins Aurora_init_0/user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]



# Se hacen externos los pines de los FIFOs para efectos de simulación


startgroup
make_bd_pins_external  [get_bd_pins fifo_generator_5/full]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins fifo_generator_5/din]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins fifo_generator_5/wr_en]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins fifo_generator_5/wr_en]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins fifo_generator_4/dout] [get_bd_pins fifo_generator_4/rd_en]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins inverter_4/Y]
endgroup


# Se le cambian los nombres a los puertos de entrada para reducir su tamaño y que queden acorde a una interfaz FIFO
set_property name not_empty [get_bd_ports Y_0]
set_property name dout [get_bd_ports dout_0]
set_property name full [get_bd_ports full_0]
set_property name din [get_bd_ports din_0]
set_property name wr_en [get_bd_ports wr_en_0]
set_property name rd_en [get_bd_ports rd_en_0]


# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup

set_property name txn [get_bd_ports txn_0]
set_property name txp [get_bd_ports txp_0]

startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup

set_property name rxn [get_bd_ports rxn_0]
set_property name rxp [get_bd_ports rxp_0]

# Se hace externo el pin de error

startgroup
make_bd_pins_external  [get_bd_pins Aurora_to_fifo_0/Error]
endgroup

set_property name Error [get_bd_ports Error_0]

# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

create_bd_port -dir I peripheral_reset

connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]


connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_0/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_1/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_2/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_3/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_4/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_5/rst]


create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n


connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_1/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_0/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_1/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_2/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_3/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_4/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_5/clk]

connect_bd_net [get_bd_pins fifo_generator_7/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_7/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_6/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_6/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]



## Se agregan señales extra para testear el módulo

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk
create_bd_port -dir O channel_up

startgroup
connect_bd_net [get_bd_ports channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]














