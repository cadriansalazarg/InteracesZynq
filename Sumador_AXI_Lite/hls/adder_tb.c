#include <stdio.h>
#include "adder.h"
#include <math.h>

int main(void)
{
	// Variables
	float A[SIZE];
	float B[SIZE];
	float Q_hw[SIZE];
	float Q_sw[SIZE];
	int i;
	int DataInput = 10;
	int DataOutput;

	for(i = 0; i < SIZE; i++)
	{
		A[i] = 1.0*i;
		B[i] = 2.0*i;
		Q_sw[i] = A[i]+B[i];
	}
	adder(A, B, Q_hw, DataInput, &DataOutput);
	
	printf("Data vailable: \n");
	for(i = 0; i < SIZE; i++)
	{
		// Check delta
		float delta = Q_sw[i] - Q_hw[i];
		// Print values
		printf("Software: %f. Hardware: %f. Delta: %f. \n",Q_sw[i], Q_hw[i], delta);
		// Check delta
		if(fabs(delta) > 0.01) return 1;
	}
	
	if (DataOutput != DataInput) return 1;

	return 0;
}
