#include "spmv.h"
#include <stdio.h>
#include <fstream>
#include <cassert>

using namespace std;

int main(){

	ifstream inf;
	inf.open("./data.txt");
	assert(!inf.fail());

	int nnz, nmat;
	DTYPE *values;
	int *columnIndex;
	DTYPE x[SIZE];
	DTYPE y[SIZE];
	DTYPE y_gol[SIZE];
	int rowPtr[SIZE+1];
	int fail = 0;

	assert(inf >> nnz);
	printf("nnz: %d\n", nnz);
	inf >> nmat;
	printf("nmat: %d\n", nmat);
	values = new DTYPE(nnz);
	columnIndex = new int(nnz);

	for ( int i = 0; i < SIZE; i++ )
	{
		x[i] = i+1;
	}


	for ( int i = 0; i < nmat; i++ )
	{
		printf("start iter %d\n", i);
		for ( int j = 0; j < nnz; j++ )
			inf >> values[j];
		for ( int j = 0; j < nnz; j++ )
			inf >> columnIndex[j];
		for ( int j = 0; j < SIZE + 1; j++)
			inf >> rowPtr[j];
		for ( int j = 0; j < SIZE; j++ )
			inf >> y_gol[j];
		
		spmv( rowPtr, columnIndex, values, y, x );
		printf("end iter %d\n", i);

		for ( int j = 0; j < SIZE; j++ )
		{
			if ( y[j] !=  y_gol[j] )
			{
				fail = 1;
			}
		}
		
	}

	inf.close();
	delete [] values;
	delete [] columnIndex;

	if(fail == 1)
		printf("FAILED\n");
	else
		printf("PASS\n");

	return fail;
}
