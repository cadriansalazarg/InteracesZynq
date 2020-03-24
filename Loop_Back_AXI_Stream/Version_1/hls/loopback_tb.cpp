#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "loopback.h"

int main(){

	int DataSended[SIZE] = {1,2,3,4,5,6,7,8};
	int DataReceived[SIZE];
	hls::stream<AXISTREAM32> inputbuffer;
	hls::stream<AXISTREAM32> outputbuffer;

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
	
	for (int i=0; i<SIZE; i++){
		printf("El dato del software es %d, el dato del hardware es: %d\n", DataSended[i], DataReceived[i]);
		if(DataReceived[i] != DataSended[i]){
			printf("Error en el dato número %d del arreglo",i);
			return 0;
		}
	}

	return 0;
}
