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
    id 131 \
    name F_V_data_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_F_V_data_0 \
    op interface \
    ports { F_V_data_0_dout { I 32 vector } F_V_data_0_empty_n { I 1 bit } F_V_data_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name F_V_data_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_F_V_data_1 \
    op interface \
    ports { F_V_data_1_dout { I 32 vector } F_V_data_1_empty_n { I 1 bit } F_V_data_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name F_V_data_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_F_V_data_2 \
    op interface \
    ports { F_V_data_2_dout { I 32 vector } F_V_data_2_empty_n { I 1 bit } F_V_data_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name F_V_data_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_F_V_data_3 \
    op interface \
    ports { F_V_data_3_dout { I 32 vector } F_V_data_3_empty_n { I 1 bit } F_V_data_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name V_V_data_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V_V_data_0 \
    op interface \
    ports { V_V_data_0_dout { I 32 vector } V_V_data_0_empty_n { I 1 bit } V_V_data_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name V_V_data_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V_V_data_1 \
    op interface \
    ports { V_V_data_1_dout { I 32 vector } V_V_data_1_empty_n { I 1 bit } V_V_data_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name V_V_data_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V_V_data_2 \
    op interface \
    ports { V_V_data_2_dout { I 32 vector } V_V_data_2_empty_n { I 1 bit } V_V_data_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name V_V_data_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V_V_data_3 \
    op interface \
    ports { V_V_data_3_dout { I 32 vector } V_V_data_3_empty_n { I 1 bit } V_V_data_3_read { O 1 bit } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 1 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
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
    id -4 \
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


# Adapter definition:
set PortName ap_ce
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_ce] == "cg_default_interface_gen_ce"} {
eval "cg_default_interface_gen_ce { \
    id -5 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_ce \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


