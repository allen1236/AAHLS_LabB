; ModuleID = 'D:/Documents/HLS/LabB/hls/spmv_base/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_spmv_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="5" %rowPtr, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="9" %columnIndex, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="9" %values, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="4" %y, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4" %x) local_unnamed_addr #0 {
entry:
  %rowPtr_copy = alloca [5 x i32], align 512
  %columnIndex_copy = alloca [9 x i32], align 512
  %values_copy = alloca [9 x float], align 512
  %y_copy = alloca [4 x float], align 512
  %x_copy = alloca [4 x float], align 512
  %0 = bitcast i32* %rowPtr to [5 x i32]*
  %1 = bitcast i32* %columnIndex to [9 x i32]*
  %2 = bitcast float* %values to [9 x float]*
  %3 = bitcast float* %y to [4 x float]*
  %4 = bitcast float* %x to [4 x float]*
  call fastcc void @copy_in([5 x i32]* nonnull %0, [5 x i32]* nonnull align 512 %rowPtr_copy, [9 x i32]* nonnull %1, [9 x i32]* nonnull align 512 %columnIndex_copy, [9 x float]* nonnull %2, [9 x float]* nonnull align 512 %values_copy, [4 x float]* nonnull %3, [4 x float]* nonnull align 512 %y_copy, [4 x float]* nonnull %4, [4 x float]* nonnull align 512 %x_copy)
  %5 = getelementptr inbounds [5 x i32], [5 x i32]* %rowPtr_copy, i32 0, i32 0
  %6 = getelementptr inbounds [9 x i32], [9 x i32]* %columnIndex_copy, i32 0, i32 0
  %7 = getelementptr inbounds [9 x float], [9 x float]* %values_copy, i32 0, i32 0
  %8 = getelementptr inbounds [4 x float], [4 x float]* %y_copy, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float], [4 x float]* %x_copy, i32 0, i32 0
  call void @apatb_spmv_hw(i32* %5, i32* %6, float* %7, float* %8, float* %9)
  call void @copy_back([5 x i32]* %0, [5 x i32]* %rowPtr_copy, [9 x i32]* %1, [9 x i32]* %columnIndex_copy, [9 x float]* %2, [9 x float]* %values_copy, [4 x float]* %3, [4 x float]* %y_copy, [4 x float]* %4, [4 x float]* %x_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([5 x i32]* noalias readonly, [5 x i32]* noalias align 512, [9 x i32]* noalias readonly, [9 x i32]* noalias align 512, [9 x float]* noalias readonly, [9 x float]* noalias align 512, [4 x float]* noalias readonly, [4 x float]* noalias align 512, [4 x float]* noalias readonly, [4 x float]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %1, [5 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a9i32([9 x i32]* align 512 %3, [9 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a9f32([9 x float]* align 512 %5, [9 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* align 512 %7, [4 x float]* %6)
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* align 512 %9, [4 x float]* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* noalias align 512, [5 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [5 x i32]* %0, null
  %3 = icmp eq [5 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [5 x i32], [5 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [5 x i32], [5 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 5
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
define internal fastcc void @copy_out([5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [9 x i32]* noalias, [9 x i32]* noalias readonly align 512, [9 x float]* noalias, [9 x float]* noalias readonly align 512, [4 x float]* noalias, [4 x float]* noalias readonly align 512, [4 x float]* noalias, [4 x float]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %0, [5 x i32]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a9i32([9 x i32]* %2, [9 x i32]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a9f32([9 x float]* %4, [9 x float]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* %6, [4 x float]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* %8, [4 x float]* align 512 %9)
  ret void
}

declare void @apatb_spmv_hw(i32*, i32*, float*, float*, float*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [9 x i32]* noalias, [9 x i32]* noalias readonly align 512, [9 x float]* noalias, [9 x float]* noalias readonly align 512, [4 x float]* noalias, [4 x float]* noalias readonly align 512, [4 x float]* noalias, [4 x float]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4f32([4 x float]* %6, [4 x float]* align 512 %7)
  ret void
}

define void @spmv_hw_stub_wrapper(i32*, i32*, float*, float*, float*) #4 {
entry:
  %5 = bitcast i32* %0 to [5 x i32]*
  %6 = bitcast i32* %1 to [9 x i32]*
  %7 = bitcast float* %2 to [9 x float]*
  %8 = bitcast float* %3 to [4 x float]*
  %9 = bitcast float* %4 to [4 x float]*
  call void @copy_out([5 x i32]* null, [5 x i32]* %5, [9 x i32]* null, [9 x i32]* %6, [9 x float]* null, [9 x float]* %7, [4 x float]* null, [4 x float]* %8, [4 x float]* null, [4 x float]* %9)
  %10 = bitcast [5 x i32]* %5 to i32*
  %11 = bitcast [9 x i32]* %6 to i32*
  %12 = bitcast [9 x float]* %7 to float*
  %13 = bitcast [4 x float]* %8 to float*
  %14 = bitcast [4 x float]* %9 to float*
  call void @spmv_hw_stub(i32* %10, i32* %11, float* %12, float* %13, float* %14)
  call void @copy_in([5 x i32]* null, [5 x i32]* %5, [9 x i32]* null, [9 x i32]* %6, [9 x float]* null, [9 x float]* %7, [4 x float]* null, [4 x float]* %8, [4 x float]* null, [4 x float]* %9)
  ret void
}

declare void @spmv_hw_stub(i32*, i32*, float*, float*, float*)

attributes #0 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
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
