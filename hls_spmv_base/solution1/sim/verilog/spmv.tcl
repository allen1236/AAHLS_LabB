
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set rowPtr__columnIndex__values__y__x__return_group [add_wave_group rowPtr__columnIndex__values__y__x__return(axi_slave) -into $cinoutgroup]
add_wave /apatb_spmv_top/AESL_inst_spmv/interrupt -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_BRESP -into $rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_BREADY -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_BVALID -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_RRESP -into $rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_RDATA -into $rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_RREADY -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_RVALID -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_ARREADY -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_ARVALID -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_ARADDR -into $rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_WSTRB -into $rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_WDATA -into $rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_WREADY -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_WVALID -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_AWREADY -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_AWVALID -into $rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/AESL_inst_spmv/s_axi_control_AWADDR -into $rowPtr__columnIndex__values__y__x__return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake(internal)" -into $designtopgroup]
add_wave /apatb_spmv_top/AESL_inst_spmv/ap_done -into $blocksiggroup
add_wave /apatb_spmv_top/AESL_inst_spmv/ap_idle -into $blocksiggroup
add_wave /apatb_spmv_top/AESL_inst_spmv/ap_ready -into $blocksiggroup
add_wave /apatb_spmv_top/AESL_inst_spmv/ap_start -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_spmv_top/AESL_inst_spmv/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_spmv_top/AESL_inst_spmv/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_spmv_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_spmv_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_spmv_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_spmv_top/LENGTH_rowPtr -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_top/LENGTH_columnIndex -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_top/LENGTH_values -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_top/LENGTH_y -into $tb_portdepth_group -radix hex
add_wave /apatb_spmv_top/LENGTH_x -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_rowPtr__columnIndex__values__y__x__return_group [add_wave_group rowPtr__columnIndex__values__y__x__return(axi_slave) -into $tbcinoutgroup]
add_wave /apatb_spmv_top/control_INTERRUPT -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_BRESP -into $tb_rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/control_BREADY -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_BVALID -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_RRESP -into $tb_rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/control_RDATA -into $tb_rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/control_RREADY -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_RVALID -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_ARREADY -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_ARVALID -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_ARADDR -into $tb_rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/control_WSTRB -into $tb_rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/control_WDATA -into $tb_rowPtr__columnIndex__values__y__x__return_group -radix hex
add_wave /apatb_spmv_top/control_WREADY -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_WVALID -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_AWREADY -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_AWVALID -into $tb_rowPtr__columnIndex__values__y__x__return_group -color #ffff00 -radix hex
add_wave /apatb_spmv_top/control_AWADDR -into $tb_rowPtr__columnIndex__values__y__x__return_group -radix hex
save_wave_config spmv.wcfg
run all

