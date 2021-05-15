set moduleName V_read
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
set C_modelName {V_read}
set C_modelType { void 0 }
set C_modelArgList {
	{ simConfig_rowBegin_V int 27 regular {fifo 0}  }
	{ simConfig_rowEnd_V int 27 regular {fifo 0}  }
	{ simConfig_rowsToSimulate_V int 27 regular {fifo 0}  }
	{ simConfig_BLOCK_NUMBERS_V int 27 regular {fifo 0}  }
	{ V_SIZE int 32 regular {ap_stable 0} }
	{ simConfig_rowsToSimulate_V_out int 27 regular {fifo 1}  }
	{ simConfig_BLOCK_NUMBERS_V_out int 27 regular {fifo 1}  }
	{ V_data_V_data_0 float 32 regular {fifo 0 volatile } {global 0}  }
	{ V_data_V_data_1 float 32 regular {fifo 0 volatile } {global 0}  }
	{ V_data_V_data_2 float 32 regular {fifo 0 volatile } {global 0}  }
	{ V_data_V_data_3 float 32 regular {fifo 0 volatile } {global 0}  }
	{ fixedData_V_data float 32 regular {fifo 1 volatile } {global 1}  }
	{ fixedData_V_tlast_V int 1 regular {fifo 1 volatile } {global 1}  }
	{ processedData_V_data float 32 regular {fifo 1 volatile } {global 1}  }
	{ processedData_V_data_1 float 32 regular {fifo 1 volatile } {global 1}  }
	{ processedData_V_data_2 float 32 regular {fifo 1 volatile } {global 1}  }
	{ processedData_V_data_3 float 32 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "simConfig_rowBegin_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowEnd_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowsToSimulate_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_BLOCK_NUMBERS_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "V_SIZE", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowsToSimulate_V_out", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "simConfig_BLOCK_NUMBERS_V_out", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "V_data_V_data_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "V_data_V_data_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "V_data_V_data_2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "V_data_V_data_3", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fixedData_V_data", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "fixedData_V_tlast_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "processedData_V_data", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "processedData_V_data_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "processedData_V_data_2", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "processedData_V_data_3", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 60
set portList { 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ simConfig_rowBegin_V_dout sc_in sc_lv 27 signal 0 } 
	{ simConfig_rowBegin_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ simConfig_rowBegin_V_read sc_out sc_logic 1 signal 0 } 
	{ simConfig_rowEnd_V_dout sc_in sc_lv 27 signal 1 } 
	{ simConfig_rowEnd_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ simConfig_rowEnd_V_read sc_out sc_logic 1 signal 1 } 
	{ simConfig_rowsToSimulate_V_dout sc_in sc_lv 27 signal 2 } 
	{ simConfig_rowsToSimulate_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ simConfig_rowsToSimulate_V_read sc_out sc_logic 1 signal 2 } 
	{ simConfig_BLOCK_NUMBERS_V_dout sc_in sc_lv 27 signal 3 } 
	{ simConfig_BLOCK_NUMBERS_V_empty_n sc_in sc_logic 1 signal 3 } 
	{ simConfig_BLOCK_NUMBERS_V_read sc_out sc_logic 1 signal 3 } 
	{ V_SIZE sc_in sc_lv 32 signal 4 } 
	{ simConfig_rowsToSimulate_V_out_din sc_out sc_lv 27 signal 5 } 
	{ simConfig_rowsToSimulate_V_out_full_n sc_in sc_logic 1 signal 5 } 
	{ simConfig_rowsToSimulate_V_out_write sc_out sc_logic 1 signal 5 } 
	{ simConfig_BLOCK_NUMBERS_V_out_din sc_out sc_lv 27 signal 6 } 
	{ simConfig_BLOCK_NUMBERS_V_out_full_n sc_in sc_logic 1 signal 6 } 
	{ simConfig_BLOCK_NUMBERS_V_out_write sc_out sc_logic 1 signal 6 } 
	{ V_data_V_data_0_dout sc_in sc_lv 32 signal 7 } 
	{ V_data_V_data_0_empty_n sc_in sc_logic 1 signal 7 } 
	{ V_data_V_data_0_read sc_out sc_logic 1 signal 7 } 
	{ V_data_V_data_1_dout sc_in sc_lv 32 signal 8 } 
	{ V_data_V_data_1_empty_n sc_in sc_logic 1 signal 8 } 
	{ V_data_V_data_1_read sc_out sc_logic 1 signal 8 } 
	{ V_data_V_data_2_dout sc_in sc_lv 32 signal 9 } 
	{ V_data_V_data_2_empty_n sc_in sc_logic 1 signal 9 } 
	{ V_data_V_data_2_read sc_out sc_logic 1 signal 9 } 
	{ V_data_V_data_3_dout sc_in sc_lv 32 signal 10 } 
	{ V_data_V_data_3_empty_n sc_in sc_logic 1 signal 10 } 
	{ V_data_V_data_3_read sc_out sc_logic 1 signal 10 } 
	{ fixedData_V_data_din sc_out sc_lv 32 signal 11 } 
	{ fixedData_V_data_full_n sc_in sc_logic 1 signal 11 } 
	{ fixedData_V_data_write sc_out sc_logic 1 signal 11 } 
	{ fixedData_V_tlast_V_din sc_out sc_lv 1 signal 12 } 
	{ fixedData_V_tlast_V_full_n sc_in sc_logic 1 signal 12 } 
	{ fixedData_V_tlast_V_write sc_out sc_logic 1 signal 12 } 
	{ processedData_V_data_din sc_out sc_lv 32 signal 13 } 
	{ processedData_V_data_full_n sc_in sc_logic 1 signal 13 } 
	{ processedData_V_data_write sc_out sc_logic 1 signal 13 } 
	{ processedData_V_data_1_din sc_out sc_lv 32 signal 14 } 
	{ processedData_V_data_1_full_n sc_in sc_logic 1 signal 14 } 
	{ processedData_V_data_1_write sc_out sc_logic 1 signal 14 } 
	{ processedData_V_data_2_din sc_out sc_lv 32 signal 15 } 
	{ processedData_V_data_2_full_n sc_in sc_logic 1 signal 15 } 
	{ processedData_V_data_2_write sc_out sc_logic 1 signal 15 } 
	{ processedData_V_data_3_din sc_out sc_lv 32 signal 16 } 
	{ processedData_V_data_3_full_n sc_in sc_logic 1 signal 16 } 
	{ processedData_V_data_3_write sc_out sc_logic 1 signal 16 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ V_SIZE_ap_vld sc_in sc_logic 1 invld 4 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "simConfig_rowBegin_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V", "role": "dout" }} , 
 	{ "name": "simConfig_rowBegin_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V", "role": "empty_n" }} , 
 	{ "name": "simConfig_rowBegin_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V", "role": "read" }} , 
 	{ "name": "simConfig_rowEnd_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V", "role": "dout" }} , 
 	{ "name": "simConfig_rowEnd_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V", "role": "empty_n" }} , 
 	{ "name": "simConfig_rowEnd_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V", "role": "read" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V", "role": "dout" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V", "role": "empty_n" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V", "role": "read" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V", "role": "dout" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V", "role": "empty_n" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V", "role": "read" }} , 
 	{ "name": "V_SIZE", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_SIZE", "role": "default" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_out", "role": "din" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_out", "role": "full_n" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_out", "role": "write" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_out", "role": "din" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_out", "role": "full_n" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_out", "role": "write" }} , 
 	{ "name": "V_data_V_data_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_data_V_data_0", "role": "dout" }} , 
 	{ "name": "V_data_V_data_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_data_V_data_0", "role": "empty_n" }} , 
 	{ "name": "V_data_V_data_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_data_V_data_0", "role": "read" }} , 
 	{ "name": "V_data_V_data_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_data_V_data_1", "role": "dout" }} , 
 	{ "name": "V_data_V_data_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_data_V_data_1", "role": "empty_n" }} , 
 	{ "name": "V_data_V_data_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_data_V_data_1", "role": "read" }} , 
 	{ "name": "V_data_V_data_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_data_V_data_2", "role": "dout" }} , 
 	{ "name": "V_data_V_data_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_data_V_data_2", "role": "empty_n" }} , 
 	{ "name": "V_data_V_data_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_data_V_data_2", "role": "read" }} , 
 	{ "name": "V_data_V_data_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_data_V_data_3", "role": "dout" }} , 
 	{ "name": "V_data_V_data_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_data_V_data_3", "role": "empty_n" }} , 
 	{ "name": "V_data_V_data_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_data_V_data_3", "role": "read" }} , 
 	{ "name": "fixedData_V_data_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fixedData_V_data", "role": "din" }} , 
 	{ "name": "fixedData_V_data_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_data", "role": "full_n" }} , 
 	{ "name": "fixedData_V_data_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_data", "role": "write" }} , 
 	{ "name": "fixedData_V_tlast_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_tlast_V", "role": "din" }} , 
 	{ "name": "fixedData_V_tlast_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_tlast_V", "role": "full_n" }} , 
 	{ "name": "fixedData_V_tlast_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_tlast_V", "role": "write" }} , 
 	{ "name": "processedData_V_data_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "processedData_V_data", "role": "din" }} , 
 	{ "name": "processedData_V_data_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data", "role": "full_n" }} , 
 	{ "name": "processedData_V_data_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data", "role": "write" }} , 
 	{ "name": "processedData_V_data_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "processedData_V_data_1", "role": "din" }} , 
 	{ "name": "processedData_V_data_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_1", "role": "full_n" }} , 
 	{ "name": "processedData_V_data_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_1", "role": "write" }} , 
 	{ "name": "processedData_V_data_2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "processedData_V_data_2", "role": "din" }} , 
 	{ "name": "processedData_V_data_2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_2", "role": "full_n" }} , 
 	{ "name": "processedData_V_data_2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_2", "role": "write" }} , 
 	{ "name": "processedData_V_data_3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "processedData_V_data_3", "role": "din" }} , 
 	{ "name": "processedData_V_data_3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_3", "role": "full_n" }} , 
 	{ "name": "processedData_V_data_3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_3", "role": "write" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "V_SIZE_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "V_SIZE", "role": "ap_vld" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"],
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
		"InputProcess" : [
			{"ID" : "2", "Name" : "V_read_entry169179_U0", "ReadyCount" : "V_read_entry169179_U0_ap_ready_count"},
			{"ID" : "3", "Name" : "readVoltages_U0", "ReadyCount" : "readVoltages_U0_ap_ready_count"}],
		"OutputProcess" : [
			{"ID" : "2", "Name" : "V_read_entry169179_U0"},
			{"ID" : "5", "Name" : "writeV2calc_U0"}],
		"Port" : [
			{"Name" : "simConfig_rowBegin_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "V_read_entry169179_U0", "Port" : "simConfig_rowBegin_V"}]},
			{"Name" : "simConfig_rowEnd_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "V_read_entry169179_U0", "Port" : "simConfig_rowEnd_V"}]},
			{"Name" : "simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "V_read_entry169179_U0", "Port" : "scalar_simConfig_rowsToSimulate_V"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "V_read_entry169179_U0", "Port" : "scalar_simConfig_BLOCK_NUMBERS_V"}]},
			{"Name" : "V_SIZE", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "simConfig_rowsToSimulate_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "V_read_entry169179_U0", "Port" : "simConfig_rowsToSimulate_V_out"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "V_read_entry169179_U0", "Port" : "simConfig_BLOCK_NUMBERS_V_out"}]},
			{"Name" : "V_data_V_data_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "readVoltages_U0", "Port" : "V_data_V_data_0"}]},
			{"Name" : "V_data_V_data_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "readVoltages_U0", "Port" : "V_data_V_data_1"}]},
			{"Name" : "V_data_V_data_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "readVoltages_U0", "Port" : "V_data_V_data_2"}]},
			{"Name" : "V_data_V_data_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "readVoltages_U0", "Port" : "V_data_V_data_3"}]},
			{"Name" : "Vi_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "Vi_idx_V_data_V_0"},
					{"ID" : "4", "SubInstance" : "indexGeneration_U0", "Port" : "Vi_idx_V_data_V_0"}]},
			{"Name" : "Vi_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "Vi_idx_V_data_V_1"},
					{"ID" : "4", "SubInstance" : "indexGeneration_U0", "Port" : "Vi_idx_V_data_V_1"}]},
			{"Name" : "Vi_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "Vi_idx_V_data_V_2"},
					{"ID" : "4", "SubInstance" : "indexGeneration_U0", "Port" : "Vi_idx_V_data_V_2"}]},
			{"Name" : "Vi_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "Vi_idx_V_data_V_3"},
					{"ID" : "4", "SubInstance" : "indexGeneration_U0", "Port" : "Vi_idx_V_data_V_3"}]},
			{"Name" : "Vj_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "Vj_idx_V_data_V_0"},
					{"ID" : "4", "SubInstance" : "indexGeneration_U0", "Port" : "Vj_idx_V_data_V_0"}]},
			{"Name" : "Vj_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "Vj_idx_V_data_V_1"},
					{"ID" : "4", "SubInstance" : "indexGeneration_U0", "Port" : "Vj_idx_V_data_V_1"}]},
			{"Name" : "Vj_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "Vj_idx_V_data_V_2"},
					{"ID" : "4", "SubInstance" : "indexGeneration_U0", "Port" : "Vj_idx_V_data_V_2"}]},
			{"Name" : "Vj_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "Vj_idx_V_data_V_3"},
					{"ID" : "4", "SubInstance" : "indexGeneration_U0", "Port" : "Vj_idx_V_data_V_3"}]},
			{"Name" : "fixedData_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "fixedData_V_data"}]},
			{"Name" : "fixedData_V_tlast_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "fixedData_V_tlast_V"}]},
			{"Name" : "processedData_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "processedData_V_data"}]},
			{"Name" : "processedData_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "processedData_V_data_1"}]},
			{"Name" : "processedData_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "processedData_V_data_2"}]},
			{"Name" : "processedData_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "writeV2calc_U0", "Port" : "processedData_V_data_3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.voltagesBackup_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_read_entry169179_U0", "Parent" : "0",
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
			{"Name" : "scalar_simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "scalar_simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scalar_simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "scalar_simConfig_rowsToSimulate_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowsToSimulate_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowBegin_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_rowBegin_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowEnd_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_rowEnd_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowBegin_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "6",
				"BlockSignal" : [
					{"Name" : "simConfig_rowBegin_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowEnd_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "7",
				"BlockSignal" : [
					{"Name" : "simConfig_rowEnd_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowsToSimulate_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "8",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "9",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_c1_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "10",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_c1_i_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.readVoltages_U0", "Parent" : "0",
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
			{"Name" : "voltagesBackup", "Type" : "Memory", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "1"},
			{"Name" : "V_SIZE", "Type" : "Stable", "Direction" : "I"},
			{"Name" : "V_data_V_data_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_data_V_data_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "V_data_V_data_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.indexGeneration_U0", "Parent" : "0",
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
		"StartSource" : "2",
		"StartFifo" : "start_for_indexGeneration_U0_U",
		"Port" : [
			{"Name" : "simConfig_rowBegin_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "6",
				"BlockSignal" : [
					{"Name" : "simConfig_rowBegin_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowEnd_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "7",
				"BlockSignal" : [
					{"Name" : "simConfig_rowEnd_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "9",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "11",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "12",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "13",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "14",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "15",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "16",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "17",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "18",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.writeV2calc_U0", "Parent" : "0",
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
			{"Name" : "voltagesBackup", "Type" : "Memory", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "1"},
			{"Name" : "simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "8",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "10",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "11",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "12",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "13",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vi_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "14",
				"BlockSignal" : [
					{"Name" : "Vi_idx_V_data_V_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fixedData_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "fixedData_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fixedData_V_tlast_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "fixedData_V_tlast_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "15",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "16",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "17",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Vj_idx_V_data_V_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "18",
				"BlockSignal" : [
					{"Name" : "Vj_idx_V_data_V_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_rowBegin_V_2_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_rowEnd_V_c_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_rowsToSimu_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_BLOCK_NUMB_5_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.simConfig_BLOCK_NUMB_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vi_idx_V_data_V_0_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vi_idx_V_data_V_1_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vi_idx_V_data_V_2_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vi_idx_V_data_V_3_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vj_idx_V_data_V_0_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vj_idx_V_data_V_1_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vj_idx_V_data_V_2_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Vj_idx_V_data_V_3_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_indexGeneration_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		processedData_V_data_3 {Type O LastRead -1 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "25012497"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "25004996"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	simConfig_rowBegin_V { ap_fifo {  { simConfig_rowBegin_V_dout fifo_data 0 27 }  { simConfig_rowBegin_V_empty_n fifo_status 0 1 }  { simConfig_rowBegin_V_read fifo_update 1 1 } } }
	simConfig_rowEnd_V { ap_fifo {  { simConfig_rowEnd_V_dout fifo_data 0 27 }  { simConfig_rowEnd_V_empty_n fifo_status 0 1 }  { simConfig_rowEnd_V_read fifo_update 1 1 } } }
	simConfig_rowsToSimulate_V { ap_fifo {  { simConfig_rowsToSimulate_V_dout fifo_data 0 27 }  { simConfig_rowsToSimulate_V_empty_n fifo_status 0 1 }  { simConfig_rowsToSimulate_V_read fifo_update 1 1 } } }
	simConfig_BLOCK_NUMBERS_V { ap_fifo {  { simConfig_BLOCK_NUMBERS_V_dout fifo_data 0 27 }  { simConfig_BLOCK_NUMBERS_V_empty_n fifo_status 0 1 }  { simConfig_BLOCK_NUMBERS_V_read fifo_update 1 1 } } }
	V_SIZE { ap_stable {  { V_SIZE in_data 0 32 }  { V_SIZE_ap_vld in_vld 0 1 } } }
	simConfig_rowsToSimulate_V_out { ap_fifo {  { simConfig_rowsToSimulate_V_out_din fifo_data 1 27 }  { simConfig_rowsToSimulate_V_out_full_n fifo_status 0 1 }  { simConfig_rowsToSimulate_V_out_write fifo_update 1 1 } } }
	simConfig_BLOCK_NUMBERS_V_out { ap_fifo {  { simConfig_BLOCK_NUMBERS_V_out_din fifo_data 1 27 }  { simConfig_BLOCK_NUMBERS_V_out_full_n fifo_status 0 1 }  { simConfig_BLOCK_NUMBERS_V_out_write fifo_update 1 1 } } }
	V_data_V_data_0 { ap_fifo {  { V_data_V_data_0_dout fifo_data 0 32 }  { V_data_V_data_0_empty_n fifo_status 0 1 }  { V_data_V_data_0_read fifo_update 1 1 } } }
	V_data_V_data_1 { ap_fifo {  { V_data_V_data_1_dout fifo_data 0 32 }  { V_data_V_data_1_empty_n fifo_status 0 1 }  { V_data_V_data_1_read fifo_update 1 1 } } }
	V_data_V_data_2 { ap_fifo {  { V_data_V_data_2_dout fifo_data 0 32 }  { V_data_V_data_2_empty_n fifo_status 0 1 }  { V_data_V_data_2_read fifo_update 1 1 } } }
	V_data_V_data_3 { ap_fifo {  { V_data_V_data_3_dout fifo_data 0 32 }  { V_data_V_data_3_empty_n fifo_status 0 1 }  { V_data_V_data_3_read fifo_update 1 1 } } }
	fixedData_V_data { ap_fifo {  { fixedData_V_data_din fifo_data 1 32 }  { fixedData_V_data_full_n fifo_status 0 1 }  { fixedData_V_data_write fifo_update 1 1 } } }
	fixedData_V_tlast_V { ap_fifo {  { fixedData_V_tlast_V_din fifo_data 1 1 }  { fixedData_V_tlast_V_full_n fifo_status 0 1 }  { fixedData_V_tlast_V_write fifo_update 1 1 } } }
	processedData_V_data { ap_fifo {  { processedData_V_data_din fifo_data 1 32 }  { processedData_V_data_full_n fifo_status 0 1 }  { processedData_V_data_write fifo_update 1 1 } } }
	processedData_V_data_1 { ap_fifo {  { processedData_V_data_1_din fifo_data 1 32 }  { processedData_V_data_1_full_n fifo_status 0 1 }  { processedData_V_data_1_write fifo_update 1 1 } } }
	processedData_V_data_2 { ap_fifo {  { processedData_V_data_2_din fifo_data 1 32 }  { processedData_V_data_2_full_n fifo_status 0 1 }  { processedData_V_data_2_write fifo_update 1 1 } } }
	processedData_V_data_3 { ap_fifo {  { processedData_V_data_3_din fifo_data 1 32 }  { processedData_V_data_3_full_n fifo_status 0 1 }  { processedData_V_data_3_write fifo_update 1 1 } } }
}
