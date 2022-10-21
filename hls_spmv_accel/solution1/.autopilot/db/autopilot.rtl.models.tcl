set SynModuleInfo {
  {SRCNAME spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1 MODELNAME spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1 RTLNAME spmv_accel_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2_Pipeline_VITIS_LOOP_30_1
    SUBMODULES {
      {MODELNAME spmv_accel_flow_control_loop_pipe_sequential_init RTLNAME spmv_accel_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME spmv_accel_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME spvm_kernel_Loop_VITIS_LOOP_30_1_proc2 MODELNAME spvm_kernel_Loop_VITIS_LOOP_30_1_proc2 RTLNAME spmv_accel_spvm_kernel_Loop_VITIS_LOOP_30_1_proc2}
  {SRCNAME spvm_kernel_Loop_VITIS_LOOP_35_2_proc3 MODELNAME spvm_kernel_Loop_VITIS_LOOP_35_2_proc3 RTLNAME spmv_accel_spvm_kernel_Loop_VITIS_LOOP_35_2_proc3
    SUBMODULES {
      {MODELNAME spmv_accel_flow_control_loop_pipe RTLNAME spmv_accel_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME spmv_accel_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME spvm_kernel_Loop_VITIS_LOOP_52_3_proc4 MODELNAME spvm_kernel_Loop_VITIS_LOOP_52_3_proc4 RTLNAME spmv_accel_spvm_kernel_Loop_VITIS_LOOP_52_3_proc4
    SUBMODULES {
      {MODELNAME spmv_accel_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME spmv_accel_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME spmv_accel_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME spmv_accel_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4 MODELNAME spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4 RTLNAME spmv_accel_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4}
  {SRCNAME spvm_kernel_Loop_VITIS_LOOP_70_4_proc5 MODELNAME spvm_kernel_Loop_VITIS_LOOP_70_4_proc5 RTLNAME spmv_accel_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5}
  {SRCNAME spvm_kernel MODELNAME spvm_kernel RTLNAME spmv_accel_spvm_kernel
    SUBMODULES {
      {MODELNAME spmv_accel_fifo_w32_d2_S RTLNAME spmv_accel_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME spmv_accel_fifo_w32_d3_S RTLNAME spmv_accel_fifo_w32_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME spmv_accel_start_for_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_U0 RTLNAME spmv_accel_start_for_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
  {SRCNAME spmv_accel MODELNAME spmv_accel RTLNAME spmv_accel IS_TOP 1
    SUBMODULES {
      {MODELNAME spmv_accel_x_local_RAM_AUTO_1R1W RTLNAME spmv_accel_x_local_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
