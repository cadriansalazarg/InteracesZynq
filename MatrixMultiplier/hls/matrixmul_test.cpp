#include <iostream>
#include "matrixmul.h"

using namespace std;

int main(int argc, char **argv)
{
    mat_a_t in_mat_a[MAT_A_ROWS][MAT_A_COLS];   // Columnas  // Filas
    mat_b_t in_mat_b[MAT_B_ROWS][MAT_B_COLS];
   
    result_t hw_result[MAT_Y_ROWS][MAT_Y_COLS], sw_result[MAT_Y_ROWS][MAT_Y_COLS];
    
    hls::stream<AXISTREAM32> inputbuffer;
	hls::stream<AXISTREAM32> outputbuffer;
   
    int err_cnt = 0;
   
	
    // Input stimulus
    for(int i = 0; i < MAT_A_ROWS; i++) {
		for(int j = 0; j < MAT_A_COLS; j++) {
			in_mat_a[i][j] = 1;
		}
	}
	
	for(int i = 0; i < MAT_B_ROWS; i++) {
		for(int j = 0; j < MAT_B_COLS; j++) {
			in_mat_b[i][j] = 1;
		}
	}
	
    // Generate the expected result
    // Iterate over the rows of the A matrix
    for(int i = 0; i < MAT_Y_ROWS; i++) {
		for(int j = 0; j < MAT_Y_COLS; j++) {
			// Iterate over the columns of the B matrix
			sw_result[i][j] = 0;
			// Do the inner product of a row of A and col of B
			for(int k = 0; k < MAT_B_ROWS; k++) {
				sw_result[i][j] += in_mat_a[i][k] * in_mat_b[k][j];
			}
		}
    }
    
    ExecuteNumberOfSteps: for (int j=0; j<NUM_OF_TESTS ; j++){
   
		EscribirBufferMatrixA: for (int i = 0; i < MAT_A_ROWS; i++){
			for(int j = 0; j < MAT_A_COLS; j++) {
				AXISTREAM32 a;
				a.data = in_mat_a[i][j];
				a.tlast = 0;
				inputbuffer.write(a);
			}
		}
	
		EscribirBufferMatrixB: for (int i = 0; i < MAT_B_ROWS; i++){
			for(int j = 0; j < MAT_B_COLS; j++) {
				AXISTREAM32 a;
				a.data = in_mat_a[i][j];
				a.tlast = ((i == (MAT_B_ROWS-1)) && (j == (MAT_B_COLS-1)))  ? 1 : 0;
				inputbuffer.write(a);
			}
		}
	
		#ifdef HW_COSIM
		// Run the AutoESL matrix multiply block
		Wrapper_Matrix_Multiplier(inputbuffer, outputbuffer);
   
		LeerBuffer: for (int i = 0; i < MAT_Y_ROWS; i++){
			for(int j = 0; j < MAT_Y_COLS; j++) {
				AXISTREAM32 a;
				a = outputbuffer.read();
				hw_result[i][j] = a.data;
			}
		}
		#endif

		// Print result matrix
		#ifdef PRINT_RESULTS
		printf(" **************** Imprimiendo la matriz de resultados ****************\n ");
		printf(" Iteración número %d\n ", j+1);
		for (int i = 0; i < MAT_Y_ROWS; i++) {
			printf(" ( ");
			for (int j = 0; j < MAT_Y_COLS; j++) {
				printf(" %d ", hw_result[i][j]);
			}
			printf(" ) \n ");
		}
		printf(" \n \n");
		#endif
		
		// Validation without print
		for (int i = 0; i < MAT_Y_ROWS; i++) {
			for (int j = 0; j < MAT_Y_COLS; j++) {
				#ifdef HW_COSIM
				// Check HW result against SW
				if (hw_result[i][j] != sw_result[i][j]) {
					err_cnt++;
				}
				#else
					cout << sw_result[i][j];
				#endif
			}
		}

		#ifdef HW_COSIM
		if (err_cnt)
			cout << "ERROR: " << err_cnt << " mismatches detected!" << endl;
		else
			cout << "Test passes." << endl;
		#endif
		
	}	
	return err_cnt;
}

