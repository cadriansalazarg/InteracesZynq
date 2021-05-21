##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ SCRIPT PARA GENERAR MÚLTIPLES TOPOLOGÍAS DE INTERCONEXIÓN
##############################################################################################################
##############################################################################################################
##############################################################################################################

##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ ENCABEZADO COMÚN PARA GENERAR CUALQUIERA DE LAS TOPOLOGÍAS
##############################################################################################################
##############################################################################################################
##############################################################################################################


# Se elimina en caso de que exista la carpeta del proyecto anterior para evitar conflictos por intentar crear un proyecto ya existente
exec rm -rf project_1/ vivado.*

# Se crea el proyecto
create_project project_1 project_1 -part xc7z045ffg900-2

# Se selecciona la tarjeta ZC706
set_property board_part xilinx.com:zc706:part0:1.4 [current_project]

# Se agrega los constrainst contenidos en el archivo de pines
# Para este caso, el archivo de pines únicamente contiene la excepción al Warning 52 y 56 para poner implementar las topologías
# sin que se produzca un error en el Aurora.
add_files -fileset constrs_1 -norecurse constraints/pines_different_topologies.xdc

# Se agrega el testbench y se pone como principal
add_files -fileset sim_1 -norecurse TestBench/testbench.sv
add_files -fileset sim_1 -norecurse TestBench/testbench1.sv
add_files -fileset sim_1 -norecurse TestBench/testbench2.sv
add_files -fileset sim_1 -norecurse TestBench/testbench3.sv


set_property top testbench2 [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Se agrega la biblioteca de buses de Verilog, Nótese que tanto el el archivo Library.sv, como fifo.sv, se toman 
# directamente de la carpeta Buses_Serial_Paralelo, es decir, justo donde se encuentra contenido el código fuente de los
# buses. Por otra parte, el Wraper del bus, tanto en System verilog como en Verilog, se encuentra dentro de la subcarpeta
# contenida dentro de este proyecto llamada src_Verilog
add_files -norecurse ../../Buses_Serial_Paralelo/src_Verilog/Library.sv

update_compile_order -fileset sources_1
add_files -norecurse ../../Buses_Serial_Paralelo/src_Verilog/fifo.sv

add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV_2drvrs.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V_2drvrs.v                              

add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV_4drvrs.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V_4drvrs.v

add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV_5drvrs.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V_5drvrs.v

add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV_6drvrs.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V_6drvrs.v

add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV_7drvrs.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V_7drvrs.v

add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV_8drvrs.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V_8drvrs.v

add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_SV_9drvrs.sv
add_files -norecurse src_Verilog/prll_bs_gnrtr_n_rbtr_wrap_V_9drvrs.v


add_files -norecurse ../../AuroraInterconnection/src_Verilog/Aurora_init.v

# Se agrega el inversor en Verilog
add_files -norecurse src_Verilog/inverter.v
update_compile_order -fileset sources_1

# Se agregan los IPs generados en HLS
set_property  ip_repo_paths  {../hls/hls_matrixmul_prj/solution1/impl/ip ../../AuroraInterconnection/fifo_to_Aurora/hls/hls_fifo_to_aurora_hw_prj/Optimized/impl/ip ../../AuroraInterconnection/Aurora_to_fifo/hls_fpga1/hls_aurora_to_fifo_fpga1_hw_prj/Optimized/impl/ip ../../Packaging_Unit/hls/hls_packaging_block_hw_prj/Optimized/impl/ip ../../Unpackaging_Unit/Point-to-Point/hls/hls_unpackaging_block_hw_prj/solution1/impl/ip} [current_project]
update_ip_catalog


















##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL PRIMER DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 4 drivers. 
# En el driver 0, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 0
# En el driver 1, se conecta un acelerador de hardware el 0
# En el driver 2, se conecta un acelerador de hardware el 1
# En el driver 3, se conecta un acelerador de hardware el 2



create_bd_design "Drvrs4_PNs3_Lanes1_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs4_PNs3_Lanes1_design/Drvrs4_PNs3_Lanes1_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_4drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7

create_bd_cell -type module -reference inverter inverter_10
create_bd_cell -type module -reference inverter inverter_12
create_bd_cell -type module -reference inverter inverter_14
create_bd_cell -type module -reference inverter inverter_16
create_bd_cell -type module -reference inverter inverter_18
create_bd_cell -type module -reference inverter inverter_19

create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0

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

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup



# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]


# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]



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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]


############################### Se agrega el Aurora 8b10b en el driver 0 ###########################################################
## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_0/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_0/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_1/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_1/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_1/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup


############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 1 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 1 del bus


startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

# Se interconecta el acelerador de hardware del driver 1 y los FIFOs Generator 2 y 3

connect_bd_net [get_bd_pins fifo_generator_3/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_10/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_10/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins fifo_generator_3/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_2/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]
connect_bd_net [get_bd_pins inverter_12/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_2/empty] [get_bd_pins inverter_12/A]

# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_FPGA_ID_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlcons_FPGA_ID_Hardware_Acc]

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {5}] [get_bd_cells xlcons_UID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_start_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_start_Hardware_Acc]


connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]


############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 2 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 2 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup

# Se interconecta el acelerador de hardware del driver 3 y los FIFOs Generator 4 Y 5

connect_bd_net [get_bd_pins fifo_generator_4/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]
connect_bd_net [get_bd_pins fifo_generator_4/empty] [get_bd_pins inverter_14/A]
connect_bd_net [get_bd_pins inverter_14/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_5/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_5/wr_en]
connect_bd_net [get_bd_pins fifo_generator_5/full] [get_bd_pins inverter_16/A]
connect_bd_net [get_bd_pins inverter_16/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {6}] [get_bd_cells xlcons_UID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult2 ubicado en el driver 3 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 3 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_2
endgroup

# Se interconecta el acelerador de hardware del driver 4 y los FIFOs Generator6 Y 7

connect_bd_net [get_bd_pins fifo_generator_6/dout] [get_bd_pins HardwareAccelerator_2/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_2/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]
connect_bd_net [get_bd_pins fifo_generator_6/empty] [get_bd_pins inverter_18/A]
connect_bd_net [get_bd_pins inverter_18/Y] [get_bd_pins HardwareAccelerator_2/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_7/din] [get_bd_pins HardwareAccelerator_2/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_2/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins fifo_generator_7/full] [get_bd_pins inverter_19/A]
connect_bd_net [get_bd_pins inverter_19/Y] [get_bd_pins HardwareAccelerator_2/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_2

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {7}] [get_bd_cells xlcons_UID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_2 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_2/ap_continue] [get_bd_pins HardwareAccelerator_2/ap_ready]

# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_2/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_3/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_4/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_5/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_6/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_7/rst]


# Se conectan los reset de los aceleradores de hardware
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_2/ap_rst]

######### Se conectan los relojes del sistema

create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de los aceleradores de hardware
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_1/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_2/ap_clk]

# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_2/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_3/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_4/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_5/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_6/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_7/clk]


connect_bd_net [get_bd_pins fifo_generator_0/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_0/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_1/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_1/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]


# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup


# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs4_PNs3_Lanes1_design]
close_bd_design [get_bd_designs Drvrs4_PNs3_Lanes1_design]


































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL SEGUNDO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 4 drivers. 
# En el driver 0, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 0
# En el driver 1, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 1
# En el driver 2, se conecta un acelerador de hardware el 0
# En el driver 3, se conecta un acelerador de hardware el 1




create_bd_design "Drvrs4_PNs2_Lanes2_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs4_PNs2_Lanes2_design/Drvrs4_PNs2_Lanes2_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_4drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7

create_bd_cell -type module -reference inverter inverter_10
create_bd_cell -type module -reference inverter inverter_12
create_bd_cell -type module -reference inverter inverter_14
create_bd_cell -type module -reference inverter inverter_16
create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_1



create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora1
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora1

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

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora1
endgroup


# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora1]


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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]


############################### Se agrega el Aurora 8b10b en el driver 0 ###########################################################
## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_0/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_0/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_1/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_1/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_1/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup


############################### Se agrega el Aurora 8b10b en el driver 1 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_1
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_1]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_1]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_1/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_1/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_1/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_1
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_1
endgroup

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_1/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_1/ap_rst]


connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/Y] [get_bd_pins fifo_to_Aurora_1/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/A] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]


connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TDATA] [get_bd_pins aurora_8b10b_1/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TLAST] [get_bd_pins aurora_8b10b_1/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TVALID] [get_bd_pins aurora_8b10b_1/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TREADY] [get_bd_pins aurora_8b10b_1/s_axi_tx_tready]


connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_1/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_1/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora1/din]
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora1/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/empty] [get_bd_pins inverter_empty_OutputAurora1/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora1/Y] [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora1/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora1/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_1]

connect_bd_net [get_bd_pins xconst_id_next_fpga_1/dout] [get_bd_pins fifo_to_Aurora_1/id_next_fpga]


# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_1/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/ap_continue] [get_bd_pins Aurora_to_fifo_1/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_1/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/ap_continue] [get_bd_pins fifo_to_Aurora_1/ap_ready]


# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_1/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_1/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_1/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_1/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_1/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_1/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_1/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_1/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_1/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_1/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/txn] [get_bd_pins aurora_8b10b_1/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/rxn] [get_bd_pins aurora_8b10b_1/rxp]
endgroup


############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 2 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 2 del bus


startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

# Se interconecta el acelerador de hardware del driver 2 y los FIFOs Generator 4 y 5

connect_bd_net [get_bd_pins fifo_generator_5/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_10/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_10/A] [get_bd_pins fifo_generator_5/full]
connect_bd_net [get_bd_pins fifo_generator_5/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_4/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]
connect_bd_net [get_bd_pins inverter_12/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_4/empty] [get_bd_pins inverter_12/A]

# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_FPGA_ID_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlcons_FPGA_ID_Hardware_Acc]

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {5}] [get_bd_cells xlcons_UID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_start_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_start_Hardware_Acc]


connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]


############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 3 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 3 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup

# Se interconecta el acelerador de hardware del driver 3 y los FIFOs Generator 6 y 7

connect_bd_net [get_bd_pins fifo_generator_6/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]
connect_bd_net [get_bd_pins fifo_generator_6/empty] [get_bd_pins inverter_14/A]
connect_bd_net [get_bd_pins inverter_14/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_7/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins fifo_generator_7/full] [get_bd_pins inverter_16/A]
connect_bd_net [get_bd_pins inverter_16/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {6}] [get_bd_cells xlcons_UID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_4/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_5/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_6/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_7/rst]

# Se conectan los reset de los aceleradores de hardware
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]

######### Se conectan los relojes del sistema

create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de los aceleradores de hardware
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_1/ap_clk]


# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_4/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_5/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_6/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_7/clk]


connect_bd_net [get_bd_pins fifo_generator_0/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_0/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_1/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_1/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_2/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_2/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_3/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_3/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]


# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_1
connect_bd_net [get_bd_ports channel_up_1] [get_bd_pins aurora_8b10b_1/channel_up]
endgroup

# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs4_PNs2_Lanes2_design]
close_bd_design [get_bd_designs Drvrs4_PNs2_Lanes2_design]











































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL TERCER DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 4 drivers. 
# En el driver 0, se agrega el Zynq
# En el driver 1, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 0
# En el driver 2, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 1
# En el driver 3, se conecta un acelerador de hardware, en este caso un multiplicador de matrices, Wrapper_Mmult_0



create_bd_design "Drvrs4_PNs1_PS1_Lanes2_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs4_PNs1_PS1_Lanes2_design/Drvrs4_PNs1_PS1_Lanes2_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_4drvrs prll_bs_gnrtr_n_rbtr_0

create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_6
create_bd_cell -type module -reference inverter inverter_7
create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_1

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora1
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora1

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

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora1
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
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora1]



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

############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]


############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 3 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 3 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

connect_bd_net [get_bd_pins fifo_generator_7/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_0/A] [get_bd_pins fifo_generator_7/full]
connect_bd_net [get_bd_pins fifo_generator_7/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_6/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_6/empty] [get_bd_pins inverter_2/A]


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



############################### Interconexión con el PS ubicado en el driver 0 ##################



# Se agrega el IP Core de la unidad de empaquetamiento

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:packaging_IP_block:1.0 packaging_IP_block_0
endgroup

connect_bd_net [get_bd_pins xlconstant_5/dout] [get_bd_pins packaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_continue] [get_bd_pins packaging_IP_block_0/ap_ready]

startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup


# Se interconecta el out_fifo de la unidad de empaquetamiento al FIFO Generator 1

connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins packaging_IP_block_0/out_fifo_V_din]
connect_bd_net [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins packaging_IP_block_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins packaging_IP_block_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_4/A]


# Se conecta la constante del bloque FPGA IP de la unidad de empaquetamiento, a la constante de FPGA_ID del acelerador
connect_bd_net [get_bd_pins packaging_IP_block_0/fpga_id] [get_bd_pins xlconstant_2/dout]

# Se agrega la unidad de desempaquetamiento
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:unpackaging_IP_block:1.0 unpackaging_IP_block_0
endgroup

connect_bd_net [get_bd_pins xlconstant_5/dout] [get_bd_pins unpackaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_continue] [get_bd_pins unpackaging_IP_block_0/ap_ready]


startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se interconecta el out_fifo de la unidad de desempaquetamiento al FIFO Generator 0


connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]
connect_bd_net [get_bd_pins inverter_6/Y] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_6/A] [get_bd_pins fifo_generator_0/empty]




############################### Se agrega el Aurora 8b10b al driver 1 ###########################################################
## Este Aurora se conecta al driver 1

## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup


############################### Se agrega el Aurora 8b10b en el driver 2 ###########################################################

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_1
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_1]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_1]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_1/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_1/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_1/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_1
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_1
endgroup

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_1/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_1/ap_rst]


connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/Y] [get_bd_pins fifo_to_Aurora_1/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/A] [get_bd_pins fifo_generator_4/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_dout] [get_bd_pins fifo_generator_4/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]


connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TDATA] [get_bd_pins aurora_8b10b_1/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TLAST] [get_bd_pins aurora_8b10b_1/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TVALID] [get_bd_pins aurora_8b10b_1/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TREADY] [get_bd_pins aurora_8b10b_1/s_axi_tx_tready]


connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_din] [get_bd_pins fifo_generator_5/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_write] [get_bd_pins fifo_generator_5/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_1/A] [get_bd_pins fifo_generator_5/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_1/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora1/din]
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora1/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/empty] [get_bd_pins inverter_empty_OutputAurora1/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora1/Y] [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora1/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora1/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_1]

connect_bd_net [get_bd_pins xconst_id_next_fpga_1/dout] [get_bd_pins fifo_to_Aurora_1/id_next_fpga]


# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_1/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/ap_continue] [get_bd_pins Aurora_to_fifo_1/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_1/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/ap_continue] [get_bd_pins fifo_to_Aurora_1/ap_ready]


# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_1/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_1/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_1/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_1/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_1/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_1/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_1/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_1/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_1/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_1/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/txn] [get_bd_pins aurora_8b10b_1/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/rxn] [get_bd_pins aurora_8b10b_1/rxp]
endgroup



# Reset del sistema #################################################################

## La señal peripheral_reset es un reset activo en alto.

create_bd_port -dir I peripheral_reset

connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]


connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_0/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_1/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_6/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_7/rst]

# El reset de la unidad de empaquetamiento, se conecta a un puerto llamado peripheral_aresetn
# esto porque para esa unidad, el reset se generó con la polaridad invertida.

startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/ap_rst_n]
endgroup

set_property name peripheral_aresetn [get_bd_ports ap_rst_n_0]
update_compile_order -fileset sources_1

# Lo mismo sucede con el reset de la unidad de desempaquetamiento, por eso se conecta al puerto peripheral_aresetn

connect_bd_net [get_bd_ports peripheral_aresetn] [get_bd_pins unpackaging_IP_block_0/ap_rst_n]


create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n


connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de la unidad de empaquetado de datos
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins packaging_IP_block_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins unpackaging_IP_block_0/ap_clk]


connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_0/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_1/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_6/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_7/clk]


connect_bd_net [get_bd_pins fifo_generator_2/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_2/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_3/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_3/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_4/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_4/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_5/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_5/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]



## Se agregan señales extra para testear el módulo

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

create_bd_port -dir O channel_up_0

create_bd_port -dir O channel_up_1



startgroup
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

startgroup
connect_bd_net [get_bd_ports channel_up_1] [get_bd_pins aurora_8b10b_1/channel_up]
endgroup

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design

current_bd_design [get_bd_designs Drvrs4_PNs1_PS1_Lanes2_design]
close_bd_design [get_bd_designs Drvrs4_PNs1_PS1_Lanes2_design]



















































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL CUARTO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 5 drivers.
# En el driver 0, se conecta el Zynq o PS 
# En el driver 1, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 0
# En el driver 2, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 1
# En el driver 3, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 2
# En el driver 4, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 3




create_bd_design "Drvrs5_PS1_Lanes4_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs5_PS1_Lanes4_design/Drvrs5_PS1_Lanes4_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_5drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7
create_bd_cell -type module -reference inverter inverter_9
create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_1
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_2
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_3

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora1
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora2
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora3


create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora1
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora2
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora3


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

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_8
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_9
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora1
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora2
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora3
endgroup

# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_8]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_9]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora1]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora2]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora3]



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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]

############## Interconexión de la los FIFOs del driver 4 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_9/empty] [get_bd_pins inverter_9/A]
connect_bd_net [get_bd_pins fifo_generator_9/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_4_bus_0]
connect_bd_net [get_bd_pins inverter_9/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_4_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_4_bus_0] [get_bd_pins fifo_generator_9/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/wr_en]



############################### Se agrega el Aurora 8b10b en el driver 1 ###########################################################
## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup


############################### Se agrega el Aurora 8b10b en el driver 2 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_1
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_1]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_1]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_1/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_1/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_1/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_1
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_1
endgroup

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_1/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_1/ap_rst]


connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/Y] [get_bd_pins fifo_to_Aurora_1/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/A] [get_bd_pins fifo_generator_4/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_dout] [get_bd_pins fifo_generator_4/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]


connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TDATA] [get_bd_pins aurora_8b10b_1/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TLAST] [get_bd_pins aurora_8b10b_1/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TVALID] [get_bd_pins aurora_8b10b_1/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TREADY] [get_bd_pins aurora_8b10b_1/s_axi_tx_tready]


connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_din] [get_bd_pins fifo_generator_5/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_write] [get_bd_pins fifo_generator_5/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_1/A] [get_bd_pins fifo_generator_5/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_1/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora1/din]
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora1/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/empty] [get_bd_pins inverter_empty_OutputAurora1/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora1/Y] [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora1/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora1/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_1]

connect_bd_net [get_bd_pins xconst_id_next_fpga_1/dout] [get_bd_pins fifo_to_Aurora_1/id_next_fpga]


# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_1/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/ap_continue] [get_bd_pins Aurora_to_fifo_1/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_1/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/ap_continue] [get_bd_pins fifo_to_Aurora_1/ap_ready]


# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_1/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_1/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_1/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_1/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_1/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_1/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_1/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_1/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_1/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_1/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/txn] [get_bd_pins aurora_8b10b_1/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/rxn] [get_bd_pins aurora_8b10b_1/rxp]
endgroup



############################### Se agrega el Aurora 8b10b en el driver 3  ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_2
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_2]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_2]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_2/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_2/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_2/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_2
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_2
endgroup


# # Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_2/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_2/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora2/Y] [get_bd_pins fifo_to_Aurora_2/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora2/A] [get_bd_pins fifo_generator_6/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/in_fifo_V_dout] [get_bd_pins fifo_generator_6/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TDATA] [get_bd_pins aurora_8b10b_2/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TLAST] [get_bd_pins aurora_8b10b_2/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TVALID] [get_bd_pins aurora_8b10b_2/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TREADY] [get_bd_pins aurora_8b10b_2/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_2/out_fifo_V_din] [get_bd_pins fifo_generator_7/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_2/A] [get_bd_pins fifo_generator_7/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_2/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_2/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora2/din]
connect_bd_net [get_bd_pins aurora_8b10b_2/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora2/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora2/empty] [get_bd_pins inverter_empty_OutputAurora2/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora2/Y] [get_bd_pins Aurora_to_fifo_2/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora2/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora2/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora2/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora2/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_2]

connect_bd_net [get_bd_pins xconst_id_next_fpga_2/dout] [get_bd_pins fifo_to_Aurora_2/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_2/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/ap_continue] [get_bd_pins Aurora_to_fifo_2/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_2/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/ap_continue] [get_bd_pins fifo_to_Aurora_2/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_2/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_2/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_2/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_2/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_2/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_2/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_2/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_2/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_2/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_2/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_2/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_2/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_2/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_2/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_2/txn] [get_bd_pins aurora_8b10b_2/txp]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_2/rxn] [get_bd_pins aurora_8b10b_2/rxp]
endgroup


############################### Se agrega el Aurora 8b10b en el driver 4 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_3
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_3]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_3]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_3/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_3/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_3/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_3
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_3
endgroup

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_3/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_3/ap_rst]

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora3/Y] [get_bd_pins fifo_to_Aurora_3/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora3/A] [get_bd_pins fifo_generator_8/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/in_fifo_V_dout] [get_bd_pins fifo_generator_8/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/in_fifo_V_read] [get_bd_pins fifo_generator_8/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TDATA] [get_bd_pins aurora_8b10b_3/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TLAST] [get_bd_pins aurora_8b10b_3/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TVALID] [get_bd_pins aurora_8b10b_3/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TREADY] [get_bd_pins aurora_8b10b_3/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_3/out_fifo_V_din] [get_bd_pins fifo_generator_9/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/out_fifo_V_write] [get_bd_pins fifo_generator_9/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_3/A] [get_bd_pins fifo_generator_9/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_3/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_3/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora3/din]
connect_bd_net [get_bd_pins aurora_8b10b_3/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora3/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora3/empty] [get_bd_pins inverter_empty_OutputAurora3/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora3/Y] [get_bd_pins Aurora_to_fifo_3/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora3/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora3/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora3/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora3/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_3]

connect_bd_net [get_bd_pins xconst_id_next_fpga_3/dout] [get_bd_pins fifo_to_Aurora_3/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_3/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/ap_continue] [get_bd_pins Aurora_to_fifo_3/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_3/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/ap_continue] [get_bd_pins fifo_to_Aurora_3/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_3/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_3/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_3/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_3/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_3/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_3/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_3/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_3/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_3/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_3/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_3/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_3/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_3/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_3/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_3/txn] [get_bd_pins aurora_8b10b_3/txp]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_3/rxn] [get_bd_pins aurora_8b10b_3/rxp]
endgroup


############################### Interconexión con el PS ubicado en el driver 0 ##################


# Se agrega el IP Core de la unidad de empaquetamiento

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:packaging_IP_block:1.0 packaging_IP_block_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start]

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins packaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_continue] [get_bd_pins packaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de empaquetamiento al FIFO Generator 1

connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins packaging_IP_block_0/out_fifo_V_din]
connect_bd_net [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins packaging_IP_block_0/out_fifo_V_write]

connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins packaging_IP_block_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_0/A]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_fpga_id
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_fpga_id]

# Se conecta la constante del bloque FPGA IP de la unidad de empaquetamiento, a la constante de FPGA_ID del acelerador
connect_bd_net [get_bd_pins packaging_IP_block_0/fpga_id] [get_bd_pins xconst_fpga_id/dout]

# Se agrega la unidad de desempaquetamiento
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:unpackaging_IP_block:1.0 unpackaging_IP_block_0
endgroup

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins unpackaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_continue] [get_bd_pins unpackaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de desempaquetamiento al FIFO Generator 0
connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_2/A] [get_bd_pins fifo_generator_0/empty]

# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_0/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_1/rst]

connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins inverter_4/A]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins packaging_IP_block_0/ap_rst_n]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins unpackaging_IP_block_0/ap_rst_n]

######### Se conectan los relojes del sistema

create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de la unidad de empaquetado de datos
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins packaging_IP_block_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins unpackaging_IP_block_0/ap_clk]

# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_0/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_1/clk]

connect_bd_net [get_bd_pins fifo_generator_2/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_2/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_3/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_3/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_4/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_4/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_5/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_5/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_6/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_6/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_7/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_7/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_8/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_8/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_9/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_9/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_1
connect_bd_net [get_bd_ports channel_up_1] [get_bd_pins aurora_8b10b_1/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_2
connect_bd_net [get_bd_ports channel_up_2] [get_bd_pins aurora_8b10b_2/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_3
connect_bd_net [get_bd_ports channel_up_3] [get_bd_pins aurora_8b10b_3/channel_up]
endgroup

# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs5_PS1_Lanes4_design]
close_bd_design [get_bd_designs Drvrs5_PS1_Lanes4_design]













































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL QUINTO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 9 drivers. 
# En el driver 0, se conecta el Zynq o PS
# En el driver 1, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 0
# En el driver 2, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 1
# En el driver 3, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 2
# En el driver 4, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 3
# En el driver 5, se conecta un acelerador de hardware el 0
# En el driver 6, se conecta un acelerador de hardware el 1
# En el driver 7, se conecta un acelerador de hardware el 2
# En el driver 8, se conecta un acelerador de hardware el 3



create_bd_design "Drvrs9_PNs4_PS1_Lanes4_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs9_PNs4_PS1_Lanes4_design/Drvrs9_PNs4_PS1_Lanes4_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_9drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7
create_bd_cell -type module -reference inverter inverter_9

create_bd_cell -type module -reference inverter inverter_10
create_bd_cell -type module -reference inverter inverter_11
create_bd_cell -type module -reference inverter inverter_12
create_bd_cell -type module -reference inverter inverter_13
create_bd_cell -type module -reference inverter inverter_14
create_bd_cell -type module -reference inverter inverter_15
create_bd_cell -type module -reference inverter inverter_16
create_bd_cell -type module -reference inverter inverter_17
create_bd_cell -type module -reference inverter inverter_18
create_bd_cell -type module -reference inverter inverter_19
create_bd_cell -type module -reference inverter inverter_20
create_bd_cell -type module -reference inverter inverter_21

create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_1
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_2
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_3

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora1
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora2
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora3


create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora1
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora2
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora3

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

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_8
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_9
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_10
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_11
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_12
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_13
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_14
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_15
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_16
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_17
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora1
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora2
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora3
endgroup

# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_10]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_11]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_12]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_13]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_14]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_15]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_16]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_17]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_8]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_9]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora1]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora2]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora3]




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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]

############## Interconexión de la los FIFOs del driver 4 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 9 y la entrada al bus paralelo del driver 4
connect_bd_net [get_bd_pins fifo_generator_9/empty] [get_bd_pins inverter_9/A]
connect_bd_net [get_bd_pins fifo_generator_9/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_4_bus_0]
connect_bd_net [get_bd_pins inverter_9/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_4_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_4_bus_0] [get_bd_pins fifo_generator_9/rd_en]


# Se realiza la conexión del puerto de salida del drvr 4 en el bus paralelo  y el FIFO 8. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/wr_en]


############## Interconexión de la los FIFOs del driver 5 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 11 y la entrada al bus paralelo del driver 5
connect_bd_net [get_bd_pins fifo_generator_11/empty] [get_bd_pins inverter_11/A]
connect_bd_net [get_bd_pins fifo_generator_11/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_5_bus_0]
connect_bd_net [get_bd_pins inverter_11/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_5_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_5_bus_0] [get_bd_pins fifo_generator_11/rd_en]


# Se realiza la conexión del puerto de salida del drvr 5 en el bus paralelo  y el FIFO 10. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_5_bus_0] [get_bd_pins fifo_generator_10/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_5_bus_0] [get_bd_pins fifo_generator_10/wr_en]

############## Interconexión de la los FIFOs del driver 6 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 13 y la entrada al bus paralelo del driver 6
connect_bd_net [get_bd_pins fifo_generator_13/empty] [get_bd_pins inverter_13/A]
connect_bd_net [get_bd_pins fifo_generator_13/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_6_bus_0]
connect_bd_net [get_bd_pins inverter_13/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_6_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_6_bus_0] [get_bd_pins fifo_generator_13/rd_en]


# Se realiza la conexión del puerto de salida del drvr 6 en el bus paralelo  y el FIFO 12. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_6_bus_0] [get_bd_pins fifo_generator_12/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_6_bus_0] [get_bd_pins fifo_generator_12/wr_en]

############## Interconexión de la los FIFOs del driver 7 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 15 y la entrada al bus paralelo del driver 7
connect_bd_net [get_bd_pins fifo_generator_15/empty] [get_bd_pins inverter_15/A]
connect_bd_net [get_bd_pins fifo_generator_15/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_7_bus_0]
connect_bd_net [get_bd_pins inverter_15/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_7_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_7_bus_0] [get_bd_pins fifo_generator_15/rd_en]


# Se realiza la conexión del puerto de salida del drvr 7 en el bus paralelo  y el FIFO 14. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_7_bus_0] [get_bd_pins fifo_generator_14/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_7_bus_0] [get_bd_pins fifo_generator_14/wr_en]

############## Interconexión de la los FIFOs del driver 8 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 17 y la entrada al bus paralelo del driver 8
connect_bd_net [get_bd_pins fifo_generator_17/empty] [get_bd_pins inverter_17/A]
connect_bd_net [get_bd_pins fifo_generator_17/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_8_bus_0]
connect_bd_net [get_bd_pins inverter_17/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_8_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_8_bus_0] [get_bd_pins fifo_generator_17/rd_en]


# Se realiza la conexión del puerto de salida del drvr 8 en el bus paralelo  y el FIFO 16. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_8_bus_0] [get_bd_pins fifo_generator_16/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_8_bus_0] [get_bd_pins fifo_generator_16/wr_en]

############################### Se agrega el Aurora 8b10b en el driver 1 ###########################################################
## Este Aurora debe incluir la lógica compartida


startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup

############################### Se agrega el Aurora 8b10b en el driver 2 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_1
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_1]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_1]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_1/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_1/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_1/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_1
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_1
endgroup

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_1/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_1/ap_rst]


connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/Y] [get_bd_pins fifo_to_Aurora_1/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/A] [get_bd_pins fifo_generator_4/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_dout] [get_bd_pins fifo_generator_4/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]


connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TDATA] [get_bd_pins aurora_8b10b_1/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TLAST] [get_bd_pins aurora_8b10b_1/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TVALID] [get_bd_pins aurora_8b10b_1/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TREADY] [get_bd_pins aurora_8b10b_1/s_axi_tx_tready]


connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_din] [get_bd_pins fifo_generator_5/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_write] [get_bd_pins fifo_generator_5/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_1/A] [get_bd_pins fifo_generator_5/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_1/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora1/din]
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora1/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/empty] [get_bd_pins inverter_empty_OutputAurora1/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora1/Y] [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora1/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora1/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_1]

connect_bd_net [get_bd_pins xconst_id_next_fpga_1/dout] [get_bd_pins fifo_to_Aurora_1/id_next_fpga]


# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_1/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/ap_continue] [get_bd_pins Aurora_to_fifo_1/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_1/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/ap_continue] [get_bd_pins fifo_to_Aurora_1/ap_ready]


# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_1/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_1/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_1/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_1/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_1/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_1/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_1/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_1/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_1/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_1/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/txn] [get_bd_pins aurora_8b10b_1/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/rxn] [get_bd_pins aurora_8b10b_1/rxp]
endgroup



############################### Se agrega el Aurora 8b10b en el driver 3 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_2
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_2]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_2]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_2/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_2/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_2/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_2
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_2
endgroup


# # Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_2/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_2/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora2/Y] [get_bd_pins fifo_to_Aurora_2/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora2/A] [get_bd_pins fifo_generator_6/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/in_fifo_V_dout] [get_bd_pins fifo_generator_6/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TDATA] [get_bd_pins aurora_8b10b_2/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TLAST] [get_bd_pins aurora_8b10b_2/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TVALID] [get_bd_pins aurora_8b10b_2/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TREADY] [get_bd_pins aurora_8b10b_2/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_2/out_fifo_V_din] [get_bd_pins fifo_generator_7/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_2/A] [get_bd_pins fifo_generator_7/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_2/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_2/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora2/din]
connect_bd_net [get_bd_pins aurora_8b10b_2/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora2/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora2/empty] [get_bd_pins inverter_empty_OutputAurora2/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora2/Y] [get_bd_pins Aurora_to_fifo_2/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora2/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora2/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora2/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora2/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_2]

connect_bd_net [get_bd_pins xconst_id_next_fpga_2/dout] [get_bd_pins fifo_to_Aurora_2/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_2/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/ap_continue] [get_bd_pins Aurora_to_fifo_2/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_2/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/ap_continue] [get_bd_pins fifo_to_Aurora_2/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_2/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_2/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_2/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_2/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_2/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_2/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_2/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_2/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_2/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_2/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_2/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_2/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_2/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_2/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_2/txn] [get_bd_pins aurora_8b10b_2/txp]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_2/rxn] [get_bd_pins aurora_8b10b_2/rxp]
endgroup

############################### Se agrega el Aurora 8b10b en el driver 4 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_3
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_3]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_3]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_3/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_3/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_3/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_3
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_3
endgroup

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_3/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_3/ap_rst]

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora3/Y] [get_bd_pins fifo_to_Aurora_3/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora3/A] [get_bd_pins fifo_generator_8/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/in_fifo_V_dout] [get_bd_pins fifo_generator_8/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/in_fifo_V_read] [get_bd_pins fifo_generator_8/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TDATA] [get_bd_pins aurora_8b10b_3/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TLAST] [get_bd_pins aurora_8b10b_3/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TVALID] [get_bd_pins aurora_8b10b_3/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TREADY] [get_bd_pins aurora_8b10b_3/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_3/out_fifo_V_din] [get_bd_pins fifo_generator_9/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/out_fifo_V_write] [get_bd_pins fifo_generator_9/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_3/A] [get_bd_pins fifo_generator_9/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_3/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_3/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora3/din]
connect_bd_net [get_bd_pins aurora_8b10b_3/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora3/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora3/empty] [get_bd_pins inverter_empty_OutputAurora3/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora3/Y] [get_bd_pins Aurora_to_fifo_3/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora3/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora3/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora3/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora3/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_3]

connect_bd_net [get_bd_pins xconst_id_next_fpga_3/dout] [get_bd_pins fifo_to_Aurora_3/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_3/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/ap_continue] [get_bd_pins Aurora_to_fifo_3/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_3/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/ap_continue] [get_bd_pins fifo_to_Aurora_3/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_3/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_3/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_3/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_3/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_3/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_3/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_3/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_3/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_3/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_3/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_3/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_3/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_3/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_3/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_3/txn] [get_bd_pins aurora_8b10b_3/txp]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_3/rxn] [get_bd_pins aurora_8b10b_3/rxp]
endgroup

############################### Interconexión con el PS ubicado en el driver 0 ##################


# Se agrega el IP Core de la unidad de empaquetamiento

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:packaging_IP_block:1.0 packaging_IP_block_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start]

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins packaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_continue] [get_bd_pins packaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de empaquetamiento al FIFO Generator 1

connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins packaging_IP_block_0/out_fifo_V_din]
connect_bd_net [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins packaging_IP_block_0/out_fifo_V_write]

connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins packaging_IP_block_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_0/A]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_fpga_id
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_fpga_id]

# Se conecta la constante del bloque FPGA IP de la unidad de empaquetamiento, a la constante de FPGA_ID del acelerador
connect_bd_net [get_bd_pins packaging_IP_block_0/fpga_id] [get_bd_pins xconst_fpga_id/dout]

# Se agrega la unidad de desempaquetamiento
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:unpackaging_IP_block:1.0 unpackaging_IP_block_0
endgroup

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins unpackaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_continue] [get_bd_pins unpackaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de desempaquetamiento al FIFO Generator 0
connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_2/A] [get_bd_pins fifo_generator_0/empty]

# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup



############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 5 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 5 del bus


startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

# Se interconecta el acelerador de hardware del driver 0 y los FIFOs Generator 10 y 11

connect_bd_net [get_bd_pins fifo_generator_11/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_10/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_10/A] [get_bd_pins fifo_generator_11/full]
connect_bd_net [get_bd_pins fifo_generator_11/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_10/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_10/rd_en]
connect_bd_net [get_bd_pins inverter_12/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_10/empty] [get_bd_pins inverter_12/A]

# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_FPGA_ID_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlcons_FPGA_ID_Hardware_Acc]

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {5}] [get_bd_cells xlcons_UID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_start_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_start_Hardware_Acc]


connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 6 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 6 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup

# Se interconecta el acelerador de hardware del driver 1 y los FIFOs Generator 12 y 13

connect_bd_net [get_bd_pins fifo_generator_12/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_12/rd_en]
connect_bd_net [get_bd_pins fifo_generator_12/empty] [get_bd_pins inverter_14/A]
connect_bd_net [get_bd_pins inverter_14/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_13/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_13/wr_en]
connect_bd_net [get_bd_pins fifo_generator_13/full] [get_bd_pins inverter_16/A]
connect_bd_net [get_bd_pins inverter_16/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {6}] [get_bd_cells xlcons_UID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult2 ubicado en el driver 7 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 7 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_2
endgroup

# Se interconecta el acelerador de hardware del driver 7 y los FIFOs Generator 14 y 15

connect_bd_net [get_bd_pins fifo_generator_14/dout] [get_bd_pins HardwareAccelerator_2/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_2/in_fifo_V_read] [get_bd_pins fifo_generator_14/rd_en]
connect_bd_net [get_bd_pins fifo_generator_14/empty] [get_bd_pins inverter_18/A]
connect_bd_net [get_bd_pins inverter_18/Y] [get_bd_pins HardwareAccelerator_2/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_15/din] [get_bd_pins HardwareAccelerator_2/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_2/out_fifo_V_write] [get_bd_pins fifo_generator_15/wr_en]
connect_bd_net [get_bd_pins fifo_generator_15/full] [get_bd_pins inverter_19/A]
connect_bd_net [get_bd_pins inverter_19/Y] [get_bd_pins HardwareAccelerator_2/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_2

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {7}] [get_bd_cells xlcons_UID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_2 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_2/ap_continue] [get_bd_pins HardwareAccelerator_2/ap_ready]





############################### Interconexión con el acelerador de hardware Xmult3 ubicado en el driver 8 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 8 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_3
endgroup

# Se interconecta el acelerador de hardware del driver 8 y los FIFOs Generator 16 y 17

connect_bd_net [get_bd_pins fifo_generator_16/dout] [get_bd_pins HardwareAccelerator_3/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_3/in_fifo_V_read] [get_bd_pins fifo_generator_16/rd_en]
connect_bd_net [get_bd_pins fifo_generator_16/empty] [get_bd_pins inverter_20/A]
connect_bd_net [get_bd_pins inverter_20/Y] [get_bd_pins HardwareAccelerator_3/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_17/din] [get_bd_pins HardwareAccelerator_3/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_3/out_fifo_V_write] [get_bd_pins fifo_generator_17/wr_en]
connect_bd_net [get_bd_pins fifo_generator_17/full] [get_bd_pins inverter_21/A]
connect_bd_net [get_bd_pins inverter_21/Y] [get_bd_pins HardwareAccelerator_3/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_3

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {8}] [get_bd_cells xlcons_UID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_3 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_3/ap_continue] [get_bd_pins HardwareAccelerator_3/ap_ready]


# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_0/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_1/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_10/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_11/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_12/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_13/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_14/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_15/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_16/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_17/rst]

# Se conectan los reset de los aceleradores de hardware
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_2/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_3/ap_rst]

# Se invierte el reset para conectarlo a la unidad de empaquetamiento y desempaquetamiento
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins inverter_4/A]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins packaging_IP_block_0/ap_rst_n]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins unpackaging_IP_block_0/ap_rst_n]



######### Se conectan los relojes del sistema

create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de la unidad de empaquetado de datos
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins packaging_IP_block_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins unpackaging_IP_block_0/ap_clk]

# Se conecta el reloj de los aceleradores de hardware
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_1/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_2/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_3/ap_clk]

# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_0/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_1/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_10/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_11/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_12/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_13/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_14/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_15/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_16/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_17/clk]

connect_bd_net [get_bd_pins fifo_generator_2/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_2/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_3/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_3/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_4/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_4/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_5/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_5/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_6/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_6/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_7/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_7/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_8/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_8/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_9/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_9/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_1
connect_bd_net [get_bd_ports channel_up_1] [get_bd_pins aurora_8b10b_1/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_2
connect_bd_net [get_bd_ports channel_up_2] [get_bd_pins aurora_8b10b_2/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_3
connect_bd_net [get_bd_ports channel_up_3] [get_bd_pins aurora_8b10b_3/channel_up]
endgroup

# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs9_PNs4_PS1_Lanes4_design]
close_bd_design [get_bd_designs Drvrs9_PNs4_PS1_Lanes4_design]












































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL SEXTO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 8 drivers. 
# En el driver 0, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 0
# En el driver 1, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 1
# En el driver 2, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 2
# En el driver 3, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 3
# En el driver 4, se conecta un acelerador de hardware el 0
# En el driver 5, se conecta un acelerador de hardware el 1
# En el driver 6, se conecta un acelerador de hardware el 2
# En el driver 7, se conecta un acelerador de hardware el 3



create_bd_design "Drvrs8_PNs4_Lanes4_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs8_PNs4_Lanes4_design/Drvrs8_PNs4_Lanes4_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_8drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7
create_bd_cell -type module -reference inverter inverter_9

create_bd_cell -type module -reference inverter inverter_10
create_bd_cell -type module -reference inverter inverter_11
create_bd_cell -type module -reference inverter inverter_12
create_bd_cell -type module -reference inverter inverter_13
create_bd_cell -type module -reference inverter inverter_14
create_bd_cell -type module -reference inverter inverter_15
create_bd_cell -type module -reference inverter inverter_16
create_bd_cell -type module -reference inverter inverter_18
create_bd_cell -type module -reference inverter inverter_19
create_bd_cell -type module -reference inverter inverter_20
create_bd_cell -type module -reference inverter inverter_21


create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_1
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_2
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_3

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora1
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora2
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora3


create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora1
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora2
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora3

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

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_8
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_9
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_10
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_11
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_12
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_13
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_14
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_15
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora1
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora2
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora3
endgroup


# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_8]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_9]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_10]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_11]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_12]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_13]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_14]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_15]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora1]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora2]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora3]



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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]

############## Interconexión de la los FIFOs del driver 4 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 9 y la entrada al bus paralelo del driver 4
connect_bd_net [get_bd_pins fifo_generator_9/empty] [get_bd_pins inverter_9/A]
connect_bd_net [get_bd_pins fifo_generator_9/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_4_bus_0]
connect_bd_net [get_bd_pins inverter_9/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_4_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_4_bus_0] [get_bd_pins fifo_generator_9/rd_en]


# Se realiza la conexión del puerto de salida del drvr 4 en el bus paralelo  y el FIFO 8. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/wr_en]


############## Interconexión de la los FIFOs del driver 5 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 11 y la entrada al bus paralelo del driver 5
connect_bd_net [get_bd_pins fifo_generator_11/empty] [get_bd_pins inverter_11/A]
connect_bd_net [get_bd_pins fifo_generator_11/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_5_bus_0]
connect_bd_net [get_bd_pins inverter_11/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_5_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_5_bus_0] [get_bd_pins fifo_generator_11/rd_en]


# Se realiza la conexión del puerto de salida del drvr 5 en el bus paralelo  y el FIFO 10. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_5_bus_0] [get_bd_pins fifo_generator_10/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_5_bus_0] [get_bd_pins fifo_generator_10/wr_en]

############## Interconexión de la los FIFOs del driver 6 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 13 y la entrada al bus paralelo del driver 6
connect_bd_net [get_bd_pins fifo_generator_13/empty] [get_bd_pins inverter_13/A]
connect_bd_net [get_bd_pins fifo_generator_13/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_6_bus_0]
connect_bd_net [get_bd_pins inverter_13/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_6_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_6_bus_0] [get_bd_pins fifo_generator_13/rd_en]


# Se realiza la conexión del puerto de salida del drvr 6 en el bus paralelo  y el FIFO 12. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_6_bus_0] [get_bd_pins fifo_generator_12/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_6_bus_0] [get_bd_pins fifo_generator_12/wr_en]

############## Interconexión de la los FIFOs del driver 7 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 15 y la entrada al bus paralelo del driver 7
connect_bd_net [get_bd_pins fifo_generator_15/empty] [get_bd_pins inverter_15/A]
connect_bd_net [get_bd_pins fifo_generator_15/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_7_bus_0]
connect_bd_net [get_bd_pins inverter_15/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_7_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_7_bus_0] [get_bd_pins fifo_generator_15/rd_en]


# Se realiza la conexión del puerto de salida del drvr 7 en el bus paralelo  y el FIFO 14. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_7_bus_0] [get_bd_pins fifo_generator_14/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_7_bus_0] [get_bd_pins fifo_generator_14/wr_en]

############################### Se agrega el Aurora 8b10b en el driver 0 ###########################################################
## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_0/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_0/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_1/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_1/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_1/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup


############################### Se agrega el Aurora 8b10b en el driver 1 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_1
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_1]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_1]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_1/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_1/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_1/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_1
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_1
endgroup

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_1/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_1/ap_rst]


connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/Y] [get_bd_pins fifo_to_Aurora_1/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/A] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]


connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TDATA] [get_bd_pins aurora_8b10b_1/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TLAST] [get_bd_pins aurora_8b10b_1/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TVALID] [get_bd_pins aurora_8b10b_1/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TREADY] [get_bd_pins aurora_8b10b_1/s_axi_tx_tready]


connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_1/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_1/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora1/din]
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora1/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/empty] [get_bd_pins inverter_empty_OutputAurora1/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora1/Y] [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora1/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora1/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_1]

connect_bd_net [get_bd_pins xconst_id_next_fpga_1/dout] [get_bd_pins fifo_to_Aurora_1/id_next_fpga]


# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_1/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/ap_continue] [get_bd_pins Aurora_to_fifo_1/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_1/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/ap_continue] [get_bd_pins fifo_to_Aurora_1/ap_ready]


# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_1/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_1/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_1/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_1/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_1/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_1/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_1/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_1/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_1/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_1/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/txn] [get_bd_pins aurora_8b10b_1/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/rxn] [get_bd_pins aurora_8b10b_1/rxp]
endgroup




############################### Se agrega el Aurora 8b10b en el driver 2 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_2
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_2]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_2]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_2/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_2/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_2/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_2
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_2
endgroup


# # Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_2/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_2/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora2/Y] [get_bd_pins fifo_to_Aurora_2/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora2/A] [get_bd_pins fifo_generator_4/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/in_fifo_V_dout] [get_bd_pins fifo_generator_4/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TDATA] [get_bd_pins aurora_8b10b_2/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TLAST] [get_bd_pins aurora_8b10b_2/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TVALID] [get_bd_pins aurora_8b10b_2/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/output_r_TREADY] [get_bd_pins aurora_8b10b_2/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_2/out_fifo_V_din] [get_bd_pins fifo_generator_5/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/out_fifo_V_write] [get_bd_pins fifo_generator_5/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_2/A] [get_bd_pins fifo_generator_5/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_2/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_2/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora2/din]
connect_bd_net [get_bd_pins aurora_8b10b_2/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora2/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora2/empty] [get_bd_pins inverter_empty_OutputAurora2/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora2/Y] [get_bd_pins Aurora_to_fifo_2/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora2/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora2/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora2/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora2/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_2]

connect_bd_net [get_bd_pins xconst_id_next_fpga_2/dout] [get_bd_pins fifo_to_Aurora_2/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_2/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_2/ap_continue] [get_bd_pins Aurora_to_fifo_2/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_2/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_2/ap_continue] [get_bd_pins fifo_to_Aurora_2/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_2/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_2/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_2/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_2/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_2/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_2/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_2/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_2/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_2/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_2/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_2/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_2/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_2/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_2/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_2/txn] [get_bd_pins aurora_8b10b_2/txp]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_2/rxn] [get_bd_pins aurora_8b10b_2/rxp]
endgroup



############################### Se agrega el Aurora 8b10b en el driver 3 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_3
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_3]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_3]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_3/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_3/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_3/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_3
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_3
endgroup

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_3/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_3/ap_rst]

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora3/Y] [get_bd_pins fifo_to_Aurora_3/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora3/A] [get_bd_pins fifo_generator_6/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/in_fifo_V_dout] [get_bd_pins fifo_generator_6/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TDATA] [get_bd_pins aurora_8b10b_3/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TLAST] [get_bd_pins aurora_8b10b_3/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TVALID] [get_bd_pins aurora_8b10b_3/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/output_r_TREADY] [get_bd_pins aurora_8b10b_3/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_3/out_fifo_V_din] [get_bd_pins fifo_generator_7/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_3/A] [get_bd_pins fifo_generator_7/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_3/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_3/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora3/din]
connect_bd_net [get_bd_pins aurora_8b10b_3/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora3/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora3/empty] [get_bd_pins inverter_empty_OutputAurora3/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora3/Y] [get_bd_pins Aurora_to_fifo_3/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora3/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora3/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora3/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora3/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_3]

connect_bd_net [get_bd_pins xconst_id_next_fpga_3/dout] [get_bd_pins fifo_to_Aurora_3/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_3/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_3/ap_continue] [get_bd_pins Aurora_to_fifo_3/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_3/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_3/ap_continue] [get_bd_pins fifo_to_Aurora_3/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_3/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_3/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_3/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_3/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_3/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_3/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_3/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_3/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_3/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_3/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_3/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_3/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_3/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_3/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_3/txn] [get_bd_pins aurora_8b10b_3/txp]
endgroup

startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_3/rxn] [get_bd_pins aurora_8b10b_3/rxp]
endgroup


############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 4 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 4 del bus


startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

# Se interconecta el acelerador de hardware del driver 0 y los FIFOs Generator 8 y 9

connect_bd_net [get_bd_pins fifo_generator_9/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_10/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_10/A] [get_bd_pins fifo_generator_9/full]
connect_bd_net [get_bd_pins fifo_generator_9/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_8/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_8/rd_en]
connect_bd_net [get_bd_pins inverter_12/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_8/empty] [get_bd_pins inverter_12/A]

# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_FPGA_ID_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlcons_FPGA_ID_Hardware_Acc]

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {5}] [get_bd_cells xlcons_UID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_start_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_start_Hardware_Acc]


connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]


############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 5 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 5 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup

# Se interconecta el acelerador de hardware del driver 1 y los FIFOs Generator 10 y 11

connect_bd_net [get_bd_pins fifo_generator_10/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_10/rd_en]
connect_bd_net [get_bd_pins fifo_generator_10/empty] [get_bd_pins inverter_14/A]
connect_bd_net [get_bd_pins inverter_14/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_11/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_11/wr_en]
connect_bd_net [get_bd_pins fifo_generator_11/full] [get_bd_pins inverter_16/A]
connect_bd_net [get_bd_pins inverter_16/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {6}] [get_bd_cells xlcons_UID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult2 ubicado en el driver 6 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 6 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_2
endgroup

# Se interconecta el acelerador de hardware del driver 7 y los FIFOs Generator 12 y 13

connect_bd_net [get_bd_pins fifo_generator_12/dout] [get_bd_pins HardwareAccelerator_2/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_2/in_fifo_V_read] [get_bd_pins fifo_generator_12/rd_en]
connect_bd_net [get_bd_pins fifo_generator_12/empty] [get_bd_pins inverter_18/A]
connect_bd_net [get_bd_pins inverter_18/Y] [get_bd_pins HardwareAccelerator_2/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_13/din] [get_bd_pins HardwareAccelerator_2/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_2/out_fifo_V_write] [get_bd_pins fifo_generator_13/wr_en]
connect_bd_net [get_bd_pins fifo_generator_13/full] [get_bd_pins inverter_19/A]
connect_bd_net [get_bd_pins inverter_19/Y] [get_bd_pins HardwareAccelerator_2/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_2

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {7}] [get_bd_cells xlcons_UID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_2 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_2/ap_continue] [get_bd_pins HardwareAccelerator_2/ap_ready]





############################### Interconexión con el acelerador de hardware Xmult3 ubicado en el driver 7 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 7 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_3
endgroup

# Se interconecta el acelerador de hardware del driver 8 y los FIFOs Generator 14 y 15

connect_bd_net [get_bd_pins fifo_generator_14/dout] [get_bd_pins HardwareAccelerator_3/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_3/in_fifo_V_read] [get_bd_pins fifo_generator_14/rd_en]
connect_bd_net [get_bd_pins fifo_generator_14/empty] [get_bd_pins inverter_20/A]
connect_bd_net [get_bd_pins inverter_20/Y] [get_bd_pins HardwareAccelerator_3/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_15/din] [get_bd_pins HardwareAccelerator_3/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_3/out_fifo_V_write] [get_bd_pins fifo_generator_15/wr_en]
connect_bd_net [get_bd_pins fifo_generator_15/full] [get_bd_pins inverter_21/A]
connect_bd_net [get_bd_pins inverter_21/Y] [get_bd_pins HardwareAccelerator_3/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_3

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {8}] [get_bd_cells xlcons_UID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_3 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_3/ap_continue] [get_bd_pins HardwareAccelerator_3/ap_ready]


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_8/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_9/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_10/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_11/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_12/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_13/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_14/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_15/rst]


# Se conectan los reset de los aceleradores de hardware
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_2/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_3/ap_rst]

######### Se conectan los relojes del sistema

create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de los aceleradores de hardware
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_1/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_2/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_3/ap_clk]

# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_8/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_9/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_10/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_11/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_12/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_13/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_14/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_15/clk]


connect_bd_net [get_bd_pins fifo_generator_0/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_0/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_1/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_1/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_2/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_2/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_3/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_3/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_4/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_4/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_5/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_5/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_6/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_6/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_7/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_7/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_1
connect_bd_net [get_bd_ports channel_up_1] [get_bd_pins aurora_8b10b_1/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_2
connect_bd_net [get_bd_ports channel_up_2] [get_bd_pins aurora_8b10b_2/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_3
connect_bd_net [get_bd_ports channel_up_3] [get_bd_pins aurora_8b10b_3/channel_up]
endgroup

# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs8_PNs4_Lanes4_design]
close_bd_design [get_bd_designs Drvrs8_PNs4_Lanes4_design]













































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL SÉTIMO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 6 drivers. 
# En el driver 0, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 0
# En el driver 1, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 1
# En el driver 2, se conecta un acelerador de hardware el 0
# En el driver 3, se conecta un acelerador de hardware el 1
# En el driver 4, se conecta un acelerador de hardware el 2
# En el driver 5, se conecta un acelerador de hardware el 3



create_bd_design "Drvrs6_PNs4_Lanes2_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs6_PNs4_Lanes2_design/Drvrs6_PNs4_Lanes2_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_6drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7
create_bd_cell -type module -reference inverter inverter_9

create_bd_cell -type module -reference inverter inverter_10
create_bd_cell -type module -reference inverter inverter_11
create_bd_cell -type module -reference inverter inverter_12
create_bd_cell -type module -reference inverter inverter_14
create_bd_cell -type module -reference inverter inverter_16
create_bd_cell -type module -reference inverter inverter_18
create_bd_cell -type module -reference inverter inverter_19
create_bd_cell -type module -reference inverter inverter_20
create_bd_cell -type module -reference inverter inverter_21

create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_1

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora1

create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora1

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

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_8
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_9
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_10
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_11
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora1
endgroup



# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_8]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_9]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_10]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_11]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora1]




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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]

############## Interconexión de la los FIFOs del driver 4 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 9 y la entrada al bus paralelo del driver 4
connect_bd_net [get_bd_pins fifo_generator_9/empty] [get_bd_pins inverter_9/A]
connect_bd_net [get_bd_pins fifo_generator_9/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_4_bus_0]
connect_bd_net [get_bd_pins inverter_9/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_4_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_4_bus_0] [get_bd_pins fifo_generator_9/rd_en]


# Se realiza la conexión del puerto de salida del drvr 4 en el bus paralelo  y el FIFO 8. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/wr_en]


############## Interconexión de la los FIFOs del driver 5 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 11 y la entrada al bus paralelo del driver 5
connect_bd_net [get_bd_pins fifo_generator_11/empty] [get_bd_pins inverter_11/A]
connect_bd_net [get_bd_pins fifo_generator_11/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_5_bus_0]
connect_bd_net [get_bd_pins inverter_11/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_5_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_5_bus_0] [get_bd_pins fifo_generator_11/rd_en]


# Se realiza la conexión del puerto de salida del drvr 5 en el bus paralelo  y el FIFO 10. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_5_bus_0] [get_bd_pins fifo_generator_10/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_5_bus_0] [get_bd_pins fifo_generator_10/wr_en]



############################### Se agrega el Aurora 8b10b en el driver 0 ###########################################################
## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_0/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_0/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_1/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_1/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_1/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup


############################### Se agrega el Aurora 8b10b en el driver 1 ###########################################################
# Este Aurora se configura con lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_1
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_1]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_REFCLK_FREQUENCY {125.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100}] [get_bd_cells aurora_8b10b_1]

# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_1/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora
connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_1/power_down]

# Se conecta el t_keep del Aurora 1, a la misma constante del t_keep a la que está atada el Aurora 0
connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_1/s_axi_tx_tkeep]

# Se agrega un bloque de hardware que sirve como interfaz entre el Aurora y el FIFO
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_1
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_1
endgroup

# Se realizan las interconexiones
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_1/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_1/ap_rst]


connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/Y] [get_bd_pins fifo_to_Aurora_1/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora1/A] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]


connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TDATA] [get_bd_pins aurora_8b10b_1/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TLAST] [get_bd_pins aurora_8b10b_1/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TVALID] [get_bd_pins aurora_8b10b_1/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/output_r_TREADY] [get_bd_pins aurora_8b10b_1/s_axi_tx_tready]


connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_1/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_1/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora1/din]
connect_bd_net [get_bd_pins aurora_8b10b_1/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora1/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/empty] [get_bd_pins inverter_empty_OutputAurora1/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora1/Y] [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora1/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora1/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora1/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_1]

connect_bd_net [get_bd_pins xconst_id_next_fpga_1/dout] [get_bd_pins fifo_to_Aurora_1/id_next_fpga]


# Se agrega la constante  para el ap_start de este módulo y el ap_continue
connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_1/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_1/ap_continue] [get_bd_pins Aurora_to_fifo_1/ap_ready]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_1/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_1/ap_continue] [get_bd_pins fifo_to_Aurora_1/ap_ready]


# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo, observe que como comparten lógica, se usa el mismo user_clk_out
# generado por el Aurora_8b10b_0
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_1/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_1/ap_clk] 

# Se conectan los reloj del Aurora, a los generados por el clk wizard
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_1/gt_refclk1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_1/init_clk_in] 

# Se realiza toda la conexión entre el primer Aurora y el segundo a través del share logic
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins aurora_8b10b_1/reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_reset_out] [get_bd_pins aurora_8b10b_1/gt_reset]
connect_bd_net [get_bd_pins aurora_8b10b_0/sync_clk_out] [get_bd_pins aurora_8b10b_1/sync_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins aurora_8b10b_1/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllclk_quad1_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt_qpllrefclk_quad1_out] [get_bd_pins aurora_8b10b_1/gt_qpllrefclk_quad1_in]

connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qplllock_out] [get_bd_pins aurora_8b10b_1/gt0_qplllock_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/gt0_qpllrefclklost_out] [get_bd_pins aurora_8b10b_1/gt0_qpllrefclklost_in]
connect_bd_net [get_bd_pins aurora_8b10b_0/pll_not_locked_out] [get_bd_pins aurora_8b10b_1/pll_not_locked]

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/txn] [get_bd_pins aurora_8b10b_1/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_1/rxn] [get_bd_pins aurora_8b10b_1/rxp]
endgroup

############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 2 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 2 del bus


startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

# Se interconecta el acelerador de hardware del driver 2 y los FIFOs Generator 4 y 5

connect_bd_net [get_bd_pins fifo_generator_5/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_10/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_10/A] [get_bd_pins fifo_generator_5/full]
connect_bd_net [get_bd_pins fifo_generator_5/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_4/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]
connect_bd_net [get_bd_pins inverter_12/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_4/empty] [get_bd_pins inverter_12/A]

# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_FPGA_ID_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlcons_FPGA_ID_Hardware_Acc]

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {5}] [get_bd_cells xlcons_UID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_start_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_start_Hardware_Acc]


connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]


############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 3 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 3 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup

# Se interconecta el acelerador de hardware del driver 3 y los FIFOs Generator 6 y 7

connect_bd_net [get_bd_pins fifo_generator_6/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]
connect_bd_net [get_bd_pins fifo_generator_6/empty] [get_bd_pins inverter_14/A]
connect_bd_net [get_bd_pins inverter_14/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_7/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins fifo_generator_7/full] [get_bd_pins inverter_16/A]
connect_bd_net [get_bd_pins inverter_16/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {6}] [get_bd_cells xlcons_UID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult2 ubicado en el driver 4 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 4 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_2
endgroup

# Se interconecta el acelerador de hardware del driver 4 y los FIFOs Generator 8 y 9

connect_bd_net [get_bd_pins fifo_generator_8/dout] [get_bd_pins HardwareAccelerator_2/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_2/in_fifo_V_read] [get_bd_pins fifo_generator_8/rd_en]
connect_bd_net [get_bd_pins fifo_generator_8/empty] [get_bd_pins inverter_18/A]
connect_bd_net [get_bd_pins inverter_18/Y] [get_bd_pins HardwareAccelerator_2/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_9/din] [get_bd_pins HardwareAccelerator_2/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_2/out_fifo_V_write] [get_bd_pins fifo_generator_9/wr_en]
connect_bd_net [get_bd_pins fifo_generator_9/full] [get_bd_pins inverter_19/A]
connect_bd_net [get_bd_pins inverter_19/Y] [get_bd_pins HardwareAccelerator_2/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_2

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {7}] [get_bd_cells xlcons_UID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_2 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_2/ap_continue] [get_bd_pins HardwareAccelerator_2/ap_ready]





############################### Interconexión con el acelerador de hardware Xmult3 ubicado en el driver 5 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 5 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_3
endgroup

# Se interconecta el acelerador de hardware del driver 5 y los FIFOs Generator 10 y 11

connect_bd_net [get_bd_pins fifo_generator_10/dout] [get_bd_pins HardwareAccelerator_3/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_3/in_fifo_V_read] [get_bd_pins fifo_generator_10/rd_en]
connect_bd_net [get_bd_pins fifo_generator_10/empty] [get_bd_pins inverter_20/A]
connect_bd_net [get_bd_pins inverter_20/Y] [get_bd_pins HardwareAccelerator_3/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_11/din] [get_bd_pins HardwareAccelerator_3/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_3/out_fifo_V_write] [get_bd_pins fifo_generator_11/wr_en]
connect_bd_net [get_bd_pins fifo_generator_11/full] [get_bd_pins inverter_21/A]
connect_bd_net [get_bd_pins inverter_21/Y] [get_bd_pins HardwareAccelerator_3/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_3

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {8}] [get_bd_cells xlcons_UID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_3 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_3/ap_continue] [get_bd_pins HardwareAccelerator_3/ap_ready]


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_4/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_5/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_6/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_7/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_8/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_9/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_10/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_11/rst]



# Se conectan los reset de los aceleradores de hardware
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_2/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_3/ap_rst]

######### Se conectan los relojes del sistema

create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de los aceleradores de hardware
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_1/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_2/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_3/ap_clk]

# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_4/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_5/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_6/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_7/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_8/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_9/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_10/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_11/clk]



connect_bd_net [get_bd_pins fifo_generator_0/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_0/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_1/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_1/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins fifo_generator_2/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_2/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_3/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_3/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]


# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

startgroup
create_bd_port -dir O channel_up_1
connect_bd_net [get_bd_ports channel_up_1] [get_bd_pins aurora_8b10b_1/channel_up]
endgroup

# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs6_PNs4_Lanes2_design]
close_bd_design [get_bd_designs Drvrs6_PNs4_Lanes2_design]
















































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL OCTAVO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 5 drivers. 
# En el driver 0, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 0
# En el driver 1, se conecta un acelerador de hardware el 0
# En el driver 2, se conecta un acelerador de hardware el 1
# En el driver 3, se conecta un acelerador de hardware el 2
# En el driver 4, se conecta un acelerador de hardware el 3



create_bd_design "Drvrs5_PNs4_Lanes1_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs5_PNs4_Lanes1_design/Drvrs5_PNs4_Lanes1_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_5drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7
create_bd_cell -type module -reference inverter inverter_9

create_bd_cell -type module -reference inverter inverter_10
create_bd_cell -type module -reference inverter inverter_12
create_bd_cell -type module -reference inverter inverter_14
create_bd_cell -type module -reference inverter inverter_16
create_bd_cell -type module -reference inverter inverter_18
create_bd_cell -type module -reference inverter inverter_19
create_bd_cell -type module -reference inverter inverter_20
create_bd_cell -type module -reference inverter inverter_21

create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0


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

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_8
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_9
endgroup


# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup




# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_8]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_9]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]

set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]


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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]

############## Interconexión de la los FIFOs del driver 4 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 9 y la entrada al bus paralelo del driver 4
connect_bd_net [get_bd_pins fifo_generator_9/empty] [get_bd_pins inverter_9/A]
connect_bd_net [get_bd_pins fifo_generator_9/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_4_bus_0]
connect_bd_net [get_bd_pins inverter_9/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_4_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_4_bus_0] [get_bd_pins fifo_generator_9/rd_en]


# Se realiza la conexión del puerto de salida del drvr 4 en el bus paralelo  y el FIFO 8. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/wr_en]


############################### Se agrega el Aurora 8b10b en el driver 0 ###########################################################
## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_0/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_0/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_1/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_1/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_1/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup



############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 1 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 1 del bus


startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

# Se interconecta el acelerador de hardware del driver 1 y los FIFOs Generator 2 y 3

connect_bd_net [get_bd_pins fifo_generator_3/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_10/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_10/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins fifo_generator_3/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_2/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]
connect_bd_net [get_bd_pins inverter_12/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_2/empty] [get_bd_pins inverter_12/A]

# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_FPGA_ID_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlcons_FPGA_ID_Hardware_Acc]

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {5}] [get_bd_cells xlcons_UID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_start_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_start_Hardware_Acc]


connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]


############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 2 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 2 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup

# Se interconecta el acelerador de hardware del driver 3 y los FIFOs Generator 4 Y 5

connect_bd_net [get_bd_pins fifo_generator_4/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]
connect_bd_net [get_bd_pins fifo_generator_4/empty] [get_bd_pins inverter_14/A]
connect_bd_net [get_bd_pins inverter_14/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_5/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_5/wr_en]
connect_bd_net [get_bd_pins fifo_generator_5/full] [get_bd_pins inverter_16/A]
connect_bd_net [get_bd_pins inverter_16/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {6}] [get_bd_cells xlcons_UID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult2 ubicado en el driver 3 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 3 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_2
endgroup

# Se interconecta el acelerador de hardware del driver 4 y los FIFOs Generator6 Y 7

connect_bd_net [get_bd_pins fifo_generator_6/dout] [get_bd_pins HardwareAccelerator_2/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_2/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]
connect_bd_net [get_bd_pins fifo_generator_6/empty] [get_bd_pins inverter_18/A]
connect_bd_net [get_bd_pins inverter_18/Y] [get_bd_pins HardwareAccelerator_2/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_7/din] [get_bd_pins HardwareAccelerator_2/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_2/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins fifo_generator_7/full] [get_bd_pins inverter_19/A]
connect_bd_net [get_bd_pins inverter_19/Y] [get_bd_pins HardwareAccelerator_2/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_2

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {7}] [get_bd_cells xlcons_UID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_2 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_2/ap_continue] [get_bd_pins HardwareAccelerator_2/ap_ready]





############################### Interconexión con el acelerador de hardware Xmult3 ubicado en el driver 4 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 4 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_3
endgroup

# Se interconecta el acelerador de hardware del driver 5 y los FIFOs Generator 8 y 9

connect_bd_net [get_bd_pins fifo_generator_8/dout] [get_bd_pins HardwareAccelerator_3/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_3/in_fifo_V_read] [get_bd_pins fifo_generator_8/rd_en]
connect_bd_net [get_bd_pins fifo_generator_8/empty] [get_bd_pins inverter_20/A]
connect_bd_net [get_bd_pins inverter_20/Y] [get_bd_pins HardwareAccelerator_3/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_9/din] [get_bd_pins HardwareAccelerator_3/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_3/out_fifo_V_write] [get_bd_pins fifo_generator_9/wr_en]
connect_bd_net [get_bd_pins fifo_generator_9/full] [get_bd_pins inverter_21/A]
connect_bd_net [get_bd_pins inverter_21/Y] [get_bd_pins HardwareAccelerator_3/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_3

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {8}] [get_bd_cells xlcons_UID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_3 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_3/ap_continue] [get_bd_pins HardwareAccelerator_3/ap_ready]


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_2/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_3/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_4/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_5/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_6/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_7/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_8/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_9/rst]



# Se conectan los reset de los aceleradores de hardware
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_2/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_3/ap_rst]

######### Se conectan los relojes del sistema

create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de los aceleradores de hardware
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_1/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_2/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_3/ap_clk]

# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_2/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_3/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_4/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_5/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_6/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_7/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_8/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_9/clk]


connect_bd_net [get_bd_pins fifo_generator_0/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_0/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_1/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_1/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]


# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup


# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs5_PNs4_Lanes1_design]
close_bd_design [get_bd_designs Drvrs5_PNs4_Lanes1_design]
















































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL NOVENO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 6 drivers. 
# En el driver 0, se conecta el Zynq o PS
# En el driver 1, se conecta un Aurora 8b10b, en este caso el Aurora 8b10b 0
# En el driver 2, se conecta un acelerador de hardware el 0
# En el driver 3, se conecta un acelerador de hardware el 1
# En el driver 4, se conecta un acelerador de hardware el 2
# En el driver 5, se conecta un acelerador de hardware el 3



create_bd_design "Drvrs6_PNs4_PS1_Lanes1_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs6_PNs4_PS1_Lanes1_design/Drvrs6_PNs4_PS1_Lanes1_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_6drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7
create_bd_cell -type module -reference inverter inverter_9

create_bd_cell -type module -reference inverter inverter_10
create_bd_cell -type module -reference inverter inverter_11
create_bd_cell -type module -reference inverter inverter_12
create_bd_cell -type module -reference inverter inverter_14
create_bd_cell -type module -reference inverter inverter_16
create_bd_cell -type module -reference inverter inverter_18
create_bd_cell -type module -reference inverter inverter_19
create_bd_cell -type module -reference inverter inverter_20
create_bd_cell -type module -reference inverter inverter_21

create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0

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

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_8
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_9
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_10
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_11
endgroup


# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup

# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_8]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_9]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_10]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_11]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]




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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]

############## Interconexión de la los FIFOs del driver 4 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 9 y la entrada al bus paralelo del driver 4
connect_bd_net [get_bd_pins fifo_generator_9/empty] [get_bd_pins inverter_9/A]
connect_bd_net [get_bd_pins fifo_generator_9/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_4_bus_0]
connect_bd_net [get_bd_pins inverter_9/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_4_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_4_bus_0] [get_bd_pins fifo_generator_9/rd_en]


# Se realiza la conexión del puerto de salida del drvr 4 en el bus paralelo  y el FIFO 8. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/wr_en]


############## Interconexión de la los FIFOs del driver 5 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 11 y la entrada al bus paralelo del driver 5
connect_bd_net [get_bd_pins fifo_generator_11/empty] [get_bd_pins inverter_11/A]
connect_bd_net [get_bd_pins fifo_generator_11/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_5_bus_0]
connect_bd_net [get_bd_pins inverter_11/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_5_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_5_bus_0] [get_bd_pins fifo_generator_11/rd_en]


# Se realiza la conexión del puerto de salida del drvr 5 en el bus paralelo  y el FIFO 10. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_5_bus_0] [get_bd_pins fifo_generator_10/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_5_bus_0] [get_bd_pins fifo_generator_10/wr_en]



############################### Se agrega el Aurora 8b10b en el driver 1 ###########################################################
## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup


############################### Interconexión con el PS ubicado en el driver 0 ##################


# Se agrega el IP Core de la unidad de empaquetamiento

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:packaging_IP_block:1.0 packaging_IP_block_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start]

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins packaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_continue] [get_bd_pins packaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de empaquetamiento al FIFO Generator 1

connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins packaging_IP_block_0/out_fifo_V_din]
connect_bd_net [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins packaging_IP_block_0/out_fifo_V_write]

connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins packaging_IP_block_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_0/A]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_fpga_id
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_fpga_id]

# Se conecta la constante del bloque FPGA IP de la unidad de empaquetamiento, a la constante de FPGA_ID del acelerador
connect_bd_net [get_bd_pins packaging_IP_block_0/fpga_id] [get_bd_pins xconst_fpga_id/dout]

# Se agrega la unidad de desempaquetamiento
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:unpackaging_IP_block:1.0 unpackaging_IP_block_0
endgroup

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins unpackaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_continue] [get_bd_pins unpackaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de desempaquetamiento al FIFO Generator 0
connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_2/A] [get_bd_pins fifo_generator_0/empty]

# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup



############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 2 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 2 del bus


startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

# Se interconecta el acelerador de hardware del driver 0 y los FIFOs Generator 4 y 5

connect_bd_net [get_bd_pins fifo_generator_5/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_10/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_10/A] [get_bd_pins fifo_generator_5/full]
connect_bd_net [get_bd_pins fifo_generator_5/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_4/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]
connect_bd_net [get_bd_pins inverter_12/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_4/empty] [get_bd_pins inverter_12/A]

# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_FPGA_ID_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlcons_FPGA_ID_Hardware_Acc]

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {5}] [get_bd_cells xlcons_UID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_start_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_start_Hardware_Acc]


connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 2 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 2 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup

# Se interconecta el acelerador de hardware del driver 1 y los FIFOs Generator 6 y 7

connect_bd_net [get_bd_pins fifo_generator_6/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]
connect_bd_net [get_bd_pins fifo_generator_6/empty] [get_bd_pins inverter_14/A]
connect_bd_net [get_bd_pins inverter_14/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_7/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins fifo_generator_7/full] [get_bd_pins inverter_16/A]
connect_bd_net [get_bd_pins inverter_16/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {6}] [get_bd_cells xlcons_UID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult2 ubicado en el driver 4 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 4 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_2
endgroup

# Se interconecta el acelerador de hardware del driver 7 y los FIFOs Generator 8 y 9

connect_bd_net [get_bd_pins fifo_generator_8/dout] [get_bd_pins HardwareAccelerator_2/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_2/in_fifo_V_read] [get_bd_pins fifo_generator_8/rd_en]
connect_bd_net [get_bd_pins fifo_generator_8/empty] [get_bd_pins inverter_18/A]
connect_bd_net [get_bd_pins inverter_18/Y] [get_bd_pins HardwareAccelerator_2/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_9/din] [get_bd_pins HardwareAccelerator_2/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_2/out_fifo_V_write] [get_bd_pins fifo_generator_9/wr_en]
connect_bd_net [get_bd_pins fifo_generator_9/full] [get_bd_pins inverter_19/A]
connect_bd_net [get_bd_pins inverter_19/Y] [get_bd_pins HardwareAccelerator_2/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_2

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {7}] [get_bd_cells xlcons_UID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_2 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_2/ap_continue] [get_bd_pins HardwareAccelerator_2/ap_ready]





############################### Interconexión con el acelerador de hardware Xmult3 ubicado en el driver 5 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 5 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_3
endgroup

# Se interconecta el acelerador de hardware del driver 8 y los FIFOs Generator 10 y 11

connect_bd_net [get_bd_pins fifo_generator_10/dout] [get_bd_pins HardwareAccelerator_3/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_3/in_fifo_V_read] [get_bd_pins fifo_generator_10/rd_en]
connect_bd_net [get_bd_pins fifo_generator_10/empty] [get_bd_pins inverter_20/A]
connect_bd_net [get_bd_pins inverter_20/Y] [get_bd_pins HardwareAccelerator_3/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_11/din] [get_bd_pins HardwareAccelerator_3/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_3/out_fifo_V_write] [get_bd_pins fifo_generator_11/wr_en]
connect_bd_net [get_bd_pins fifo_generator_11/full] [get_bd_pins inverter_21/A]
connect_bd_net [get_bd_pins inverter_21/Y] [get_bd_pins HardwareAccelerator_3/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_3

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_3

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_3
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {8}] [get_bd_cells xlcons_UID_Hardware_Acc_3]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_3/dout] [get_bd_pins HardwareAccelerator_3/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_3 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_3/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_3/ap_continue] [get_bd_pins HardwareAccelerator_3/ap_ready]


# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_0/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_1/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_4/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_5/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_6/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_7/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_8/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_9/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_10/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_11/rst]

# Se conectan los reset de los aceleradores de hardware
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_2/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_3/ap_rst]

# Se invierte el reset para conectarlo a la unidad de empaquetamiento y desempaquetamiento
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins inverter_4/A]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins packaging_IP_block_0/ap_rst_n]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins unpackaging_IP_block_0/ap_rst_n]



######### Se conectan los relojes del sistema

create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de la unidad de empaquetado de datos
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins packaging_IP_block_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins unpackaging_IP_block_0/ap_clk]

# Se conecta el reloj de los aceleradores de hardware
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_1/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_2/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_3/ap_clk]

# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_0/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_1/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_4/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_5/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_6/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_7/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_8/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_9/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_10/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_11/clk]


connect_bd_net [get_bd_pins fifo_generator_2/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_2/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_3/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_3/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]


# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs6_PNs4_PS1_Lanes1_design]
close_bd_design [get_bd_designs Drvrs6_PNs4_PS1_Lanes1_design]

























##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL DECIMO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 5 drivers. 
# En el driver 0, se conecta el Zynq o PS
# En el driver 1, se encuentra el Aurora 8b10b
# En el driver 2, se conecta un acelerador de hardware el 0
# En el driver 3, se conecta un acelerador de hardware el 1
# En el driver 4, se conecta un acelerador de hardware el 2



create_bd_design "Drvrs5_PNs3_PS1_Lanes1_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs5_PNs3_PS1_Lanes1_design/Drvrs5_PNs3_PS1_Lanes1_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_5drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7
create_bd_cell -type module -reference inverter inverter_9

create_bd_cell -type module -reference inverter inverter_10
create_bd_cell -type module -reference inverter inverter_12
create_bd_cell -type module -reference inverter inverter_14
create_bd_cell -type module -reference inverter inverter_16
create_bd_cell -type module -reference inverter inverter_18
create_bd_cell -type module -reference inverter inverter_19

create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0


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

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_8
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_9
endgroup

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup



# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_8]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_9]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]




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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]

############## Interconexión de la los FIFOs del driver 4 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 9 y la entrada al bus paralelo del driver 4
connect_bd_net [get_bd_pins fifo_generator_9/empty] [get_bd_pins inverter_9/A]
connect_bd_net [get_bd_pins fifo_generator_9/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_4_bus_0]
connect_bd_net [get_bd_pins inverter_9/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_4_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_4_bus_0] [get_bd_pins fifo_generator_9/rd_en]


# Se realiza la conexión del puerto de salida del drvr 4 en el bus paralelo  y el FIFO 8. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_4_bus_0] [get_bd_pins fifo_generator_8/wr_en]



############################### Se agrega el Aurora 8b10b en el driver 1 ###########################################################
## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup

############################### Interconexión con el PS ubicado en el driver 0 ##################


# Se agrega el IP Core de la unidad de empaquetamiento

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:packaging_IP_block:1.0 packaging_IP_block_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start]

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins packaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_continue] [get_bd_pins packaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de empaquetamiento al FIFO Generator 1

connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins packaging_IP_block_0/out_fifo_V_din]
connect_bd_net [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins packaging_IP_block_0/out_fifo_V_write]

connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins packaging_IP_block_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_0/A]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_fpga_id
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_fpga_id]

# Se conecta la constante del bloque FPGA IP de la unidad de empaquetamiento, a la constante de FPGA_ID del acelerador
connect_bd_net [get_bd_pins packaging_IP_block_0/fpga_id] [get_bd_pins xconst_fpga_id/dout]

# Se agrega la unidad de desempaquetamiento
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:unpackaging_IP_block:1.0 unpackaging_IP_block_0
endgroup

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins unpackaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_continue] [get_bd_pins unpackaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de desempaquetamiento al FIFO Generator 0
connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_2/A] [get_bd_pins fifo_generator_0/empty]

# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup



############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 2 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 2 del bus


startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

# Se interconecta el acelerador de hardware del driver 0 y los FIFOs Generator 4 y 5

connect_bd_net [get_bd_pins fifo_generator_5/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_10/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_10/A] [get_bd_pins fifo_generator_5/full]
connect_bd_net [get_bd_pins fifo_generator_5/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_4/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]
connect_bd_net [get_bd_pins inverter_12/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_4/empty] [get_bd_pins inverter_12/A]

# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_FPGA_ID_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlcons_FPGA_ID_Hardware_Acc]

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {2}] [get_bd_cells xlcons_UID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_start_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_start_Hardware_Acc]


connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 3 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 3 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup

# Se interconecta el acelerador de hardware del driver 1 y los FIFOs Generator 6 y 7

connect_bd_net [get_bd_pins fifo_generator_6/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]
connect_bd_net [get_bd_pins fifo_generator_6/empty] [get_bd_pins inverter_14/A]
connect_bd_net [get_bd_pins inverter_14/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_7/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins fifo_generator_7/full] [get_bd_pins inverter_16/A]
connect_bd_net [get_bd_pins inverter_16/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {3}] [get_bd_cells xlcons_UID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult2 ubicado en el driver 4 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 4 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_2
endgroup

# Se interconecta el acelerador de hardware del driver 7 y los FIFOs Generator 8 y 9

connect_bd_net [get_bd_pins fifo_generator_8/dout] [get_bd_pins HardwareAccelerator_2/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_2/in_fifo_V_read] [get_bd_pins fifo_generator_8/rd_en]
connect_bd_net [get_bd_pins fifo_generator_8/empty] [get_bd_pins inverter_18/A]
connect_bd_net [get_bd_pins inverter_18/Y] [get_bd_pins HardwareAccelerator_2/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_9/din] [get_bd_pins HardwareAccelerator_2/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_2/out_fifo_V_write] [get_bd_pins fifo_generator_9/wr_en]
connect_bd_net [get_bd_pins fifo_generator_9/full] [get_bd_pins inverter_19/A]
connect_bd_net [get_bd_pins inverter_19/Y] [get_bd_pins HardwareAccelerator_2/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_2

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_UID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_2 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_2/ap_continue] [get_bd_pins HardwareAccelerator_2/ap_ready]


# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_0/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_1/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_4/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_5/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_6/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_7/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_8/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_9/rst]


# Se conectan los reset de los aceleradores de hardware
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_2/ap_rst]

# Se invierte el reset para conectarlo a la unidad de empaquetamiento y desempaquetamiento
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins inverter_4/A]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins packaging_IP_block_0/ap_rst_n]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins unpackaging_IP_block_0/ap_rst_n]



######### Se conectan los relojes del sistema

create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de la unidad de empaquetado de datos
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins packaging_IP_block_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins unpackaging_IP_block_0/ap_clk]

# Se conecta el reloj de los aceleradores de hardware
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_1/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins HardwareAccelerator_2/ap_clk]

# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_0/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_1/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_4/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_5/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_6/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_7/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_8/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_9/clk]

connect_bd_net [get_bd_pins fifo_generator_2/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_2/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_3/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_3/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]


# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs5_PNs3_PS1_Lanes1_design]
close_bd_design [get_bd_designs Drvrs5_PNs3_PS1_Lanes1_design]
























































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL UNDÉCIMO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 4 drivers. 
# En el driver 0, se conecta el Zynq o PS
# En el driver 1, se conecta un acelerador de hardware el 0
# En el driver 2, se conecta un acelerador de hardware el 1
# En el driver 3, se conecta un acelerador de hardware el 2



create_bd_design "Drvrs4_PNs3_PS1_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs4_PNs3_PS1_design/Drvrs4_PNs3_PS1_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_4drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4
create_bd_cell -type module -reference inverter inverter_5
create_bd_cell -type module -reference inverter inverter_7

create_bd_cell -type module -reference inverter inverter_10
create_bd_cell -type module -reference inverter inverter_12
create_bd_cell -type module -reference inverter inverter_14
create_bd_cell -type module -reference inverter inverter_16
create_bd_cell -type module -reference inverter inverter_18
create_bd_cell -type module -reference inverter inverter_19




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
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_4]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_5]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_6]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_7]
endgroup





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


############## Interconexión de la los FIFOs del driver 3 y el bus paralelo ############################

# realiza la conexión entre la salida de la FIFO 7 y la entrada al bus paralelo del driver 3
connect_bd_net [get_bd_pins fifo_generator_7/empty] [get_bd_pins inverter_7/A]
connect_bd_net [get_bd_pins fifo_generator_7/dout] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_pop_drvr_3_bus_0]
connect_bd_net [get_bd_pins inverter_7/Y] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pndng_drvr_3_bus_0]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_3_bus_0] [get_bd_pins fifo_generator_7/rd_en]


# Se realiza la conexión del puerto de salida del drvr 3 en el bus paralelo  y el FIFO 6. Dado que el bus no tiene bandera full, está no se usa
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/D_push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/din]
connect_bd_net [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_3_bus_0] [get_bd_pins fifo_generator_6/wr_en]


############################### Interconexión con el PS ubicado en el driver 0 ##################


# Se agrega el IP Core de la unidad de empaquetamiento

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:packaging_IP_block:1.0 packaging_IP_block_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start]

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins packaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_continue] [get_bd_pins packaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de empaquetamiento al FIFO Generator 1

connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins packaging_IP_block_0/out_fifo_V_din]
connect_bd_net [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins packaging_IP_block_0/out_fifo_V_write]

connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins packaging_IP_block_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_0/A]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_fpga_id
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_fpga_id]

# Se conecta la constante del bloque FPGA IP de la unidad de empaquetamiento, a la constante de FPGA_ID del acelerador
connect_bd_net [get_bd_pins packaging_IP_block_0/fpga_id] [get_bd_pins xconst_fpga_id/dout]

# Se agrega la unidad de desempaquetamiento
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:unpackaging_IP_block:1.0 unpackaging_IP_block_0
endgroup

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins unpackaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_continue] [get_bd_pins unpackaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de desempaquetamiento al FIFO Generator 0
connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_2/A] [get_bd_pins fifo_generator_0/empty]

# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup



############################### Interconexión con el acelerador de hardware Xmult0 ubicado en el driver 1 ##################

## Se agrega el primer IP Core del multiplicador y se conecta al driver 1 del bus


startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_0
endgroup

# Se interconecta el acelerador de hardware del driver 0 y los FIFOs Generator 2 y 3

connect_bd_net [get_bd_pins fifo_generator_3/wr_en] [get_bd_pins HardwareAccelerator_0/out_fifo_V_write]
connect_bd_net [get_bd_pins inverter_10/Y] [get_bd_pins HardwareAccelerator_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins inverter_10/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins fifo_generator_3/din] [get_bd_pins HardwareAccelerator_0/out_fifo_V_din]

connect_bd_net [get_bd_pins fifo_generator_2/dout] [get_bd_pins HardwareAccelerator_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_0/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]
connect_bd_net [get_bd_pins inverter_12/Y] [get_bd_pins HardwareAccelerator_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins fifo_generator_2/empty] [get_bd_pins inverter_12/A]

# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_FPGA_ID_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {0}] [get_bd_cells xlcons_FPGA_ID_Hardware_Acc]

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_0

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {5}] [get_bd_cells xlcons_UID_Hardware_Acc_0]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_0/dout] [get_bd_pins HardwareAccelerator_0/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_0 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_start_Hardware_Acc
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_start_Hardware_Acc]


connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_0/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_0/ap_continue] [get_bd_pins HardwareAccelerator_0/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult1 ubicado en el driver 2 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 2 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_1
endgroup

# Se interconecta el acelerador de hardware del driver 1 y los FIFOs Generator 4 y 5

connect_bd_net [get_bd_pins fifo_generator_4/dout] [get_bd_pins HardwareAccelerator_1/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_1/in_fifo_V_read] [get_bd_pins fifo_generator_4/rd_en]
connect_bd_net [get_bd_pins fifo_generator_4/empty] [get_bd_pins inverter_14/A]
connect_bd_net [get_bd_pins inverter_14/Y] [get_bd_pins HardwareAccelerator_1/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_5/din] [get_bd_pins HardwareAccelerator_1/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_1/out_fifo_V_write] [get_bd_pins fifo_generator_5/wr_en]
connect_bd_net [get_bd_pins fifo_generator_5/full] [get_bd_pins inverter_16/A]
connect_bd_net [get_bd_pins inverter_16/Y] [get_bd_pins HardwareAccelerator_1/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_1

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_1

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_1
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {6}] [get_bd_cells xlcons_UID_Hardware_Acc_1]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_1/dout] [get_bd_pins HardwareAccelerator_1/uid]

# Se configura el multiplicador Wrapper_Matrix_Multi_1 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_1/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_1/ap_continue] [get_bd_pins HardwareAccelerator_1/ap_ready]




############################### Interconexión con el acelerador de hardware Xmult2 ubicado en el driver 3 ##################

## Se agrega el segundo IP Core del multiplicador y se conecta al driver 3 del bus

# Se agrega el IP Core custom del multiplicador
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Wrapper_Matrix_Multiplier:1.0 HardwareAccelerator_2
endgroup

# Se interconecta el acelerador de hardware del driver 7 y los FIFOs Generator 6 y 7

connect_bd_net [get_bd_pins fifo_generator_6/dout] [get_bd_pins HardwareAccelerator_2/in_fifo_V_dout]
connect_bd_net [get_bd_pins HardwareAccelerator_2/in_fifo_V_read] [get_bd_pins fifo_generator_6/rd_en]
connect_bd_net [get_bd_pins fifo_generator_6/empty] [get_bd_pins inverter_18/A]
connect_bd_net [get_bd_pins inverter_18/Y] [get_bd_pins HardwareAccelerator_2/in_fifo_V_empty_n]


connect_bd_net [get_bd_pins fifo_generator_7/din] [get_bd_pins HardwareAccelerator_2/out_fifo_V_din]
connect_bd_net [get_bd_pins HardwareAccelerator_2/out_fifo_V_write] [get_bd_pins fifo_generator_7/wr_en]
connect_bd_net [get_bd_pins fifo_generator_7/full] [get_bd_pins inverter_19/A]
connect_bd_net [get_bd_pins inverter_19/Y] [get_bd_pins HardwareAccelerator_2/out_fifo_V_full_n]


# Se agrega una constante para el bus_id del multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_BS_ID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlcons_BS_ID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_BS_ID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/bus_id]

# Se agrega una constante para el fpga_id del multiplicador Wrapper_Matrix_Multi_2

connect_bd_net [get_bd_pins xlcons_FPGA_ID_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/fpga_id]

# Se agrega una constante para colocar el identificador único uid del nodo multiplicador Wrapper_Matrix_Multi_2

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlcons_UID_Hardware_Acc_2
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {7}] [get_bd_cells xlcons_UID_Hardware_Acc_2]

connect_bd_net [get_bd_pins xlcons_UID_Hardware_Acc_2/dout] [get_bd_pins HardwareAccelerator_2/uid]
# Se configura el multiplicador Wrapper_Matrix_Multi_2 para que trabaje en modo AutoStart. El ap_start se conecta a 1, miéntras
# que el ap_ready se conecta al ap_continue

connect_bd_net [get_bd_pins xconst_start_Hardware_Acc/dout] [get_bd_pins HardwareAccelerator_2/ap_start]
connect_bd_net [get_bd_pins HardwareAccelerator_2/ap_continue] [get_bd_pins HardwareAccelerator_2/ap_ready]


# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_0/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_1/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_2/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_3/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_4/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_5/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_6/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_7/rst]


# Se conectan los reset de los aceleradores de hardware
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_0/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_1/ap_rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins HardwareAccelerator_2/ap_rst]

# Se invierte el reset para conectarlo a la unidad de empaquetamiento y desempaquetamiento
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins inverter_4/A]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins packaging_IP_block_0/ap_rst_n]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins unpackaging_IP_block_0/ap_rst_n]



######### Se conectan los relojes del sistema

create_bd_port -dir I clk

# Se conecta el reloj del bus
connect_bd_net [get_bd_ports clk] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de la unidad de empaquetado de datos
connect_bd_net [get_bd_ports clk] [get_bd_pins packaging_IP_block_0/ap_clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins unpackaging_IP_block_0/ap_clk]

# Se conecta el reloj de los aceleradores de hardware
connect_bd_net [get_bd_ports clk] [get_bd_pins HardwareAccelerator_0/ap_clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins HardwareAccelerator_1/ap_clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins HardwareAccelerator_2/ap_clk]

# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_ports clk] [get_bd_pins fifo_generator_0/clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins fifo_generator_1/clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins fifo_generator_2/clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins fifo_generator_3/clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins fifo_generator_4/clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins fifo_generator_5/clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins fifo_generator_6/clk]
connect_bd_net [get_bd_ports clk] [get_bd_pins fifo_generator_7/clk]


save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs4_PNs3_PS1_design]
close_bd_design [get_bd_designs Drvrs4_PNs3_PS1_design]























































##############################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
############################ AQUÍ EMPIEZA LA CONSTRUCCIÓN DEL DUODÉCIMO DISEÑO
##############################################################################################################
##############################################################################################################
##############################################################################################################

# En este diseño se configura un bus con 2 drivers. 
# En el driver 0, se conecta el Zynq o PS
# En el driver 1, se encuentra el Aurora 8b10b




create_bd_design "Drvrs2_PS1_Lanes1_design"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/Drvrs2_PS1_Lanes1_design/Drvrs2_PS1_Lanes1_design.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_2drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4


create_bd_cell -type module -reference inverter inverter_reset_TX_RX_Block
create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0

create_bd_cell -type module -reference inverter inverter_empty_fifo_to_aurora0
create_bd_cell -type module -reference inverter inverter_empty_OutputAurora0


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

# FIFO de la salida del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_OutputAurora0
endgroup



# Se configura adecuadamente los IPs FIFO Generator,
# Cada FIFO se configura con una profundidad de 512 elementos y un tamaño de palabra de 256 bits
# Todos los FIFOs se configuran usando el modo de lectura First Word Fall Through
# Los FIFOS 8 y 9 los cuales se conectan al generador de datos y a los aceleradores de hardware,
# se implementan usando  una plantilla Common_Clock_Builtin_FIFO. Todos estos FIFOS son los que se encargan de la comunicación
# con el bus intra-FPGA y se conectan a la frecuencia de 200Mhz. En este caso, todos los pares de FIFOs conectados al driver 0,
# driver 1 y driver 2, tienen esta configuración.
# Con respecto a los fifos 0, 1, 2, 3, 4, 5, 6, 7, conectados al Aurora, encargados de la comunicación multi-FPGA (Fifo Generator 6 y 7), se configuran
# usando las plantillas Independent_Clocks_Distributed_RAM. Esto porque se requieren relojes indipendientes, por un lado, 
# se utiliza el reloj user_clk que proporciona el Aurora, y por otro lado se conecta el clk_200MHz interno de la FPGA.
# Para el reset de estos FIFOs 0, 1, 2, 3, 4, 5, 6, 7, 8, el reset se encuentra suprimido, ya que la hoja de datos indica que el reset no es
# necesario.


startgroup
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_0]
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_1]
endgroup

set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_2]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Distributed_RAM} CONFIG.INTERFACE_TYPE {Native} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {256} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {256} CONFIG.Output_Depth {512} CONFIG.Reset_Pin {false} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {0} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5} CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wach {15} CONFIG.Empty_Threshold_Assert_Value_wach {14} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_wrch {15} CONFIG.Empty_Threshold_Assert_Value_wrch {14} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.Full_Threshold_Assert_Value_rach {15} CONFIG.Empty_Threshold_Assert_Value_rach {14} CONFIG.Enable_Safety_Circuit {false}] [get_bd_cells fifo_generator_3]

# Se configura el FIFO de la salida del Aurora
set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Builtin_FIFO} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_OutputAurora0]




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



############################### Se agrega el Aurora 8b10b en el driver 1 ###########################################################
## Este Aurora debe incluir la lógica compartida

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup

set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0000} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1}] [get_bd_cells aurora_8b10b_0]


# Se agrega una constante de 3 bits y se coloca en 0, para conectar al puerto de loopback del Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_loopback
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_loopback]

connect_bd_net [get_bd_pins xconst_loopback/dout] [get_bd_pins aurora_8b10b_0/loopback]

# Se agrega una constante de 1 bit y se coloca en 0 para conectar al puerto de power_down del Aurora

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_powerdown
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xconst_powerdown]

connect_bd_net [get_bd_pins xconst_powerdown/dout] [get_bd_pins aurora_8b10b_0/power_down]


## Se agrega un bloque de hardware que inicializa el Aurora
create_bd_cell -type module -reference Aurora_init Aurora_init_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/RST]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_Aurora]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/gt_reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /Aurora_init_0/reset_TX_RX_Block]

# Se agrega el IP core de HLS llamado Aurora to fifo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:Aurora_to_fifo_IP_fpga1_block:1.0 Aurora_to_fifo_0
endgroup

# Se agrega un bloque de hardware que sirve como interfaz entre el FIFO Generator y el Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:fifo_to_Aurora_IP:1.0 fifo_to_Aurora_0
endgroup


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins inverter_reset_TX_RX_Block/A]
connect_bd_net [get_bd_pins inverter_reset_TX_RX_Block/Y] [get_bd_pins fifo_to_Aurora_0/ap_rst_n]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/Y] [get_bd_pins fifo_to_Aurora_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_empty_fifo_to_aurora0/A] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/in_fifo_V_read] [get_bd_pins fifo_generator_2/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TDATA] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TLAST] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TVALID] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/output_r_TREADY] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_din] [get_bd_pins fifo_generator_3/din]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_write] [get_bd_pins fifo_generator_3/wr_en]
connect_bd_net [get_bd_pins inverter_full_Aurora_to_fifo_0/A] [get_bd_pins fifo_generator_3/full]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/out_fifo_V_full_n] [get_bd_pins inverter_full_Aurora_to_fifo_0/Y]

# Se conecta la salida del Aurora a la entrada del fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_OutputAurora0/din]
connect_bd_net [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_OutputAurora0/wr_en]

connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/empty] [get_bd_pins inverter_empty_OutputAurora0/A]
connect_bd_net [get_bd_pins inverter_empty_OutputAurora0/Y] [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_empty_n]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_dout] [get_bd_pins fifo_generator_OutputAurora0/dout]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/input_fifo_V_V_read] [get_bd_pins fifo_generator_OutputAurora0/rd_en]

# Se conecta el reset del FIFO conectado a la salida del Aurora. También se conecta el reloj
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/rst] [get_bd_pins aurora_8b10b_0/sys_reset_out]
connect_bd_net [get_bd_pins fifo_generator_OutputAurora0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

# Se conecta la constante Next FPGA del bloque FIFO to Aurora
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_id_next_fpga_0
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_id_next_fpga_0]

connect_bd_net [get_bd_pins xconst_id_next_fpga_0/dout] [get_bd_pins fifo_to_Aurora_0/id_next_fpga]

# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/ap_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins fifo_to_Aurora_0/ap_start]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/ap_continue] [get_bd_pins fifo_to_Aurora_0/ap_ready]

# Se interconecta el puerto channel_up del Aurora 8b10b0, al puerto de entrada channel_up del módulo Aurora_init
# Anteriormente se hacia una AND de todas las banderas de channel_up de los diferentes Auroras, sin embargo, el problema
# de esta técnica, es que si un canal se cuelga, o no se está utilizando, nada servirá. La idea de este enfoque, es que
# si se quieren usar menos lanes, se use siempre el Aurora 0.
connect_bd_net [get_bd_pins Aurora_init_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_keep
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xconst_keep]

connect_bd_net [get_bd_pins xconst_keep/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]



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

# Se hacen externos los pines del Aurora
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins aurora_8b10b_0/rxp]
endgroup

############################### Interconexión con el PS ubicado en el driver 0 ##################


# Se agrega el IP Core de la unidad de empaquetamiento

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:packaging_IP_block:1.0 packaging_IP_block_0
endgroup

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start]

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins packaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_continue] [get_bd_pins packaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de empaquetamiento al FIFO Generator 1

connect_bd_net [get_bd_pins fifo_generator_1/din] [get_bd_pins packaging_IP_block_0/out_fifo_V_din]
connect_bd_net [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins packaging_IP_block_0/out_fifo_V_write]

connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins packaging_IP_block_0/out_fifo_V_full_n]
connect_bd_net [get_bd_pins fifo_generator_1/full] [get_bd_pins inverter_0/A]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_fpga_id
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_fpga_id]

# Se conecta la constante del bloque FPGA IP de la unidad de empaquetamiento, a la constante de FPGA_ID del acelerador
connect_bd_net [get_bd_pins packaging_IP_block_0/fpga_id] [get_bd_pins xconst_fpga_id/dout]

# Se agrega la unidad de desempaquetamiento
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:unpackaging_IP_block:1.0 unpackaging_IP_block_0
endgroup

connect_bd_net [get_bd_pins xconst_ap_start/dout] [get_bd_pins unpackaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_continue] [get_bd_pins unpackaging_IP_block_0/ap_ready]


# Se interconecta el out_fifo de la unidad de desempaquetamiento al FIFO Generator 0
connect_bd_net [get_bd_pins fifo_generator_0/dout] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_dout]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_read] [get_bd_pins fifo_generator_0/rd_en]
connect_bd_net [get_bd_pins inverter_2/Y] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_empty_n]
connect_bd_net [get_bd_pins inverter_2/A] [get_bd_pins fifo_generator_0/empty]

# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup


# Se hacen externos los pines de la unidad de desempaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
endgroup

# Se hacen externos los pines de la unidad de empaquetamiento
startgroup
make_bd_pins_external  [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
endgroup


# Reset del sistema

## La señal peripheral_reset es un reset activo en alto.

# Se crea un pin de reset
create_bd_port -dir I peripheral_reset

# Se conecta el reset del bus y el reset del Aurora_init
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins Aurora_init_0/RST]

# Se conecta el reset de los FIFOS 8 y 9, esto porque estos FIFOs  sí tienen reset. Los Fifos que se conectan al Aurora, no tienen reset
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_0/rst]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins fifo_generator_1/rst]

# Se invierte el reset para conectarlo a la unidad de empaquetamiento y desempaquetamiento
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins inverter_4/A]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins packaging_IP_block_0/ap_rst_n]
connect_bd_net [get_bd_pins inverter_4/Y] [get_bd_pins unpackaging_IP_block_0/ap_rst_n]

######### Se conectan los relojes del sistema
create_bd_port -dir I clk_200MHz_p
create_bd_port -dir I clk_200MHz_n

# Se conecta el reloj del bus
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/clk]

# Se conecta el reloj de la unidad de empaquetado de datos
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins packaging_IP_block_0/ap_clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins unpackaging_IP_block_0/ap_clk]



# Se conecta el reloj de los FIFOS
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_0/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins fifo_generator_1/clk]


connect_bd_net [get_bd_pins fifo_generator_2/wr_clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins fifo_generator_2/rd_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]

connect_bd_net [get_bd_pins fifo_generator_3/wr_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins fifo_generator_3/rd_clk] [get_bd_pins clk_wiz_0/clk_out3]


# Se conecta el reloj de entrada en el clocking wizar
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]


# Las banderas de channel_up se hacen externas para efectos de Testing
startgroup
create_bd_port -dir O channel_up_0
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

# Los relojes se hacen externos para efectos de testing

create_bd_port -dir O clk_200MHz
create_bd_port -dir O gt_refclk
create_bd_port -dir O init_clk
create_bd_port -dir O user_clk

connect_bd_net [get_bd_ports user_clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_ports init_clk] [get_bd_pins clk_wiz_0/clk_out2]
connect_bd_net [get_bd_ports gt_refclk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_ports clk_200MHz] [get_bd_pins clk_wiz_0/clk_out3]

save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs Drvrs2_PS1_Lanes1_design]
close_bd_design [get_bd_designs Drvrs2_PS1_Lanes1_design]







