set moduleName calc
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
set C_modelName {calc}
set C_modelType { void 0 }
set C_modelArgList {
	{ simConfig_rowsToSimulate_V int 27 regular {fifo 0}  }
	{ simConfig_BLOCK_NUMBERS_V int 27 regular {fifo 0}  }
	{ simConfig_rowsToSimulate_V_out int 27 regular {fifo 1}  }
	{ simConfig_BLOCK_NUMBERS_V_out int 27 regular {fifo 1}  }
	{ processedData_V_data float 32 regular {fifo 0 volatile } {global 0}  }
	{ processedData_V_data_1 float 32 regular {fifo 0 volatile } {global 0}  }
	{ processedData_V_data_2 float 32 regular {fifo 0 volatile } {global 0}  }
	{ processedData_V_data_3 float 32 regular {fifo 0 volatile } {global 0}  }
	{ fixedData_V_data float 32 regular {fifo 0 volatile } {global 0}  }
	{ fixedData_V_tlast_V int 1 regular {fifo 0 volatile } {global 0}  }
	{ V_V_data_0 float 32 regular {fifo 1 volatile } {global 1}  }
	{ V_V_data_1 float 32 regular {fifo 1 volatile } {global 1}  }
	{ V_V_data_2 float 32 regular {fifo 1 volatile } {global 1}  }
	{ V_V_data_3 float 32 regular {fifo 1 volatile } {global 1}  }
	{ F_V_data_0 float 32 regular {fifo 1 volatile } {global 1}  }
	{ F_V_data_1 float 32 regular {fifo 1 volatile } {global 1}  }
	{ F_V_data_2 float 32 regular {fifo 1 volatile } {global 1}  }
	{ F_V_data_3 float 32 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "simConfig_rowsToSimulate_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_BLOCK_NUMBERS_V", "interface" : "fifo", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "simConfig_rowsToSimulate_V_out", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "simConfig_BLOCK_NUMBERS_V_out", "interface" : "fifo", "bitwidth" : 27, "direction" : "WRITEONLY"} , 
 	{ "Name" : "processedData_V_data", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "processedData_V_data_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "processedData_V_data_2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "processedData_V_data_3", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fixedData_V_data", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "fixedData_V_tlast_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "V_V_data_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "V_V_data_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "V_V_data_2", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "V_V_data_3", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "F_V_data_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "F_V_data_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "F_V_data_2", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "F_V_data_3", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 64
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
	{ simConfig_rowsToSimulate_V_dout sc_in sc_lv 27 signal 0 } 
	{ simConfig_rowsToSimulate_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ simConfig_rowsToSimulate_V_read sc_out sc_logic 1 signal 0 } 
	{ simConfig_BLOCK_NUMBERS_V_dout sc_in sc_lv 27 signal 1 } 
	{ simConfig_BLOCK_NUMBERS_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ simConfig_BLOCK_NUMBERS_V_read sc_out sc_logic 1 signal 1 } 
	{ simConfig_rowsToSimulate_V_out_din sc_out sc_lv 27 signal 2 } 
	{ simConfig_rowsToSimulate_V_out_full_n sc_in sc_logic 1 signal 2 } 
	{ simConfig_rowsToSimulate_V_out_write sc_out sc_logic 1 signal 2 } 
	{ simConfig_BLOCK_NUMBERS_V_out_din sc_out sc_lv 27 signal 3 } 
	{ simConfig_BLOCK_NUMBERS_V_out_full_n sc_in sc_logic 1 signal 3 } 
	{ simConfig_BLOCK_NUMBERS_V_out_write sc_out sc_logic 1 signal 3 } 
	{ processedData_V_data_dout sc_in sc_lv 32 signal 4 } 
	{ processedData_V_data_empty_n sc_in sc_logic 1 signal 4 } 
	{ processedData_V_data_read sc_out sc_logic 1 signal 4 } 
	{ processedData_V_data_1_dout sc_in sc_lv 32 signal 5 } 
	{ processedData_V_data_1_empty_n sc_in sc_logic 1 signal 5 } 
	{ processedData_V_data_1_read sc_out sc_logic 1 signal 5 } 
	{ processedData_V_data_2_dout sc_in sc_lv 32 signal 6 } 
	{ processedData_V_data_2_empty_n sc_in sc_logic 1 signal 6 } 
	{ processedData_V_data_2_read sc_out sc_logic 1 signal 6 } 
	{ processedData_V_data_3_dout sc_in sc_lv 32 signal 7 } 
	{ processedData_V_data_3_empty_n sc_in sc_logic 1 signal 7 } 
	{ processedData_V_data_3_read sc_out sc_logic 1 signal 7 } 
	{ fixedData_V_data_dout sc_in sc_lv 32 signal 8 } 
	{ fixedData_V_data_empty_n sc_in sc_logic 1 signal 8 } 
	{ fixedData_V_data_read sc_out sc_logic 1 signal 8 } 
	{ fixedData_V_tlast_V_dout sc_in sc_lv 1 signal 9 } 
	{ fixedData_V_tlast_V_empty_n sc_in sc_logic 1 signal 9 } 
	{ fixedData_V_tlast_V_read sc_out sc_logic 1 signal 9 } 
	{ V_V_data_0_din sc_out sc_lv 32 signal 10 } 
	{ V_V_data_0_full_n sc_in sc_logic 1 signal 10 } 
	{ V_V_data_0_write sc_out sc_logic 1 signal 10 } 
	{ V_V_data_1_din sc_out sc_lv 32 signal 11 } 
	{ V_V_data_1_full_n sc_in sc_logic 1 signal 11 } 
	{ V_V_data_1_write sc_out sc_logic 1 signal 11 } 
	{ V_V_data_2_din sc_out sc_lv 32 signal 12 } 
	{ V_V_data_2_full_n sc_in sc_logic 1 signal 12 } 
	{ V_V_data_2_write sc_out sc_logic 1 signal 12 } 
	{ V_V_data_3_din sc_out sc_lv 32 signal 13 } 
	{ V_V_data_3_full_n sc_in sc_logic 1 signal 13 } 
	{ V_V_data_3_write sc_out sc_logic 1 signal 13 } 
	{ F_V_data_0_din sc_out sc_lv 32 signal 14 } 
	{ F_V_data_0_full_n sc_in sc_logic 1 signal 14 } 
	{ F_V_data_0_write sc_out sc_logic 1 signal 14 } 
	{ F_V_data_1_din sc_out sc_lv 32 signal 15 } 
	{ F_V_data_1_full_n sc_in sc_logic 1 signal 15 } 
	{ F_V_data_1_write sc_out sc_logic 1 signal 15 } 
	{ F_V_data_2_din sc_out sc_lv 32 signal 16 } 
	{ F_V_data_2_full_n sc_in sc_logic 1 signal 16 } 
	{ F_V_data_2_write sc_out sc_logic 1 signal 16 } 
	{ F_V_data_3_din sc_out sc_lv 32 signal 17 } 
	{ F_V_data_3_full_n sc_in sc_logic 1 signal 17 } 
	{ F_V_data_3_write sc_out sc_logic 1 signal 17 } 
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
 	{ "name": "simConfig_rowsToSimulate_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V", "role": "dout" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V", "role": "empty_n" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V", "role": "read" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V", "role": "dout" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V", "role": "empty_n" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V", "role": "read" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_out", "role": "din" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_out", "role": "full_n" }} , 
 	{ "name": "simConfig_rowsToSimulate_V_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_rowsToSimulate_V_out", "role": "write" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_out", "role": "din" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_out", "role": "full_n" }} , 
 	{ "name": "simConfig_BLOCK_NUMBERS_V_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "simConfig_BLOCK_NUMBERS_V_out", "role": "write" }} , 
 	{ "name": "processedData_V_data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "processedData_V_data", "role": "dout" }} , 
 	{ "name": "processedData_V_data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data", "role": "empty_n" }} , 
 	{ "name": "processedData_V_data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data", "role": "read" }} , 
 	{ "name": "processedData_V_data_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "processedData_V_data_1", "role": "dout" }} , 
 	{ "name": "processedData_V_data_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_1", "role": "empty_n" }} , 
 	{ "name": "processedData_V_data_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_1", "role": "read" }} , 
 	{ "name": "processedData_V_data_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "processedData_V_data_2", "role": "dout" }} , 
 	{ "name": "processedData_V_data_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_2", "role": "empty_n" }} , 
 	{ "name": "processedData_V_data_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_2", "role": "read" }} , 
 	{ "name": "processedData_V_data_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "processedData_V_data_3", "role": "dout" }} , 
 	{ "name": "processedData_V_data_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_3", "role": "empty_n" }} , 
 	{ "name": "processedData_V_data_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "processedData_V_data_3", "role": "read" }} , 
 	{ "name": "fixedData_V_data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fixedData_V_data", "role": "dout" }} , 
 	{ "name": "fixedData_V_data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_data", "role": "empty_n" }} , 
 	{ "name": "fixedData_V_data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_data", "role": "read" }} , 
 	{ "name": "fixedData_V_tlast_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_tlast_V", "role": "dout" }} , 
 	{ "name": "fixedData_V_tlast_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_tlast_V", "role": "empty_n" }} , 
 	{ "name": "fixedData_V_tlast_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fixedData_V_tlast_V", "role": "read" }} , 
 	{ "name": "V_V_data_0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_V_data_0", "role": "din" }} , 
 	{ "name": "V_V_data_0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_0", "role": "full_n" }} , 
 	{ "name": "V_V_data_0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_0", "role": "write" }} , 
 	{ "name": "V_V_data_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_V_data_1", "role": "din" }} , 
 	{ "name": "V_V_data_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_1", "role": "full_n" }} , 
 	{ "name": "V_V_data_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_1", "role": "write" }} , 
 	{ "name": "V_V_data_2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_V_data_2", "role": "din" }} , 
 	{ "name": "V_V_data_2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_2", "role": "full_n" }} , 
 	{ "name": "V_V_data_2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_2", "role": "write" }} , 
 	{ "name": "V_V_data_3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "V_V_data_3", "role": "din" }} , 
 	{ "name": "V_V_data_3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_3", "role": "full_n" }} , 
 	{ "name": "V_V_data_3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_data_3", "role": "write" }} , 
 	{ "name": "F_V_data_0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "F_V_data_0", "role": "din" }} , 
 	{ "name": "F_V_data_0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_0", "role": "full_n" }} , 
 	{ "name": "F_V_data_0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_0", "role": "write" }} , 
 	{ "name": "F_V_data_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "F_V_data_1", "role": "din" }} , 
 	{ "name": "F_V_data_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_1", "role": "full_n" }} , 
 	{ "name": "F_V_data_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_1", "role": "write" }} , 
 	{ "name": "F_V_data_2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "F_V_data_2", "role": "din" }} , 
 	{ "name": "F_V_data_2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_2", "role": "full_n" }} , 
 	{ "name": "F_V_data_2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_2", "role": "write" }} , 
 	{ "name": "F_V_data_3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "F_V_data_3", "role": "din" }} , 
 	{ "name": "F_V_data_3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_3", "role": "full_n" }} , 
 	{ "name": "F_V_data_3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "F_V_data_3", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"],
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
		"Port" : [
			{"Name" : "simConfig_rowsToSimulate_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_rowsToSimulate_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_rowsToSimulate_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "simConfig_BLOCK_NUMBERS_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "simConfig_BLOCK_NUMBERS_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "processedData_V_data_3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "processedData_V_data_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fixedData_V_data", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fixedData_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fixedData_V_tlast_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fixedData_V_tlast_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_V_data_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "V_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "V_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "V_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "V_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "V_V_data_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_V_data_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "F_V_data_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_V_data_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "F_V_data_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_V_data_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "F_V_data_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "F_V_data_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "F_V_data_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fsub_32ns_32ns_32_8_full_dsp_1_U98", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fsub_32ns_32ns_32_8_full_dsp_1_U99", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U100", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U101", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U102", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U103", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U104", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fmul_32ns_32ns_32_5_max_dsp_1_U105", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fexp_32ns_32ns_32_18_full_dsp_1_U106", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_fexp_32ns_32ns_32_18_full_dsp_1_U107", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.GapJunctionIP_mul_27ns_29ns_56_5_1_U108", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		F_V_data_3 {Type O LastRead -1 FirstWrite 50}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "51", "Max" : "50000049"}
	, {"Name" : "Interval", "Min" : "51", "Max" : "50000049"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	simConfig_rowsToSimulate_V { ap_fifo {  { simConfig_rowsToSimulate_V_dout fifo_data 0 27 }  { simConfig_rowsToSimulate_V_empty_n fifo_status 0 1 }  { simConfig_rowsToSimulate_V_read fifo_update 1 1 } } }
	simConfig_BLOCK_NUMBERS_V { ap_fifo {  { simConfig_BLOCK_NUMBERS_V_dout fifo_data 0 27 }  { simConfig_BLOCK_NUMBERS_V_empty_n fifo_status 0 1 }  { simConfig_BLOCK_NUMBERS_V_read fifo_update 1 1 } } }
	simConfig_rowsToSimulate_V_out { ap_fifo {  { simConfig_rowsToSimulate_V_out_din fifo_data 1 27 }  { simConfig_rowsToSimulate_V_out_full_n fifo_status 0 1 }  { simConfig_rowsToSimulate_V_out_write fifo_update 1 1 } } }
	simConfig_BLOCK_NUMBERS_V_out { ap_fifo {  { simConfig_BLOCK_NUMBERS_V_out_din fifo_data 1 27 }  { simConfig_BLOCK_NUMBERS_V_out_full_n fifo_status 0 1 }  { simConfig_BLOCK_NUMBERS_V_out_write fifo_update 1 1 } } }
	processedData_V_data { ap_fifo {  { processedData_V_data_dout fifo_data 0 32 }  { processedData_V_data_empty_n fifo_status 0 1 }  { processedData_V_data_read fifo_update 1 1 } } }
	processedData_V_data_1 { ap_fifo {  { processedData_V_data_1_dout fifo_data 0 32 }  { processedData_V_data_1_empty_n fifo_status 0 1 }  { processedData_V_data_1_read fifo_update 1 1 } } }
	processedData_V_data_2 { ap_fifo {  { processedData_V_data_2_dout fifo_data 0 32 }  { processedData_V_data_2_empty_n fifo_status 0 1 }  { processedData_V_data_2_read fifo_update 1 1 } } }
	processedData_V_data_3 { ap_fifo {  { processedData_V_data_3_dout fifo_data 0 32 }  { processedData_V_data_3_empty_n fifo_status 0 1 }  { processedData_V_data_3_read fifo_update 1 1 } } }
	fixedData_V_data { ap_fifo {  { fixedData_V_data_dout fifo_data 0 32 }  { fixedData_V_data_empty_n fifo_status 0 1 }  { fixedData_V_data_read fifo_update 1 1 } } }
	fixedData_V_tlast_V { ap_fifo {  { fixedData_V_tlast_V_dout fifo_data 0 1 }  { fixedData_V_tlast_V_empty_n fifo_status 0 1 }  { fixedData_V_tlast_V_read fifo_update 1 1 } } }
	V_V_data_0 { ap_fifo {  { V_V_data_0_din fifo_data 1 32 }  { V_V_data_0_full_n fifo_status 0 1 }  { V_V_data_0_write fifo_update 1 1 } } }
	V_V_data_1 { ap_fifo {  { V_V_data_1_din fifo_data 1 32 }  { V_V_data_1_full_n fifo_status 0 1 }  { V_V_data_1_write fifo_update 1 1 } } }
	V_V_data_2 { ap_fifo {  { V_V_data_2_din fifo_data 1 32 }  { V_V_data_2_full_n fifo_status 0 1 }  { V_V_data_2_write fifo_update 1 1 } } }
	V_V_data_3 { ap_fifo {  { V_V_data_3_din fifo_data 1 32 }  { V_V_data_3_full_n fifo_status 0 1 }  { V_V_data_3_write fifo_update 1 1 } } }
	F_V_data_0 { ap_fifo {  { F_V_data_0_din fifo_data 1 32 }  { F_V_data_0_full_n fifo_status 0 1 }  { F_V_data_0_write fifo_update 1 1 } } }
	F_V_data_1 { ap_fifo {  { F_V_data_1_din fifo_data 1 32 }  { F_V_data_1_full_n fifo_status 0 1 }  { F_V_data_1_write fifo_update 1 1 } } }
	F_V_data_2 { ap_fifo {  { F_V_data_2_din fifo_data 1 32 }  { F_V_data_2_full_n fifo_status 0 1 }  { F_V_data_2_write fifo_update 1 1 } } }
	F_V_data_3 { ap_fifo {  { F_V_data_3_din fifo_data 1 32 }  { F_V_data_3_full_n fifo_status 0 1 }  { F_V_data_3_write fifo_update 1 1 } } }
}
