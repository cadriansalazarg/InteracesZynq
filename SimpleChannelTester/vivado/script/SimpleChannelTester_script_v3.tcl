# Se elimina en caso de que exista la carpeta del proyecto anterior para evitar conflictos por intentar crear un proyecto ya existente
exec rm -rf SimpleChannelTester_v3/ vivado.*

# Se crea el proyecto
create_project SimpleChannelTester_v3 SimpleChannelTester_v3 -part xc7z045ffg900-2

# Se selecciona la tarjeta ZC706
set_property board_part xilinx.com:zc706:part0:1.4 [current_project]

# Se agrega los constrainst contenidos en el archivo de pines
add_files -fileset constrs_1 -norecurse constraints/pinesChannelTester_v1.xdc

# Se agrega el testbench y se pone como principal
add_files -fileset sim_1 -norecurse TestBench/SimpleChecker_tb.v
add_files -fileset sim_1 -norecurse TestBench/SimpleGenerator_tb.v
add_files -fileset sim_1 -norecurse TestBench/SimpleChannelTester_v1_tb.sv

set_property top SimpleChannelTester_v1_tb [get_filesets sim_1]
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

add_files -norecurse ../../AuroraInterconnection/src_Verilog/Aurora_init.v
add_files -norecurse ../../AuroraInterconnection/src_Verilog/fifo_to_Aurora.v


# Se agrega el inversor en Verilog
add_files -norecurse src_Verilog/inverter.v
update_compile_order -fileset sources_1

# Se agrega el Generador de datos
add_files -norecurse src_Verilog/SimpleGenerator.v
update_compile_order -fileset sources_1

# Se agrega el Checker de datos
add_files -norecurse src_Verilog/SimpleChecker.v
update_compile_order -fileset sources_1

# Se agregan los IPs generados en HLS
set_property  ip_repo_paths  {../../AuroraInterconnection/Aurora_to_fifo/hls_fpga1/hls_aurora_to_fifo_fpga1_hw_prj/Optimized/impl/ip ../../Packaging_Unit/hls/hls_packaging_block_hw_prj/Optimized/impl/ip ../../Unpackaging_Unit/Point-to-Point/hls/hls_unpackaging_block_hw_prj/solution1/impl/ip} [current_project]
update_ip_catalog




















































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




create_bd_design "SimpleTester"

update_compile_order -fileset sources_1
open_bd_design {project_1/project_1.srcs/sources_1/bd/SimpleTester/SimpleTester.bd}



# Se agrega el bus paralelo y seis inversores
create_bd_cell -type module -reference prll_bs_gnrtr_n_rbtr_wrap_V_2drvrs prll_bs_gnrtr_n_rbtr_0


create_bd_cell -type module -reference inverter inverter_0
create_bd_cell -type module -reference inverter inverter_1
create_bd_cell -type module -reference inverter inverter_2
create_bd_cell -type module -reference inverter inverter_3
create_bd_cell -type module -reference inverter inverter_4


create_bd_cell -type module -reference inverter inverter_full_Aurora_to_fifo_0

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
create_bd_cell -type module -reference fifo_to_Aurora fifo_to_Aurora_0

# Se cambia la polaridad de los resets en el block design para que coincidan con el del RTL
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /fifo_to_Aurora_0/reset_TX_RX_Block]


# Se realizan las interconexiones

# se conectan las señales generadoras del reset del Aurora generadas por el bloque Aurora init
connect_bd_net [get_bd_pins Aurora_init_0/reset_Aurora] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins Aurora_init_0/gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]

# Se conecta la señal de salida reset_TX_RX_Block del Aurora_init al reset de los bloques fifo_to_Aurora_0 y Aurora_to_fifo_0
connect_bd_net [get_bd_pins Aurora_init_0/reset_TX_RX_Block] [get_bd_pins fifo_to_Aurora_0/reset_TX_RX_Block]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins Aurora_to_fifo_0/ap_rst]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/empty] [get_bd_pins fifo_generator_2/empty]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/dout] [get_bd_pins fifo_generator_2/dout]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/rd_en] [get_bd_pins fifo_generator_2/rd_en]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/channel_up] [get_bd_pins aurora_8b10b_0/channel_up]

connect_bd_net [get_bd_pins fifo_to_Aurora_0/s_axi_tx_tdata] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/s_axi_tx_tlast] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/s_axi_tx_tvalid] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins fifo_to_Aurora_0/s_axi_tx_tready] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

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



# Se agrega la constante  para el ap_start de este módulo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xconst_ap_start_Aurora_to_fifo
endgroup

set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells xconst_ap_start_Aurora_to_fifo]

connect_bd_net [get_bd_pins xconst_ap_start_Aurora_to_fifo/dout] [get_bd_pins Aurora_to_fifo_0/ap_start]
connect_bd_net [get_bd_pins Aurora_to_fifo_0/ap_continue] [get_bd_pins Aurora_to_fifo_0/ap_ready]

# Se conecta el reloj a los bloques fifo_to_Aurora y el Aurora_to_fifo
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins fifo_to_Aurora_0/user_clk]
connect_bd_net [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins Aurora_to_fifo_0/ap_clk] 


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


update_compile_order -fileset sim_1
create_bd_cell -type module -reference SimpleChecker SimpleChecker_0

create_bd_cell -type module -reference SimpleGenerator SimpleGenerator_0

connect_bd_net [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins SimpleChecker_0/output_r_TVALID_0]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins SimpleChecker_0/output_r_TREADY_0]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins SimpleChecker_0/output_r_TDATA_0]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/output_r_TLAST] [get_bd_pins SimpleChecker_0/output_r_TLAST_0]

connect_bd_net [get_bd_pins SimpleGenerator_0/input_r_TDATA_0] [get_bd_pins packaging_IP_block_0/input_r_TDATA]
connect_bd_net [get_bd_pins SimpleGenerator_0/input_r_TLAST_0] [get_bd_pins packaging_IP_block_0/input_r_TLAST]
connect_bd_net [get_bd_pins SimpleGenerator_0/input_r_TVALID_0] [get_bd_pins packaging_IP_block_0/input_r_TVALID]
connect_bd_net [get_bd_pins SimpleGenerator_0/input_r_TREADY_0] [get_bd_pins packaging_IP_block_0/input_r_TREADY]



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

set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /SimpleChecker_0/reset]
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins /SimpleGenerator_0/reset]

connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins SimpleChecker_0/reset]
connect_bd_net [get_bd_ports peripheral_reset] [get_bd_pins SimpleGenerator_0/reset]

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

connect_bd_net [get_bd_pins SimpleChecker_0/clk] [get_bd_pins clk_wiz_0/clk_out3]
connect_bd_net [get_bd_pins SimpleGenerator_0/clk] [get_bd_pins clk_wiz_0/clk_out3]


# Se conecta el reloj de entrada en el clocking wizard
connect_bd_net [get_bd_ports clk_200MHz_n] [get_bd_pins clk_wiz_0/clk_in1_n]
connect_bd_net [get_bd_ports clk_200MHz_p] [get_bd_pins clk_wiz_0/clk_in1_p]

# Se hace  externa la salida del detector de errores

startgroup
make_bd_pins_external  [get_bd_pins SimpleChecker_0/Error_Counter]
endgroup

# Se hace externa la salida del channel up 0
create_bd_port -dir O channel_up_0

startgroup
connect_bd_net [get_bd_ports channel_up_0] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup

# Se agrega el ILA para testing

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0
endgroup

set_property -dict [list CONFIG.C_PROBE8_WIDTH {4} CONFIG.C_PROBE4_WIDTH {32} CONFIG.C_PROBE0_WIDTH {32} CONFIG.C_DATA_DEPTH {8192} CONFIG.C_NUM_OF_PROBES {15} CONFIG.C_ENABLE_ILA_AXI_MON {false} CONFIG.C_MONITOR_TYPE {Native}] [get_bd_cells ila_0]

connect_bd_net [get_bd_pins ila_0/clk] [get_bd_pins clk_wiz_0/clk_out3]

connect_bd_net [get_bd_pins ila_0/probe0] [get_bd_pins SimpleGenerator_0/input_r_TDATA_0]
connect_bd_net [get_bd_pins ila_0/probe1] [get_bd_pins SimpleGenerator_0/input_r_TLAST_0]
connect_bd_net [get_bd_pins ila_0/probe2] [get_bd_pins SimpleGenerator_0/input_r_TVALID_0]
connect_bd_net [get_bd_pins ila_0/probe3] [get_bd_pins packaging_IP_block_0/input_r_TREADY]

connect_bd_net [get_bd_pins ila_0/probe4] [get_bd_pins unpackaging_IP_block_0/output_r_TDATA]
connect_bd_net [get_bd_pins ila_0/probe5] [get_bd_pins unpackaging_IP_block_0/output_r_TLAST]
connect_bd_net [get_bd_pins ila_0/probe6] [get_bd_pins unpackaging_IP_block_0/output_r_TVALID]
connect_bd_net [get_bd_pins ila_0/probe7] [get_bd_pins SimpleChecker_0/output_r_TREADY_0]
connect_bd_net [get_bd_pins ila_0/probe8] [get_bd_pins SimpleChecker_0/Error_Counter]
connect_bd_net [get_bd_pins ila_0/probe9] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_0_bus_0]
connect_bd_net [get_bd_pins ila_0/probe10] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_read]
connect_bd_net [get_bd_pins ila_0/probe11] [get_bd_pins packaging_IP_block_0/out_fifo_V_write]
connect_bd_net [get_bd_pins ila_0/probe12] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_0_bus_0]
connect_bd_net [get_bd_pins ila_0/probe13] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/push_drvr_1_bus_0]
connect_bd_net [get_bd_pins ila_0/probe14] [get_bd_pins prll_bs_gnrtr_n_rbtr_0/pop_drvr_1_bus_0]



save_bd_design
validate_bd_design
save_bd_design

current_bd_design [get_bd_designs SimpleTester]
close_bd_design [get_bd_designs SimpleTester]
