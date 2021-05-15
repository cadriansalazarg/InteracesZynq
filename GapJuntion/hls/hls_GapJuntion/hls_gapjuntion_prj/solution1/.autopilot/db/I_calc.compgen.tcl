# This script segment is generated automatically by AutoPilot

# Memory (RAM/ROM)  definition:
set ID 183
set hasByteEnable 0
set MemName I_calc_F_temp_data
set CoreName ap_simcore_mem
set PortList { 2 0 }
set DataWd 32
set AddrRange 4
set AddrWd 2
set impl_style block
set TrueReset 0
set HasInitializer 0
set IsROM 0
set ROMData {}
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.755
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 184 \
    name I_V_data \
    reset_level 1 \
    sync_rst true \
    corename {output_r} \
    metadata {  } \
    op interface \
    ports { output_r_TDATA { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'I_V_data'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 185 \
    name I_V_tlast_V \
    reset_level 1 \
    sync_rst true \
    corename {output_r} \
    metadata {  } \
    op interface \
    ports { output_r_TVALID { O 1 bit } output_r_TREADY { I 1 bit } output_r_TLAST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'I_V_tlast_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name simConfig_rowsToSimulate_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_simConfig_rowsToSimulate_V \
    op interface \
    ports { simConfig_rowsToSimulate_V_dout { I 27 vector } simConfig_rowsToSimulate_V_empty_n { I 1 bit } simConfig_rowsToSimulate_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name simConfig_BLOCK_NUMBERS_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_simConfig_BLOCK_NUMBERS_V \
    op interface \
    ports { simConfig_BLOCK_NUMBERS_V_dout { I 27 vector } simConfig_BLOCK_NUMBERS_V_empty_n { I 1 bit } simConfig_BLOCK_NUMBERS_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name F_acc_V_data_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_F_acc_V_data_0 \
    op interface \
    ports { F_acc_V_data_0_dout { I 32 vector } F_acc_V_data_0_empty_n { I 1 bit } F_acc_V_data_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 189 \
    name F_acc_V_data_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_F_acc_V_data_1 \
    op interface \
    ports { F_acc_V_data_1_dout { I 32 vector } F_acc_V_data_1_empty_n { I 1 bit } F_acc_V_data_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 190 \
    name F_acc_V_data_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_F_acc_V_data_2 \
    op interface \
    ports { F_acc_V_data_2_dout { I 32 vector } F_acc_V_data_2_empty_n { I 1 bit } F_acc_V_data_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 191 \
    name F_acc_V_data_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_F_acc_V_data_3 \
    op interface \
    ports { F_acc_V_data_3_dout { I 32 vector } F_acc_V_data_3_empty_n { I 1 bit } F_acc_V_data_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 192 \
    name V_acc_V_data_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V_acc_V_data_0 \
    op interface \
    ports { V_acc_V_data_0_dout { I 32 vector } V_acc_V_data_0_empty_n { I 1 bit } V_acc_V_data_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 193 \
    name V_acc_V_data_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V_acc_V_data_1 \
    op interface \
    ports { V_acc_V_data_1_dout { I 32 vector } V_acc_V_data_1_empty_n { I 1 bit } V_acc_V_data_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 194 \
    name V_acc_V_data_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V_acc_V_data_2 \
    op interface \
    ports { V_acc_V_data_2_dout { I 32 vector } V_acc_V_data_2_empty_n { I 1 bit } V_acc_V_data_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 195 \
    name V_acc_V_data_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V_acc_V_data_3 \
    op interface \
    ports { V_acc_V_data_3_dout { I 32 vector } V_acc_V_data_3_empty_n { I 1 bit } V_acc_V_data_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


