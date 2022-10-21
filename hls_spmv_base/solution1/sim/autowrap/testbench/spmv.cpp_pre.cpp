# 1 "D:/Documents/HLS/LabB/hls/spmv_base/spmv.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "D:/Documents/HLS/LabB/hls/spmv_base/spmv.cpp"
# 1 "D:/Documents/HLS/LabB/hls/spmv_base/spmv.h" 1



const static int SIZE = 4;
const static int NNZ = 9;
const static int NUM_ROWS = 4;
typedef float DTYPE;
void spmv(int rowPtr[NUM_ROWS+1], int columnIndex[NNZ],
    DTYPE values[NNZ], DTYPE y[SIZE], DTYPE x[SIZE]);
void spmv_s(int *rowPtr, int *columnIndex,
    DTYPE *values, DTYPE *y, DTYPE *x,
    int nRow);
# 2 "D:/Documents/HLS/LabB/hls/spmv_base/spmv.cpp" 2


void spmv(int rowPtr[NUM_ROWS+1], int columnIndex[NNZ],
  DTYPE values[NNZ], DTYPE y[SIZE], DTYPE x[SIZE])
{

#pragma HLS INTERFACE s_axilite port=rowPtr
#pragma HLS INTERFACE s_axilite port=columnIndex
#pragma HLS INTERFACE s_axilite port=values
#pragma HLS INTERFACE s_axilite port=y
#pragma HLS INTERFACE s_axilite port=x
#pragma HLS INTERFACE s_axilite port=return


L1: for (int i = 0; i < NUM_ROWS; i++) {
  DTYPE y0 = 0;
 L2: for (int k = rowPtr[i]; k < rowPtr[i+1]; k++) {
#pragma HLS unroll factor=8
#pragma HLS pipeline
   y0 += values[k] * x[columnIndex[k]];
  }
  y[i] = y0;
 }

 return;
}


void spmv_s(int *rowPtr, int *columnIndex,
    DTYPE *values, DTYPE *y, DTYPE *x,
    int nRow) {

#pragma HLS INTERFACE s_axilite port=rowPtr
#pragma HLS INTERFACE s_axilite port=columnIndex
#pragma HLS INTERFACE s_axilite port=values
#pragma HLS INTERFACE s_axilite port=y
#pragma HLS INTERFACE s_axilite port=x
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE s_axilite port=nRow


L1: for (int i = 0; i < nRow; i++) {
  DTYPE y0 = 0;
 L2: for (int k = rowPtr[i]; k < rowPtr[i+1]; k++) {
#pragma HLS unroll factor=8
#pragma HLS pipeline
   y0 += values[k] * x[columnIndex[k]];
  }
  y[i] = y0;
 }

 return;
}
