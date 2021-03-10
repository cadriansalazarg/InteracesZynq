#include "matrixmul.h"

//****** Encabezado de las funciones que existen en esta función ***************
void productor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &input);
void consumidor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &output);


void Wrapper_Matrix_Multiplier(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output){

	static hls::stream<int> bus_local;

	productor(bus_local, input);
	consumidor(bus_local, output);
}

void productor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &input) {
	Loop_Productor: for (int i = 0; i < ((MAT_A_ROWS * MAT_A_COLS)+(MAT_B_ROWS * MAT_B_COLS)); i++) {
		auto a = input.read();
		bus_local.write(a.data);
	}
	
}

void consumidor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &output) {
	mat_a_t in_mat_a[MAT_A_ROWS][MAT_A_COLS];
    mat_b_t in_mat_b[MAT_B_ROWS][MAT_B_COLS];
    result_t result[MAT_Y_ROWS][MAT_Y_COLS];
    
    Loop_Reorganizing_Data_MatrixA: for (int i = 0; i < MAT_A_ROWS ; i++) { 
		for (int j = 0; j < MAT_A_COLS; j++){
			in_mat_a[i][j] = bus_local.read();
		}
	}
	
	Loop_Reorganizing_Data_MatrixB: for (int i = 0; i < MAT_B_ROWS ; i++) { 
		for (int j = 0; j < MAT_B_COLS; j++){
			in_mat_b[i][j] = bus_local.read();
		}
	}
	
	matrixmul(in_mat_a, in_mat_b, result);
	
	Loop_Consumidor:for (int i = 0; i < MAT_Y_ROWS; i++) {
		for (int j = 0; j < MAT_Y_COLS; j++){
			AXISTREAM32 a;
			a.data = result[i][j];
			a.tlast = ((i == (MAT_Y_ROWS-1)) && (j == (MAT_Y_COLS-1)))  ? 1 : 0;
			output.write(a);
		}
	}
}

void matrixmul( mat_a_t a[MAT_A_ROWS][MAT_A_COLS], mat_b_t b[MAT_B_ROWS][MAT_B_COLS], result_t res[MAT_Y_ROWS][MAT_Y_COLS]){
	
	mat_a_t a_row[MAT_A_COLS];
	int tmp = 0;

	// Iterate over the rowa of the A matrix
	Row: for(int i = 0; i < MAT_A_ROWS; i++) {
		// Iterate over the columns of the B matrix
		Col: for(int j = 0; j < MAT_B_COLS; j++) {
			// Do the inner product of a row of A and col of B
			tmp=0;
			// Cache each row (so it's only read once per function)
			if (j == 0)
				Cache_Row: for(int k = 0; k < MAT_A_COLS; k++)
					a_row[k] = a[i][k];

			Product: for(int k = 0; k < MAT_B_ROWS; k++) {
				tmp += a_row[k] * b[k][j];
			}
			res[i][j] = tmp;
		}
    }
}

