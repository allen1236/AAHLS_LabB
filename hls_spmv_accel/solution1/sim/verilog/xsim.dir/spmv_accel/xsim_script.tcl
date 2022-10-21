set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {spmv_accel} -view {{spmv_accel_dataflow_ana.wcfg}} -tclbatch {spmv_accel.tcl} -protoinst {spmv_accel.protoinst}
