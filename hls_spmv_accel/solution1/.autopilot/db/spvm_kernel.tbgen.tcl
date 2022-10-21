set moduleName spvm_kernel
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {spvm_kernel}
set C_modelType { void 0 }
set C_modelArgList {
	{ values int 32 regular {array 9 { 1 3 } 1 1 }  }
	{ cols int 32 regular {array 9 { 1 3 } 1 1 }  }
	{ rows int 32 regular {array 4 { 1 3 } 1 1 }  }
	{ x_local float 32 regular {array 4 { 1 3 } 1 1 }  }
	{ y int 32 regular {array 4 { 0 3 } 0 1 }  }
	{ row_size int 32 regular  }
	{ data_size int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "values", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "cols", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "rows", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x_local", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "row_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "data_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 61
set portList { 
	{ values_address0 sc_out sc_lv 4 signal 0 } 
	{ values_ce0 sc_out sc_logic 1 signal 0 } 
	{ values_d0 sc_out sc_lv 32 signal 0 } 
	{ values_q0 sc_in sc_lv 32 signal 0 } 
	{ values_we0 sc_out sc_logic 1 signal 0 } 
	{ values_address1 sc_out sc_lv 4 signal 0 } 
	{ values_ce1 sc_out sc_logic 1 signal 0 } 
	{ values_d1 sc_out sc_lv 32 signal 0 } 
	{ values_q1 sc_in sc_lv 32 signal 0 } 
	{ values_we1 sc_out sc_logic 1 signal 0 } 
	{ cols_address0 sc_out sc_lv 4 signal 1 } 
	{ cols_ce0 sc_out sc_logic 1 signal 1 } 
	{ cols_d0 sc_out sc_lv 32 signal 1 } 
	{ cols_q0 sc_in sc_lv 32 signal 1 } 
	{ cols_we0 sc_out sc_logic 1 signal 1 } 
	{ cols_address1 sc_out sc_lv 4 signal 1 } 
	{ cols_ce1 sc_out sc_logic 1 signal 1 } 
	{ cols_d1 sc_out sc_lv 32 signal 1 } 
	{ cols_q1 sc_in sc_lv 32 signal 1 } 
	{ cols_we1 sc_out sc_logic 1 signal 1 } 
	{ rows_address0 sc_out sc_lv 2 signal 2 } 
	{ rows_ce0 sc_out sc_logic 1 signal 2 } 
	{ rows_d0 sc_out sc_lv 32 signal 2 } 
	{ rows_q0 sc_in sc_lv 32 signal 2 } 
	{ rows_we0 sc_out sc_logic 1 signal 2 } 
	{ rows_address1 sc_out sc_lv 2 signal 2 } 
	{ rows_ce1 sc_out sc_logic 1 signal 2 } 
	{ rows_d1 sc_out sc_lv 32 signal 2 } 
	{ rows_q1 sc_in sc_lv 32 signal 2 } 
	{ rows_we1 sc_out sc_logic 1 signal 2 } 
	{ x_local_address0 sc_out sc_lv 2 signal 3 } 
	{ x_local_ce0 sc_out sc_logic 1 signal 3 } 
	{ x_local_d0 sc_out sc_lv 32 signal 3 } 
	{ x_local_q0 sc_in sc_lv 32 signal 3 } 
	{ x_local_we0 sc_out sc_logic 1 signal 3 } 
	{ x_local_address1 sc_out sc_lv 2 signal 3 } 
	{ x_local_ce1 sc_out sc_logic 1 signal 3 } 
	{ x_local_d1 sc_out sc_lv 32 signal 3 } 
	{ x_local_q1 sc_in sc_lv 32 signal 3 } 
	{ x_local_we1 sc_out sc_logic 1 signal 3 } 
	{ y_address0 sc_out sc_lv 2 signal 4 } 
	{ y_ce0 sc_out sc_logic 1 signal 4 } 
	{ y_d0 sc_out sc_lv 32 signal 4 } 
	{ y_q0 sc_in sc_lv 32 signal 4 } 
	{ y_we0 sc_out sc_logic 1 signal 4 } 
	{ y_address1 sc_out sc_lv 2 signal 4 } 
	{ y_ce1 sc_out sc_logic 1 signal 4 } 
	{ y_d1 sc_out sc_lv 32 signal 4 } 
	{ y_q1 sc_in sc_lv 32 signal 4 } 
	{ y_we1 sc_out sc_logic 1 signal 4 } 
	{ row_size sc_in sc_lv 32 signal 5 } 
	{ data_size sc_in sc_lv 32 signal 6 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ row_size_ap_vld sc_in sc_logic 1 invld 5 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ data_size_ap_vld sc_in sc_logic 1 invld 6 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "values", "role": "address0" }} , 
 	{ "name": "values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values", "role": "ce0" }} , 
 	{ "name": "values_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "values", "role": "d0" }} , 
 	{ "name": "values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "values", "role": "q0" }} , 
 	{ "name": "values_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values", "role": "we0" }} , 
 	{ "name": "values_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "values", "role": "address1" }} , 
 	{ "name": "values_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values", "role": "ce1" }} , 
 	{ "name": "values_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "values", "role": "d1" }} , 
 	{ "name": "values_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "values", "role": "q1" }} , 
 	{ "name": "values_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values", "role": "we1" }} , 
 	{ "name": "cols_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cols", "role": "address0" }} , 
 	{ "name": "cols_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols", "role": "ce0" }} , 
 	{ "name": "cols_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "d0" }} , 
 	{ "name": "cols_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "q0" }} , 
 	{ "name": "cols_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols", "role": "we0" }} , 
 	{ "name": "cols_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "cols", "role": "address1" }} , 
 	{ "name": "cols_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols", "role": "ce1" }} , 
 	{ "name": "cols_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "d1" }} , 
 	{ "name": "cols_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "q1" }} , 
 	{ "name": "cols_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols", "role": "we1" }} , 
 	{ "name": "rows_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rows", "role": "address0" }} , 
 	{ "name": "rows_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows", "role": "ce0" }} , 
 	{ "name": "rows_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "d0" }} , 
 	{ "name": "rows_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "q0" }} , 
 	{ "name": "rows_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows", "role": "we0" }} , 
 	{ "name": "rows_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rows", "role": "address1" }} , 
 	{ "name": "rows_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows", "role": "ce1" }} , 
 	{ "name": "rows_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "d1" }} , 
 	{ "name": "rows_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "q1" }} , 
 	{ "name": "rows_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows", "role": "we1" }} , 
 	{ "name": "x_local_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "x_local", "role": "address0" }} , 
 	{ "name": "x_local_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_local", "role": "ce0" }} , 
 	{ "name": "x_local_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_local", "role": "d0" }} , 
 	{ "name": "x_local_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_local", "role": "q0" }} , 
 	{ "name": "x_local_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_local", "role": "we0" }} , 
 	{ "name": "x_local_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "x_local", "role": "address1" }} , 
 	{ "name": "x_local_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_local", "role": "ce1" }} , 
 	{ "name": "x_local_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_local", "role": "d1" }} , 
 	{ "name": "x_local_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_local", "role": "q1" }} , 
 	{ "name": "x_local_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_local", "role": "we1" }} , 
 	{ "name": "y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "y", "role": "address0" }} , 
 	{ "name": "y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "ce0" }} , 
 	{ "name": "y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "d0" }} , 
 	{ "name": "y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "q0" }} , 
 	{ "name": "y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "we0" }} , 
 	{ "name": "y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "y", "role": "address1" }} , 
 	{ "name": "y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "ce1" }} , 
 	{ "name": "y_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "d1" }} , 
 	{ "name": "y_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "q1" }} , 
 	{ "name": "y_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "we1" }} , 
 	{ "name": "row_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "row_size", "role": "default" }} , 
 	{ "name": "data_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_size", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "row_size_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "row_size", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "data_size_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "data_size", "role": "ap_vld" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "6", "10", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "spvm_kernel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_U0"},
			{"ID" : "4", "Name" : "spvm_kernel_Loop_VITIS_LOOP_35_2_proc3_U0"},
			{"ID" : "6", "Name" : "spvm_kernel_Loop_VITIS_LOOP_52_3_proc4_U0"}],
		"OutputProcess" : [
			{"ID" : "10", "Name" : "spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_U0"}],
		"Port" : [
			{"Name" : "values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "spvm_kernel_Loop_VITIS_LOOP_35_2_proc3_U0", "Port" : "values"}]},
			{"Name" : "cols", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "spvm_kernel_Loop_VITIS_LOOP_35_2_proc3_U0", "Port" : "cols"}]},
			{"Name" : "rows", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_U0", "Port" : "rows"}]},
			{"Name" : "x_local", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "spvm_kernel_Loop_VITIS_LOOP_52_3_proc4_U0", "Port" : "x_local"}]},
			{"Name" : "y", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_U0", "Port" : "y"}]},
			{"Name" : "row_size", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_size", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_U0", "Parent" : "0", "Child" : ["2"],
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
					{"ID" : "2", "SubInstance" : "grp_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1_fu_52", "Port" : "rows", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "rows_fifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["6"], "DependentChan" : "13", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1_fu_52", "Port" : "rows_fifo", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "row_size_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["10"], "DependentChan" : "14", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "row_size_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_U0.grp_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1_fu_52", "Parent" : "1", "Child" : ["3"],
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
	{"ID" : "3", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_U0.grp_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1_fu_52.flow_control_loop_pipe_sequential_init_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_35_2_proc3_U0", "Parent" : "0", "Child" : ["5"],
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
			{"Name" : "values_fifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["6"], "DependentChan" : "15", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "values_fifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cols", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cols_fifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["6"], "DependentChan" : "16", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "cols_fifo_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_35_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_35_2_proc3_U0.flow_control_loop_pipe_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_52_3_proc4_U0", "Parent" : "0", "Child" : ["7", "8", "9"],
		"CDFG" : "spvm_kernel_Loop_VITIS_LOOP_52_3_proc4",
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
			{"Name" : "values_fifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "15", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "values_fifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cols_fifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "16", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "cols_fifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "x_local", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rows_fifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "13", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rows_fifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "results_fifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["10"], "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "results_fifo_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_52_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_52_3_proc4_U0.fadd_32ns_32ns_32_5_full_dsp_1_U13", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_52_3_proc4_U0.fmul_32ns_32ns_32_4_max_dsp_1_U14", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_52_3_proc4_U0.flow_control_loop_pipe_U", "Parent" : "6"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_U0", "Parent" : "0", "Child" : ["11"],
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
		"StartSource" : "1",
		"StartFifo" : "start_for_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_U0_U",
		"Port" : [
			{"Name" : "row_size", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "14", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "row_size_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "results_fifo", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40", "Port" : "results_fifo", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "y", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40", "Port" : "y", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_U0.grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40", "Parent" : "10", "Child" : ["12"],
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
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_U0.grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rows_fifo_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.row_size_c_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.values_fifo_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cols_fifo_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.results_fifo_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	spvm_kernel {
		values {Type I LastRead 0 FirstWrite -1}
		cols {Type I LastRead 0 FirstWrite -1}
		rows {Type I LastRead 0 FirstWrite -1}
		x_local {Type I LastRead 2 FirstWrite -1}
		y {Type O LastRead -1 FirstWrite 1}
		row_size {Type I LastRead 0 FirstWrite -1}
		data_size {Type I LastRead 0 FirstWrite -1}}
	spvm_kernel_Loop_VITIS_LOOP_30_1_proc2 {
		row_size {Type I LastRead 0 FirstWrite -1}
		rows {Type I LastRead 0 FirstWrite -1}
		rows_fifo {Type O LastRead -1 FirstWrite 1}
		row_size_c {Type O LastRead -1 FirstWrite 0}}
	spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1 {
		row_size {Type I LastRead 0 FirstWrite -1}
		rows {Type I LastRead 0 FirstWrite -1}
		rows_fifo {Type O LastRead -1 FirstWrite 1}}
	spvm_kernel_Loop_VITIS_LOOP_35_2_proc3 {
		data_size {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 0 FirstWrite -1}
		values_fifo {Type O LastRead -1 FirstWrite 1}
		cols {Type I LastRead 0 FirstWrite -1}
		cols_fifo {Type O LastRead -1 FirstWrite 1}}
	spvm_kernel_Loop_VITIS_LOOP_52_3_proc4 {
		data_size {Type I LastRead 0 FirstWrite -1}
		values_fifo {Type I LastRead 1 FirstWrite -1}
		cols_fifo {Type I LastRead 1 FirstWrite -1}
		x_local {Type I LastRead 2 FirstWrite -1}
		rows_fifo {Type I LastRead 6 FirstWrite -1}
		results_fifo {Type O LastRead -1 FirstWrite 12}}
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
	values { ap_memory {  { values_address0 mem_address 1 4 }  { values_ce0 mem_ce 1 1 }  { values_d0 mem_din 1 32 }  { values_q0 mem_dout 0 32 }  { values_we0 mem_we 1 1 }  { values_address1 mem_address 1 4 }  { values_ce1 mem_ce 1 1 }  { values_d1 mem_din 1 32 }  { values_q1 mem_dout 0 32 }  { values_we1 mem_we 1 1 } } }
	cols { ap_memory {  { cols_address0 mem_address 1 4 }  { cols_ce0 mem_ce 1 1 }  { cols_d0 mem_din 1 32 }  { cols_q0 mem_dout 0 32 }  { cols_we0 mem_we 1 1 }  { cols_address1 mem_address 1 4 }  { cols_ce1 mem_ce 1 1 }  { cols_d1 mem_din 1 32 }  { cols_q1 mem_dout 0 32 }  { cols_we1 mem_we 1 1 } } }
	rows { ap_memory {  { rows_address0 mem_address 1 2 }  { rows_ce0 mem_ce 1 1 }  { rows_d0 mem_din 1 32 }  { rows_q0 mem_dout 0 32 }  { rows_we0 mem_we 1 1 }  { rows_address1 mem_address 1 2 }  { rows_ce1 mem_ce 1 1 }  { rows_d1 mem_din 1 32 }  { rows_q1 mem_dout 0 32 }  { rows_we1 mem_we 1 1 } } }
	x_local { ap_memory {  { x_local_address0 mem_address 1 2 }  { x_local_ce0 mem_ce 1 1 }  { x_local_d0 mem_din 1 32 }  { x_local_q0 mem_dout 0 32 }  { x_local_we0 mem_we 1 1 }  { x_local_address1 mem_address 1 2 }  { x_local_ce1 mem_ce 1 1 }  { x_local_d1 mem_din 1 32 }  { x_local_q1 mem_dout 0 32 }  { x_local_we1 mem_we 1 1 } } }
	y { ap_memory {  { y_address0 mem_address 1 2 }  { y_ce0 mem_ce 1 1 }  { y_d0 mem_din 1 32 }  { y_q0 mem_dout 0 32 }  { y_we0 mem_we 1 1 }  { y_address1 mem_address 1 2 }  { y_ce1 mem_ce 1 1 }  { y_d1 mem_din 1 32 }  { y_q1 mem_dout 0 32 }  { y_we1 mem_we 1 1 } } }
	row_size { ap_none {  { row_size in_data 0 32 }  { row_size_ap_vld in_vld 0 1 } } }
	data_size { ap_none {  { data_size in_data 0 32 }  { data_size_ap_vld in_vld 0 1 } } }
}
