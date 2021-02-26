exec rm -rf Aurora_Full-Duplex_Loopback_Test/ vivado.*

# Se crea el proyecto y se añaden los archivos .v y las constraints
create_project Aurora_Full-Duplex_Loopback_Test Aurora_Full-Duplex_Loopback_Test -part xc7z045ffg900-2
set_property board_part xilinx.com:zc706:part0:1.4 [current_project]
add_files -norecurse {src_Verilog/FSM_Initial_Sequence.v  src_Verilog/FSM_AXI4.v src_Verilog/Debouncing.v}
add_files -fileset constrs_1 -norecurse Constraints/Connections.xdc
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1

# Se agregan los archivos de simulación
set_property SOURCE_SET sources_1 [get_filesets sim_1]
add_files -fileset sim_1 -norecurse Test_Aurora/Aurora_tb.v
update_compile_order -fileset sim_1


# Se crea un diseño de bloques
create_bd_design "main"
update_compile_order -fileset sources_1

# Se añade el ip de aurora8b10b y se le aplica la configuración
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0
endgroup
set_property -dict [list CONFIG.C_INIT_CLK.VALUE_SRC USER CONFIG.DRP_FREQ.VALUE_SRC USER] [get_bd_cells aurora_8b10b_0]
set_property -dict [list CONFIG.C_LANE_WIDTH {4} CONFIG.C_LINE_RATE {0.5} CONFIG.C_REFCLK_FREQUENCY {100.000} CONFIG.C_INIT_CLK {100.0} CONFIG.DRP_FREQ {100.0} CONFIG.Dataflow_Config {Duplex} CONFIG.C_GT_LOC_12 {1} CONFIG.C_GT_LOC_1 {X} CONFIG.C_GT_CLOCK_1 {GTXQ2} CONFIG.SINGLEEND_INITCLK {true} CONFIG.SINGLEEND_GTREFCLK {true} CONFIG.SupportLevel {1} CONFIG.TransceiverControl {false} CONFIG.C_DRP_IF {false}] [get_bd_cells aurora_8b10b_0]

# Se añade el clock wizard y es configurado
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0
endgroup
set_property -dict [list CONFIG.PRIM_IN_FREQ.VALUE_SRC USER] [get_bd_cells clk_wiz_0]
set_property -dict [list CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} CONFIG.PRIM_IN_FREQ {200.0} CONFIG.CLKOUT2_USED {true} CONFIG.CLKIN1_JITTER_PS {50.0} CONFIG.MMCM_DIVCLK_DIVIDE {1} CONFIG.MMCM_CLKFBOUT_MULT_F {5.000} CONFIG.MMCM_CLKIN1_PERIOD {5.000} CONFIG.MMCM_CLKIN2_PERIOD {10.0} CONFIG.MMCM_CLKOUT1_DIVIDE {10} CONFIG.NUM_OUT_CLKS {2} CONFIG.CLKOUT1_JITTER {112.316} CONFIG.CLKOUT1_PHASE_ERROR {89.971} CONFIG.CLKOUT2_JITTER {112.316} CONFIG.CLKOUT2_PHASE_ERROR {89.971}] [get_bd_cells clk_wiz_0]

# Se realizan algunas interconexiones
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_0/drpclk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins aurora_8b10b_0/init_clk_in]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins aurora_8b10b_0/gt_refclk1]

# Se colocan algunos pines como externos
startgroup
make_bd_pins_external  [get_bd_pins aurora_8b10b_0/rxn] [get_bd_pins clk_wiz_0/clk_in1_p] [get_bd_pins aurora_8b10b_0/rxp] [get_bd_pins clk_wiz_0/reset] [get_bd_pins clk_wiz_0/clk_in1_n] [get_bd_pins aurora_8b10b_0/txn] [get_bd_pins aurora_8b10b_0/txp]
endgroup


# Se realiza el cambio de nombre los pines externos
set_property name clk_in_n [get_bd_ports clk_in1_n_0]
set_property name clk_in_p [get_bd_ports clk_in1_p_0]
set_property name rxn [get_bd_ports rxn_0]
set_property name rxp [get_bd_ports rxp_0]
set_property name txn [get_bd_ports txn_0]
set_property name txp [get_bd_ports txp_0]
set_property name reset [get_bd_ports reset_0]

# Se añade una compuerta and y se hace la configuración además de colocar una de las entradas como externa
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0
endgroup
set_property -dict [list CONFIG.C_SIZE {1}] [get_bd_cells util_vector_logic_0]
connect_bd_net [get_bd_pins clk_wiz_0/locked] [get_bd_pins util_vector_logic_0/Op1]
startgroup
make_bd_pins_external  [get_bd_pins util_vector_logic_0/Op2]
endgroup
set_property name USR_rst [get_bd_ports Op2_0]

# Se añaden módulos a partir de los archivos .v además de realizar las interconexiones y configuraciones básicas
create_bd_cell -type module -reference Debouncing Debouncing_0
create_bd_cell -type module -reference FSM_Initial_Sequence FSM_Initial_Sequence_0
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins FSM_Initial_Sequence_0/clk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins Debouncing_0/CLK]
connect_bd_net [get_bd_pins util_vector_logic_0/Res] [get_bd_pins Debouncing_0/rst_in]
connect_bd_net [get_bd_pins Debouncing_0/rst_out] [get_bd_pins FSM_Initial_Sequence_0/USR_rst]
connect_bd_net [get_bd_pins FSM_Initial_Sequence_0/out_rst] [get_bd_pins aurora_8b10b_0/reset]
connect_bd_net [get_bd_pins FSM_Initial_Sequence_0/out_rst] [get_bd_pins aurora_8b10b_0/gt_reset]
set_property -dict [list CONFIG.POLARITY {ACTIVE_HIGH}] [get_bd_pins FSM_Initial_Sequence_0/USR_rst]
set_property -dict [list CONFIG.POLARITY {ACTIVE_HIGH}] [get_bd_pins FSM_Initial_Sequence_0/out_rst]
create_bd_cell -type module -reference FSM_AXI4 FSM_AXI4_0
set_property -dict [list CONFIG.POLARITY {ACTIVE_HIGH}] [get_bd_pins FSM_AXI4_0/rst]
connect_bd_net [get_bd_pins FSM_AXI4_0/clk] [get_bd_pins aurora_8b10b_0/user_clk_out]
connect_bd_net [get_bd_pins FSM_AXI4_0/tx_channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
connect_bd_net [get_bd_pins FSM_AXI4_0/s_axi_tx_tdata_0] [get_bd_pins aurora_8b10b_0/s_axi_tx_tdata]
connect_bd_net [get_bd_pins FSM_AXI4_0/s_axi_tx_tlast_0] [get_bd_pins aurora_8b10b_0/s_axi_tx_tlast]
connect_bd_net [get_bd_pins FSM_AXI4_0/s_axi_tx_tvalid_0] [get_bd_pins aurora_8b10b_0/s_axi_tx_tvalid]
connect_bd_net [get_bd_pins FSM_AXI4_0/s_axi_tx_tready_0] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]
connect_bd_net [get_bd_pins aurora_8b10b_0/sys_reset_out] [get_bd_pins FSM_AXI4_0/rst]
create_bd_port -dir O channel_up
create_bd_port -dir O locked
startgroup
connect_bd_net [get_bd_ports channel_up] [get_bd_pins aurora_8b10b_0/channel_up]
endgroup
connect_bd_net [get_bd_ports locked] [get_bd_pins clk_wiz_0/locked]

# Se añaden 3 ip constantes, se configuran y se realizan las conexiones
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2
endgroup
set_property -dict [list CONFIG.CONST_WIDTH {4} CONFIG.CONST_VAL {15}] [get_bd_cells xlconstant_2]
connect_bd_net [get_bd_pins xlconstant_2/dout] [get_bd_pins aurora_8b10b_0/s_axi_tx_tkeep]
set_property -dict [list CONFIG.CONST_WIDTH {3} CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_1]
connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins aurora_8b10b_0/loopback]
set_property -dict [list CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_0]
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins aurora_8b10b_0/power_down]


# Se añade la unidad ILA y es configurado
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0
endgroup
set_property -dict [list CONFIG.C_PROBE1_WIDTH {4} CONFIG.C_PROBE0_WIDTH {32} CONFIG.C_DATA_DEPTH {131072} CONFIG.C_NUM_OF_PROBES {5} CONFIG.C_ENABLE_ILA_AXI_MON {false} CONFIG.C_MONITOR_TYPE {Native}] [get_bd_cells ila_0]
connect_bd_net [get_bd_pins ila_0/clk] [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net [get_bd_pins ila_0/probe0] [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata]
connect_bd_net [get_bd_pins ila_0/probe1] [get_bd_pins aurora_8b10b_0/m_axi_rx_tkeep]
connect_bd_net [get_bd_pins ila_0/probe2] [get_bd_pins aurora_8b10b_0/m_axi_rx_tlast]
connect_bd_net [get_bd_pins ila_0/probe3] [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid]
connect_bd_net [get_bd_pins ila_0/probe4] [get_bd_pins aurora_8b10b_0/s_axi_tx_tready]

# Se selecciona la opción Generate Output Products
generate_target all [get_files  Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.srcs/sources_1/bd/main/main.bd]
catch { config_ip_cache -export [get_ips -all main_aurora_8b10b_0_0] }
catch { config_ip_cache -export [get_ips -all main_clk_wiz_0_0] }
catch { config_ip_cache -export [get_ips -all main_util_vector_logic_0_0] }
catch { config_ip_cache -export [get_ips -all main_ila_0_0] }
export_ip_user_files -of_objects [get_files Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.srcs/sources_1/bd/main/main.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.srcs/sources_1/bd/main/main.bd]
launch_runs -jobs 8 {main_aurora_8b10b_0_0_synth_1 main_clk_wiz_0_0_synth_1 main_util_vector_logic_0_0_synth_1 main_Debouncing_0_0_synth_1 main_FSM_Initial_Sequence_0_0_synth_1 main_FSM_AXI4_0_0_synth_1 main_ila_0_0_synth_1}
export_simulation -of_objects [get_files Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.srcs/sources_1/bd/main/main.bd] -directory Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.ip_user_files/sim_scripts -ip_user_files_dir Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.ip_user_files -ipstatic_source_dir Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.ip_user_files/ipstatic -lib_map_path [list {modelsim=Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.cache/compile_simlib/modelsim} {questa=Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.cache/compile_simlib/questa} {riviera=Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.cache/compile_simlib/riviera} {activehdl=Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.cache/compile_simlib/activehdl}] -use_ip_compiled_libs -force -quiet

# Se crea el wrapper
make_wrapper -files [get_files Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.srcs/sources_1/bd/main/main.bd] -top
add_files -norecurse Aurora_Full-Duplex_Loopback_Test/Aurora_Full-Duplex_Loopback_Test.srcs/sources_1/bd/main/hdl/main_wrapper.v
update_compile_order -fileset sources_1

# Se sintetiza el diseño
launch_runs synth_1 -jobs 8

# Se implementa y se genera el bitstreams
launch_runs impl_1 -to_step write_bitstream -jobs 8