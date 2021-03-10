#ifndef __MATRIXMUL_H__
#define __MATRIXMUL_H__

#include <cmath>
#include <hls_stream.h>
#include <ap_int.h>

using namespace std;

// Compare TB vs HW C-model and/or RTL without prints
#define HW_COSIM

// Print the matrix results
#define PRINT_RESULTS

#define MAT_A_ROWS 10
#define MAT_A_COLS MAT_A_ROWS // Because A is a square matrix

#define MAT_B_ROWS MAT_A_COLS // the numbers of rows in matrix B must be the same value of the number of colunms in matrix A
#define MAT_B_COLS 5

#define MAT_Y_ROWS MAT_A_ROWS
#define MAT_Y_COLS MAT_B_COLS

#define NUM_OF_TESTS 10

typedef int mat_a_t;
typedef int mat_b_t;
typedef int result_t;

struct AXISTREAM32{
	int data;
	ap_int<1> tlast;
};

// Prototype of top level function for C-synthesis
void Wrapper_Matrix_Multiplier(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output);

void matrixmul( mat_a_t a[MAT_A_ROWS][MAT_A_COLS], mat_b_t b[MAT_B_ROWS][MAT_B_COLS], result_t res[MAT_A_ROWS][MAT_B_COLS]);

#endif // __MATRIXMUL_H__ not defined

