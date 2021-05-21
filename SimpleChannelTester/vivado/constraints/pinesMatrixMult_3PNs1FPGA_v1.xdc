set_property SEVERITY WARNING [get_drc_checks REQP-52]
set_property SEVERITY WARNING [get_drc_checks REQP-56]


set_property PACKAGE_PIN Y21 [get_ports channel_up_0]
set_property IOSTANDARD LVCMOS25 [get_ports channel_up_0]


set_property PACKAGE_PIN AJ21 [get_ports Error_Counter_0[0]]
set_property IOSTANDARD LVCMOS25 [get_ports Error_Counter_0[0]]

set_property PACKAGE_PIN AK21 [get_ports Error_Counter_0[1]]
set_property IOSTANDARD LVCMOS25 [get_ports Error_Counter_0[1]]

set_property PACKAGE_PIN AB21 [get_ports Error_Counter_0[2]]
set_property IOSTANDARD LVCMOS25 [get_ports Error_Counter_0[2]]

set_property PACKAGE_PIN AB16 [get_ports Error_Counter_0[3]]
set_property IOSTANDARD LVCMOS25 [get_ports Error_Counter_0[3]]

#set_property PACKAGE_PIN Y20 [get_ports Error_0]
#set_property IOSTANDARD LVCMOS25 [get_ports Error_0]

#set_property PACKAGE_PIN AA20 [get_ports Error_1]
#set_property IOSTANDARD LVCMOS25 [get_ports Error_1]



set_property PACKAGE_PIN AK25 [get_ports peripheral_reset]
set_property IOSTANDARD LVCMOS25 [get_ports peripheral_reset]


# Conección de trasceiver del conector SMA
set_property PACKAGE_PIN Y2 [get_ports txp_0]
set_property PACKAGE_PIN AB6 [get_ports rxp_0]
set_property PACKAGE_PIN Y1 [get_ports txn_0]
set_property PACKAGE_PIN AB5 [get_ports rxn_0]

# Conección del transceiver del loopback interno
#set_property PACKAGE_PIN V2 [get_ports txp_1]
#set_property PACKAGE_PIN AA4 [get_ports rxp_1]
#set_property PACKAGE_PIN V1 [get_ports txn_1]
#set_property PACKAGE_PIN AA3 [get_ports rxn_1] 

set_property PACKAGE_PIN H9 [get_ports clk_200MHz_p]
set_property IOSTANDARD LVDS [get_ports clk_200MHz_p]
set_property PACKAGE_PIN G9 [get_ports clk_200MHz_n]
set_property IOSTANDARD LVDS [get_ports clk_200MHz_n]