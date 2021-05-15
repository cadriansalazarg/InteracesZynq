# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 49 \
    name voltagesBackup \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename voltagesBackup \
    op interface \
    ports { voltagesBackup_address0 { O 14 vector } voltagesBackup_ce0 { O 1 bit } voltagesBackup_q0 { I 32 vector } voltagesBackup_address1 { O 14 vector } voltagesBackup_ce1 { O 1 bit } voltagesBackup_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'voltagesBackup'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 50 \
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
    id 51 \
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
    id 52 \
    name Vi_idx_V_data_V_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Vi_idx_V_data_V_0 \
    op interface \
    ports { Vi_idx_V_data_V_0_dout { I 27 vector } Vi_idx_V_data_V_0_empty_n { I 1 bit } Vi_idx_V_data_V_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name Vi_idx_V_data_V_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Vi_idx_V_data_V_1 \
    op interface \
    ports { Vi_idx_V_data_V_1_dout { I 27 vector } Vi_idx_V_data_V_1_empty_n { I 1 bit } Vi_idx_V_data_V_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name Vi_idx_V_data_V_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Vi_idx_V_data_V_2 \
    op interface \
    ports { Vi_idx_V_data_V_2_dout { I 27 vector } Vi_idx_V_data_V_2_empty_n { I 1 bit } Vi_idx_V_data_V_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name Vi_idx_V_data_V_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Vi_idx_V_data_V_3 \
    op interface \
    ports { Vi_idx_V_data_V_3_dout { I 27 vector } Vi_idx_V_data_V_3_empty_n { I 1 bit } Vi_idx_V_data_V_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name fixedData_V_data \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fixedData_V_data \
    op interface \
    ports { fixedData_V_data_din { O 32 vector } fixedData_V_data_full_n { I 1 bit } fixedData_V_data_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name fixedData_V_tlast_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fixedData_V_tlast_V \
    op interface \
    ports { fixedData_V_tlast_V_din { O 1 vector } fixedData_V_tlast_V_full_n { I 1 bit } fixedData_V_tlast_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name Vj_idx_V_data_V_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Vj_idx_V_data_V_0 \
    op interface \
    ports { Vj_idx_V_data_V_0_dout { I 27 vector } Vj_idx_V_data_V_0_empty_n { I 1 bit } Vj_idx_V_data_V_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name Vj_idx_V_data_V_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Vj_idx_V_data_V_1 \
    op interface \
    ports { Vj_idx_V_data_V_1_dout { I 27 vector } Vj_idx_V_data_V_1_empty_n { I 1 bit } Vj_idx_V_data_V_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name Vj_idx_V_data_V_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Vj_idx_V_data_V_2 \
    op interface \
    ports { Vj_idx_V_data_V_2_dout { I 27 vector } Vj_idx_V_data_V_2_empty_n { I 1 bit } Vj_idx_V_data_V_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name Vj_idx_V_data_V_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Vj_idx_V_data_V_3 \
    op interface \
    ports { Vj_idx_V_data_V_3_dout { I 27 vector } Vj_idx_V_data_V_3_empty_n { I 1 bit } Vj_idx_V_data_V_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name processedData_V_data \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_processedData_V_data \
    op interface \
    ports { processedData_V_data_din { O 32 vector } processedData_V_data_full_n { I 1 bit } processedData_V_data_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name processedData_V_data_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_processedData_V_data_1 \
    op interface \
    ports { processedData_V_data_1_din { O 32 vector } processedData_V_data_1_full_n { I 1 bit } processedData_V_data_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name processedData_V_data_2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_processedData_V_data_2 \
    op interface \
    ports { processedData_V_data_2_din { O 32 vector } processedData_V_data_2_full_n { I 1 bit } processedData_V_data_2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name processedData_V_data_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_processedData_V_data_3 \
    op interface \
    ports { processedData_V_data_3_din { O 32 vector } processedData_V_data_3_full_n { I 1 bit } processedData_V_data_3_write { O 1 bit } } \
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


