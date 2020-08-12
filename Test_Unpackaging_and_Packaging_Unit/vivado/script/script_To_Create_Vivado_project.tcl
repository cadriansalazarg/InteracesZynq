## Para lanzar este script, Vivado siempre deberá ejecutarse en la raíz de la carpeta Vivado, de lo contrario, si se hace dentro de la carpeta script,
## elproyecto se caerá ya que no encontrará ni el IP personalizado ni los archivos fuentes de Verilog.

## Comando Linux ejecutado dentro de un tcl file para borrar algún proyecto anterior que impida que este sea lanzado
exec rm -rf project_1/ vivado.*

create_project project_1 project_1 -part xc7z020clg484-1

set_property board_part em.avnet.com:zed:part0:1.4 [current_project]

add_files -norecurse {src_Verilog/inverter.v}

add_files -norecurse {../../Packaging_Unit/python/customized_concat.v}
update_compile_order -fileset sources_1


add_files -norecurse {../../Unpackaging_Unit/Python/customized_slice.v}

update_compile_order -fileset sources_1

update_compile_order -fileset sources_1

update_compile_order -fileset sources_1


set_property  ip_repo_paths  {../../Unpackaging_Unit/Point-to-Point/hls/hls_unpackaging_block_hw_prj/solution1/impl/ip ../../Packaging_Unit/hls/hls_packaging_block_hw_prj/solution1/impl/ip} [current_project]
update_ip_catalog


create_bd_design "design_1"

update_compile_order -fileset sources_1


## Se agrega la unidad de desempaquetado

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:unpackaging_IP_block:1.0 unpackaging_IP_block_0
endgroup

## Se agrega la unidad de empaquetado

startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:packaging_IP_block:1.0 packaging_IP_block_0
endgroup

# Se agrega el IP propietario FIFO Generator 

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_0
endgroup


## Se configura la FIFO para tener una profundidad de 64 paquetes y un tamaño de paquete igual a 1024 bits

set_property -dict [list CONFIG.Fifo_Implementation {Common_Clock_Block_RAM} CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {1024} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {1024} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Synchronous_Reset} CONFIG.Use_Dout_Reset {true} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {511} CONFIG.Full_Threshold_Negate_Value {510} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_bd_cells fifo_generator_0]


## Se agrega el módulo en Verilog del contatenador generado automáticamente por un script de Python

create_bd_cell -type module -reference customized_concat customized_concat_0

## Se agrega el módulo en Verilog del Slice generado automáticamente por un script de Python

create_bd_cell -type module -reference customized_slice customized_slice_0

## Se interconecta los datos generados por el IP Core personalizado con el módulo concat

connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_BS_ID_din] [get_bd_pins customized_concat_0/BS_ID]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_FPGA_ID_din] [get_bd_pins customized_concat_0/FPGA_ID]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_PCKG_ID_din] [get_bd_pins customized_concat_0/PCKG_ID]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_TX_UID_din] [get_bd_pins customized_concat_0/TX_UID]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_RX_UID_din] [get_bd_pins customized_concat_0/RX_UID]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_VALID_PACKET_BYTES_din] [get_bd_pins customized_concat_0/VALID_PACKET_BYTES]

connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_0_din] [get_bd_pins customized_concat_0/MESSAGE0]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_1_din] [get_bd_pins customized_concat_0/MESSAGE1]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_2_din] [get_bd_pins customized_concat_0/MESSAGE2]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_3_din] [get_bd_pins customized_concat_0/MESSAGE3]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_4_din] [get_bd_pins customized_concat_0/MESSAGE4]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_5_din] [get_bd_pins customized_concat_0/MESSAGE5]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_6_din] [get_bd_pins customized_concat_0/MESSAGE6]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_7_din] [get_bd_pins customized_concat_0/MESSAGE7]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_8_din] [get_bd_pins customized_concat_0/MESSAGE8]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_9_din] [get_bd_pins customized_concat_0/MESSAGE9]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_10_din] [get_bd_pins customized_concat_0/MESSAGE10]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_11_din] [get_bd_pins customized_concat_0/MESSAGE11]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_12_din] [get_bd_pins customized_concat_0/MESSAGE12]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_13_din] [get_bd_pins customized_concat_0/MESSAGE13]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_14_din] [get_bd_pins customized_concat_0/MESSAGE14]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_15_din] [get_bd_pins customized_concat_0/MESSAGE15]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_16_din] [get_bd_pins customized_concat_0/MESSAGE16]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_17_din] [get_bd_pins customized_concat_0/MESSAGE17]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_18_din] [get_bd_pins customized_concat_0/MESSAGE18]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_19_din] [get_bd_pins customized_concat_0/MESSAGE19]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_20_din] [get_bd_pins customized_concat_0/MESSAGE20]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_21_din] [get_bd_pins customized_concat_0/MESSAGE21]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_22_din] [get_bd_pins customized_concat_0/MESSAGE22]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_23_din] [get_bd_pins customized_concat_0/MESSAGE23]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_24_din] [get_bd_pins customized_concat_0/MESSAGE24]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_25_din] [get_bd_pins customized_concat_0/MESSAGE25]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_26_din] [get_bd_pins customized_concat_0/MESSAGE26]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_27_din] [get_bd_pins customized_concat_0/MESSAGE27]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_28_din] [get_bd_pins customized_concat_0/MESSAGE28]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_29_din] [get_bd_pins customized_concat_0/MESSAGE29]


connect_bd_net [get_bd_pins customized_concat_0/din] [get_bd_pins fifo_generator_0/din]


## Se agrega el inversor de la bandera full

create_bd_cell -type module -reference inverter inverter_0


## Se interconecta la bandera full

connect_bd_net [get_bd_pins fifo_generator_0/full] [get_bd_pins inverter_0/A]

connect_bd_net [get_bd_pins inverter_0/Y] [get_bd_pins packaging_IP_block_0/out_fifo_V_BS_ID_full_n]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_FPGA_ID_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_PCKG_ID_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_TX_UID_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_RX_UID_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_VALID_PACKET_BYTES_full_n] [get_bd_pins inverter_0/Y]

connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_0_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_1_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_2_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_3_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_4_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_5_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_6_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_7_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_8_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_9_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_10_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_11_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_12_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_13_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_14_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_15_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_16_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_17_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_18_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_19_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_20_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_21_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_22_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_23_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_24_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_25_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_26_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_27_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_28_full_n] [get_bd_pins inverter_0/Y]
connect_bd_net [get_bd_pins packaging_IP_block_0/out_fifo_V_MESSAGE_29_full_n] [get_bd_pins inverter_0/Y]

## Se interconecta la bandera wr_en de la FIFO a la salida out_fifo_V_BS_ID_Write
## Solo se conecta a ésta dado que las demás terminales en teoría generan un write en el mismo instante.

connect_bd_net [get_bd_pins fifo_generator_0/wr_en] [get_bd_pins packaging_IP_block_0/out_fifo_V_BS_ID_write]


## Se intercecta la salida de datos de la fifo a la entrada del módulo slice

connect_bd_net [get_bd_pins customized_slice_0/dout] [get_bd_pins fifo_generator_0/dout]

## Se interconectan las diferentes salidas del módulo slice a la entrada de datos del IP Core personalizado unpackaging

connect_bd_net [get_bd_pins customized_slice_0/BS_ID] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_BS_ID_dout]
connect_bd_net [get_bd_pins customized_slice_0/FPGA_ID] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_FPGA_ID_dout]
connect_bd_net [get_bd_pins customized_slice_0/PCKG_ID] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_PCKG_ID_dout]
connect_bd_net [get_bd_pins customized_slice_0/TX_UID] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_TX_UID_dout]
connect_bd_net [get_bd_pins customized_slice_0/RX_UID] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_RX_UID_dout]
connect_bd_net [get_bd_pins customized_slice_0/VALID_PACKET_BYTES] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_VALID_PACKET_BYTES_dout]

connect_bd_net [get_bd_pins customized_slice_0/MESSAGE0] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_0_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE1] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_1_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE2] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_2_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE3] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_3_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE4] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_4_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE5] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_5_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE6] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_6_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE7] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_7_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE8] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_8_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE9] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_9_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE10] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_10_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE11] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_11_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE12] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_12_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE13] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_13_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE14] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_14_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE15] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_15_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE16] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_16_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE17] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_17_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE18] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_18_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE19] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_19_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE20] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_20_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE21] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_21_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE22] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_22_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE23] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_23_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE24] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_24_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE25] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_25_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE26] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_26_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE27] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_27_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE28] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_28_dout]
connect_bd_net [get_bd_pins customized_slice_0/MESSAGE29] [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_29_dout]

## Se agrega el inversor de la bandera empty

create_bd_cell -type module -reference inverter inverter_1

## Se interconecta la bandera empty de la FIFO, con el inversor, y con las entradas del IP HLS personalizado llamado empty_n
## Nótese que esta bandera se debe invertir, por un asunto de compatibilidad-

connect_bd_net [get_bd_pins fifo_generator_0/empty] [get_bd_pins inverter_1/A]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_BS_ID_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_FPGA_ID_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_PCKG_ID_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_TX_UID_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_RX_UID_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_VALID_PACKET_BYTES_empty_n] [get_bd_pins inverter_1/Y]

connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_0_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_1_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_2_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_3_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_4_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_5_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_6_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_7_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_8_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_9_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_10_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_11_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_12_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_13_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_14_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_15_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_16_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_17_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_18_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_19_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_20_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_21_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_22_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_23_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_24_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_25_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_26_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_27_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_28_empty_n] [get_bd_pins inverter_1/Y]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_MESSAGE_29_empty_n] [get_bd_pins inverter_1/Y]

## Se interconecta la bandera de la FIFO llamada rd_en  a la señal de salida llamada in_fifo_V_BS_ID_read
## Solo se conecta este puerto debido a que todas las fifos van sincronizadas, por lo tanto, todas las banderas _read de los diferentes puertos
## deben asertar en el mismo instante

connect_bd_net [get_bd_pins unpackaging_IP_block_0/in_fifo_V_BS_ID_read] [get_bd_pins fifo_generator_0/rd_en]

## Se agrega el Zynq
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup


# Se agrega el AXI DMA

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
endgroup

# Se agrega el bloque concat el cual se usará para conectar las dos interrupciones del DMA

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup

# Se agrega el AXI Timer para las mediciones de tiempo
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0
endgroup

# Se configura la Zynq para que trabaje con la plantilla de la ZedBoard y se configuran las interrupciones
startgroup
set_property -dict [list CONFIG.preset {ZedBoard}] [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1} CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1}] [get_bd_cells processing_system7_0]
endgroup

# Se habilita el puerto de HP en la Zynq
startgroup
set_property -dict [list CONFIG.PCW_USE_S_AXI_HP0 {1}] [get_bd_cells processing_system7_0]
endgroup


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


# Se conecta el Zynq a la memoria
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]


# Se autointerconecta todo lo que es posible interconectar de forma automática

startgroup
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/processing_system7_0/FCLK_CLK0 (100 MHz)" }  [get_bd_pins fifo_generator_0/clk]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/axi_dma_0/M_AXI_MM2S} Slave {/processing_system7_0/S_AXI_HP0} intc_ip {Auto} master_apm {0}}  [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_dma_0/S_AXI_LITE} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_timer_0/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_timer_0/S_AXI]
endgroup

apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {/processing_system7_0/FCLK_CLK0 (100 MHz)} Clk_xbar {/processing_system7_0/FCLK_CLK0 (100 MHz)} Master {/axi_dma_0/M_AXI_S2MM} Slave {/processing_system7_0/S_AXI_HP0} intc_ip {/axi_smc} master_apm {0}}  [get_bd_intf_pins axi_dma_0/M_AXI_S2MM]

# Se conecta manualmente las tres: dos interrupciones del dma en  dos entradas del bloque concat y una interrupción del AXI Timer en el puerto de entrada restante y la salida del bloque concat, se conecta a la entrada de interrupciones del Zynq
connect_bd_net [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins axi_timer_0/interrupt] [get_bd_pins xlconcat_0/In2]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins processing_system7_0/IRQ_F2P]

# Se conecta manualmente el reset del IP FIFO generator, Oberve que el FIFO generator tienen el reset invertido con respecto a los demás módulos
connect_bd_net [get_bd_pins rst_ps7_0_100M/peripheral_reset] [get_bd_pins fifo_generator_0/srst]

## Se conectan individualmente las señales de entrada del IP personalizado packaging con el puerto del DMA llamado S_AXIS_S2MM
connect_bd_net [get_bd_pins packaging_IP_block_0/input_r_TDATA] [get_bd_pins axi_dma_0/m_axis_mm2s_tdata] 
connect_bd_net [get_bd_pins packaging_IP_block_0/input_r_TLAST] [get_bd_pins axi_dma_0/m_axis_mm2s_tlast]
connect_bd_net [get_bd_pins packaging_IP_block_0/input_r_TREADY] [get_bd_pins axi_dma_0/m_axis_mm2s_tready]
connect_bd_net [get_bd_pins packaging_IP_block_0/input_r_TVALID] [get_bd_pins axi_dma_0/m_axis_mm2s_tvalid]

# Se conectan individualmente las señales de la salida del IP personalizado unpackaging con el puerto del DMA llamado 
connect_bd_net [get_bd_pins unpackaging_IP_block_0/output_r_TVALID] [get_bd_pins axi_dma_0/s_axis_s2mm_tvalid]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/output_r_TREADY] [get_bd_pins axi_dma_0/s_axis_s2mm_tready]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/output_r_TDATA] [get_bd_pins axi_dma_0/s_axis_s2mm_tdata]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/output_r_TLAST] [get_bd_pins axi_dma_0/s_axis_s2mm_tlast]

# se interconecta el reloj y el reset del los dos IP Core personalizados 
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_clk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_rst_n] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]

connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_clk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_rst_n] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]


# Se agrega un IP Core de constante para conectar a 1, el puerto ap_start  de ambos IP Cores

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
endgroup

# Se interconecta la señal de 1 al puerto de ap_start del IP y se interconecta el puerto ap_ready junto con el puerto ap_continue para ambos IP Cores
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins packaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins packaging_IP_block_0/ap_continue] [get_bd_pins packaging_IP_block_0/ap_ready]

connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins unpackaging_IP_block_0/ap_start]
connect_bd_net [get_bd_pins unpackaging_IP_block_0/ap_continue] [get_bd_pins unpackaging_IP_block_0/ap_ready]

# Se regenera el layout

update_compile_order -fileset sources_1
regenerate_bd_layout

save_bd_design

validate_bd_design

save_bd_design

## Create output products

generate_target all [get_files  project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]

catch { config_ip_cache -export [get_ips -all design_1_unpackaging_IP_block_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_packaging_IP_block_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_fifo_generator_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_processing_system7_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_axi_dma_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_axi_timer_0_0] }
catch { config_ip_cache -export [get_ips -all design_1_axi_smc_0] }
catch { config_ip_cache -export [get_ips -all design_1_rst_ps7_0_100M_0] }
catch { config_ip_cache -export [get_ips -all design_1_xbar_0] }
catch { config_ip_cache -export [get_ips -all design_1_auto_pc_0] }

export_ip_user_files -of_objects [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]
launch_runs -jobs 8 {design_1_unpackaging_IP_block_0_0_synth_1 design_1_packaging_IP_block_0_0_synth_1 design_1_fifo_generator_0_0_synth_1 design_1_customized_concat_0_0_synth_1 design_1_customized_slice_0_0_synth_1 design_1_inverter_0_0_synth_1 design_1_inverter_1_0_synth_1 design_1_processing_system7_0_0_synth_1 design_1_axi_dma_0_0_synth_1 design_1_axi_timer_0_0_synth_1 design_1_axi_smc_0_synth_1 design_1_rst_ps7_0_100M_0_synth_1 design_1_xbar_0_synth_1 design_1_auto_pc_0_synth_1}

export_simulation -of_objects [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -directory project_1/project_1.ip_user_files/sim_scripts -ip_user_files_dir project_1/project_1.ip_user_files -ipstatic_source_dir project_1/project_1.ip_user_files/ipstatic -lib_map_path [list {modelsim=project_1/project_1.cache/compile_simlib/modelsim} {questa=project_1/project_1.cache/compile_simlib/questa} {ies=project_1/project_1.cache/compile_simlib/ies} {xcelium=project_1/project_1.cache/compile_simlib/xcelium} {vcs=project_1/project_1.cache/compile_simlib/vcs} {riviera=project_1/project_1.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet


## Create HDL Wrapper

make_wrapper -files [get_files project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse project_1/project_1.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1


## Se sintetiza el diseño

launch_runs synth_1 -jobs 8

## Se implementa el diseño y se genera el bitstream

launch_runs impl_1 -to_step write_bitstream -jobs 8
