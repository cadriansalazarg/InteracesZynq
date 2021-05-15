set moduleName V_read_entry169179
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {V_read.entry169179}
set C_modelType { void 0 }
set C_modelArgList {
	{ scalar_simConfig_BLOCK_NUMBERS_V int 27 regular {fifo 0}  }
	{ simConfig_BLOCK_NUMBERS_V_out int 27 regular {fifo 1}  }
	{ scalar_simConfig_rowsToSimulate_V int 27 regular {fifo 0}  }
	{ simConfig_rowsToSimulate_V_out int 27 regular {fifo 1}  }
	{ simConfig_rowBegin_V int 27 regular {fifo 0}  }
	{ simConfig_rowEnd_V int 27 regular {fifo 0}  }
	{ simConfig_rowBegin_V_c_i int 27 regular {fifo 1}  }
	{ simConfig_rowEnd_V_c_i int 27 regular {fifo 1}  }
	{ simConfig_rowsToSimulate_V_c_i int 27 regular {fifo 1}  }
	{ simConfig_BLOCK_NUMBERS_V_c_i int 27 regular {fifo 1}  }
	{ simConfig_BLOCK_NUMBERS_V_c1_i int 27 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "scalar_simConfig_BLOCK_NUMBERS_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_BLOCK_NUMBERS_V_out", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scalar_simConfig_rowsToSimulate_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowsToSimulate_V_out", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "simConfig_rowBegin_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowEnd_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowBegin_V_c_i", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "simConfig_rowEnd_V_c_i", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "simConfig_rowsToSimulate_V_c_i", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "simConfig_BLOCK_NUMBERS_V_c_i", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "simConfig_BLOCK_NUMBERS_V_c1_i", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 43
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ scalar_simConfig_BLOCK_NUMBERS_V_dout sc_in sc_lv 27 signal 0 } 
	{ scalar_simConfig_BLOCK_NUMBERS_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ scalar_simConfig_BLOCK_NUMBERS_V_read sc_out sc_logic 1 signal 0 } 
	{ simConfig_BLOCK_NUMBERS_V_out_din sc_out sc_lv 27 signal 1 } 
	{ simConfig_BLOCK_NUMBERS_V_out_full_n sc_in sc_logic 1 signal 1 } 
	{ simConfig_BLOCK_NUMBERS_V_out_write sc_out sc_logic 1 signal 1 } 
	{ scalar_simConfig_rowsToSimulate_V_dout sc_in sc_lv 27 signal 2 } 
	{ scalar_simConfig_rowsToSimulate_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ scalar_simConfig_rowsToSimulate_V_read sc_out sc_logic 1 signal 2 } 
	{ simConfig_rowsToSimulate_V_out_din sc_out sc_lv 27 signal 3 } 
	{ simConfig_rowsToSimulate_V_out_full_n sc_in sc_logic 1 signal 3 } 
	{ simConfig_rowsToSimulate_V_out_write sc_out sc_logic 1 signal 3 } 
	{ simConfig_rowBegin_V_dout sc_in sc_lv 27 signal 4 } 
	{ simConfig_rowBegin_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ simConfig_rowBegin_V_read sc_out sc_logic 1 signal 4 } 
	{ simConfig_rowEnd_V_dout sc_in sc_lv 27 signal 5 } 
	{ simConfig_rowEnd_V_empty_n sc_in sc_logic 1 signal 5 } 
	{ simConfig_rowEnd_V_read sc_out sc_logic 1 signal 5 } 
	{ simConfig_rowBegin_V_c_i_din sc_out sc_lv 27 signal 6 } 
	{ simConfig_rowBegin_V_c_i_full_n sc_in sc_logic 1 signal 6 } 
	{ simConfig_rowBegin_V_c_i_write sc_out sc_logic 1 signal 6 } 
	{ simConfig_rowEnd_V_c_i_din sc_out sc_lv 27 signal 7 } 
	{ simConfig_rowEnd_V_c_i_full_n sc_in sc_logic 1 signal 7 } 
	{ simConfig_rowEnd_V_c_i_write sc_out sc_logic 1 signal 7 } 
	{ simConfig_rowsToSimulate_V_c_i_din sc_out sc_lv 27 signal 8 } 
	{ simConfig_rowsToSimulate_V_c_i_full_n sc_in sc_logic 1 signal 8 } 
	{ simConfig_rowsToSimulate_V_c_i_write sc_out sc_logic 1 signal 8 } 
	{ simConfig_BLOCK_NUMBERS_V_c_i_din sc_out sc_lv 27 signal 9 } 
	{ simConfig_BLOCK_NUMBERS_V_c_i_full_n sc_in sc_logic 1 signal 9 } 
	{ simConfig_BLOCK_NUMBERS_V_c_i_write sc_out sc_logic 1 signal 9 } 
	{ simConfig_BLOCK_NUMBERS_V_c1_i_din sc_out sc_lv 27 signal 10 } 
	{ simConfig_BLOCK_NUMBERS_V_c1_i_full_n sc_in sc_logic 1 signal 10 } 
	{ simConfig_BLOCK_NUMBERS_V_c1_i_write sc_out sc_logic 1 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "scalar_simConfig_BLOCK_NUMBERS_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "scalar_simConfig_BLOCK_NUMBERS_V", "role": "dout" }} , 
 	{ "name": "scalar_simConfig_BLOCK_NUMBERS_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scalar_simConfig_BLOCK_NUMBERS_V", "role": "empty_n" }} , 
 	{ "name": "scalar_simConfig_BLOCK_NUMBERS_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scalar_simConfig_BLOCK_NUMBERS_V", "role": "read" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_out", "role": "din" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_out", "role": "full_n" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_out", "role": "write" }} , 
 	{ "name": "scalar_simConfig_rowsToSimulate_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "scalar_simConfig_rowsToSimulate_V", "role": "dout" }} , 
 	{ "name": "scalar_simConfig_rowsToSimulate_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scalar_simConfig_rowsToSimulate_V", "role": "empty_n" }} , 
 	{ "name": "scalar_simConfig_rowsToSimulate_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scalar_simConfig_rowsToSimulate_V", "role": "read" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_out", "role": "din" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_out", "role": "full_n" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_out", "role": "write" }} , 
 	{ "name": "simConfig_rowBegin_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V", "role": "dout" }} , 
 	{ "name": "simConfig_rowBegin_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V", "role": "empty_n" }} , 
 	{ "name": "simConfig_rowBegin_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V", "role": "read" }} , 
 	{ "name": "simConfig_rowEnd_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V", "role": "dout" }} , 
 	{ "name": "simConfig_rowEnd_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V", "role": "empty_n" }} , 
 	{ "name": "simConfig_rowEnd_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V", "role": "read" }} , 
 	{ "name": "simConfig_rowBegin_V_c_i_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V_c_i", "role": "din" }} , 
 	{ "name": "simConfig_rowBegin_V_c_i_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V_c_i", "role": "full_n" }} , 
 	{ "name": "simConfig_rowBegin_V_c_i_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowBegin_V_c_i", "role": "write" }} , 
 	{ "name": "simConfig_rowEnd_V_c_i_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V_c_i", "role": "din" }} , 
 	{ "name": "simConfig_rowEnd_V_c_i_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V_c_i", "role": "full_n" }} , 
 	{ "name": "simConfig_rowEnd_V_c_i_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowEnd_V_c_i", "role": "write" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_c_i_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_c_i", "role": "din" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_c_i_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_c_i", "role": "full_n" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_c_i_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_c_i", "role": "write" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_c_i_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_c_i", "role": "din" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_c_i_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_c_i", "role": "full_n" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_c_i_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_c_i", "role": "write" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_c1_i_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_c1_i", "role": "din" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_c1_i_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_c1_i", "role": "full_n" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_c1_i_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_c1_i", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "simConfig_rowBegin_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_rowBegin_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowEnd_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_rowEnd_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowsToSimulate_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_c_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_c_i_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_c1_i", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_c1_i_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
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
		simConfig_BLOCK_NUMBERS_V_c1_i {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	scalar_simConfig_BLOCK_NUMBERS_V { ap_fifo {  { scalar_simConfig_BLOCK_NUMBERS_V_dout fifo_data 0 27 }  { scalar_simConfig_BLOCK_NUMBERS_V_empty_n fifo_status 0 1 }  { scalar_simConfig_BLOCK_NUMBERS_V_read fifo_update 1 1 } } }
	simConfig_BLOCK_NUMBERS_V_out { ap_fifo {  { simConfig_BLOCK_NUMBERS_V_out_din fifo_data 1 27 }  { simConfig_BLOCK_NUMBERS_V_out_full_n fifo_status 0 1 }  { simConfig_BLOCK_NUMBERS_V_out_write fifo_update 1 1 } } }
	scalar_simConfig_rowsToSimulate_V { ap_fifo {  { scalar_simConfig_rowsToSimulate_V_dout fifo_data 0 27 }  { scalar_simConfig_rowsToSimulate_V_empty_n fifo_status 0 1 }  { scalar_simConfig_rowsToSimulate_V_read fifo_update 1 1 } } }
	simConfig_rowsToSimulate_V_out { ap_fifo {  { simConfig_rowsToSimulate_V_out_din fifo_data 1 27 }  { simConfig_rowsToSimulate_V_out_full_n fifo_status 0 1 }  { simConfig_rowsToSimulate_V_out_write fifo_update 1 1 } } }
	simConfig_rowBegin_V { ap_fifo {  { simConfig_rowBegin_V_dout fifo_data 0 27 }  { simConfig_rowBegin_V_empty_n fifo_status 0 1 }  { simConfig_rowBegin_V_read fifo_update 1 1 } } }
	simConfig_rowEnd_V { ap_fifo {  { simConfig_rowEnd_V_dout fifo_data 0 27 }  { simConfig_rowEnd_V_empty_n fifo_status 0 1 }  { simConfig_rowEnd_V_read fifo_update 1 1 } } }
	simConfig_rowBegin_V_c_i { ap_fifo {  { simConfig_rowBegin_V_c_i_din fifo_data 1 27 }  { simConfig_rowBegin_V_c_i_full_n fifo_status 0 1 }  { simConfig_rowBegin_V_c_i_write fifo_update 1 1 } } }
	simConfig_rowEnd_V_c_i { ap_fifo {  { simConfig_rowEnd_V_c_i_din fifo_data 1 27 }  { simConfig_rowEnd_V_c_i_full_n fifo_status 0 1 }  { simConfig_rowEnd_V_c_i_write fifo_update 1 1 } } }
	simConfig_rowsToSimulate_V_c_i { ap_fifo {  { simConfig_rowsToSimulate_V_c_i_din fifo_data 1 27 }  { simConfig_rowsToSimulate_V_c_i_full_n fifo_status 0 1 }  { simConfig_rowsToSimulate_V_c_i_write fifo_update 1 1 } } }
	simConfig_BLOCK_NUMBERS_V_c_i { ap_fifo {  { simConfig_BLOCK_NUMBERS_V_c_i_din fifo_data 1 27 }  { simConfig_BLOCK_NUMBERS_V_c_i_full_n fifo_status 0 1 }  { simConfig_BLOCK_NUMBERS_V_c_i_write fifo_update 1 1 } } }
	simConfig_BLOCK_NUMBERS_V_c1_i { ap_fifo {  { simConfig_BLOCK_NUMBERS_V_c1_i_din fifo_data 1 27 }  { simConfig_BLOCK_NUMBERS_V_c1_i_full_n fifo_status 0 1 }  { simConfig_BLOCK_NUMBERS_V_c1_i_write fifo_update 1 1 } } }
}
