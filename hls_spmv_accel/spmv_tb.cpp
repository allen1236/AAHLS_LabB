#include "spmv.h"
#include <stdio.h>

void matrixvector(DTYPE A[SIZE][SIZE], DTYPE *y, DTYPE *x)
{
	for (int i = 0; i < SIZE; i++) {
		DTYPE y0 = 0;
		for (int j = 0; j < SIZE; j++)
			y0 += A[i][j] * x[j];
		y[i] = y0;
	}
}

int main(){
	int fail = 0;
	DTYPE M[SIZE][SIZE] = {{3,4,0,0},{0,5,9,0},{2,0,3,1},{0,4,0,6}};
	DTYPE x[SIZE] = {1,2,3,4};
	DTYPE y_sw[SIZE];
	DTYPE values[] = {3,4,5,9,2,3,1,4,6};
	u32 columnIndex[] = {0,1,1,2,0,2,3,1,3};
	u32 rowPtr[] = {0,2,4,7,9};
	u32 rowPtr2[] = {2,2,3,2};
	DTYPE y[SIZE];

	spmv_accel(values, columnIndex, rowPtr2, x , y, 4, 4, 9);
	matrixvector(M, y_sw, x);

	for(int i = 0; i < SIZE; i++)
	{
		if(y_sw[i] != y[i])
				fail = 1;
		printf("%f %f\n", y_sw[i], y[i]);
	}


	if(fail == 1)
		printf("FAILED\n");
	else
		printf("PASS\n");

	return fail;
}
