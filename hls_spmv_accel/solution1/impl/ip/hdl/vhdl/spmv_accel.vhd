-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity spmv_accel is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    values_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    values_ce0 : OUT STD_LOGIC;
    values_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    cols_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    cols_ce0 : OUT STD_LOGIC;
    cols_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    rows_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
    rows_ce0 : OUT STD_LOGIC;
    rows_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    x_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
    x_ce0 : OUT STD_LOGIC;
    x_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    y_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
    y_ce0 : OUT STD_LOGIC;
    y_we0 : OUT STD_LOGIC;
    y_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    row_size : IN STD_LOGIC_VECTOR (31 downto 0);
    col_size : IN STD_LOGIC_VECTOR (31 downto 0);
    data_size : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of spmv_accel is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "spmv_accel_spmv_accel,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.256000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=1401,HLS_SYN_LUT=2007,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal zext_ln103_fu_135_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln103_reg_175 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln103_fu_124_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state2 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal x_local_address0 : STD_LOGIC_VECTOR (1 downto 0);
    signal x_local_ce0 : STD_LOGIC;
    signal x_local_we0 : STD_LOGIC;
    signal x_local_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal x_local_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_values_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_spvm_kernel_fu_101_values_ce0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_values_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_values_we0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_values_address1 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_spvm_kernel_fu_101_values_ce1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_values_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_values_we1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_cols_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_spvm_kernel_fu_101_cols_ce0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_cols_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_cols_we0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_cols_address1 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_spvm_kernel_fu_101_cols_ce1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_cols_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_cols_we1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_rows_address0 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_spvm_kernel_fu_101_rows_ce0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_rows_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_rows_we0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_rows_address1 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_spvm_kernel_fu_101_rows_ce1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_rows_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_rows_we1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_x_local_address0 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_spvm_kernel_fu_101_x_local_ce0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_x_local_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_x_local_we0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_x_local_address1 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_spvm_kernel_fu_101_x_local_ce1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_x_local_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_x_local_we1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_y_address0 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_spvm_kernel_fu_101_y_ce0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_y_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_y_we0 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_y_address1 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_spvm_kernel_fu_101_y_ce1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_y_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_fu_101_y_we1 : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_ap_start : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_ap_done : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_ap_ready : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_ap_idle : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_ap_continue : STD_LOGIC;
    signal grp_spvm_kernel_fu_101_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_sync_grp_spvm_kernel_fu_101_ap_ready : STD_LOGIC;
    signal ap_sync_grp_spvm_kernel_fu_101_ap_done : STD_LOGIC;
    signal ap_block_state5_on_subcall_done : BOOLEAN;
    signal ap_sync_reg_grp_spvm_kernel_fu_101_ap_ready : STD_LOGIC := '0';
    signal ap_sync_reg_grp_spvm_kernel_fu_101_ap_done : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal i_fu_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln103_fu_129_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component spmv_accel_spvm_kernel IS
    port (
        values_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
        values_ce0 : OUT STD_LOGIC;
        values_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        values_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        values_we0 : OUT STD_LOGIC;
        values_address1 : OUT STD_LOGIC_VECTOR (3 downto 0);
        values_ce1 : OUT STD_LOGIC;
        values_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        values_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
        values_we1 : OUT STD_LOGIC;
        cols_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
        cols_ce0 : OUT STD_LOGIC;
        cols_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        cols_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        cols_we0 : OUT STD_LOGIC;
        cols_address1 : OUT STD_LOGIC_VECTOR (3 downto 0);
        cols_ce1 : OUT STD_LOGIC;
        cols_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        cols_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
        cols_we1 : OUT STD_LOGIC;
        rows_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
        rows_ce0 : OUT STD_LOGIC;
        rows_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        rows_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        rows_we0 : OUT STD_LOGIC;
        rows_address1 : OUT STD_LOGIC_VECTOR (1 downto 0);
        rows_ce1 : OUT STD_LOGIC;
        rows_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        rows_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
        rows_we1 : OUT STD_LOGIC;
        x_local_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
        x_local_ce0 : OUT STD_LOGIC;
        x_local_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        x_local_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        x_local_we0 : OUT STD_LOGIC;
        x_local_address1 : OUT STD_LOGIC_VECTOR (1 downto 0);
        x_local_ce1 : OUT STD_LOGIC;
        x_local_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        x_local_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
        x_local_we1 : OUT STD_LOGIC;
        y_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
        y_ce0 : OUT STD_LOGIC;
        y_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        y_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        y_we0 : OUT STD_LOGIC;
        y_address1 : OUT STD_LOGIC_VECTOR (1 downto 0);
        y_ce1 : OUT STD_LOGIC;
        y_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        y_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
        y_we1 : OUT STD_LOGIC;
        row_size : IN STD_LOGIC_VECTOR (31 downto 0);
        data_size : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        row_size_ap_vld : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        data_size_ap_vld : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;


    component spmv_accel_x_local_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (1 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    x_local_U : component spmv_accel_x_local_RAM_AUTO_1R1W
    generic map (
        DataWidth => 32,
        AddressRange => 4,
        AddressWidth => 2)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => x_local_address0,
        ce0 => x_local_ce0,
        we0 => x_local_we0,
        d0 => x_local_d0,
        q0 => x_local_q0);

    grp_spvm_kernel_fu_101 : component spmv_accel_spvm_kernel
    port map (
        values_address0 => grp_spvm_kernel_fu_101_values_address0,
        values_ce0 => grp_spvm_kernel_fu_101_values_ce0,
        values_d0 => grp_spvm_kernel_fu_101_values_d0,
        values_q0 => values_q0,
        values_we0 => grp_spvm_kernel_fu_101_values_we0,
        values_address1 => grp_spvm_kernel_fu_101_values_address1,
        values_ce1 => grp_spvm_kernel_fu_101_values_ce1,
        values_d1 => grp_spvm_kernel_fu_101_values_d1,
        values_q1 => ap_const_lv32_0,
        values_we1 => grp_spvm_kernel_fu_101_values_we1,
        cols_address0 => grp_spvm_kernel_fu_101_cols_address0,
        cols_ce0 => grp_spvm_kernel_fu_101_cols_ce0,
        cols_d0 => grp_spvm_kernel_fu_101_cols_d0,
        cols_q0 => cols_q0,
        cols_we0 => grp_spvm_kernel_fu_101_cols_we0,
        cols_address1 => grp_spvm_kernel_fu_101_cols_address1,
        cols_ce1 => grp_spvm_kernel_fu_101_cols_ce1,
        cols_d1 => grp_spvm_kernel_fu_101_cols_d1,
        cols_q1 => ap_const_lv32_0,
        cols_we1 => grp_spvm_kernel_fu_101_cols_we1,
        rows_address0 => grp_spvm_kernel_fu_101_rows_address0,
        rows_ce0 => grp_spvm_kernel_fu_101_rows_ce0,
        rows_d0 => grp_spvm_kernel_fu_101_rows_d0,
        rows_q0 => rows_q0,
        rows_we0 => grp_spvm_kernel_fu_101_rows_we0,
        rows_address1 => grp_spvm_kernel_fu_101_rows_address1,
        rows_ce1 => grp_spvm_kernel_fu_101_rows_ce1,
        rows_d1 => grp_spvm_kernel_fu_101_rows_d1,
        rows_q1 => ap_const_lv32_0,
        rows_we1 => grp_spvm_kernel_fu_101_rows_we1,
        x_local_address0 => grp_spvm_kernel_fu_101_x_local_address0,
        x_local_ce0 => grp_spvm_kernel_fu_101_x_local_ce0,
        x_local_d0 => grp_spvm_kernel_fu_101_x_local_d0,
        x_local_q0 => x_local_q0,
        x_local_we0 => grp_spvm_kernel_fu_101_x_local_we0,
        x_local_address1 => grp_spvm_kernel_fu_101_x_local_address1,
        x_local_ce1 => grp_spvm_kernel_fu_101_x_local_ce1,
        x_local_d1 => grp_spvm_kernel_fu_101_x_local_d1,
        x_local_q1 => ap_const_lv32_0,
        x_local_we1 => grp_spvm_kernel_fu_101_x_local_we1,
        y_address0 => grp_spvm_kernel_fu_101_y_address0,
        y_ce0 => grp_spvm_kernel_fu_101_y_ce0,
        y_d0 => grp_spvm_kernel_fu_101_y_d0,
        y_q0 => ap_const_lv32_0,
        y_we0 => grp_spvm_kernel_fu_101_y_we0,
        y_address1 => grp_spvm_kernel_fu_101_y_address1,
        y_ce1 => grp_spvm_kernel_fu_101_y_ce1,
        y_d1 => grp_spvm_kernel_fu_101_y_d1,
        y_q1 => ap_const_lv32_0,
        y_we1 => grp_spvm_kernel_fu_101_y_we1,
        row_size => row_size,
        data_size => data_size,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        row_size_ap_vld => ap_const_logic_1,
        ap_start => grp_spvm_kernel_fu_101_ap_start,
        data_size_ap_vld => ap_const_logic_1,
        ap_done => grp_spvm_kernel_fu_101_ap_done,
        ap_ready => grp_spvm_kernel_fu_101_ap_ready,
        ap_idle => grp_spvm_kernel_fu_101_ap_idle,
        ap_continue => grp_spvm_kernel_fu_101_ap_continue);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state2);
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_grp_spvm_kernel_fu_101_ap_done_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_spvm_kernel_fu_101_ap_done <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_state5_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                    ap_sync_reg_grp_spvm_kernel_fu_101_ap_done <= ap_const_logic_0;
                elsif ((grp_spvm_kernel_fu_101_ap_done = ap_const_logic_1)) then 
                    ap_sync_reg_grp_spvm_kernel_fu_101_ap_done <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_grp_spvm_kernel_fu_101_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_spvm_kernel_fu_101_ap_ready <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_state5_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                    ap_sync_reg_grp_spvm_kernel_fu_101_ap_ready <= ap_const_logic_0;
                elsif ((grp_spvm_kernel_fu_101_ap_ready = ap_const_logic_1)) then 
                    ap_sync_reg_grp_spvm_kernel_fu_101_ap_ready <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_spvm_kernel_fu_101_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_spvm_kernel_fu_101_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state4) or ((ap_const_logic_1 = ap_CS_fsm_state5) and (ap_sync_grp_spvm_kernel_fu_101_ap_ready = ap_const_logic_0)))) then 
                    grp_spvm_kernel_fu_101_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_spvm_kernel_fu_101_ap_ready = ap_const_logic_1)) then 
                    grp_spvm_kernel_fu_101_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_fu_50 <= ap_const_lv32_0;
            elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln103_fu_124_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                i_fu_50 <= add_ln103_fu_129_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln103_fu_124_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    zext_ln103_reg_175(31 downto 0) <= zext_ln103_fu_135_p1(31 downto 0);
            end if;
        end if;
    end process;
    zext_ln103_reg_175(63 downto 32) <= "00000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln103_fu_124_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, ap_CS_fsm_state5, ap_block_state5_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln103_fu_124_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln103_fu_124_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((ap_const_boolean_0 = ap_block_state5_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    add_ln103_fu_129_p2 <= std_logic_vector(unsigned(i_fu_50) + unsigned(ap_const_lv32_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state4 <= ap_CS_fsm(2);
    ap_CS_fsm_state5 <= ap_CS_fsm(3);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(ap_block_state5_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state5_on_subcall_done)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;

        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state5_on_subcall_done_assign_proc : process(ap_sync_grp_spvm_kernel_fu_101_ap_ready, ap_sync_grp_spvm_kernel_fu_101_ap_done)
    begin
                ap_block_state5_on_subcall_done <= ((ap_sync_grp_spvm_kernel_fu_101_ap_ready and ap_sync_grp_spvm_kernel_fu_101_ap_done) = ap_const_logic_0);
    end process;


    ap_condition_pp0_exit_iter0_state2_assign_proc : process(icmp_ln103_fu_124_p2)
    begin
        if ((icmp_ln103_fu_124_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state5, ap_block_state5_on_subcall_done)
    begin
        if (((ap_const_boolean_0 = ap_block_state5_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state5, ap_block_state5_on_subcall_done)
    begin
        if (((ap_const_boolean_0 = ap_block_state5_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= ap_const_lv32_0;
    ap_sync_grp_spvm_kernel_fu_101_ap_done <= (grp_spvm_kernel_fu_101_ap_done or ap_sync_reg_grp_spvm_kernel_fu_101_ap_done);
    ap_sync_grp_spvm_kernel_fu_101_ap_ready <= (grp_spvm_kernel_fu_101_ap_ready or ap_sync_reg_grp_spvm_kernel_fu_101_ap_ready);
    cols_address0 <= grp_spvm_kernel_fu_101_cols_address0;
    cols_ce0 <= grp_spvm_kernel_fu_101_cols_ce0;

    grp_spvm_kernel_fu_101_ap_continue_assign_proc : process(ap_CS_fsm_state5, ap_block_state5_on_subcall_done)
    begin
        if (((ap_const_boolean_0 = ap_block_state5_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            grp_spvm_kernel_fu_101_ap_continue <= ap_const_logic_1;
        else 
            grp_spvm_kernel_fu_101_ap_continue <= ap_const_logic_0;
        end if; 
    end process;

    grp_spvm_kernel_fu_101_ap_start <= grp_spvm_kernel_fu_101_ap_start_reg;
    icmp_ln103_fu_124_p2 <= "1" when (i_fu_50 = col_size) else "0";
    rows_address0 <= grp_spvm_kernel_fu_101_rows_address0;
    rows_ce0 <= grp_spvm_kernel_fu_101_rows_ce0;
    values_address0 <= grp_spvm_kernel_fu_101_values_address0;
    values_ce0 <= grp_spvm_kernel_fu_101_values_ce0;
    x_address0 <= zext_ln103_fu_135_p1(2 - 1 downto 0);

    x_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            x_ce0 <= ap_const_logic_1;
        else 
            x_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    x_local_address0_assign_proc : process(zext_ln103_reg_175, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, grp_spvm_kernel_fu_101_x_local_address0, ap_CS_fsm_state5, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            x_local_address0 <= zext_ln103_reg_175(2 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            x_local_address0 <= grp_spvm_kernel_fu_101_x_local_address0;
        else 
            x_local_address0 <= "XX";
        end if; 
    end process;


    x_local_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter1, grp_spvm_kernel_fu_101_x_local_ce0, ap_CS_fsm_state5)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            x_local_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            x_local_ce0 <= grp_spvm_kernel_fu_101_x_local_ce0;
        else 
            x_local_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    x_local_d0 <= x_q0;

    x_local_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            x_local_we0 <= ap_const_logic_1;
        else 
            x_local_we0 <= ap_const_logic_0;
        end if; 
    end process;

    y_address0 <= grp_spvm_kernel_fu_101_y_address0;
    y_ce0 <= grp_spvm_kernel_fu_101_y_ce0;
    y_d0 <= grp_spvm_kernel_fu_101_y_d0;
    y_we0 <= grp_spvm_kernel_fu_101_y_we0;
    zext_ln103_fu_135_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_fu_50),64));
end behav;
