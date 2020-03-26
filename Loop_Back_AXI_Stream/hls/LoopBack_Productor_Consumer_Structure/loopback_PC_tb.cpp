#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "loopback_PC.hpp"

int main(){

	data_type DataSended[SIZE];
	data_type DataReceived[SIZE];
	hls::stream<AXISTREAM32> inputbuffer;
	hls::stream<AXISTREAM32> outputbuffer;
	
	InicializarArregloEntrada: for(int k=0; k<SIZE; k++){
		DataSended[k] = k;
	}
	
	ExecuteNumberOfSteps: for (int j=0; j<NUM_OF_TESTS ; j++){

		EscribirBuffer: for (int i=0; i<SIZE;i++){
			AXISTREAM32 a;
			a.data = DataSended[i];
			a.tlast = (i==SIZE-1)? 1:0;
			inputbuffer.write(a);
		}


		loopback(inputbuffer, outputbuffer);

		LeerBuffer: for (int i=0; i<SIZE; i++){
			AXISTREAM32 a;
			a = outputbuffer.read();
			DataReceived[i] = a.data;
		}
	
		Validation: for (int i=0; i<SIZE; i++){
			printf("Paso de simulación %d. Elemento del areglo: %d. Dato teórico: %d. Dato obtenido del hardware: %d.\n", j+1, i, DataSended[i], DataReceived[i]);
			if(DataReceived[i] != DataSended[i]){
				printf("Error en el dato número %d del arreglo",i);
				return 0;
			}
		}
	}
	
	printf("La simulación funcionó sin problemas\n");
	return 0;
}
