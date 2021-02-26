#set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
#set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY WARNING [get_drc_checks REQP-52]
set_property SEVERITY WARNING [get_drc_checks REQP-56]

set_property PACKAGE_PIN Y21 [get_ports channel_up]
set_property IOSTANDARD LVCMOS25 [get_ports channel_up]

set_property PACKAGE_PIN W21 [get_ports locked]
set_property IOSTANDARD LVCMOS25 [get_ports locked]

set_property PACKAGE_PIN R27 [get_ports reset]
set_property IOSTANDARD LVCMOS25 [get_ports reset]

set_property PACKAGE_PIN AK25 [get_ports USR_rst]
set_property IOSTANDARD LVCMOS25 [get_ports USR_rst]


set_property LOC GTXE2_CHANNEL_X0Y11 [get_cells main_i/aurora_8b10b_0/inst/main_aurora_8b10b_0_0_core_i/gt_wrapper_i/main_aurora_8b10b_0_0_multi_gt_i/gt0_main_aurora_8b10b_0_0_i/gtxe2_i]


set_property PACKAGE_PIN H9 [get_ports clk_in_p]
set_property IOSTANDARD LVDS [get_ports clk_in_p]
set_property PACKAGE_PIN G9 [get_ports clk_in_n]
set_property IOSTANDARD LVDS [get_ports clk_in_n]

