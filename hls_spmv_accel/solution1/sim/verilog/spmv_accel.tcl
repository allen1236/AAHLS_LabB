
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $coutputgroup]
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/ap_return -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/y_d0 -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/y_we0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/y_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/y_address0 -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $cinputgroup]
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/data_size -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/col_size -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/row_size -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/x_q0 -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/x_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/x_address0 -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/rows_q0 -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/rows_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/rows_address0 -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/cols_q0 -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/cols_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/cols_address0 -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/values_q0 -into $return_group -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/values_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/values_address0 -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/ap_start -into $blocksiggroup
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/ap_done -into $blocksiggroup
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/ap_idle -into $blocksiggroup
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_spmv_accel_top/AESL_inst_spmv_accel/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_spmv_accel_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_spmv_accel_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_spmv_accel_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_spmv_accel_top/LENGTH_values -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_accel_top/LENGTH_cols -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_accel_top/LENGTH_rows -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_accel_top/LENGTH_x -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_accel_top/LENGTH_y -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_accel_top/LENGTH_row_size -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_accel_top/LENGTH_col_size -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_accel_top/LENGTH_data_size -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_accel_top/LENGTH_ap_return -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(memory) -into $tbcoutputgroup]
add_wave /apatb_spmv_accel_top/ap_return -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/y_d0 -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/y_we0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/y_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/y_address0 -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(memory) -into $tbcinputgroup]
add_wave /apatb_spmv_accel_top/data_size -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/col_size -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/row_size -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/x_q0 -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/x_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/x_address0 -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/rows_q0 -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/rows_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/rows_address0 -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/cols_q0 -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/cols_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/cols_address0 -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/values_q0 -into $tb_return_group -radix hex
add_wave /apatb_spmv_accel_top/values_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_accel_top/values_address0 -into $tb_return_group -radix hex
save_wave_config spmv_accel.wcfg
run all

