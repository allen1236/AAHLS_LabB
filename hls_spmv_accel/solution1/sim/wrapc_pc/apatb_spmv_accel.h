// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" int AESL_WRAP_spmv_accel (
volatile void* values,
volatile void* cols,
volatile void* rows,
volatile void* x,
volatile void* y,
int row_size,
int col_size,
int data_size);
