create_project prj -part xc7z045ffg900-2 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "/home/carlositcr/InterfacesZynq/GapJuntion/hls/hls_GapJuntion/hls_gapjuntion_prj/solution1/syn/verilog/GapJunctionIP_ap_dadd_7_full_dsp_64_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips GapJunctionIP_ap_dadd_7_full_dsp_64]]
}
source "/home/carlositcr/InterfacesZynq/GapJuntion/hls/hls_GapJuntion/hls_gapjuntion_prj/solution1/syn/verilog/GapJunctionIP_ap_fadd_6_full_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips GapJunctionIP_ap_fadd_6_full_dsp_32]]
}
source "/home/carlositcr/InterfacesZynq/GapJuntion/hls/hls_GapJuntion/hls_gapjuntion_prj/solution1/syn/verilog/GapJunctionIP_ap_fsub_6_full_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips GapJunctionIP_ap_fsub_6_full_dsp_32]]
}
source "/home/carlositcr/InterfacesZynq/GapJuntion/hls/hls_GapJuntion/hls_gapjuntion_prj/solution1/syn/verilog/GapJunctionIP_ap_dmul_8_max_dsp_64_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips GapJunctionIP_ap_dmul_8_max_dsp_64]]
}
source "/home/carlositcr/InterfacesZynq/GapJuntion/hls/hls_GapJuntion/hls_gapjuntion_prj/solution1/syn/verilog/GapJunctionIP_ap_fpext_0_no_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips GapJunctionIP_ap_fpext_0_no_dsp_32]]
}
source "/home/carlositcr/InterfacesZynq/GapJuntion/hls/hls_GapJuntion/hls_gapjuntion_prj/solution1/syn/verilog/GapJunctionIP_ap_fmul_3_max_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips GapJunctionIP_ap_fmul_3_max_dsp_32]]
}
source "/home/carlositcr/InterfacesZynq/GapJuntion/hls/hls_GapJuntion/hls_gapjuntion_prj/solution1/syn/verilog/GapJunctionIP_ap_fexp_16_full_dsp_32_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips GapJunctionIP_ap_fexp_16_full_dsp_32]]
}
source "/home/carlositcr/InterfacesZynq/GapJuntion/hls/hls_GapJuntion/hls_gapjuntion_prj/solution1/syn/verilog/GapJunctionIP_ap_fptrunc_0_no_dsp_64_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips GapJunctionIP_ap_fptrunc_0_no_dsp_64]]
}
