set moduleName spvm_kernel_Loop_VITIS_LOOP_70_4_proc5
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {spvm_kernel_Loop_VITIS_LOOP_70_4_proc5}
set C_modelType { void 0 }
set C_modelArgList {
	{ row_size int 32 regular {fifo 0}  }
	{ results_fifo int 32 regular {fifo 0 volatile }  }
	{ y int 32 regular {array 4 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "row_size", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "results_fifo", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ row_size_dout sc_in sc_lv 32 signal 0 } 
	{ row_size_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ row_size_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ row_size_empty_n sc_in sc_logic 1 signal 0 } 
	{ row_size_read sc_out sc_logic 1 signal 0 } 
	{ results_fifo_dout sc_in sc_lv 32 signal 1 } 
	{ results_fifo_num_data_valid sc_in sc_lv 2 signal 1 } 
	{ results_fifo_fifo_cap sc_in sc_lv 2 signal 1 } 
	{ results_fifo_empty_n sc_in sc_logic 1 signal 1 } 
	{ results_fifo_read sc_out sc_logic 1 signal 1 } 
	{ y_address0 sc_out sc_lv 2 signal 2 } 
	{ y_ce0 sc_out sc_logic 1 signal 2 } 
	{ y_we0 sc_out sc_logic 1 signal 2 } 
	{ y_d0 sc_out sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "row_size_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "row_size", "role": "dout" }} , 
 	{ "name": "row_size_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "row_size", "role": "num_data_valid" }} , 
 	{ "name": "row_size_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "row_size", "role": "fifo_cap" }} , 
 	{ "name": "row_size_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "row_size", "role": "empty_n" }} , 
 	{ "name": "row_size_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "row_size", "role": "read" }} , 
 	{ "name": "results_fifo_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_fifo", "role": "dout" }} , 
 	{ "name": "results_fifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "results_fifo", "role": "num_data_valid" }} , 
 	{ "name": "results_fifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "results_fifo", "role": "fifo_cap" }} , 
 	{ "name": "results_fifo_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_fifo", "role": "empty_n" }} , 
 	{ "name": "results_fifo_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_fifo", "role": "read" }} , 
 	{ "name": "y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "y", "role": "address0" }} , 
 	{ "name": "y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "ce0" }} , 
 	{ "name": "y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "we0" }} , 
 	{ "name": "y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "spvm_kernel_Loop_VITIS_LOOP_70_4_proc5",
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
			{"Name" : "row_size", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "row_size_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "results_fifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40", "Port" : "results_fifo", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "y", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40", "Port" : "y", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "row_size_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "results_fifo", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "results_fifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "y", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_70_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	spvm_kernel_Loop_VITIS_LOOP_70_4_proc5 {
		row_size {Type I LastRead 0 FirstWrite -1}
		results_fifo {Type I LastRead 1 FirstWrite -1}
		y {Type O LastRead -1 FirstWrite 1}}
	spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4 {
		row_size_load {Type I LastRead 0 FirstWrite -1}
		results_fifo {Type I LastRead 1 FirstWrite -1}
		y {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	row_size { ap_fifo {  { row_size_dout fifo_port_we 0 32 }  { row_size_num_data_valid fifo_status_num_data_valid 0 3 }  { row_size_fifo_cap fifo_update 0 3 }  { row_size_empty_n fifo_status 0 1 }  { row_size_read fifo_data 1 1 } } }
	results_fifo { ap_fifo {  { results_fifo_dout fifo_port_we 0 32 }  { results_fifo_num_data_valid fifo_status_num_data_valid 0 2 }  { results_fifo_fifo_cap fifo_update 0 2 }  { results_fifo_empty_n fifo_status 0 1 }  { results_fifo_read fifo_data 1 1 } } }
	y { ap_memory {  { y_address0 mem_address 1 2 }  { y_ce0 mem_ce 1 1 }  { y_we0 mem_we 1 1 }  { y_d0 mem_din 1 32 } } }
}
