set SynModuleInfo {
  {SRCNAME spmv_Pipeline_L2 MODELNAME spmv_Pipeline_L2 RTLNAME spmv_spmv_Pipeline_L2
    SUBMODULES {
      {MODELNAME spmv_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME spmv_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME spmv_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME spmv_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME spmv MODELNAME spmv RTLNAME spmv IS_TOP 1
    SUBMODULES {
      {MODELNAME spmv_control_s_axi RTLNAME spmv_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
