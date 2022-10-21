// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xspmv.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSpmv_CfgInitialize(XSpmv *InstancePtr, XSpmv_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSpmv_Start(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSpmv_IsDone(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSpmv_IsIdle(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSpmv_IsReady(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSpmv_EnableAutoRestart(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSpmv_DisableAutoRestart(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XSpmv_Get_y_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_Y_BASE);
}

u32 XSpmv_Get_y_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_Y_HIGH);
}

u32 XSpmv_Get_y_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_CONTROL_ADDR_Y_HIGH - XSPMV_CONTROL_ADDR_Y_BASE + 1);
}

u32 XSpmv_Get_y_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_WIDTH_Y;
}

u32 XSpmv_Get_y_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_DEPTH_Y;
}

u32 XSpmv_Write_y_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_Y_HIGH - XSPMV_CONTROL_ADDR_Y_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_Y_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_y_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_Y_HIGH - XSPMV_CONTROL_ADDR_Y_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_Y_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_y_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_Y_HIGH - XSPMV_CONTROL_ADDR_Y_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_Y_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_y_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_Y_HIGH - XSPMV_CONTROL_ADDR_Y_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_Y_BASE + offset + i);
    }
    return length;
}

u32 XSpmv_Get_rowPtr_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_ROWPTR_BASE);
}

u32 XSpmv_Get_rowPtr_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_ROWPTR_HIGH);
}

u32 XSpmv_Get_rowPtr_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_CONTROL_ADDR_ROWPTR_HIGH - XSPMV_CONTROL_ADDR_ROWPTR_BASE + 1);
}

u32 XSpmv_Get_rowPtr_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_WIDTH_ROWPTR;
}

u32 XSpmv_Get_rowPtr_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_DEPTH_ROWPTR;
}

u32 XSpmv_Write_rowPtr_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_ROWPTR_HIGH - XSPMV_CONTROL_ADDR_ROWPTR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_ROWPTR_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_rowPtr_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_ROWPTR_HIGH - XSPMV_CONTROL_ADDR_ROWPTR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_ROWPTR_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_rowPtr_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_ROWPTR_HIGH - XSPMV_CONTROL_ADDR_ROWPTR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_ROWPTR_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_rowPtr_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_ROWPTR_HIGH - XSPMV_CONTROL_ADDR_ROWPTR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_ROWPTR_BASE + offset + i);
    }
    return length;
}

u32 XSpmv_Get_columnIndex_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE);
}

u32 XSpmv_Get_columnIndex_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_COLUMNINDEX_HIGH);
}

u32 XSpmv_Get_columnIndex_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_CONTROL_ADDR_COLUMNINDEX_HIGH - XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE + 1);
}

u32 XSpmv_Get_columnIndex_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_WIDTH_COLUMNINDEX;
}

u32 XSpmv_Get_columnIndex_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_DEPTH_COLUMNINDEX;
}

u32 XSpmv_Write_columnIndex_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_COLUMNINDEX_HIGH - XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_columnIndex_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_COLUMNINDEX_HIGH - XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_columnIndex_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_COLUMNINDEX_HIGH - XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_columnIndex_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_COLUMNINDEX_HIGH - XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_COLUMNINDEX_BASE + offset + i);
    }
    return length;
}

u32 XSpmv_Get_values_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_VALUES_BASE);
}

u32 XSpmv_Get_values_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_VALUES_HIGH);
}

u32 XSpmv_Get_values_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_CONTROL_ADDR_VALUES_HIGH - XSPMV_CONTROL_ADDR_VALUES_BASE + 1);
}

u32 XSpmv_Get_values_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_WIDTH_VALUES;
}

u32 XSpmv_Get_values_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_DEPTH_VALUES;
}

u32 XSpmv_Write_values_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_VALUES_HIGH - XSPMV_CONTROL_ADDR_VALUES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_VALUES_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_values_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_VALUES_HIGH - XSPMV_CONTROL_ADDR_VALUES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_VALUES_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_values_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_VALUES_HIGH - XSPMV_CONTROL_ADDR_VALUES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_VALUES_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_values_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_VALUES_HIGH - XSPMV_CONTROL_ADDR_VALUES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_VALUES_BASE + offset + i);
    }
    return length;
}

u32 XSpmv_Get_x_BaseAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_X_BASE);
}

u32 XSpmv_Get_x_HighAddress(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_X_HIGH);
}

u32 XSpmv_Get_x_TotalBytes(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPMV_CONTROL_ADDR_X_HIGH - XSPMV_CONTROL_ADDR_X_BASE + 1);
}

u32 XSpmv_Get_x_BitWidth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_WIDTH_X;
}

u32 XSpmv_Get_x_Depth(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPMV_CONTROL_DEPTH_X;
}

u32 XSpmv_Write_x_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_X_HIGH - XSPMV_CONTROL_ADDR_X_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_X_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_x_Words(XSpmv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPMV_CONTROL_ADDR_X_HIGH - XSPMV_CONTROL_ADDR_X_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_X_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSpmv_Write_x_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_X_HIGH - XSPMV_CONTROL_ADDR_X_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_X_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSpmv_Read_x_Bytes(XSpmv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPMV_CONTROL_ADDR_X_HIGH - XSPMV_CONTROL_ADDR_X_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XSPMV_CONTROL_ADDR_X_BASE + offset + i);
    }
    return length;
}

void XSpmv_InterruptGlobalEnable(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_GIE, 1);
}

void XSpmv_InterruptGlobalDisable(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_GIE, 0);
}

void XSpmv_InterruptEnable(XSpmv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER);
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER, Register | Mask);
}

void XSpmv_InterruptDisable(XSpmv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER);
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSpmv_InterruptClear(XSpmv *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_ISR, Mask);
}

u32 XSpmv_InterruptGetEnabled(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER);
}

u32 XSpmv_InterruptGetStatus(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_ISR);
}

