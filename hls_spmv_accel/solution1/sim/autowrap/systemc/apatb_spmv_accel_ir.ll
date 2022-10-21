; ModuleID = 'D:/Documents/HLS/LabB/hls/proj3/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define i32 @apatb_spmv_accel_ir(float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="9" %values, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="9" %cols, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4" %rows, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4" %x, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="4" %y, i32 %row_size, i32 %col_size, i32 %data_size) local_unnamed_addr #0 {
entry:
  %values_copy = alloca [9 x float], align 512
  %cols_copy = alloca [9 x i32], align 512
  %rows_copy = alloca [4 x i32], align 512
  %x_copy = alloca [4 x float], align 512
  %y_copy = alloca [4 x float], align 512
  %0 = bitcast float* %values to [9 x float]*
  %1 = bitcast i32* %cols to [9 x i32]*
  %2 = bitcast i32* %rows to [4 x i32]*
  %3 = bitcast float* %x to [4 x float]*
  %4 = bitcast float* %y to [4 x float]*
  call fastcc void @copy_in([9 x float]* nonnull %0, [9 x float]* nonnull align 512 %values_copy, [9 x i32]* nonnull %1, [9 x i32]* nonnull align 512 %cols_copy, [4 x i32]* nonnull %2, [4 x i32]* nonnull align 512 %rows_copy, [4 x float]* nonnull %3, [4 x float]* nonnull align 512 %x_copy, [4 x float]* nonnull %4, [4 x float]* nonnull align 512 %y_copy)
  %5 = getelementptr inbounds [9 x float], [9 x float]* %values_copy, i32 0, i32 0
  %6 = getelementptr inbounds [9 x i32], [9 x i32]* %cols_copy, i32 0, i32 0
  %7 = getelementptr inbounds [4 x i32], [4 x i32]* %rows_copy, i32 0, i32 0
  %8 = getelementptr inbounds [4 x float], [4 x float]* %x_copy, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float], [4 x float]* %y_copy, i32 0, i32 0
  %10 = call i32 @apatb_spmv_accel_hw(float* %5, i32* %6, i32* %7, float* %8, float* %9, i32 %row_size, i32 %col_size, i32 %data_size)
  call void @copy_back([9 x float]* %0, [9 x float]* %values_copy, [9 x i32]* %1, [9 x i32]* %cols_copy, [4 x i32]* %2, [4 x i32]* %rows_copy, [4 x float]* %3, [4 x float]* %x_copy, [4 x float]* %4, [4 x float]* %y_copy)
  ret i32 %10
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([9 x float]* noalias readonly, [9 x float]* noalias align 512, [9 x i32]* noalias readonly, [9 x i32]* noalias align 512, [4 x i32]* noalias readonly, [4 x i32]* noalias align 512, [4 x float]* noalias readonly, [4 x float]* noalias align 512, [4 x float]* noalias readonly, [4 x float]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a9f32([9 x float]* align 512 %1, [9 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a9i32([9 x i32]* align 512 %3, [9 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* align 512 %5, [4 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* align 512 %7, [4 x float]* %6)
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* align 512 %9, [4 x float]* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a9f32([9 x float]* noalias align 512, [9 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [9 x float]* %0, null
  %3 = icmp eq [9 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [9 x float], [9 x float]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [9 x float], [9 x float]* %1, i64 0, i64 %for.loop.idx1
  %5 = load float, float* %src.addr, align 4
  store float %5, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 9
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a9i32([9 x i32]* noalias align 512, [9 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [9 x i32]* %0, null
  %3 = icmp eq [9 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [9 x i32], [9 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [9 x i32], [9 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 9
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* noalias align 512, [4 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [4 x i32]* %0, null
  %3 = icmp eq [4 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4 x i32], [4 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [4 x i32], [4 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* noalias align 512, [4 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [4 x float]* %0, null
  %3 = icmp eq [4 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4 x float], [4 x float]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [4 x float], [4 x float]* %1, i64 0, i64 %for.loop.idx1
  %5 = load float, float* %src.addr, align 4
  store float %5, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([9 x float]* noalias, [9 x float]* noalias readonly align 512, [9 x i32]* noalias, [9 x i32]* noalias readonly align 512, [4 x i32]* noalias, [4 x i32]* noalias readonly align 512, [4 x float]* noalias, [4 x float]* noalias readonly align 512, [4 x float]* noalias, [4 x float]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a9f32([9 x float]* %0, [9 x float]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a9i32([9 x i32]* %2, [9 x i32]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* %4, [4 x i32]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* %6, [4 x float]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* %8, [4 x float]* align 512 %9)
  ret void
}

declare i32 @apatb_spmv_accel_hw(float*, i32*, i32*, float*, float*, i32, i32, i32)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([9 x float]* noalias, [9 x float]* noalias readonly align 512, [9 x i32]* noalias, [9 x i32]* noalias readonly align 512, [4 x i32]* noalias, [4 x i32]* noalias readonly align 512, [4 x float]* noalias, [4 x float]* noalias readonly align 512, [4 x float]* noalias, [4 x float]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* %8, [4 x float]* align 512 %9)
  ret void
}

define i32 @spmv_accel_hw_stub_wrapper(float*, i32*, i32*, float*, float*, i32, i32, i32) #4 {
entry:
  %8 = bitcast float* %0 to [9 x float]*
  %9 = bitcast i32* %1 to [9 x i32]*
  %10 = bitcast i32* %2 to [4 x i32]*
  %11 = bitcast float* %3 to [4 x float]*
  %12 = bitcast float* %4 to [4 x float]*
  call void @copy_out([9 x float]* null, [9 x float]* %8, [9 x i32]* null, [9 x i32]* %9, [4 x i32]* null, [4 x i32]* %10, [4 x float]* null, [4 x float]* %11, [4 x float]* null, [4 x float]* %12)
  %13 = bitcast [9 x float]* %8 to float*
  %14 = bitcast [9 x i32]* %9 to i32*
  %15 = bitcast [4 x i32]* %10 to i32*
  %16 = bitcast [4 x float]* %11 to float*
  %17 = bitcast [4 x float]* %12 to float*
  %18 = call i32 @spmv_accel_hw_stub(float* %13, i32* %14, i32* %15, float* %16, float* %17, i32 %5, i32 %6, i32 %7)
  call void @copy_in([9 x float]* null, [9 x float]* %8, [9 x i32]* null, [9 x i32]* %9, [4 x i32]* null, [4 x i32]* %10, [4 x float]* null, [4 x float]* %11, [4 x float]* null, [4 x float]* %12)
  ret i32 %18
}

declare i32 @spmv_accel_hw_stub(float*, i32*, i32*, float*, float*, i32, i32, i32)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
