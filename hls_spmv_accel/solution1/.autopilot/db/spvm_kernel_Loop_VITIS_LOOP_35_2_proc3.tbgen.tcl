set moduleName spvm_kernel_Loop_VITIS_LOOP_35_2_proc3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {spvm_kernel_Loop_VITIS_LOOP_35_2_proc3}
set C_modelType { void 0 }
set C_modelArgList {
	{ data_size int 32 regular  }
	{ values int 32 regular {array 9 { 1 3 } 1 1 }  }
	{ values_fifo int 32 regular {fifo 1 volatile }  }
	{ cols int 32 regular {array 9 { 1 3 } 1 1 }  }
	{ cols_fifo int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "data_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "values", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "values_fifo", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cols", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "cols_fifo", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ values_fifo_din sc_out sc_lv 32 signal 2 } 
	{ values_fifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ values_fifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ values_fifo_full_n sc_in sc_logic 1 signal 2 } 
	{ values_fifo_write sc_out sc_logic 1 signal 2 } 
	{ cols_fifo_din sc_out sc_lv 32 signal 4 } 
	{ cols_fifo_num_data_valid sc_in sc_lv 2 signal 4 } 
	{ cols_fifo_fifo_cap sc_in sc_lv 2 signal 4 } 
	{ cols_fifo_full_n sc_in sc_logic 1 signal 4 } 
	{ cols_fifo_write sc_out sc_logic 1 signal 4 } 
	{ data_size sc_in sc_lv 32 signal 0 } 
	{ values_address0 sc_out sc_lv 4 signal 1 } 
	{ values_ce0 sc_out sc_logic 1 signal 1 } 
	{ values_q0 sc_in sc_lv 32 signal 1 } 
	{ cols_address0 sc_out sc_lv 4 signal 3 } 
	{ cols_ce0 sc_out sc_logic 1 signal 3 } 
	{ cols_q0 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "values_fifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "values_fifo", "role": "din" }} , 
 	{ "name": "values_fifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "values_fifo", "role": "num_data_valid" }} , 
 	{ "name": "values_fifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "values_fifo", "role": "fifo_cap" }} , 
 	{ "name": "values_fifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values_fifo", "role": "full_n" }} , 
 	{ "name": "values_fifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values_fifo", "role": "write" }} , 
 	{ "name": "cols_fifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols_fifo", "role": "din" }} , 
 	{ "name": "cols_fifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "cols_fifo", "role": "num_data_valid" }} , 
 	{ "name": "cols_fifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "cols_fifo", "role": "fifo_cap" }} , 
 	{ "name": "cols_fifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols_fifo", "role": "full_n" }} , 
 	{ "name": "cols_fifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols_fifo", "role": "write" }} , 
 	{ "name": "data_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_size", "role": "default" }} , 
 	{ "name": "values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "values", "role": "address0" }} , 
 	{ "name": "values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values", "role": "ce0" }} , 
 	{ "name": "values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "values", "role": "q0" }} , 
 	{ "name": "cols_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cols", "role": "address0" }} , 
 	{ "name": "cols_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols", "role": "ce0" }} , 
 	{ "name": "cols_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "spvm_kernel_Loop_VITIS_LOOP_35_2_proc3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data_size", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "values_fifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "values_fifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cols", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cols_fifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "cols_fifo_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_35_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	spvm_kernel_Loop_VITIS_LOOP_35_2_proc3 {
		data_size {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 0 FirstWrite -1}
		values_fifo {Type O LastRead -1 FirstWrite 1}
		cols {Type I LastRead 0 FirstWrite -1}
		cols_fifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	data_size { ap_none {  { data_size in_data 0 32 } } }
	values { ap_memory {  { values_address0 mem_address 1 4 }  { values_ce0 mem_ce 1 1 }  { values_q0 in_data 0 32 } } }
	values_fifo { ap_fifo {  { values_fifo_din fifo_port_we 1 32 }  { values_fifo_num_data_valid fifo_status_num_data_valid 0 2 }  { values_fifo_fifo_cap fifo_update 0 2 }  { values_fifo_full_n fifo_status 0 1 }  { values_fifo_write fifo_data 1 1 } } }
	cols { ap_memory {  { cols_address0 mem_address 1 4 }  { cols_ce0 mem_ce 1 1 }  { cols_q0 in_data 0 32 } } }
	cols_fifo { ap_fifo {  { cols_fifo_din fifo_port_we 1 32 }  { cols_fifo_num_data_valid fifo_status_num_data_valid 0 2 }  { cols_fifo_fifo_cap fifo_update 0 2 }  { cols_fifo_full_n fifo_status 0 1 }  { cols_fifo_write fifo_data 1 1 } } }
}
