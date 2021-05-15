set moduleName getTotalCurrent
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {getTotalCurrent}
set C_modelType { void 0 }
set C_modelArgList {
	{ row_V int 3 regular  }
	{ I_V_data float 32 regular {axi_s 1 volatile  { output_r Data } }  }
	{ I_V_tlast_V int 1 regular {axi_s 1 volatile  { output_r Last } }  }
	{ RowOfBlocks_V_read int 26 regular  }
	{ simConfig_rowsToSimulate_V_read int 27 regular  }
	{ F_temp_data float 32 regular {array 4 { 1 3 } 1 1 }  }
	{ V_temp_data float 32 regular {array 4 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "row_V", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "I_V_data", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "I_V_tlast_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "RowOfBlocks_V_read", "interface" : "wire", "bitwidth" : 26, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowsToSimulate_V_read", "interface" : "wire", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "F_temp_data", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "V_temp_data", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ row_V sc_in sc_lv 3 signal 0 } 
	{ output_r_TDATA sc_out sc_lv 32 signal 1 } 
	{ output_r_TVALID sc_out sc_logic 1 outvld 2 } 
	{ output_r_TREADY sc_in sc_logic 1 outacc 1 } 
	{ output_r_TLAST sc_out sc_lv 1 signal 2 } 
	{ RowOfBlocks_V_read sc_in sc_lv 26 signal 3 } 
	{ simConfig_rowsToSimulate_V_read sc_in sc_lv 27 signal 4 } 
	{ F_temp_data_address0 sc_out sc_lv 2 signal 5 } 
	{ F_temp_data_ce0 sc_out sc_logic 1 signal 5 } 
	{ F_temp_data_q0 sc_in sc_lv 32 signal 5 } 
	{ V_temp_data_address0 sc_out sc_lv 2 signal 6 } 
	{ V_temp_data_ce0 sc_out sc_logic 1 signal 6 } 
	{ V_temp_data_q0 sc_in sc_lv 32 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "row_V", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "row_V", "role": "default" }} , 
 	{ "name": "output_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "I_V_data", "role": "TDATA" }} , 
 	{ "name": "output_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "I_V_tlast_V", "role": "LID" }} , 
 	{ "name": "output_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "I_V_data", "role": "TREADY" }} , 
 	{ "name": "output_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "I_V_tlast_V", "role": "ST" }} , 
 	{ "name": "RowOfBlocks_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":26, "type": "signal", "bundle":{"name": "RowOfBlocks_V_read", "role": "default" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_read", "role": "default" }} , 
 	{ "name": "F_temp_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "F_temp_data", "role": "address0" }} , 
 	{ "name": "F_temp_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_temp_data", "role": "ce0" }} , 
 	{ "name": "F_temp_data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "F_temp_data", "role": "q0" }} , 
 	{ "name": "V_temp_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "V_temp_data", "role": "address0" }} , 
 	{ "name": "V_temp_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_temp_data", "role": "ce0" }} , 
 	{ "name": "V_temp_data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_temp_data", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "getTotalCurrent",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "23", "EstimateLatencyMax" : "23",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "row_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "I_V_data", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "I_V_tlast_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "RowOfBlocks_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "simConfig_rowsToSimulate_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "F_temp_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "V_temp_data", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fptrunc_64ns_32_2_1_U165", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fpext_32ns_64_1_1_U166", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fpext_32ns_64_1_1_U167", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_dadd_64ns_64ns_64_9_full_dsp_1_U168", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_dmul_64ns_64ns_64_10_max_dsp_1_U169", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_dmul_64ns_64ns_64_10_max_dsp_1_U170", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	getTotalCurrent {
		row_V {Type I LastRead 0 FirstWrite -1}
		I_V_data {Type O LastRead -1 FirstWrite 23}
		I_V_tlast_V {Type O LastRead -1 FirstWrite 23}
		RowOfBlocks_V_read {Type I LastRead 22 FirstWrite -1}
		simConfig_rowsToSimulate_V_read {Type I LastRead 22 FirstWrite -1}
		F_temp_data {Type I LastRead 0 FirstWrite -1}
		V_temp_data {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "23", "Max" : "23"}
	, {"Name" : "Interval", "Min" : "23", "Max" : "23"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	row_V { ap_none {  { row_V in_data 0 3 } } }
	I_V_data { axis {  { output_r_TDATA out_data 1 32 }  { output_r_TREADY out_acc 0 1 } } }
	I_V_tlast_V { axis {  { output_r_TVALID out_vld 1 1 }  { output_r_TLAST out_data 1 1 } } }
	RowOfBlocks_V_read { ap_none {  { RowOfBlocks_V_read in_data 0 26 } } }
	simConfig_rowsToSimulate_V_read { ap_none {  { simConfig_rowsToSimulate_V_read in_data 0 27 } } }
	F_temp_data { ap_memory {  { F_temp_data_address0 mem_address 1 2 }  { F_temp_data_ce0 mem_ce 1 1 }  { F_temp_data_q0 mem_dout 0 32 } } }
	V_temp_data { ap_memory {  { V_temp_data_address0 mem_address 1 2 }  { V_temp_data_ce0 mem_ce 1 1 }  { V_temp_data_q0 mem_dout 0 32 } } }
}
