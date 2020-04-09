#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "customized_IP.hpp"

int main(){

	data_type Data_Sent[SIZE];
	data_type Data_Received_AXIStream[SIZE];
	data_type Data_Received_fifo[SIZE];
	
	hls::stream<AXISTREAM32> input_buffer;
	hls::stream<AXISTREAM32> output_buffer;
	
	hls::stream<data_t> input_fifo;
	hls::stream<data_t> output_fifo;
	
	int i, j;  // Variables para los loops
	
	InicializarArregloEntrada: for(i=0; i<SIZE; i++){
		Data_Sent[i] = i;
	}
	
	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS ; j++){

		EscribirBuffer: for (i=0; i<SIZE;i++){
			AXISTREAM32 a;
			a.data = Data_Sent[i];
			a.tlast = (i==SIZE-1)? 1:0;
			input_buffer.write(a);
		}
		
		EscribirFIFO: for (i=0; i<SIZE;i++){
			input_fifo.write(Data_Sent[i]);
		}

		customized_IP_block(input_buffer, output_buffer, input_fifo, output_fifo);

		LeerBuffer: for (i=0; i<SIZE; i++){
			AXISTREAM32 a;
			a = output_buffer.read();
			Data_Received_AXIStream[i] = a.data;
		}
		
		i = 0;
	    LeerFIFO: while(!output_fifo.empty()){
		  Data_Received_fifo[i] = output_fifo.read();
		  i++;
	    }
		
		Validation_AXIStream: for (i=0; i<SIZE; i++){
			printf("Paso de simulación %d. Elemento del areglo: %d. Dato teórico: %d. Dato obtenido AXI Stream: %d.\n", j+1, i, Data_Sent[i], Data_Received_AXIStream[i]);
			if(Data_Received_AXIStream[i] != Data_Sent[i]){
				printf("Error en el dato número %d del arreglo",i);
				return 0;
			}
		}
		
		Validation_FIFO: for (i=0; i<SIZE; i++){
			printf("Paso de simulación %d. Elemento del areglo: %d. Dato teórico: %d. Dato obtenido FIFO: %d.\n", j+1, i, Data_Sent[i], Data_Received_fifo[i]);
			if(Data_Received_fifo[i] != Data_Sent[i]){
				printf("Error en el dato número %d del arreglo",i);
				return 0;
			}
		}
	}
	
	printf("La simulación funcionó sin problemas\n");
	return 0;
}
