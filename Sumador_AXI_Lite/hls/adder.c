#include "adder.h"

void adder(float A[SIZE],float B[SIZE],float Q[SIZE],int DataInput,int *DataOutput)
{
	
	
	SumaElementos: for(int i = 0; i < SIZE; i++)
	{
		Q[i] = A[i] + B[i];
	}
	
	
	*DataOutput = DataInput;
}
