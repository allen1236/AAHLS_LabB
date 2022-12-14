-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity spmv_accel_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    row_size_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    row_size_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    row_size_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    row_size_empty_n : IN STD_LOGIC;
    row_size_read : OUT STD_LOGIC;
    results_fifo_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    results_fifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    results_fifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    results_fifo_empty_n : IN STD_LOGIC;
    results_fifo_read : OUT STD_LOGIC;
    y_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
    y_ce0 : OUT STD_LOGIC;
    y_we0 : OUT STD_LOGIC;
    y_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of spmv_accel_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal row_size_blk_n : STD_LOGIC;
    signal row_size_read_reg_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_start : STD_LOGIC;
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done : STD_LOGIC;
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_idle : STD_LOGIC;
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_ready : STD_LOGIC;
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_results_fifo_read : STD_LOGIC;
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_address0 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_ce0 : STD_LOGIC;
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_we0 : STD_LOGIC;
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component spmv_accel_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        results_fifo_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        results_fifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        results_fifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        results_fifo_empty_n : IN STD_LOGIC;
        results_fifo_read : OUT STD_LOGIC;
        row_size_load : IN STD_LOGIC_VECTOR (31 downto 0);
        y_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
        y_ce0 : OUT STD_LOGIC;
        y_we0 : OUT STD_LOGIC;
        y_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40 : component spmv_accel_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_start,
        ap_done => grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done,
        ap_idle => grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_idle,
        ap_ready => grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_ready,
        results_fifo_dout => results_fifo_dout,
        results_fifo_num_data_valid => ap_const_lv2_0,
        results_fifo_fifo_cap => ap_const_lv2_0,
        results_fifo_empty_n => results_fifo_empty_n,
        results_fifo_read => grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_results_fifo_read,
        row_size_load => row_size_read_reg_49,
        y_address0 => grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_address0,
        y_ce0 => grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_ce0,
        y_we0 => grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_we0,
        y_d0 => grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_d0);





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


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                    grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_ready = ap_const_logic_1)) then 
                    grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                row_size_read_reg_49 <= row_size_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, row_size_empty_n, grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (row_size_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if (((grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, row_size_empty_n)
    begin
        if (((ap_start = ap_const_logic_0) or (row_size_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done)
    begin
        if ((grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, row_size_empty_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (row_size_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done, ap_CS_fsm_state3)
    begin
        if (((grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done, ap_CS_fsm_state3)
    begin
        if (((grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_start <= grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_ap_start_reg;

    results_fifo_read_assign_proc : process(grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_results_fifo_read, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            results_fifo_read <= grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_results_fifo_read;
        else 
            results_fifo_read <= ap_const_logic_0;
        end if; 
    end process;


    row_size_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, row_size_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            row_size_blk_n <= row_size_empty_n;
        else 
            row_size_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    row_size_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, row_size_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (row_size_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            row_size_read <= ap_const_logic_1;
        else 
            row_size_read <= ap_const_logic_0;
        end if; 
    end process;

    y_address0 <= grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_address0;
    y_ce0 <= grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_ce0;
    y_d0 <= grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_d0;
    y_we0 <= grp_spvm_kernel_Loop_VITIS_LOOP_70_4_proc5_Pipeline_VITIS_LOOP_70_4_fu_40_y_we0;
end behav;
