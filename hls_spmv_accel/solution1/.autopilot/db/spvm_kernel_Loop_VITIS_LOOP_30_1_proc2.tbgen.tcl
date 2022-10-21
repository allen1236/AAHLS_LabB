set moduleName spvm_kernel_Loop_VITIS_LOOP_30_1_proc2
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
set C_modelName {spvm_kernel_Loop_VITIS_LOOP_30_1_proc2}
set C_modelType { void 0 }
set C_modelArgList {
	{ row_size int 32 regular  }
	{ rows int 32 regular {array 4 { 1 3 } 1 1 }  }
	{ rows_fifo int 32 regular {fifo 1 volatile }  }
	{ row_size_c int 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "row_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "rows", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "rows_fifo", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "row_size_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
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
	{ row_size sc_in sc_lv 32 signal 0 } 
	{ rows_address0 sc_out sc_lv 2 signal 1 } 
	{ rows_ce0 sc_out sc_logic 1 signal 1 } 
	{ rows_q0 sc_in sc_lv 32 signal 1 } 
	{ rows_fifo_din sc_out sc_lv 32 signal 2 } 
	{ rows_fifo_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ rows_fifo_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ rows_fifo_full_n sc_in sc_logic 1 signal 2 } 
	{ rows_fifo_write sc_out sc_logic 1 signal 2 } 
	{ row_size_c_din sc_out sc_lv 32 signal 3 } 
	{ row_size_c_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ row_size_c_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ row_size_c_full_n sc_in sc_logic 1 signal 3 } 
	{ row_size_c_write sc_out sc_logic 1 signal 3 } 
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
 	{ "name": "row_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "row_size", "role": "default" }} , 
 	{ "name": "rows_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rows", "role": "address0" }} , 
 	{ "name": "rows_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows", "role": "ce0" }} , 
 	{ "name": "rows_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "q0" }} , 
 	{ "name": "rows_fifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows_fifo", "role": "din" }} , 
 	{ "name": "rows_fifo_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rows_fifo", "role": "num_data_valid" }} , 
 	{ "name": "rows_fifo_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rows_fifo", "role": "fifo_cap" }} , 
 	{ "name": "rows_fifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows_fifo", "role": "full_n" }} , 
 	{ "name": "rows_fifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows_fifo", "role": "write" }} , 
 	{ "name": "row_size_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "row_size_c", "role": "din" }} , 
 	{ "name": "row_size_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "row_size_c", "role": "num_data_valid" }} , 
 	{ "name": "row_size_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "row_size_c", "role": "fifo_cap" }} , 
 	{ "name": "row_size_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "row_size_c", "role": "full_n" }} , 
 	{ "name": "row_size_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "row_size_c", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "spvm_kernel_Loop_VITIS_LOOP_30_1_proc2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
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
			{"Name" : "row_size", "Type" : "None", "Direction" : "I"},
			{"Name" : "rows", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1_fu_52", "Port" : "rows", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "rows_fifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1_fu_52", "Port" : "rows_fifo", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "row_size_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "row_size_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1_fu_52", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1",
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
			{"Name" : "row_size", "Type" : "None", "Direction" : "I"},
			{"Name" : "rows", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rows_fifo", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "rows_fifo_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_30_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1_fu_52.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	spvm_kernel_Loop_VITIS_LOOP_30_1_proc2 {
		row_size {Type I LastRead 0 FirstWrite -1}
		rows {Type I LastRead 0 FirstWrite -1}
		rows_fifo {Type O LastRead -1 FirstWrite 1}
		row_size_c {Type O LastRead -1 FirstWrite 0}}
	spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1 {
		row_size {Type I LastRead 0 FirstWrite -1}
		rows {Type I LastRead 0 FirstWrite -1}
		rows_fifo {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	row_size { ap_none {  { row_size in_data 0 32 } } }
	rows { ap_memory {  { rows_address0 mem_address 1 2 }  { rows_ce0 mem_ce 1 1 }  { rows_q0 mem_dout 0 32 } } }
	rows_fifo { ap_fifo {  { rows_fifo_din fifo_port_we 1 32 }  { rows_fifo_num_data_valid fifo_status_num_data_valid 0 2 }  { rows_fifo_fifo_cap fifo_update 0 2 }  { rows_fifo_full_n fifo_status 0 1 }  { rows_fifo_write fifo_data 1 1 } } }
	row_size_c { ap_fifo {  { row_size_c_din fifo_port_we 1 32 }  { row_size_c_num_data_valid fifo_status_num_data_valid 0 3 }  { row_size_c_fifo_cap fifo_update 0 3 }  { row_size_c_full_n fifo_status 0 1 }  { row_size_c_write fifo_data 1 1 } } }
}
