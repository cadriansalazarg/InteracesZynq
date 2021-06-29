set_property SEVERITY WARNING [get_drc_checks REQP-52]
set_property SEVERITY WARNING [get_drc_checks REQP-56]

set_property PACKAGE_PIN Y21 [get_ports channel_up_0]
set_property IOSTANDARD LVCMOS25 [get_ports channel_up_0]

set_property PACKAGE_PIN AK25 [get_ports peripheral_reset]
set_property IOSTANDARD LVCMOS25 [get_ports peripheral_reset]

# Lane 1
set_property PACKAGE_PIN P2 [get_ports txp_0]
set_property PACKAGE_PIN T6 [get_ports rxp_0]
set_property PACKAGE_PIN P1 [get_ports txn_0]
set_property PACKAGE_PIN T5 [get_ports rxn_0]

set_property PACKAGE_PIN H9 [get_ports clk_200MHz_p]
set_property IOSTANDARD LVDS [get_ports clk_200MHz_p]
set_property PACKAGE_PIN G9 [get_ports clk_200MHz_n]
set_property IOSTANDARD LVDS [get_ports clk_200MHz_n]
