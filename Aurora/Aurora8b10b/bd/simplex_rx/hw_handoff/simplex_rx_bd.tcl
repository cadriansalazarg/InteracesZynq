
################################################################
# This is a generated script based on design: simplex_rx
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source simplex_rx_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z045ffg900-2
   set_property BOARD_PART xilinx.com:zc706:part0:1.4 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name simplex_rx

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set drpclk_in_0 [ create_bd_port -dir I -type clk drpclk_in_0 ]
  set frame_err_0 [ create_bd_port -dir O frame_err_0 ]
  set gt_refclk1_0 [ create_bd_port -dir I -type clk gt_refclk1_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
 ] $gt_refclk1_0
  set gt_reset_0 [ create_bd_port -dir I -type rst gt_reset_0 ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $gt_reset_0
  set init_clk_in_0 [ create_bd_port -dir I -type clk init_clk_in_0 ]
  set link_reset_out_0 [ create_bd_port -dir O -type rst link_reset_out_0 ]
  set loopback_0 [ create_bd_port -dir I -from 2 -to 0 loopback_0 ]
  set m_axi_rx_tdata_0 [ create_bd_port -dir O -from 0 -to 15 m_axi_rx_tdata_0 ]
  set m_axi_rx_tkeep_0 [ create_bd_port -dir O -from 0 -to 1 m_axi_rx_tkeep_0 ]
  set m_axi_rx_tlast_0 [ create_bd_port -dir O m_axi_rx_tlast_0 ]
  set m_axi_rx_tvalid_0 [ create_bd_port -dir O m_axi_rx_tvalid_0 ]
  set pll_not_locked_out_0 [ create_bd_port -dir O pll_not_locked_out_0 ]
  set power_down_0 [ create_bd_port -dir I -type rst power_down_0 ]
  set rx_aligned_0 [ create_bd_port -dir O rx_aligned_0 ]
  set rx_channel_up_0 [ create_bd_port -dir O rx_channel_up_0 ]
  set rx_hard_err_0 [ create_bd_port -dir O rx_hard_err_0 ]
  set rx_lane_up_0 [ create_bd_port -dir O -from 0 -to 0 rx_lane_up_0 ]
  set rx_reset_0 [ create_bd_port -dir O rx_reset_0 ]
  set rx_resetdone_out_0 [ create_bd_port -dir O rx_resetdone_out_0 ]
  set rx_system_reset_0 [ create_bd_port -dir I -type rst rx_system_reset_0 ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $rx_system_reset_0
  set rx_verify_0 [ create_bd_port -dir O rx_verify_0 ]
  set rxn_0 [ create_bd_port -dir I -from 0 -to 0 rxn_0 ]
  set rxp_0 [ create_bd_port -dir I -from 0 -to 0 rxp_0 ]
  set soft_err_0 [ create_bd_port -dir O soft_err_0 ]
  set sys_reset_out_0 [ create_bd_port -dir O -type rst sys_reset_out_0 ]
  set tx_lock_0 [ create_bd_port -dir O tx_lock_0 ]
  set user_clk_out_0 [ create_bd_port -dir O -type clk user_clk_out_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
 ] $user_clk_out_0

  # Create instance: aurora_8b10b_0, and set properties
  set aurora_8b10b_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0 ]
  set_property -dict [ list \
   CONFIG.C_DRP_IF {false} \
   CONFIG.Dataflow_Config {RX-only_Simplex} \
   CONFIG.SINGLEEND_GTREFCLK {true} \
   CONFIG.SINGLEEND_INITCLK {true} \
   CONFIG.SupportLevel {1} \
 ] $aurora_8b10b_0

  # Create port connections
  connect_bd_net -net aurora_8b10b_0_frame_err [get_bd_ports frame_err_0] [get_bd_pins aurora_8b10b_0/frame_err]
  connect_bd_net -net aurora_8b10b_0_link_reset_out [get_bd_ports link_reset_out_0] [get_bd_pins aurora_8b10b_0/link_reset_out]
  connect_bd_net -net aurora_8b10b_0_m_axi_rx_tdata [get_bd_ports m_axi_rx_tdata_0] [get_bd_pins aurora_8b10b_0/m_axi_rx_tdata]
  connect_bd_net -net aurora_8b10b_0_m_axi_rx_tkeep [get_bd_ports m_axi_rx_tkeep_0] [get_bd_pins aurora_8b10b_0/m_axi_rx_tkeep]
  connect_bd_net -net aurora_8b10b_0_m_axi_rx_tlast [get_bd_ports m_axi_rx_tlast_0] [get_bd_pins aurora_8b10b_0/m_axi_rx_tlast]
  connect_bd_net -net aurora_8b10b_0_m_axi_rx_tvalid [get_bd_ports m_axi_rx_tvalid_0] [get_bd_pins aurora_8b10b_0/m_axi_rx_tvalid]
  connect_bd_net -net aurora_8b10b_0_pll_not_locked_out [get_bd_ports pll_not_locked_out_0] [get_bd_pins aurora_8b10b_0/pll_not_locked_out]
  connect_bd_net -net aurora_8b10b_0_rx_aligned [get_bd_ports rx_aligned_0] [get_bd_pins aurora_8b10b_0/rx_aligned]
  connect_bd_net -net aurora_8b10b_0_rx_channel_up [get_bd_ports rx_channel_up_0] [get_bd_pins aurora_8b10b_0/rx_channel_up]
  connect_bd_net -net aurora_8b10b_0_rx_hard_err [get_bd_ports rx_hard_err_0] [get_bd_pins aurora_8b10b_0/rx_hard_err]
  connect_bd_net -net aurora_8b10b_0_rx_lane_up [get_bd_ports rx_lane_up_0] [get_bd_pins aurora_8b10b_0/rx_lane_up]
  connect_bd_net -net aurora_8b10b_0_rx_reset [get_bd_ports rx_reset_0] [get_bd_pins aurora_8b10b_0/rx_reset]
  connect_bd_net -net aurora_8b10b_0_rx_resetdone_out [get_bd_ports rx_resetdone_out_0] [get_bd_pins aurora_8b10b_0/rx_resetdone_out]
  connect_bd_net -net aurora_8b10b_0_rx_verify [get_bd_ports rx_verify_0] [get_bd_pins aurora_8b10b_0/rx_verify]
  connect_bd_net -net aurora_8b10b_0_soft_err [get_bd_ports soft_err_0] [get_bd_pins aurora_8b10b_0/soft_err]
  connect_bd_net -net aurora_8b10b_0_sys_reset_out [get_bd_ports sys_reset_out_0] [get_bd_pins aurora_8b10b_0/sys_reset_out]
  connect_bd_net -net aurora_8b10b_0_tx_lock [get_bd_ports tx_lock_0] [get_bd_pins aurora_8b10b_0/tx_lock]
  connect_bd_net -net aurora_8b10b_0_user_clk_out [get_bd_ports user_clk_out_0] [get_bd_pins aurora_8b10b_0/user_clk_out]
  connect_bd_net -net drpclk_in_0_1 [get_bd_ports drpclk_in_0] [get_bd_pins aurora_8b10b_0/drpclk_in]
  connect_bd_net -net gt_refclk1_0_1 [get_bd_ports gt_refclk1_0] [get_bd_pins aurora_8b10b_0/gt_refclk1]
  connect_bd_net -net gt_reset_0_1 [get_bd_ports gt_reset_0] [get_bd_pins aurora_8b10b_0/gt_reset]
  connect_bd_net -net init_clk_in_0_1 [get_bd_ports init_clk_in_0] [get_bd_pins aurora_8b10b_0/init_clk_in]
  connect_bd_net -net loopback_0_1 [get_bd_ports loopback_0] [get_bd_pins aurora_8b10b_0/loopback]
  connect_bd_net -net power_down_0_1 [get_bd_ports power_down_0] [get_bd_pins aurora_8b10b_0/power_down]
  connect_bd_net -net rx_system_reset_0_1 [get_bd_ports rx_system_reset_0] [get_bd_pins aurora_8b10b_0/rx_system_reset]
  connect_bd_net -net rxn_0_1 [get_bd_ports rxn_0] [get_bd_pins aurora_8b10b_0/rxn]
  connect_bd_net -net rxp_0_1 [get_bd_ports rxp_0] [get_bd_pins aurora_8b10b_0/rxp]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


