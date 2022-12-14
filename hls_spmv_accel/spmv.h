#ifndef __SPMV_H__
#define __SPMV_H__


//#define  ROWS          400000
//#define  COLS          400000
//#define  DATA_LENGTH   20000000
//
//#define  MAX_COL_SIZE  980000
//#define  MAX_ROW_SIZE  980000

const static int SIZE = 4; // SIZE of square matrix
const static int NNZ = 9; //Number of non-zero elements
const static int NUM_ROWS = 4;// SIZE;
typedef float DTYPE;

#define  ROWS          SIZE
#define  COLS          SIZE
#define  DATA_LENGTH   NNZ

#define  MAX_COL_SIZE  SIZE
#define  MAX_ROW_SIZE  SIZE


//typedef ap_uint<32> u32;
typedef unsigned int u32;
typedef float DATA_TYPE;




int spmv_accel(
		DATA_TYPE       values[DATA_LENGTH],
		u32        		cols[DATA_LENGTH],
		u32        		rows[ROWS],
		DATA_TYPE  		x[COLS],
		DATA_TYPE  		y[ROWS],

		u32        		 row_size,
		u32        		 col_size,
		u32        		 data_size
	);

#endif //__SPMV_H__
