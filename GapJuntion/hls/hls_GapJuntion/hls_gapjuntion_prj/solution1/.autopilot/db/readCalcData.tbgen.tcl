set moduleName readCalcData
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {readCalcData}
set C_modelType { int 256 }
set C_modelArgList {
	{ F_V_data_0 float 32 regular {fifo 0 volatile } {global 0}  }
	{ F_V_data_1 float 32 regular {fifo 0 volatile } {global 0}  }
	{ F_V_data_2 float 32 regular {fifo 0 volatile } {global 0}  }
	{ F_V_data_3 float 32 regular {fifo 0 volatile } {global 0}  }
	{ V_V_data_0 float 32 regular {fifo 0 volatile } {global 0}  }
	{ V_V_data_1 float 32 regular {fifo 0 volatile } {global 0}  }
	{ V_V_data_2 float 32 regular {fifo 0 volatile } {global 0}  }
	{ V_V_data_3 float 32 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "F_V_data_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "F_V_data_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "F_V_data_2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "F_V_data_3", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "V_V_data_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "V_V_data_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "V_V_data_2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "V_V_data_3", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 256} ]}
# RTL Port declarations: 
set portNum 47
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ F_V_data_0_dout sc_in sc_lv 32 signal 0 } 
	{ F_V_data_0_empty_n sc_in sc_logic 1 signal 0 } 
	{ F_V_data_0_read sc_out sc_logic 1 signal 0 } 
	{ F_V_data_1_dout sc_in sc_lv 32 signal 1 } 
	{ F_V_data_1_empty_n sc_in sc_logic 1 signal 1 } 
	{ F_V_data_1_read sc_out sc_logic 1 signal 1 } 
	{ F_V_data_2_dout sc_in sc_lv 32 signal 2 } 
	{ F_V_data_2_empty_n sc_in sc_logic 1 signal 2 } 
	{ F_V_data_2_read sc_out sc_logic 1 signal 2 } 
	{ F_V_data_3_dout sc_in sc_lv 32 signal 3 } 
	{ F_V_data_3_empty_n sc_in sc_logic 1 signal 3 } 
	{ F_V_data_3_read sc_out sc_logic 1 signal 3 } 
	{ V_V_data_0_dout sc_in sc_lv 32 signal 4 } 
	{ V_V_data_0_empty_n sc_in sc_logic 1 signal 4 } 
	{ V_V_data_0_read sc_out sc_logic 1 signal 4 } 
	{ V_V_data_1_dout sc_in sc_lv 32 signal 5 } 
	{ V_V_data_1_empty_n sc_in sc_logic 1 signal 5 } 
	{ V_V_data_1_read sc_out sc_logic 1 signal 5 } 
	{ V_V_data_2_dout sc_in sc_lv 32 signal 6 } 
	{ V_V_data_2_empty_n sc_in sc_logic 1 signal 6 } 
	{ V_V_data_2_read sc_out sc_logic 1 signal 6 } 
	{ V_V_data_3_dout sc_in sc_lv 32 signal 7 } 
	{ V_V_data_3_empty_n sc_in sc_logic 1 signal 7 } 
	{ V_V_data_3_read sc_out sc_logic 1 signal 7 } 
	{ ap_return_0 sc_out sc_lv 32 signal -1 } 
	{ ap_return_1 sc_out sc_lv 32 signal -1 } 
	{ ap_return_2 sc_out sc_lv 32 signal -1 } 
	{ ap_return_3 sc_out sc_lv 32 signal -1 } 
	{ ap_return_4 sc_out sc_lv 32 signal -1 } 
	{ ap_return_5 sc_out sc_lv 32 signal -1 } 
	{ ap_return_6 sc_out sc_lv 32 signal -1 } 
	{ ap_return_7 sc_out sc_lv 32 signal -1 } 
	{ F_V_data_0_blk_n sc_out sc_logic 1 signal -1 } 
	{ F_V_data_1_blk_n sc_out sc_logic 1 signal -1 } 
	{ F_V_data_2_blk_n sc_out sc_logic 1 signal -1 } 
	{ F_V_data_3_blk_n sc_out sc_logic 1 signal -1 } 
	{ V_V_data_0_blk_n sc_out sc_logic 1 signal -1 } 
	{ V_V_data_1_blk_n sc_out sc_logic 1 signal -1 } 
	{ V_V_data_2_blk_n sc_out sc_logic 1 signal -1 } 
	{ V_V_data_3_blk_n sc_out sc_logic 1 signal -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "F_V_data_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "F_V_data_0", "role": "dout" }} , 
 	{ "name": "F_V_data_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_0", "role": "empty_n" }} , 
 	{ "name": "F_V_data_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_0", "role": "read" }} , 
 	{ "name": "F_V_data_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "F_V_data_1", "role": "dout" }} , 
 	{ "name": "F_V_data_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_1", "role": "empty_n" }} , 
 	{ "name": "F_V_data_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_1", "role": "read" }} , 
 	{ "name": "F_V_data_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "F_V_data_2", "role": "dout" }} , 
 	{ "name": "F_V_data_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_2", "role": "empty_n" }} , 
 	{ "name": "F_V_data_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_2", "role": "read" }} , 
 	{ "name": "F_V_data_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "F_V_data_3", "role": "dout" }} , 
 	{ "name": "F_V_data_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_3", "role": "empty_n" }} , 
 	{ "name": "F_V_data_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_3", "role": "read" }} , 
 	{ "name": "V_V_data_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_V_data_0", "role": "dout" }} , 
 	{ "name": "V_V_data_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_0", "role": "empty_n" }} , 
 	{ "name": "V_V_data_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_0", "role": "read" }} , 
 	{ "name": "V_V_data_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_V_data_1", "role": "dout" }} , 
 	{ "name": "V_V_data_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_1", "role": "empty_n" }} , 
 	{ "name": "V_V_data_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_1", "role": "read" }} , 
 	{ "name": "V_V_data_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_V_data_2", "role": "dout" }} , 
 	{ "name": "V_V_data_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_2", "role": "empty_n" }} , 
 	{ "name": "V_V_data_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_2", "role": "read" }} , 
 	{ "name": "V_V_data_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_V_data_3", "role": "dout" }} , 
 	{ "name": "V_V_data_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_3", "role": "empty_n" }} , 
 	{ "name": "V_V_data_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_3", "role": "read" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }} , 
 	{ "name": "ap_return_5", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_5", "role": "default" }} , 
 	{ "name": "ap_return_6", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_6", "role": "default" }} , 
 	{ "name": "ap_return_7", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_7", "role": "default" }} , 
 	{ "name": "F_V_data_0_blk_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_0_blk_n", "role": "default" }} , 
 	{ "name": "F_V_data_1_blk_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_1_blk_n", "role": "default" }} , 
 	{ "name": "F_V_data_2_blk_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_2_blk_n", "role": "default" }} , 
 	{ "name": "F_V_data_3_blk_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_3_blk_n", "role": "default" }} , 
 	{ "name": "V_V_data_0_blk_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_0_blk_n", "role": "default" }} , 
 	{ "name": "V_V_data_1_blk_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_1_blk_n", "role": "default" }} , 
 	{ "name": "V_V_data_2_blk_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_2_blk_n", "role": "default" }} , 
 	{ "name": "V_V_data_3_blk_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_3_blk_n", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
					{"Name" : "V_V_data_3_blk_n", "Type" : "RtlPort"}]}]}]}


set ArgLastReadFirstWriteLatency {
	readCalcData {
		F_V_data_0 {Type I LastRead 0 FirstWrite -1}
		F_V_data_1 {Type I LastRead 0 FirstWrite -1}
		F_V_data_2 {Type I LastRead 0 FirstWrite -1}
		F_V_data_3 {Type I LastRead 0 FirstWrite -1}
		V_V_data_0 {Type I LastRead 0 FirstWrite -1}
		V_V_data_1 {Type I LastRead 0 FirstWrite -1}
		V_V_data_2 {Type I LastRead 0 FirstWrite -1}
		V_V_data_3 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	F_V_data_0 { ap_fifo {  { F_V_data_0_dout fifo_data 0 32 }  { F_V_data_0_empty_n fifo_status 0 1 }  { F_V_data_0_read fifo_update 1 1 } } }
	F_V_data_1 { ap_fifo {  { F_V_data_1_dout fifo_data 0 32 }  { F_V_data_1_empty_n fifo_status 0 1 }  { F_V_data_1_read fifo_update 1 1 } } }
	F_V_data_2 { ap_fifo {  { F_V_data_2_dout fifo_data 0 32 }  { F_V_data_2_empty_n fifo_status 0 1 }  { F_V_data_2_read fifo_update 1 1 } } }
	F_V_data_3 { ap_fifo {  { F_V_data_3_dout fifo_data 0 32 }  { F_V_data_3_empty_n fifo_status 0 1 }  { F_V_data_3_read fifo_update 1 1 } } }
	V_V_data_0 { ap_fifo {  { V_V_data_0_dout fifo_data 0 32 }  { V_V_data_0_empty_n fifo_status 0 1 }  { V_V_data_0_read fifo_update 1 1 } } }
	V_V_data_1 { ap_fifo {  { V_V_data_1_dout fifo_data 0 32 }  { V_V_data_1_empty_n fifo_status 0 1 }  { V_V_data_1_read fifo_update 1 1 } } }
	V_V_data_2 { ap_fifo {  { V_V_data_2_dout fifo_data 0 32 }  { V_V_data_2_empty_n fifo_status 0 1 }  { V_V_data_2_read fifo_update 1 1 } } }
	V_V_data_3 { ap_fifo {  { V_V_data_3_dout fifo_data 0 32 }  { V_V_data_3_empty_n fifo_status 0 1 }  { V_V_data_3_read fifo_update 1 1 } } }
}
