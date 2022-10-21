set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {spmv} -view {{spmv_dataflow_ana.wcfg}} -tclbatch {spmv.tcl} -protoinst {spmv.protoinst}
