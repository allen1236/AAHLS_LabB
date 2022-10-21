// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      spmv_accel
`define AUTOTB_DUT_INST AESL_inst_spmv_accel
`define AUTOTB_TOP      apatb_spmv_accel_top
`define AUTOTB_LAT_RESULT_FILE "spmv_accel.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "spmv_accel.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_spmv_accel_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00

`define AESL_MEM_values AESL_automem_values
`define AESL_MEM_INST_values mem_inst_values
`define AESL_MEM_cols AESL_automem_cols
`define AESL_MEM_INST_cols mem_inst_cols
`define AESL_MEM_rows AESL_automem_rows
`define AESL_MEM_INST_rows mem_inst_rows
`define AESL_MEM_x AESL_automem_x
`define AESL_MEM_INST_x mem_inst_x
`define AESL_MEM_y AESL_automem_y
`define AESL_MEM_INST_y mem_inst_y
`define AESL_DEPTH_row_size 1
`define AESL_DEPTH_col_size 1
`define AESL_DEPTH_data_size 1
`define AUTOTB_TVIN_values  "../tv/cdatafile/c.spmv_accel.autotvin_values.dat"
`define AUTOTB_TVIN_cols  "../tv/cdatafile/c.spmv_accel.autotvin_cols.dat"
`define AUTOTB_TVIN_rows  "../tv/cdatafile/c.spmv_accel.autotvin_rows.dat"
`define AUTOTB_TVIN_x  "../tv/cdatafile/c.spmv_accel.autotvin_x.dat"
`define AUTOTB_TVIN_y  "../tv/cdatafile/c.spmv_accel.autotvin_y.dat"
`define AUTOTB_TVIN_row_size  "../tv/cdatafile/c.spmv_accel.autotvin_row_size.dat"
`define AUTOTB_TVIN_col_size  "../tv/cdatafile/c.spmv_accel.autotvin_col_size.dat"
`define AUTOTB_TVIN_data_size  "../tv/cdatafile/c.spmv_accel.autotvin_data_size.dat"
`define AUTOTB_TVIN_values_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvin_values.dat"
`define AUTOTB_TVIN_cols_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvin_cols.dat"
`define AUTOTB_TVIN_rows_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvin_rows.dat"
`define AUTOTB_TVIN_x_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvin_x.dat"
`define AUTOTB_TVIN_y_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvin_y.dat"
`define AUTOTB_TVIN_row_size_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvin_row_size.dat"
`define AUTOTB_TVIN_col_size_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvin_col_size.dat"
`define AUTOTB_TVIN_data_size_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvin_data_size.dat"
`define AUTOTB_TVOUT_y  "../tv/cdatafile/c.spmv_accel.autotvout_y.dat"
`define AUTOTB_TVOUT_ap_return  "../tv/cdatafile/c.spmv_accel.autotvout_ap_return.dat"
`define AUTOTB_TVOUT_y_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvout_y.dat"
`define AUTOTB_TVOUT_ap_return_out_wrapc  "../tv/rtldatafile/rtl.spmv_accel.autotvout_ap_return.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 1;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = -1;
parameter LENGTH_values = 9;
parameter LENGTH_cols = 9;
parameter LENGTH_rows = 4;
parameter LENGTH_x = 4;
parameter LENGTH_y = 4;
parameter LENGTH_row_size = 1;
parameter LENGTH_col_size = 1;
parameter LENGTH_data_size = 1;
parameter LENGTH_ap_return = 1;

task read_token;
    input integer fp;
    output reg [143 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

reg AESL_clock;
reg rst;
reg dut_rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [3 : 0] values_address0;
wire  values_ce0;
wire [31 : 0] values_q0;
wire [3 : 0] cols_address0;
wire  cols_ce0;
wire [31 : 0] cols_q0;
wire [1 : 0] rows_address0;
wire  rows_ce0;
wire [31 : 0] rows_q0;
wire [1 : 0] x_address0;
wire  x_ce0;
wire [31 : 0] x_q0;
wire [1 : 0] y_address0;
wire  y_ce0;
wire  y_we0;
wire [31 : 0] y_d0;
wire [31 : 0] row_size;
wire [31 : 0] col_size;
wire [31 : 0] data_size;
wire [31 : 0] ap_return;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;


wire ap_clk;
wire ap_rst;
wire ap_rst_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .values_address0(values_address0),
    .values_ce0(values_ce0),
    .values_q0(values_q0),
    .cols_address0(cols_address0),
    .cols_ce0(cols_ce0),
    .cols_q0(cols_q0),
    .rows_address0(rows_address0),
    .rows_ce0(rows_ce0),
    .rows_q0(rows_q0),
    .x_address0(x_address0),
    .x_ce0(x_ce0),
    .x_q0(x_q0),
    .y_address0(y_address0),
    .y_ce0(y_ce0),
    .y_we0(y_we0),
    .y_d0(y_d0),
    .row_size(row_size),
    .col_size(col_size),
    .data_size(data_size),
    .ap_return(ap_return));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst = dut_rst;
assign ap_rst_n = ~dut_rst;
assign AESL_reset = rst;
assign ap_start = AESL_start;
assign AESL_start = start;
assign AESL_done = ap_done;
assign AESL_idle = ap_idle;
assign AESL_ready = ap_ready;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_done !== 1 && AESL_done !== 0) begin
                $display("ERROR: Control signal AESL_done is invalid!");
                $finish;
            end
        end
    end
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_ready !== 1 && AESL_ready !== 0) begin
                $display("ERROR: Control signal AESL_ready is invalid!");
                $finish;
            end
        end
    end
//------------------------arrayvalues Instantiation--------------

// The input and output of arrayvalues
wire    arrayvalues_ce0, arrayvalues_ce1;
wire [4 - 1 : 0]    arrayvalues_we0, arrayvalues_we1;
wire    [3 : 0]    arrayvalues_address0, arrayvalues_address1;
wire    [31 : 0]    arrayvalues_din0, arrayvalues_din1;
wire    [31 : 0]    arrayvalues_dout0, arrayvalues_dout1;
wire    arrayvalues_ready;
wire    arrayvalues_done;

`AESL_MEM_values `AESL_MEM_INST_values(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayvalues_ce0),
    .we0        (arrayvalues_we0),
    .address0   (arrayvalues_address0),
    .din0       (arrayvalues_din0),
    .dout0      (arrayvalues_dout0),
    .ce1        (arrayvalues_ce1),
    .we1        (arrayvalues_we1),
    .address1   (arrayvalues_address1),
    .din1       (arrayvalues_din1),
    .dout1      (arrayvalues_dout1),
    .ready      (arrayvalues_ready),
    .done    (arrayvalues_done)
);

// Assignment between dut and arrayvalues
assign arrayvalues_address0 = values_address0;
assign arrayvalues_ce0 = values_ce0;
assign values_q0 = arrayvalues_dout0;
assign arrayvalues_we0 = 0;
assign arrayvalues_din0 = 0;
assign arrayvalues_we1 = 0;
assign arrayvalues_din1 = 0;
assign arrayvalues_ready=    ready;
assign arrayvalues_done = 0;


//------------------------arraycols Instantiation--------------

// The input and output of arraycols
wire    arraycols_ce0, arraycols_ce1;
wire [4 - 1 : 0]    arraycols_we0, arraycols_we1;
wire    [3 : 0]    arraycols_address0, arraycols_address1;
wire    [31 : 0]    arraycols_din0, arraycols_din1;
wire    [31 : 0]    arraycols_dout0, arraycols_dout1;
wire    arraycols_ready;
wire    arraycols_done;

`AESL_MEM_cols `AESL_MEM_INST_cols(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arraycols_ce0),
    .we0        (arraycols_we0),
    .address0   (arraycols_address0),
    .din0       (arraycols_din0),
    .dout0      (arraycols_dout0),
    .ce1        (arraycols_ce1),
    .we1        (arraycols_we1),
    .address1   (arraycols_address1),
    .din1       (arraycols_din1),
    .dout1      (arraycols_dout1),
    .ready      (arraycols_ready),
    .done    (arraycols_done)
);

// Assignment between dut and arraycols
assign arraycols_address0 = cols_address0;
assign arraycols_ce0 = cols_ce0;
assign cols_q0 = arraycols_dout0;
assign arraycols_we0 = 0;
assign arraycols_din0 = 0;
assign arraycols_we1 = 0;
assign arraycols_din1 = 0;
assign arraycols_ready=    ready;
assign arraycols_done = 0;


//------------------------arrayrows Instantiation--------------

// The input and output of arrayrows
wire    arrayrows_ce0, arrayrows_ce1;
wire [4 - 1 : 0]    arrayrows_we0, arrayrows_we1;
wire    [1 : 0]    arrayrows_address0, arrayrows_address1;
wire    [31 : 0]    arrayrows_din0, arrayrows_din1;
wire    [31 : 0]    arrayrows_dout0, arrayrows_dout1;
wire    arrayrows_ready;
wire    arrayrows_done;

`AESL_MEM_rows `AESL_MEM_INST_rows(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayrows_ce0),
    .we0        (arrayrows_we0),
    .address0   (arrayrows_address0),
    .din0       (arrayrows_din0),
    .dout0      (arrayrows_dout0),
    .ce1        (arrayrows_ce1),
    .we1        (arrayrows_we1),
    .address1   (arrayrows_address1),
    .din1       (arrayrows_din1),
    .dout1      (arrayrows_dout1),
    .ready      (arrayrows_ready),
    .done    (arrayrows_done)
);

// Assignment between dut and arrayrows
assign arrayrows_address0 = rows_address0;
assign arrayrows_ce0 = rows_ce0;
assign rows_q0 = arrayrows_dout0;
assign arrayrows_we0 = 0;
assign arrayrows_din0 = 0;
assign arrayrows_we1 = 0;
assign arrayrows_din1 = 0;
assign arrayrows_ready=    ready;
assign arrayrows_done = 0;


//------------------------arrayx Instantiation--------------

// The input and output of arrayx
wire    arrayx_ce0, arrayx_ce1;
wire [4 - 1 : 0]    arrayx_we0, arrayx_we1;
wire    [1 : 0]    arrayx_address0, arrayx_address1;
wire    [31 : 0]    arrayx_din0, arrayx_din1;
wire    [31 : 0]    arrayx_dout0, arrayx_dout1;
wire    arrayx_ready;
wire    arrayx_done;

`AESL_MEM_x `AESL_MEM_INST_x(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayx_ce0),
    .we0        (arrayx_we0),
    .address0   (arrayx_address0),
    .din0       (arrayx_din0),
    .dout0      (arrayx_dout0),
    .ce1        (arrayx_ce1),
    .we1        (arrayx_we1),
    .address1   (arrayx_address1),
    .din1       (arrayx_din1),
    .dout1      (arrayx_dout1),
    .ready      (arrayx_ready),
    .done    (arrayx_done)
);

// Assignment between dut and arrayx
assign arrayx_address0 = x_address0;
assign arrayx_ce0 = x_ce0;
assign x_q0 = arrayx_dout0;
assign arrayx_we0 = 0;
assign arrayx_din0 = 0;
assign arrayx_we1 = 0;
assign arrayx_din1 = 0;
assign arrayx_ready=    ready;
assign arrayx_done = 0;


//------------------------arrayy Instantiation--------------

// The input and output of arrayy
wire    arrayy_ce0, arrayy_ce1;
wire [4 - 1 : 0]    arrayy_we0, arrayy_we1;
wire    [1 : 0]    arrayy_address0, arrayy_address1;
wire    [31 : 0]    arrayy_din0, arrayy_din1;
wire    [31 : 0]    arrayy_dout0, arrayy_dout1;
wire    arrayy_ready;
wire    arrayy_done;

`AESL_MEM_y `AESL_MEM_INST_y(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayy_ce0),
    .we0        (arrayy_we0),
    .address0   (arrayy_address0),
    .din0       (arrayy_din0),
    .dout0      (arrayy_dout0),
    .ce1        (arrayy_ce1),
    .we1        (arrayy_we1),
    .address1   (arrayy_address1),
    .din1       (arrayy_din1),
    .dout1      (arrayy_dout1),
    .ready      (arrayy_ready),
    .done    (arrayy_done)
);

// Assignment between dut and arrayy
assign arrayy_address0 = y_address0;
assign arrayy_ce0 = y_ce0;
assign arrayy_we0[0] = y_we0;
assign arrayy_we0[1] = y_we0;
assign arrayy_we0[2] = y_we0;
assign arrayy_we0[3] = y_we0;
assign arrayy_din0 = y_d0;
assign arrayy_we1 = 0;
assign arrayy_din1 = 0;
assign arrayy_ready= ready_initial | arrayy_done;
assign arrayy_done =    AESL_done_delay;


// The signal of port row_size
reg [31: 0] AESL_REG_row_size = 0;
assign row_size = AESL_REG_row_size;
initial begin : read_file_process_row_size
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [143  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_row_size,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_row_size);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_row_size);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port col_size
reg [31: 0] AESL_REG_col_size = 0;
assign col_size = AESL_REG_col_size;
initial begin : read_file_process_col_size
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [143  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_col_size,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_col_size);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_col_size);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port data_size
reg [31: 0] AESL_REG_data_size = 0;
assign data_size = AESL_REG_data_size;
initial begin : read_file_process_data_size
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [143  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_data_size,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_data_size);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_data_size);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


initial begin : write_file_process_ap_return
    integer fp;
    integer fp_size;
    integer err;
    integer ret;
    integer i;
    integer hls_stream_size;
    integer proc_rand;
    integer ap_return_count;
    reg [143:0] token;
    integer transaction_idx;
    reg [8 * 5:1] str;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVOUT_ap_return_out_wrapc,"w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_ap_return_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    transaction_idx = 0;
    while (transaction_idx != AUTOTB_TRANSACTION_NUM) begin
        @(posedge AESL_clock);
          while(AESL_done !== 1) begin
              @(posedge AESL_clock);
          end
        $fdisplay(fp,"[[transaction]] %d", transaction_idx);
          $fdisplay(fp,"0x%x", ap_return);
    transaction_idx = transaction_idx + 1;
      $fdisplay(fp,"[[/transaction]]");
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 0);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 0);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        repeat(6) @ (posedge AESL_clock);
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_values;
reg [31:0] size_values;
reg [31:0] size_values_backup;
reg end_cols;
reg [31:0] size_cols;
reg [31:0] size_cols_backup;
reg end_rows;
reg [31:0] size_rows;
reg [31:0] size_rows_backup;
reg end_x;
reg [31:0] size_x;
reg [31:0] size_x_backup;
reg end_y;
reg [31:0] size_y;
reg [31:0] size_y_backup;
reg end_row_size;
reg [31:0] size_row_size;
reg [31:0] size_row_size_backup;
reg end_col_size;
reg [31:0] size_col_size;
reg [31:0] size_col_size_backup;
reg end_data_size;
reg [31:0] size_data_size;
reg [31:0] size_data_size_backup;
reg end_ap_return;
reg [31:0] size_ap_return;
reg [31:0] size_ap_return_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 1;
    # 100;
    repeat(0+3) @ (posedge AESL_clock);
    rst = 0;
end
initial begin : initial_process_for_dut_rst
    integer proc_rand;
    dut_rst = 1;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    dut_rst = 0;
end
initial begin : start_process
    integer proc_rand;
    start = 0;
    ce = 1;
    wait(AESL_reset === 0);
    @ (posedge AESL_clock);
    while (1) begin
        if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
        #0 start = 1;
        end
        @ (posedge AESL_clock);
        while (AESL_ready !== 1) begin
            @ (posedge AESL_clock);
        end
        if (AESL_done !== 1) begin
            #0 start = 0;
            while (AESL_done !== 1) begin
                @ (posedge AESL_clock);
            end
            @ (posedge AESL_clock);
        end
        #0 start = 0;
        @ (negedge AESL_clock);
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

assign ready = (ready_initial | AESL_done_delay);
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready_wire = (ready_initial | AESL_done_delay);
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
task write_binary;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;

reg dump_tvout_finish_y;

initial begin : dump_tvout_runtime_sign_y
    integer fp;
    dump_tvout_finish_y = 0;
    fp = $fopen(`AUTOTB_TVOUT_y_out_wrapc, "wb");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_y_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    repeat(5) @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_y_out_wrapc, "ab");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_y_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    write_binary(fp,64'h5a5aa5a50f0ff0f0,64);
    $fclose(fp);
    repeat(5) @ (posedge AESL_clock);
    dump_tvout_finish_y = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    if (AESL_reset == 1) begin
        clk_cnt <= 32'h0;
        AESL_ready_p1 <= 1'b0;
        AESL_start_p1 <= 1'b0;
    end
    else begin
        clk_cnt <= clk_cnt + 1;
        AESL_ready_p1 <= AESL_ready;
        AESL_start_p1 <= AESL_start;
    end
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
reg [31:0] lat_total;
event report_progress;

always @(posedge AESL_clock)
begin
    if (finish_cnt == AUTOTB_TRANSACTION_NUM - 1 && AESL_done == 1'b1)
        lat_total = clk_cnt - start_timestamp[0];
end

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 0);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 0);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    reg [31:0] total_execute_time;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;
        total_execute_time = lat_total;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);
        $fdisplay(fp, "$TOTAL_EXECUTE_TIME = \"%0d\"", total_execute_time);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif

AESL_deadlock_detector deadlock_detector(
    .dl_reset(~AESL_reset),
    .all_finish(all_finish),
    .dl_clock(AESL_clock));

///////////////////////////////////////////////////////
// dataflow status monitor
///////////////////////////////////////////////////////
dataflow_monitor U_dataflow_monitor(
    .clock(AESL_clock),
    .reset(rst),
    .finish(all_finish));

`include "fifo_para.vh"

endmodule
