set moduleName spmv_Pipeline_L2
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
set C_modelName {spmv_Pipeline_L2}
set C_modelType { int 3 }
set C_modelArgList {
	{ sext_ln18 int 32 regular  }
	{ sext_ln18_1 int 32 regular  }
	{ values int 32 regular {array 9 { 1 } 1 1 }  }
	{ columnIndex int 32 regular {array 9 { 1 } 1 1 }  }
	{ x int 32 regular {array 4 { 1 } 1 1 }  }
	{ y0_0_out float 32 regular {pointer 1}  }
	{ y0_1_6_out float 32 regular {pointer 1}  }
	{ y0_1_5_out float 32 regular {pointer 1}  }
	{ y0_1_4_out float 32 regular {pointer 1}  }
	{ y0_1_3_out float 32 regular {pointer 1}  }
	{ y0_1_2_out float 32 regular {pointer 1}  }
	{ y0_1_1_out float 32 regular {pointer 1}  }
	{ y0_1_out float 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln18", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln18_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "values", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "columnIndex", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "y0_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y0_1_6_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y0_1_5_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y0_1_4_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y0_1_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y0_1_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y0_1_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y0_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 3} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln18 sc_in sc_lv 32 signal 0 } 
	{ sext_ln18_1 sc_in sc_lv 32 signal 1 } 
	{ values_address0 sc_out sc_lv 4 signal 2 } 
	{ values_ce0 sc_out sc_logic 1 signal 2 } 
	{ values_q0 sc_in sc_lv 32 signal 2 } 
	{ columnIndex_address0 sc_out sc_lv 4 signal 3 } 
	{ columnIndex_ce0 sc_out sc_logic 1 signal 3 } 
	{ columnIndex_q0 sc_in sc_lv 32 signal 3 } 
	{ x_address0 sc_out sc_lv 2 signal 4 } 
	{ x_ce0 sc_out sc_logic 1 signal 4 } 
	{ x_q0 sc_in sc_lv 32 signal 4 } 
	{ y0_0_out sc_out sc_lv 32 signal 5 } 
	{ y0_0_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ y0_1_6_out sc_out sc_lv 32 signal 6 } 
	{ y0_1_6_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ y0_1_5_out sc_out sc_lv 32 signal 7 } 
	{ y0_1_5_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ y0_1_4_out sc_out sc_lv 32 signal 8 } 
	{ y0_1_4_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ y0_1_3_out sc_out sc_lv 32 signal 9 } 
	{ y0_1_3_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ y0_1_2_out sc_out sc_lv 32 signal 10 } 
	{ y0_1_2_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ y0_1_1_out sc_out sc_lv 32 signal 11 } 
	{ y0_1_1_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ y0_1_out sc_out sc_lv 32 signal 12 } 
	{ y0_1_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ ap_return sc_out sc_lv 3 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln18", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln18", "role": "default" }} , 
 	{ "name": "sext_ln18_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln18_1", "role": "default" }} , 
 	{ "name": "values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "values", "role": "address0" }} , 
 	{ "name": "values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values", "role": "ce0" }} , 
 	{ "name": "values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "values", "role": "q0" }} , 
 	{ "name": "columnIndex_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "columnIndex", "role": "address0" }} , 
 	{ "name": "columnIndex_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "columnIndex", "role": "ce0" }} , 
 	{ "name": "columnIndex_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "columnIndex", "role": "q0" }} , 
 	{ "name": "x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "x", "role": "address0" }} , 
 	{ "name": "x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "ce0" }} , 
 	{ "name": "x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x", "role": "q0" }} , 
 	{ "name": "y0_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y0_0_out", "role": "default" }} , 
 	{ "name": "y0_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "y0_0_out", "role": "ap_vld" }} , 
 	{ "name": "y0_1_6_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y0_1_6_out", "role": "default" }} , 
 	{ "name": "y0_1_6_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "y0_1_6_out", "role": "ap_vld" }} , 
 	{ "name": "y0_1_5_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y0_1_5_out", "role": "default" }} , 
 	{ "name": "y0_1_5_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "y0_1_5_out", "role": "ap_vld" }} , 
 	{ "name": "y0_1_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y0_1_4_out", "role": "default" }} , 
 	{ "name": "y0_1_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "y0_1_4_out", "role": "ap_vld" }} , 
 	{ "name": "y0_1_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y0_1_3_out", "role": "default" }} , 
 	{ "name": "y0_1_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "y0_1_3_out", "role": "ap_vld" }} , 
 	{ "name": "y0_1_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y0_1_2_out", "role": "default" }} , 
 	{ "name": "y0_1_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "y0_1_2_out", "role": "ap_vld" }} , 
 	{ "name": "y0_1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y0_1_1_out", "role": "default" }} , 
 	{ "name": "y0_1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "y0_1_1_out", "role": "ap_vld" }} , 
 	{ "name": "y0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y0_1_out", "role": "default" }} , 
 	{ "name": "y0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "y0_1_out", "role": "ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "spmv_Pipeline_L2",
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
			{"Name" : "sext_ln18", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln18_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndex", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "y0_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "y0_1_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "y0_1_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "y0_1_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "y0_1_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "y0_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "y0_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "y0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "L2", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "50", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage7", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage7_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "PostState" : ["ap_ST_fsm_state50", "ap_ST_fsm_state51", "ap_ST_fsm_state52", "ap_ST_fsm_state53", "ap_ST_fsm_state54", "ap_ST_fsm_state55", "ap_ST_fsm_state56", "ap_ST_fsm_state57"]}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U2", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	spmv_Pipeline_L2 {
		sext_ln18 {Type I LastRead 0 FirstWrite -1}
		sext_ln18_1 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 8 FirstWrite -1}
		columnIndex {Type I LastRead 8 FirstWrite -1}
		x {Type I LastRead 9 FirstWrite -1}
		y0_0_out {Type O LastRead -1 FirstWrite 2}
		y0_1_6_out {Type O LastRead -1 FirstWrite 43}
		y0_1_5_out {Type O LastRead -1 FirstWrite 38}
		y0_1_4_out {Type O LastRead -1 FirstWrite 33}
		y0_1_3_out {Type O LastRead -1 FirstWrite 28}
		y0_1_2_out {Type O LastRead -1 FirstWrite 23}
		y0_1_1_out {Type O LastRead -1 FirstWrite 18}
		y0_1_out {Type O LastRead -1 FirstWrite 13}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln18 { ap_none {  { sext_ln18 in_data 0 32 } } }
	sext_ln18_1 { ap_none {  { sext_ln18_1 in_data 0 32 } } }
	values { ap_memory {  { values_address0 mem_address 1 4 }  { values_ce0 mem_ce 1 1 }  { values_q0 mem_dout 0 32 } } }
	columnIndex { ap_memory {  { columnIndex_address0 mem_address 1 4 }  { columnIndex_ce0 mem_ce 1 1 }  { columnIndex_q0 in_data 0 32 } } }
	x { ap_memory {  { x_address0 mem_address 1 2 }  { x_ce0 mem_ce 1 1 }  { x_q0 mem_dout 0 32 } } }
	y0_0_out { ap_vld {  { y0_0_out out_data 1 32 }  { y0_0_out_ap_vld out_vld 1 1 } } }
	y0_1_6_out { ap_vld {  { y0_1_6_out out_data 1 32 }  { y0_1_6_out_ap_vld out_vld 1 1 } } }
	y0_1_5_out { ap_vld {  { y0_1_5_out out_data 1 32 }  { y0_1_5_out_ap_vld out_vld 1 1 } } }
	y0_1_4_out { ap_vld {  { y0_1_4_out out_data 1 32 }  { y0_1_4_out_ap_vld out_vld 1 1 } } }
	y0_1_3_out { ap_vld {  { y0_1_3_out out_data 1 32 }  { y0_1_3_out_ap_vld out_vld 1 1 } } }
	y0_1_2_out { ap_vld {  { y0_1_2_out out_data 1 32 }  { y0_1_2_out_ap_vld out_vld 1 1 } } }
	y0_1_1_out { ap_vld {  { y0_1_1_out out_data 1 32 }  { y0_1_1_out_ap_vld out_vld 1 1 } } }
	y0_1_out { ap_vld {  { y0_1_out out_data 1 32 }  { y0_1_out_ap_vld out_vld 1 1 } } }
}
