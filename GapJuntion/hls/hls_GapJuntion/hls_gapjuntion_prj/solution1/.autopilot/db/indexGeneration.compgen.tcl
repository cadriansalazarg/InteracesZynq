# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name simConfig_rowBegin_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_simConfig_rowBegin_V \
    op interface \
    ports { simConfig_rowBegin_V_dout { I 27 vector } simConfig_rowBegin_V_empty_n { I 1 bit } simConfig_rowBegin_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name simConfig_rowEnd_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_simConfig_rowEnd_V \
    op interface \
    ports { simConfig_rowEnd_V_dout { I 27 vector } simConfig_rowEnd_V_empty_n { I 1 bit } simConfig_rowEnd_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
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
    id 41 \
    name Vi_idx_V_data_V_0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Vi_idx_V_data_V_0 \
    op interface \
    ports { Vi_idx_V_data_V_0_din { O 27 vector } Vi_idx_V_data_V_0_full_n { I 1 bit } Vi_idx_V_data_V_0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name Vi_idx_V_data_V_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Vi_idx_V_data_V_1 \
    op interface \
    ports { Vi_idx_V_data_V_1_din { O 27 vector } Vi_idx_V_data_V_1_full_n { I 1 bit } Vi_idx_V_data_V_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name Vi_idx_V_data_V_2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Vi_idx_V_data_V_2 \
    op interface \
    ports { Vi_idx_V_data_V_2_din { O 27 vector } Vi_idx_V_data_V_2_full_n { I 1 bit } Vi_idx_V_data_V_2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name Vi_idx_V_data_V_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Vi_idx_V_data_V_3 \
    op interface \
    ports { Vi_idx_V_data_V_3_din { O 27 vector } Vi_idx_V_data_V_3_full_n { I 1 bit } Vi_idx_V_data_V_3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name Vj_idx_V_data_V_0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Vj_idx_V_data_V_0 \
    op interface \
    ports { Vj_idx_V_data_V_0_din { O 27 vector } Vj_idx_V_data_V_0_full_n { I 1 bit } Vj_idx_V_data_V_0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name Vj_idx_V_data_V_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Vj_idx_V_data_V_1 \
    op interface \
    ports { Vj_idx_V_data_V_1_din { O 27 vector } Vj_idx_V_data_V_1_full_n { I 1 bit } Vj_idx_V_data_V_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 47 \
    name Vj_idx_V_data_V_2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Vj_idx_V_data_V_2 \
    op interface \
    ports { Vj_idx_V_data_V_2_din { O 27 vector } Vj_idx_V_data_V_2_full_n { I 1 bit } Vj_idx_V_data_V_2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 48 \
    name Vj_idx_V_data_V_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Vj_idx_V_data_V_3 \
    op interface \
    ports { Vj_idx_V_data_V_3_din { O 27 vector } Vj_idx_V_data_V_3_full_n { I 1 bit } Vj_idx_V_data_V_3_write { O 1 bit } } \
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


