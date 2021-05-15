set moduleName execute
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {execute}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_V_data int 64 regular {axi_s 0 volatile  { input_V_data Data } }  }
	{ output_V_data float 32 regular {axi_s 1 volatile  { output_r Data } }  }
	{ output_V_tlast_V int 1 regular {axi_s 1 volatile  { output_r Last } }  }
	{ simConfig_rowBegin_V_2 int 27 regular {ap_stable 0} }
	{ simConfig_rowEnd_V_r int 27 regular {ap_stable 0} }
	{ simConfig_rowsToSimu int 27 regular {ap_stable 0} }
	{ simConfig_BLOCK_NUMB int 27 regular {ap_stable 0} }
	{ size int 32 regular {ap_stable 0} }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_V_data", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_V_data", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_V_tlast_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "simConfig_rowBegin_V_2", "interface" : "wire", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowEnd_V_r", "interface" : "wire", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowsToSimu", "interface" : "wire", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_BLOCK_NUMB", "interface" : "wire", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ input_V_data_TDATA sc_in sc_lv 64 signal 0 } 
	{ output_r_TDATA sc_out sc_lv 32 signal 1 } 
	{ output_r_TLAST sc_out sc_lv 1 signal 2 } 
	{ simConfig_rowBegin_V_2 sc_in sc_lv 27 signal 3 } 
	{ simConfig_rowEnd_V_r sc_in sc_lv 27 signal 4 } 
	{ simConfig_rowsToSimu sc_in sc_lv 27 signal 5 } 
	{ simConfig_BLOCK_NUMB sc_in sc_lv 27 signal 6 } 
	{ size sc_in sc_lv 32 signal 7 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ input_V_data_TVALID sc_in sc_logic 1 invld 0 } 
	{ input_V_data_TREADY sc_out sc_logic 1 inacc 0 } 
	{ size_ap_vld sc_in sc_logic 1 invld 7 } 
	{ simConfig_rowBegin_V_2_ap_vld sc_in sc_logic 1 invld 3 } 
	{ simConfig_rowEnd_V_r_ap_vld sc_in sc_logic 1 invld 4 } 
	{ simConfig_rowsToSimu_ap_vld sc_in sc_logic 1 invld 5 } 
	{ simConfig_BLOCK_NUMB_ap_vld sc_in sc_logic 1 invld 6 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ output_r_TVALID sc_out sc_logic 1 outvld 2 } 
	{ output_r_TREADY sc_in sc_logic 1 outacc 2 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "input_V_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_V_data", "role": "TDATA" }} , 
 	{ "name": "output_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_V_data", "role": "" }} , 
 	{ "name": "output_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "output_V_tlast_V", "role": "default" }} , 
 	{ "name": "simConfig_rowBegin_V_2", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V_2", "role": "default" }} , 
 	{ "name": "simConfig_rowEnd_V_r", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V_r", "role": "default" }} , 
 	{ "name": "simConfig_rowsToSimu", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowsToSimu", "role": "default" }} , 
 	{ "name": "simConfig_BLOCK_NUMB", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMB", "role": "default" }} , 
 	{ "name": "size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "size", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "input_V_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_V_data", "role": "TVALID" }} , 
 	{ "name": "input_V_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "input_V_data", "role": "TREADY" }} , 
 	{ "name": "size_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "size", "role": "ap_vld" }} , 
 	{ "name": "simConfig_rowBegin_V_2_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "simConfig_rowBegin_V_2", "role": "ap_vld" }} , 
 	{ "name": "simConfig_rowEnd_V_r_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "simConfig_rowEnd_V_r", "role": "ap_vld" }} , 
 	{ "name": "simConfig_rowsToSimu_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "simConfig_rowsToSimu", "role": "ap_vld" }} , 
 	{ "name": "simConfig_BLOCK_NUMB_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "simConfig_BLOCK_NUMB", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "output_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_V_tlast_V", "role": "default" }} , 
 	{ "name": "output_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "output_V_tlast_V", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "23", "35", "41", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91"],
		"CDFG" : "execute",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "204", "EstimateLatencyMax" : "50265082",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "blockControl173_U0"}],
		"OutputProcess" : [
			{"ID" : "41", "Name" : "I_calc_U0"}],
		"Port" : [
			{"Name" : "input_V_data", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "blockControl173_U0", "Port" : "input_V_data"}]},
			{"Name" : "output_V_data", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "I_V_data"}]},
			{"Name" : "output_V_tlast_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "I_V_tlast_V"}]},
			{"Name" : "simConfig_rowBegin_V_2", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "simConfig_rowEnd_V_r", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "simConfig_rowsToSimu", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "simConfig_BLOCK_NUMB", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "size", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "V_data_V_data_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "blockControl173_U0", "Port" : "V_data_V_data_0"},
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "V_data_V_data_0"}]},
			{"Name" : "V_data_V_data_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "blockControl173_U0", "Port" : "V_data_V_data_1"},
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "V_data_V_data_1"}]},
			{"Name" : "V_data_V_data_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "blockControl173_U0", "Port" : "V_data_V_data_2"},
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "V_data_V_data_2"}]},
			{"Name" : "V_data_V_data_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "blockControl173_U0", "Port" : "V_data_V_data_3"},
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "V_data_V_data_3"}]},
			{"Name" : "Vi_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "Vi_idx_V_data_V_0"}]},
			{"Name" : "Vi_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "Vi_idx_V_data_V_1"}]},
			{"Name" : "Vi_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "Vi_idx_V_data_V_2"}]},
			{"Name" : "Vi_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "Vi_idx_V_data_V_3"}]},
			{"Name" : "Vj_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "Vj_idx_V_data_V_0"}]},
			{"Name" : "Vj_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "Vj_idx_V_data_V_1"}]},
			{"Name" : "Vj_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "Vj_idx_V_data_V_2"}]},
			{"Name" : "Vj_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "Vj_idx_V_data_V_3"}]},
			{"Name" : "fixedData_V_data", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "fixedData_V_data"},
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "fixedData_V_data"}]},
			{"Name" : "fixedData_V_tlast_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "fixedData_V_tlast_V"},
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "fixedData_V_tlast_V"}]},
			{"Name" : "processedData_V_data", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "processedData_V_data"},
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "processedData_V_data"}]},
			{"Name" : "processedData_V_data_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "processedData_V_data_1"},
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "processedData_V_data_1"}]},
			{"Name" : "processedData_V_data_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "processedData_V_data_2"},
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "processedData_V_data_2"}]},
			{"Name" : "processedData_V_data_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "V_read_U0", "Port" : "processedData_V_data_3"},
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "processedData_V_data_3"}]},
			{"Name" : "V_V_data_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "V_V_data_0"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "V_V_data_0"}]},
			{"Name" : "V_V_data_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "V_V_data_1"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "V_V_data_1"}]},
			{"Name" : "V_V_data_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "V_V_data_2"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "V_V_data_2"}]},
			{"Name" : "V_V_data_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "V_V_data_3"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "V_V_data_3"}]},
			{"Name" : "F_V_data_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "F_V_data_0"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "F_V_data_0"}]},
			{"Name" : "F_V_data_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "F_V_data_1"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "F_V_data_1"}]},
			{"Name" : "F_V_data_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "F_V_data_2"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "F_V_data_2"}]},
			{"Name" : "F_V_data_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "calc_U0", "Port" : "F_V_data_3"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "F_V_data_3"}]},
			{"Name" : "F_acc_V_data_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "F_acc_V_data_0"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "F_acc_V_data_0"}]},
			{"Name" : "F_acc_V_data_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "F_acc_V_data_1"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "F_acc_V_data_1"}]},
			{"Name" : "F_acc_V_data_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "F_acc_V_data_2"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "F_acc_V_data_2"}]},
			{"Name" : "F_acc_V_data_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "F_acc_V_data_3"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "F_acc_V_data_3"}]},
			{"Name" : "V_acc_V_data_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "V_acc_V_data_0"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "V_acc_V_data_0"}]},
			{"Name" : "V_acc_V_data_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "V_acc_V_data_1"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "V_acc_V_data_1"}]},
			{"Name" : "V_acc_V_data_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "V_acc_V_data_2"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "V_acc_V_data_2"}]},
			{"Name" : "V_acc_V_data_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "I_calc_U0", "Port" : "V_acc_V_data_3"},
					{"ID" : "35", "SubInstance" : "acc_U0", "Port" : "V_acc_V_data_3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.blockControl173_U0", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "blockControl173",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "5002",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_getVoltages_fu_118"}],
		"Port" : [
			{"Name" : "input_V_data", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_getVoltages_fu_118", "Port" : "input_V_data"}]},
			{"Name" : "V_SIZE", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "simConfig_rowBegin_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "52",
				"BlockSignal" : [
					{"Name" : "simConfig_rowBegin_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowEnd_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "53",
				"BlockSignal" : [
					{"Name" : "simConfig_rowEnd_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowsToSimulate_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "54",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "55",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "6", "DependentChan" : "56",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_getVoltages_fu_118", "Port" : "V_data_V_data_0"}]},
			{"Name" : "V_data_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "6", "DependentChan" : "57",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_getVoltages_fu_118", "Port" : "V_data_V_data_1"}]},
			{"Name" : "V_data_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "6", "DependentChan" : "58",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_getVoltages_fu_118", "Port" : "V_data_V_data_2"}]},
			{"Name" : "V_data_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "6", "DependentChan" : "59",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_getVoltages_fu_118", "Port" : "V_data_V_data_3"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.blockControl173_U0.grp_getVoltages_fu_118", "Parent" : "1",
		"CDFG" : "getVoltages",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "5001",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "input_V_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_V_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_SIZE", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "V_data_V_data_0", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_1", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_2", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_3", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_read_U0", "Parent" : "0", "Child" : ["4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"],
		"CDFG" : "V_read",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "25012497",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "1",
		"StartFifo" : "start_for_V_read_U0_U",
		"InputProcess" : [
			{"ID" : "5", "Name" : "V_read_entry169179_U0", "ReadyCount" : "V_read_entry169179_U0_ap_ready_count"},
			{"ID" : "6", "Name" : "readVoltages_U0", "ReadyCount" : "readVoltages_U0_ap_ready_count"}],
		"OutputProcess" : [
			{"ID" : "5", "Name" : "V_read_entry169179_U0"},
			{"ID" : "8", "Name" : "writeV2calc_U0"}],
		"Port" : [
			{"Name" : "simConfig_rowBegin_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "52",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "V_read_entry169179_U0", "Port" : "simConfig_rowBegin_V"}]},
			{"Name" : "simConfig_rowEnd_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "53",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "V_read_entry169179_U0", "Port" : "simConfig_rowEnd_V"}]},
			{"Name" : "simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "54",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "V_read_entry169179_U0", "Port" : "scalar_simConfig_rowsToSimulate_V"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "55",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "V_read_entry169179_U0", "Port" : "scalar_simConfig_BLOCK_NUMBERS_V"}]},
			{"Name" : "V_SIZE", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "simConfig_rowsToSimulate_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "60",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "V_read_entry169179_U0", "Port" : "simConfig_rowsToSimulate_V_out"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "61",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "V_read_entry169179_U0", "Port" : "simConfig_BLOCK_NUMBERS_V_out"}]},
			{"Name" : "V_data_V_data_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "56",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "readVoltages_U0", "Port" : "V_data_V_data_0"}]},
			{"Name" : "V_data_V_data_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "57",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "readVoltages_U0", "Port" : "V_data_V_data_1"}]},
			{"Name" : "V_data_V_data_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "58",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "readVoltages_U0", "Port" : "V_data_V_data_2"}]},
			{"Name" : "V_data_V_data_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "59",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "readVoltages_U0", "Port" : "V_data_V_data_3"}]},
			{"Name" : "Vi_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "Vi_idx_V_data_V_0"},
					{"ID" : "7", "SubInstance" : "indexGeneration_U0", "Port" : "Vi_idx_V_data_V_0"}]},
			{"Name" : "Vi_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "Vi_idx_V_data_V_1"},
					{"ID" : "7", "SubInstance" : "indexGeneration_U0", "Port" : "Vi_idx_V_data_V_1"}]},
			{"Name" : "Vi_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "Vi_idx_V_data_V_2"},
					{"ID" : "7", "SubInstance" : "indexGeneration_U0", "Port" : "Vi_idx_V_data_V_2"}]},
			{"Name" : "Vi_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "Vi_idx_V_data_V_3"},
					{"ID" : "7", "SubInstance" : "indexGeneration_U0", "Port" : "Vi_idx_V_data_V_3"}]},
			{"Name" : "Vj_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "Vj_idx_V_data_V_0"},
					{"ID" : "7", "SubInstance" : "indexGeneration_U0", "Port" : "Vj_idx_V_data_V_0"}]},
			{"Name" : "Vj_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "Vj_idx_V_data_V_1"},
					{"ID" : "7", "SubInstance" : "indexGeneration_U0", "Port" : "Vj_idx_V_data_V_1"}]},
			{"Name" : "Vj_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "Vj_idx_V_data_V_2"},
					{"ID" : "7", "SubInstance" : "indexGeneration_U0", "Port" : "Vj_idx_V_data_V_2"}]},
			{"Name" : "Vj_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "Vj_idx_V_data_V_3"},
					{"ID" : "7", "SubInstance" : "indexGeneration_U0", "Port" : "Vj_idx_V_data_V_3"}]},
			{"Name" : "fixedData_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "62",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "fixedData_V_data"}]},
			{"Name" : "fixedData_V_tlast_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "63",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "fixedData_V_tlast_V"}]},
			{"Name" : "processedData_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "64",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "processedData_V_data"}]},
			{"Name" : "processedData_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "65",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "processedData_V_data_1"}]},
			{"Name" : "processedData_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "66",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "processedData_V_data_2"}]},
			{"Name" : "processedData_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "67",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "writeV2calc_U0", "Port" : "processedData_V_data_3"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.voltagesBackup_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.V_read_entry169179_U0", "Parent" : "3",
		"CDFG" : "V_read_entry169179",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "scalar_simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "55",
				"BlockSignal" : [
					{"Name" : "scalar_simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "61",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scalar_simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "54",
				"BlockSignal" : [
					{"Name" : "scalar_simConfig_rowsToSimulate_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowsToSimulate_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "60",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowBegin_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "52",
				"BlockSignal" : [
					{"Name" : "simConfig_rowBegin_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowEnd_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "53",
				"BlockSignal" : [
					{"Name" : "simConfig_rowEnd_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowBegin_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "9",
				"BlockSignal" : [
					{"Name" : "simConfig_rowBegin_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowEnd_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "10",
				"BlockSignal" : [
					{"Name" : "simConfig_rowEnd_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowsToSimulate_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "11",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "12",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_c1_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "13",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_c1_i_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.readVoltages_U0", "Parent" : "3",
		"CDFG" : "readVoltages",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "7501",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "voltagesBackup", "Type" : "Memory", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "4"},
			{"Name" : "V_SIZE", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "V_data_V_data_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "56",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "57",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "58",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "59",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.indexGeneration_U0", "Parent" : "3",
		"CDFG" : "indexGeneration",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "6252501",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "5",
		"StartFifo" : "start_for_indexGeneration_U0_U",
		"Port" : [
			{"Name" : "simConfig_rowBegin_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "9",
				"BlockSignal" : [
					{"Name" : "simConfig_rowBegin_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowEnd_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "10",
				"BlockSignal" : [
					{"Name" : "simConfig_rowEnd_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "12",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "14",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "15",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "16",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "17",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "18",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "19",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "20",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "21",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.writeV2calc_U0", "Parent" : "3",
		"CDFG" : "writeV2calc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "25004995",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "voltagesBackup", "Type" : "Memory", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "4"},
			{"Name" : "simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "11",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "13",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "14",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "15",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "16",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "17",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fixedData_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "62",
				"BlockSignal" : [
					{"Name" : "fixedData_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fixedData_V_tlast_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "63",
				"BlockSignal" : [
					{"Name" : "fixedData_V_tlast_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "18",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "19",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "20",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "21",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "64",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "65",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "66",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "23", "DependentChan" : "67",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.simConfig_rowBegin_V_2_U", "Parent" : "3"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.simConfig_rowEnd_V_c_U", "Parent" : "3"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.simConfig_rowsToSimu_U", "Parent" : "3"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.simConfig_BLOCK_NUMB_5_U", "Parent" : "3"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.simConfig_BLOCK_NUMB_U", "Parent" : "3"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.Vi_idx_V_data_V_0_U", "Parent" : "3"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.Vi_idx_V_data_V_1_U", "Parent" : "3"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.Vi_idx_V_data_V_2_U", "Parent" : "3"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.Vi_idx_V_data_V_3_U", "Parent" : "3"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.Vj_idx_V_data_V_0_U", "Parent" : "3"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.Vj_idx_V_data_V_1_U", "Parent" : "3"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.Vj_idx_V_data_V_2_U", "Parent" : "3"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.Vj_idx_V_data_V_3_U", "Parent" : "3"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.V_read_U0.start_for_indexGeneration_U0_U", "Parent" : "3"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.calc_U0", "Parent" : "0", "Child" : ["24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34"],
		"CDFG" : "calc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "51", "EstimateLatencyMax" : "50000049",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "3",
		"StartFifo" : "start_for_calc_U0_U",
		"Port" : [
			{"Name" : "simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "60",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "61",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowsToSimulate_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "68",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "69",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "64",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "65",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "66",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "67",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fixedData_V_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "62",
				"BlockSignal" : [
					{"Name" : "fixedData_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fixedData_V_tlast_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "63",
				"BlockSignal" : [
					{"Name" : "fixedData_V_tlast_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_V_data_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "70",
				"BlockSignal" : [
					{"Name" : "V_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "71",
				"BlockSignal" : [
					{"Name" : "V_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "72",
				"BlockSignal" : [
					{"Name" : "V_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "73",
				"BlockSignal" : [
					{"Name" : "V_V_data_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_V_data_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "74",
				"BlockSignal" : [
					{"Name" : "F_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "75",
				"BlockSignal" : [
					{"Name" : "F_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "76",
				"BlockSignal" : [
					{"Name" : "F_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "77",
				"BlockSignal" : [
					{"Name" : "F_V_data_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fsub_32ns_32ns_32_8_full_dsp_1_U98", "Parent" : "23"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fsub_32ns_32ns_32_8_full_dsp_1_U99", "Parent" : "23"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U100", "Parent" : "23"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U101", "Parent" : "23"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U102", "Parent" : "23"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U103", "Parent" : "23"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U104", "Parent" : "23"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U105", "Parent" : "23"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fexp_32ns_32ns_32_18_full_dsp_1_U106", "Parent" : "23"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_fexp_32ns_32ns_32_18_full_dsp_1_U107", "Parent" : "23"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.calc_U0.GapJunctionIP_mul_27ns_29ns_56_5_1_U108", "Parent" : "23"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.acc_U0", "Parent" : "0", "Child" : ["36", "37", "38", "39", "40"],
		"CDFG" : "acc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "33", "EstimateLatencyMax" : "50000025",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "23",
		"StartFifo" : "start_for_acc_U0_U",
		"Port" : [
			{"Name" : "simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "68",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "69",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowsToSimulate_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "78",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "79",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_V_data_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "74",
				"BlockSignal" : [
					{"Name" : "F_V_data_0_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_readCalcData_fu_159", "Port" : "F_V_data_0"}]},
			{"Name" : "F_V_data_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "75",
				"BlockSignal" : [
					{"Name" : "F_V_data_1_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_readCalcData_fu_159", "Port" : "F_V_data_1"}]},
			{"Name" : "F_V_data_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "76",
				"BlockSignal" : [
					{"Name" : "F_V_data_2_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_readCalcData_fu_159", "Port" : "F_V_data_2"}]},
			{"Name" : "F_V_data_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "77",
				"BlockSignal" : [
					{"Name" : "F_V_data_3_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_readCalcData_fu_159", "Port" : "F_V_data_3"}]},
			{"Name" : "V_V_data_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "70",
				"BlockSignal" : [
					{"Name" : "V_V_data_0_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_readCalcData_fu_159", "Port" : "V_V_data_0"}]},
			{"Name" : "V_V_data_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "71",
				"BlockSignal" : [
					{"Name" : "V_V_data_1_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_readCalcData_fu_159", "Port" : "V_V_data_1"}]},
			{"Name" : "V_V_data_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "72",
				"BlockSignal" : [
					{"Name" : "V_V_data_2_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_readCalcData_fu_159", "Port" : "V_V_data_2"}]},
			{"Name" : "V_V_data_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "23", "DependentChan" : "73",
				"BlockSignal" : [
					{"Name" : "V_V_data_3_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_readCalcData_fu_159", "Port" : "V_V_data_3"}]},
			{"Name" : "F_acc_V_data_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "80",
				"BlockSignal" : [
					{"Name" : "F_acc_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_acc_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "81",
				"BlockSignal" : [
					{"Name" : "F_acc_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_acc_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "82",
				"BlockSignal" : [
					{"Name" : "F_acc_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_acc_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "83",
				"BlockSignal" : [
					{"Name" : "F_acc_V_data_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_acc_V_data_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "84",
				"BlockSignal" : [
					{"Name" : "V_acc_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_acc_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "85",
				"BlockSignal" : [
					{"Name" : "V_acc_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_acc_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "86",
				"BlockSignal" : [
					{"Name" : "V_acc_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_acc_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "41", "DependentChan" : "87",
				"BlockSignal" : [
					{"Name" : "V_acc_V_data_3_blk_n", "Type" : "RtlSignal"}]}],
		"SubInstanceBlock" : [
			{"SubInstance" : "grp_readCalcData_fu_159", "SubBlockPort" : ["F_V_data_0_blk_n", "F_V_data_1_blk_n", "F_V_data_2_blk_n", "F_V_data_3_blk_n", "V_V_data_0_blk_n", "V_V_data_1_blk_n", "V_V_data_2_blk_n", "V_V_data_3_blk_n"]}]},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.acc_U0.grp_readCalcData_fu_159", "Parent" : "35",
		"CDFG" : "readCalcData",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "F_V_data_0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "F_V_data_0_blk_n", "Type" : "RtlPort"}]},
			{"Name" : "F_V_data_1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "F_V_data_1_blk_n", "Type" : "RtlPort"}]},
			{"Name" : "F_V_data_2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "F_V_data_2_blk_n", "Type" : "RtlPort"}]},
			{"Name" : "F_V_data_3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "F_V_data_3_blk_n", "Type" : "RtlPort"}]},
			{"Name" : "V_V_data_0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "V_V_data_0_blk_n", "Type" : "RtlPort"}]},
			{"Name" : "V_V_data_1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "V_V_data_1_blk_n", "Type" : "RtlPort"}]},
			{"Name" : "V_V_data_2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "V_V_data_2_blk_n", "Type" : "RtlPort"}]},
			{"Name" : "V_V_data_3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "V_V_data_3_blk_n", "Type" : "RtlPort"}]}]},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.acc_U0.GapJunctionIP_fadd_32ns_32ns_32_8_full_dsp_1_U139", "Parent" : "35"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.acc_U0.GapJunctionIP_fadd_32ns_32ns_32_8_full_dsp_1_U140", "Parent" : "35"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.acc_U0.GapJunctionIP_fadd_32ns_32ns_32_8_full_dsp_1_U141", "Parent" : "35"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.acc_U0.GapJunctionIP_mul_27ns_27ns_54_7_1_U142", "Parent" : "35"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.I_calc_U0", "Parent" : "0", "Child" : ["42", "43", "44", "51"],
		"CDFG" : "I_calc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "123", "EstimateLatencyMax" : "50265001",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "35",
		"StartFifo" : "start_for_I_calc_U0_U",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state24", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_getTotalCurrent_fu_363"}],
		"Port" : [
			{"Name" : "I_V_data", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_getTotalCurrent_fu_363", "Port" : "I_V_data"}]},
			{"Name" : "I_V_tlast_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_getTotalCurrent_fu_363", "Port" : "I_V_tlast_V"}]},
			{"Name" : "simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "78",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "79",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_acc_V_data_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "80",
				"BlockSignal" : [
					{"Name" : "F_acc_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_acc_V_data_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "81",
				"BlockSignal" : [
					{"Name" : "F_acc_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_acc_V_data_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "82",
				"BlockSignal" : [
					{"Name" : "F_acc_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_acc_V_data_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "83",
				"BlockSignal" : [
					{"Name" : "F_acc_V_data_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_acc_V_data_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "84",
				"BlockSignal" : [
					{"Name" : "V_acc_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_acc_V_data_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "85",
				"BlockSignal" : [
					{"Name" : "V_acc_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_acc_V_data_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "86",
				"BlockSignal" : [
					{"Name" : "V_acc_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_acc_V_data_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "87",
				"BlockSignal" : [
					{"Name" : "V_acc_V_data_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.F_temp_data_U", "Parent" : "41"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.V_temp_data_U", "Parent" : "41"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.grp_getTotalCurrent_fu_363", "Parent" : "41", "Child" : ["45", "46", "47", "48", "49", "50"],
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
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.grp_getTotalCurrent_fu_363.GapJunctionIP_fptrunc_64ns_32_2_1_U165", "Parent" : "44"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.grp_getTotalCurrent_fu_363.GapJunctionIP_fpext_32ns_64_1_1_U166", "Parent" : "44"},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.grp_getTotalCurrent_fu_363.GapJunctionIP_fpext_32ns_64_1_1_U167", "Parent" : "44"},
	{"ID" : "48", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.grp_getTotalCurrent_fu_363.GapJunctionIP_dadd_64ns_64ns_64_9_full_dsp_1_U168", "Parent" : "44"},
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.grp_getTotalCurrent_fu_363.GapJunctionIP_dmul_64ns_64ns_64_10_max_dsp_1_U169", "Parent" : "44"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.grp_getTotalCurrent_fu_363.GapJunctionIP_dmul_64ns_64ns_64_10_max_dsp_1_U170", "Parent" : "44"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.I_calc_U0.GapJunctionIP_fadd_32ns_32ns_32_8_full_dsp_1_U182", "Parent" : "41"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_rowBegin_V_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_rowEnd_V_c_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_rowsToSimu_4_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_BLOCK_NUMB_4_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_data_V_data_0_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_data_V_data_1_U", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_data_V_data_2_U", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_data_V_data_3_U", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_rowsToSimu_3_U", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_BLOCK_NUMB_3_U", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fixedData_V_data_U", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fixedData_V_tlast_V_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.processedData_V_data_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.processedData_V_data_1_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.processedData_V_data_2_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.processedData_V_data_3_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_rowsToSimu_2_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_BLOCK_NUMB_2_U", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_V_data_0_U", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_V_data_1_U", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_V_data_2_U", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_V_data_3_U", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.F_V_data_0_U", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.F_V_data_1_U", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.F_V_data_2_U", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.F_V_data_3_U", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_rowsToSimu_1_U", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_BLOCK_NUMB_1_U", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.F_acc_V_data_0_U", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.F_acc_V_data_1_U", "Parent" : "0"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.F_acc_V_data_2_U", "Parent" : "0"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.F_acc_V_data_3_U", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_acc_V_data_0_U", "Parent" : "0"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_acc_V_data_1_U", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_acc_V_data_2_U", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_acc_V_data_3_U", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_V_read_U0_U", "Parent" : "0"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_calc_U0_U", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_acc_U0_U", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_I_calc_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	execute {
		input_V_data {Type I LastRead 2 FirstWrite -1}
		output_V_data {Type O LastRead -1 FirstWrite 23}
		output_V_tlast_V {Type O LastRead -1 FirstWrite 23}
		simConfig_rowBegin_V_2 {Type I LastRead 0 FirstWrite -1}
		simConfig_rowEnd_V_r {Type I LastRead 0 FirstWrite -1}
		simConfig_rowsToSimu {Type I LastRead 0 FirstWrite -1}
		simConfig_BLOCK_NUMB {Type I LastRead 0 FirstWrite -1}
		size {Type I LastRead 0 FirstWrite -1}
		V_data_V_data_0 {Type IO LastRead -1 FirstWrite -1}
		V_data_V_data_1 {Type IO LastRead -1 FirstWrite -1}
		V_data_V_data_2 {Type IO LastRead -1 FirstWrite -1}
		V_data_V_data_3 {Type IO LastRead -1 FirstWrite -1}
		Vi_idx_V_data_V_0 {Type IO LastRead -1 FirstWrite -1}
		Vi_idx_V_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		Vi_idx_V_data_V_2 {Type IO LastRead -1 FirstWrite -1}
		Vi_idx_V_data_V_3 {Type IO LastRead -1 FirstWrite -1}
		Vj_idx_V_data_V_0 {Type IO LastRead -1 FirstWrite -1}
		Vj_idx_V_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		Vj_idx_V_data_V_2 {Type IO LastRead -1 FirstWrite -1}
		Vj_idx_V_data_V_3 {Type IO LastRead -1 FirstWrite -1}
		fixedData_V_data {Type IO LastRead -1 FirstWrite -1}
		fixedData_V_tlast_V {Type IO LastRead -1 FirstWrite -1}
		processedData_V_data {Type IO LastRead -1 FirstWrite -1}
		processedData_V_data_1 {Type IO LastRead -1 FirstWrite -1}
		processedData_V_data_2 {Type IO LastRead -1 FirstWrite -1}
		processedData_V_data_3 {Type IO LastRead -1 FirstWrite -1}
		V_V_data_0 {Type IO LastRead -1 FirstWrite -1}
		V_V_data_1 {Type IO LastRead -1 FirstWrite -1}
		V_V_data_2 {Type IO LastRead -1 FirstWrite -1}
		V_V_data_3 {Type IO LastRead -1 FirstWrite -1}
		F_V_data_0 {Type IO LastRead -1 FirstWrite -1}
		F_V_data_1 {Type IO LastRead -1 FirstWrite -1}
		F_V_data_2 {Type IO LastRead -1 FirstWrite -1}
		F_V_data_3 {Type IO LastRead -1 FirstWrite -1}
		F_acc_V_data_0 {Type IO LastRead -1 FirstWrite -1}
		F_acc_V_data_1 {Type IO LastRead -1 FirstWrite -1}
		F_acc_V_data_2 {Type IO LastRead -1 FirstWrite -1}
		F_acc_V_data_3 {Type IO LastRead -1 FirstWrite -1}
		V_acc_V_data_0 {Type IO LastRead -1 FirstWrite -1}
		V_acc_V_data_1 {Type IO LastRead -1 FirstWrite -1}
		V_acc_V_data_2 {Type IO LastRead -1 FirstWrite -1}
		V_acc_V_data_3 {Type IO LastRead -1 FirstWrite -1}}
	blockControl173 {
		input_V_data {Type I LastRead 2 FirstWrite -1}
		V_SIZE {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 1 FirstWrite -1}
		p_read1 {Type I LastRead 1 FirstWrite -1}
		p_read2 {Type I LastRead 1 FirstWrite -1}
		p_read3 {Type I LastRead 1 FirstWrite -1}
		simConfig_rowBegin_V_out {Type O LastRead -1 FirstWrite 1}
		simConfig_rowEnd_V_out {Type O LastRead -1 FirstWrite 1}
		simConfig_rowsToSimulate_V_out {Type O LastRead -1 FirstWrite 1}
		simConfig_BLOCK_NUMBERS_V_out {Type O LastRead -1 FirstWrite 1}
		V_data_V_data_0 {Type O LastRead -1 FirstWrite 2}
		V_data_V_data_1 {Type O LastRead -1 FirstWrite 2}
		V_data_V_data_2 {Type O LastRead -1 FirstWrite 2}
		V_data_V_data_3 {Type O LastRead -1 FirstWrite 2}}
	getVoltages {
		input_V_data {Type I LastRead 2 FirstWrite -1}
		V_SIZE {Type I LastRead 0 FirstWrite -1}
		V_data_V_data_0 {Type O LastRead -1 FirstWrite 2}
		V_data_V_data_1 {Type O LastRead -1 FirstWrite 2}
		V_data_V_data_2 {Type O LastRead -1 FirstWrite 2}
		V_data_V_data_3 {Type O LastRead -1 FirstWrite 2}}
	V_read {
		simConfig_rowBegin_V {Type I LastRead 0 FirstWrite -1}
		simConfig_rowEnd_V {Type I LastRead 0 FirstWrite -1}
		simConfig_rowsToSimulate_V {Type I LastRead 0 FirstWrite -1}
		simConfig_BLOCK_NUMBERS_V {Type I LastRead 0 FirstWrite -1}
		V_SIZE {Type I LastRead 1 FirstWrite -1}
		simConfig_rowsToSimulate_V_out {Type O LastRead -1 FirstWrite 0}
		simConfig_BLOCK_NUMBERS_V_out {Type O LastRead -1 FirstWrite 0}
		V_data_V_data_0 {Type I LastRead 1 FirstWrite -1}
		V_data_V_data_1 {Type I LastRead 1 FirstWrite -1}
		V_data_V_data_2 {Type I LastRead 1 FirstWrite -1}
		V_data_V_data_3 {Type I LastRead 1 FirstWrite -1}
		Vi_idx_V_data_V_0 {Type IO LastRead -1 FirstWrite -1}
		Vi_idx_V_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		Vi_idx_V_data_V_2 {Type IO LastRead -1 FirstWrite -1}
		Vi_idx_V_data_V_3 {Type IO LastRead -1 FirstWrite -1}
		Vj_idx_V_data_V_0 {Type IO LastRead -1 FirstWrite -1}
		Vj_idx_V_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		Vj_idx_V_data_V_2 {Type IO LastRead -1 FirstWrite -1}
		Vj_idx_V_data_V_3 {Type IO LastRead -1 FirstWrite -1}
		fixedData_V_data {Type O LastRead -1 FirstWrite 10}
		fixedData_V_tlast_V {Type O LastRead -1 FirstWrite 10}
		processedData_V_data {Type O LastRead -1 FirstWrite 10}
		processedData_V_data_1 {Type O LastRead -1 FirstWrite 10}
		processedData_V_data_2 {Type O LastRead -1 FirstWrite 10}
		processedData_V_data_3 {Type O LastRead -1 FirstWrite 10}}
	V_read_entry169179 {
		scalar_simConfig_BLOCK_NUMBERS_V {Type I LastRead 0 FirstWrite -1}
		simConfig_BLOCK_NUMBERS_V_out {Type O LastRead -1 FirstWrite 0}
		scalar_simConfig_rowsToSimulate_V {Type I LastRead 0 FirstWrite -1}
		simConfig_rowsToSimulate_V_out {Type O LastRead -1 FirstWrite 0}
		simConfig_rowBegin_V {Type I LastRead 0 FirstWrite -1}
		simConfig_rowEnd_V {Type I LastRead 0 FirstWrite -1}
		simConfig_rowBegin_V_c_i {Type O LastRead -1 FirstWrite 0}
		simConfig_rowEnd_V_c_i {Type O LastRead -1 FirstWrite 0}
		simConfig_rowsToSimulate_V_c_i {Type O LastRead -1 FirstWrite 0}
		simConfig_BLOCK_NUMBERS_V_c_i {Type O LastRead -1 FirstWrite 0}
		simConfig_BLOCK_NUMBERS_V_c1_i {Type O LastRead -1 FirstWrite 0}}
	readVoltages {
		voltagesBackup {Type O LastRead -1 FirstWrite 2}
		V_SIZE {Type I LastRead 0 FirstWrite -1}
		V_data_V_data_0 {Type I LastRead 1 FirstWrite -1}
		V_data_V_data_1 {Type I LastRead 1 FirstWrite -1}
		V_data_V_data_2 {Type I LastRead 1 FirstWrite -1}
		V_data_V_data_3 {Type I LastRead 1 FirstWrite -1}}
	indexGeneration {
		simConfig_rowBegin_V {Type I LastRead 0 FirstWrite -1}
		simConfig_rowEnd_V {Type I LastRead 0 FirstWrite -1}
		simConfig_BLOCK_NUMBERS_V {Type I LastRead 0 FirstWrite -1}
		Vi_idx_V_data_V_0 {Type O LastRead -1 FirstWrite 1}
		Vi_idx_V_data_V_1 {Type O LastRead -1 FirstWrite 1}
		Vi_idx_V_data_V_2 {Type O LastRead -1 FirstWrite 1}
		Vi_idx_V_data_V_3 {Type O LastRead -1 FirstWrite 1}
		Vj_idx_V_data_V_0 {Type O LastRead -1 FirstWrite 2}
		Vj_idx_V_data_V_1 {Type O LastRead -1 FirstWrite 2}
		Vj_idx_V_data_V_2 {Type O LastRead -1 FirstWrite 2}
		Vj_idx_V_data_V_3 {Type O LastRead -1 FirstWrite 2}}
	writeV2calc {
		voltagesBackup {Type I LastRead 9 FirstWrite -1}
		simConfig_rowsToSimulate_V {Type I LastRead 0 FirstWrite -1}
		simConfig_BLOCK_NUMBERS_V {Type I LastRead 0 FirstWrite -1}
		Vi_idx_V_data_V_0 {Type I LastRead 1 FirstWrite -1}
		Vi_idx_V_data_V_1 {Type I LastRead 1 FirstWrite -1}
		Vi_idx_V_data_V_2 {Type I LastRead 1 FirstWrite -1}
		Vi_idx_V_data_V_3 {Type I LastRead 1 FirstWrite -1}
		fixedData_V_data {Type O LastRead -1 FirstWrite 10}
		fixedData_V_tlast_V {Type O LastRead -1 FirstWrite 10}
		Vj_idx_V_data_V_0 {Type I LastRead 6 FirstWrite -1}
		Vj_idx_V_data_V_1 {Type I LastRead 6 FirstWrite -1}
		Vj_idx_V_data_V_2 {Type I LastRead 6 FirstWrite -1}
		Vj_idx_V_data_V_3 {Type I LastRead 6 FirstWrite -1}
		processedData_V_data {Type O LastRead -1 FirstWrite 10}
		processedData_V_data_1 {Type O LastRead -1 FirstWrite 10}
		processedData_V_data_2 {Type O LastRead -1 FirstWrite 10}
		processedData_V_data_3 {Type O LastRead -1 FirstWrite 10}}
	calc {
		simConfig_rowsToSimulate_V {Type I LastRead 0 FirstWrite -1}
		simConfig_BLOCK_NUMBERS_V {Type I LastRead 0 FirstWrite -1}
		simConfig_rowsToSimulate_V_out {Type O LastRead -1 FirstWrite 0}
		simConfig_BLOCK_NUMBERS_V_out {Type O LastRead -1 FirstWrite 0}
		processedData_V_data {Type I LastRead 7 FirstWrite -1}
		processedData_V_data_1 {Type I LastRead 7 FirstWrite -1}
		processedData_V_data_2 {Type I LastRead 7 FirstWrite -1}
		processedData_V_data_3 {Type I LastRead 7 FirstWrite -1}
		fixedData_V_data {Type I LastRead 7 FirstWrite -1}
		fixedData_V_tlast_V {Type I LastRead 7 FirstWrite -1}
		V_V_data_0 {Type O LastRead -1 FirstWrite 50}
		V_V_data_1 {Type O LastRead -1 FirstWrite 50}
		V_V_data_2 {Type O LastRead -1 FirstWrite 50}
		V_V_data_3 {Type O LastRead -1 FirstWrite 50}
		F_V_data_0 {Type O LastRead -1 FirstWrite 50}
		F_V_data_1 {Type O LastRead -1 FirstWrite 50}
		F_V_data_2 {Type O LastRead -1 FirstWrite 50}
		F_V_data_3 {Type O LastRead -1 FirstWrite 50}}
	acc {
		simConfig_rowsToSimulate_V {Type I LastRead 0 FirstWrite -1}
		simConfig_BLOCK_NUMBERS_V {Type I LastRead 0 FirstWrite -1}
		simConfig_rowsToSimulate_V_out {Type O LastRead -1 FirstWrite 0}
		simConfig_BLOCK_NUMBERS_V_out {Type O LastRead -1 FirstWrite 0}
		F_V_data_0 {Type I LastRead 0 FirstWrite -1}
		F_V_data_1 {Type I LastRead 0 FirstWrite -1}
		F_V_data_2 {Type I LastRead 0 FirstWrite -1}
		F_V_data_3 {Type I LastRead 0 FirstWrite -1}
		V_V_data_0 {Type I LastRead 0 FirstWrite -1}
		V_V_data_1 {Type I LastRead 0 FirstWrite -1}
		V_V_data_2 {Type I LastRead 0 FirstWrite -1}
		V_V_data_3 {Type I LastRead 0 FirstWrite -1}
		F_acc_V_data_0 {Type O LastRead -1 FirstWrite 32}
		F_acc_V_data_1 {Type O LastRead -1 FirstWrite 32}
		F_acc_V_data_2 {Type O LastRead -1 FirstWrite 32}
		F_acc_V_data_3 {Type O LastRead -1 FirstWrite 32}
		V_acc_V_data_0 {Type O LastRead -1 FirstWrite 32}
		V_acc_V_data_1 {Type O LastRead -1 FirstWrite 32}
		V_acc_V_data_2 {Type O LastRead -1 FirstWrite 32}
		V_acc_V_data_3 {Type O LastRead -1 FirstWrite 32}}
	readCalcData {
		F_V_data_0 {Type I LastRead 0 FirstWrite -1}
		F_V_data_1 {Type I LastRead 0 FirstWrite -1}
		F_V_data_2 {Type I LastRead 0 FirstWrite -1}
		F_V_data_3 {Type I LastRead 0 FirstWrite -1}
		V_V_data_0 {Type I LastRead 0 FirstWrite -1}
		V_V_data_1 {Type I LastRead 0 FirstWrite -1}
		V_V_data_2 {Type I LastRead 0 FirstWrite -1}
		V_V_data_3 {Type I LastRead 0 FirstWrite -1}}
	I_calc {
		I_V_data {Type O LastRead -1 FirstWrite 23}
		I_V_tlast_V {Type O LastRead -1 FirstWrite 23}
		simConfig_rowsToSimulate_V {Type I LastRead 0 FirstWrite -1}
		simConfig_BLOCK_NUMBERS_V {Type I LastRead 0 FirstWrite -1}
		F_acc_V_data_0 {Type I LastRead 4 FirstWrite -1}
		F_acc_V_data_1 {Type I LastRead 4 FirstWrite -1}
		F_acc_V_data_2 {Type I LastRead 4 FirstWrite -1}
		F_acc_V_data_3 {Type I LastRead 4 FirstWrite -1}
		V_acc_V_data_0 {Type I LastRead 4 FirstWrite -1}
		V_acc_V_data_1 {Type I LastRead 4 FirstWrite -1}
		V_acc_V_data_2 {Type I LastRead 4 FirstWrite -1}
		V_acc_V_data_3 {Type I LastRead 4 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "204", "Max" : "50265082"}
	, {"Name" : "Interval", "Min" : "124", "Max" : "50265002"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_V_data { axis {  { input_V_data_TDATA in_data 0 64 }  { input_V_data_TVALID in_vld 0 1 }  { input_V_data_TREADY in_acc 1 1 } } }
	output_V_data { axis {  { output_r_TDATA out_data 1 32 } } }
	output_V_tlast_V { axis {  { output_r_TLAST out_data 1 1 }  { output_r_TVALID out_vld 1 1 }  { output_r_TREADY out_acc 0 1 } } }
	simConfig_rowBegin_V_2 { ap_stable {  { simConfig_rowBegin_V_2 in_data 0 27 }  { simConfig_rowBegin_V_2_ap_vld in_vld 0 1 } } }
	simConfig_rowEnd_V_r { ap_stable {  { simConfig_rowEnd_V_r in_data 0 27 }  { simConfig_rowEnd_V_r_ap_vld in_vld 0 1 } } }
	simConfig_rowsToSimu { ap_stable {  { simConfig_rowsToSimu in_data 0 27 }  { simConfig_rowsToSimu_ap_vld in_vld 0 1 } } }
	simConfig_BLOCK_NUMB { ap_stable {  { simConfig_BLOCK_NUMB in_data 0 27 }  { simConfig_BLOCK_NUMB_ap_vld in_vld 0 1 } } }
	size { ap_stable {  { size in_data 0 32 }  { size_ap_vld in_vld 0 1 } } }
}
