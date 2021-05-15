#include "Stream.h"
#include <math.h>
#include <time.h>
#include <stdlib.h>


void Simulate_SW(float *VectorC, float *VectorV,hls::stream<float> &output_Software) {

	int i = 0;
	int j = 0;
	int k = 0;

	float f = 0.0;
	float f_acc = 0.0;
	float v_acc = 0.0;
	float v = 0.0;
	float const hundred = -1.0 / 100.0;
	float I_c = 0.0;

	printf("SW____________________________________________\n");

	for (i = 0; i < V_SIZE; i++) {
		f_acc = 0;
		v_acc = 0;
		for (j = 0; j < V_SIZE; j++) {
			v = VectorV[i] - VectorV[j];
			printf("Vi = %f , Vj = %f \n", VectorV[i],VectorV[j]);
			f = v * expf(v * v * hundred);
			f_acc += f * VectorC[k];
			v_acc += v * VectorC[k];
			k++;
		}
		I_c = (0.8 * f_acc + 0.2 * v_acc);
		output_Software.write(I_c);
	}
}

void Generate_Data(float *C, float *V) {
	int i;
	printf("Original Data____________________________________________\n");
	for (i = 0; i < V_SIZE; i++) {
		V[i] = -2.910938 * i;
	}
	for (int i = 0; i < V_SIZE * V_SIZE; i++) {
		C[i] = 0.04;
	}
	printf("_________________________________________________________\n");
}

void Check_Results(hls::stream<float> &output_Software,hls::stream<data_t> &output_Hardware) {
	int successful = 0;
	float sw_result, hw_result;
	float precision = 0.01;
	while (!output_Software.empty()) {
		sw_result = output_Software.read();
		hw_result = output_Hardware.read().data;
		printf("Software Result %f \n", sw_result);
		printf("Hardware Result %f \n \n", hw_result);
		if (fabs(sw_result - hw_result) >= precision) {
			successful = 1;
			//break;
		}
	}
	printf("******************************************\n");
	if (successful == 0) {
		printf("Successful result\n");
	} else {
		printf("Error\n");
	}
	printf("******************************************\n");
}


float V[V_SIZE];
float C[V_SIZE * V_SIZE];

hls::stream<data_t> input("input");
int size=V_SIZE;
stream<data_t> output_Hardware("output");
stream<float> output_Software("output");



int main() {
/*
	Generate_Data(C,V);
	Simulate_SW(C,V,output_Software);

	/*HW */

	data_t in;

/*
	for (int i = 0; i < BLOCK_NUMBERS; i++) {
	for (int j = 0; j < BLOCK_SIZE*BLOCK_SIZE; j++) {

		if(j<BLOCK_SIZE){
			in.data=V[j+i*BLOCK_SIZE];
			in.idx=j;
			input.write(in);
		}


			in.data=0.04;
			in.idx=j;
			input.write(in);
			}
}



		for (int j = 0; j < V_SIZE*V_SIZE; j++) {
			if(j==0){
				Simulate_HW(0,input,output_Hardware,size); //Reset
			}
			else{
				Simulate_HW(1,input,output_Hardware,size);
			}

		}




	Check_Results(output_Software,output_Hardware);
*/



data_t voltage;
data_t conductance;
srand(time(NULL));


for(int it=0;it<1;it++){
	Generate_Data(C,V);
			printf("Test \n");
			int index_matrix_column = 0, index_matrix_row = 0, index_block = 0, row = 0,
					column = 0, row_temp = 0, count_column = 0, index_V = 0,
					index_C = 0, offset_C = 0;
			int blockNumbers = V_SIZE / BLOCK_SIZE; // Cantidad de bloques por fila
			if (V_SIZE % BLOCK_SIZE != 0) { // Si el bloque no es multiplo, se completa la matriz
				blockNumbers++;
			}
			int size_V = blockNumbers * BLOCK_SIZE;
			int last_element = blockNumbers - 1;

			for (index_matrix_row = 0; index_matrix_row < blockNumbers;
					index_matrix_row++) {   //Se recorre en columnas los bloques
				index_C = index_matrix_row * (BLOCK_SIZE * V_SIZE);
				index_V = 0;
				for (index_matrix_column = 0; index_matrix_column < blockNumbers;
						index_matrix_column++) { //Se recorre en columnas los bloques
					count_column = 0;


					for (index_block = 0; index_block < BLOCK_SIZE; index_block++) { //Se divide los V, en bloques
						if (index_V < V_SIZE) {
							voltage.data = V[index_V];
							printf("V %d = %f \n", index_V,V[index_V]);
							voltage.idx = index_V;
							input.write(voltage);

							//	printf("V %f \n", V[index_V]);
							count_column++;
						} else {
							voltage.data = 0.0;
							printf("V %d = %f \n", index_V,0);
							voltage.idx = index_V;
							input.write(voltage);
							//	printf("V %f \n", 0.0);
						}

						index_V++;
					}
					for (index_block = 0; index_block < BLOCK_SIZE; index_block++) { //Se divide los  C, en bloques

						if (index_matrix_column == last_element) { // Se realiza a lógica para determinar si se debe completar los V's segun los bloques
							column = BLOCK_SIZE - count_column;
							if (index_matrix_row != last_element) {
								row++;
								row_temp = row;
							}
						} else {
							column = 0;
						}
						if (index_matrix_row == last_element) {
							row++;
						}

						for (offset_C = index_C; offset_C < index_C + BLOCK_SIZE;
								offset_C++) {
							if (column < BLOCK_SIZE && row <= V_SIZE) {
								conductance.data = 0.04;//C[(index_block * V_SIZE + offset_C)];
								printf("c %d = %f \n", offset_C,0.04);
								conductance.idx = offset_C;
								input.write(conductance);
								//	printf("C %f \n", C[(index_block * V_SIZE + offset_C)]);
							} else {
								conductance.data = 0.0;
								printf("c %d = %f \n", offset_C,0.00);
								conductance.idx = offset_C;
								input.write(conductance);
								//	printf("C %f \n", 0.0);
							}
							column++;
						}

					}
					row = row_temp;
					index_C += BLOCK_SIZE;
					//Simulate_HW(input, output_Hardware, size_V); // por bloque
				}
				//printf("Call");

				Simulate_HW(0,input,output_Hardware,size); //por fila
			}
			Simulate_SW(C,V,output_Software);

		/*	for (int j = 0; j < V_SIZE*V_SIZE; j++) {
				if(j==0){
					Simulate_HW(0,input,output_Hardware,size); //Reset
				}
				else{
					Simulate_HW(1,input,output_Hardware,size);
				}*/

			}
			Check_Results(output_Software,output_Hardware);


	return 0;

	}
