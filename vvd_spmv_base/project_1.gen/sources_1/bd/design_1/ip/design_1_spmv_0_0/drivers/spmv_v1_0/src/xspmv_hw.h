// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/COR)
//        bit 0 - ap_done (Read/COR)
//        bit 1 - ap_ready (Read/COR)
//        others - reserved
// 0x10 ~
// 0x1f : Memory 'y' (4 * 32b)
//        Word n : bit [31:0] - y[n]
// 0x20 ~
// 0x3f : Memory 'rowPtr' (5 * 32b)
//        Word n : bit [31:0] - rowPtr[n]
// 0x40 ~
// 0x7f : Memory 'columnIndex' (9 * 32b)
//        Word n : bit [31:0] - columnIndex[n]
// 0x80 ~
// 0xbf : Memory 'values' (9 * 32b)
//        Word n : bit [31:0] - values[n]
// 0xc0 ~
// 0xcf : Memory 'x' (4 * 32b)
//        Word n : bit [31:0] - x[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSPMV_CONTROL_ADDR_AP_CTRL          0x00
#define XSPMV_CONTROL_ADDR_GIE              0x04
#define XSPMV_CONTROL_ADDR_IER              0x08
#define XSPMV_CONTROL_ADDR_ISR              0x0c
#define XSPMV_CONTROL_ADDR_Y_BASE           0x10
#define XSPMV_CONTROL_ADDR_Y_HIGH           0x1f
#define XSPMV_CONTROL_WIDTH_Y               32
#define XSPMV_CONTROL_DEPTH_Y               4
#define XSPMV_CONTROL_ADDR_ROWPTR_BASE      0x20
#define XSPMV_CONTROL_ADDR_ROWPTR_HIGH      0x3f
#define XSPMV_CONTROL_WIDTH_ROWPTR          32
#define XSPMV_CONTROL_DEPTH_ROWPTR          5
#define XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE 0x40
#define XSPMV_CONTROL_ADDR_COLUMNINDEX_HIGH 0x7f
#define XSPMV_CONTROL_WIDTH_COLUMNINDEX     32
#define XSPMV_CONTROL_DEPTH_COLUMNINDEX     9
#define XSPMV_CONTROL_ADDR_VALUES_BASE      0x80
#define XSPMV_CONTROL_ADDR_VALUES_HIGH      0xbf
#define XSPMV_CONTROL_WIDTH_VALUES          32
#define XSPMV_CONTROL_DEPTH_VALUES          9
#define XSPMV_CONTROL_ADDR_X_BASE           0xc0
#define XSPMV_CONTROL_ADDR_X_HIGH           0xcf
#define XSPMV_CONTROL_WIDTH_X               32
#define XSPMV_CONTROL_DEPTH_X               4

