#include <hls_stream.h>
#include <ap_int.h>
#include "loopback.hpp"

//****** Encabezado de las funciones que existen en esta función ***************
void productor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &input);
void consumidor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &output);




void loopback(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output){
	static hls::stream<int> bus_local;
	productor(bus_local, input);
	consumidor(bus_local, output);
}

void productor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &input){
	Loop_Productor: for (int i = 0; i < SIZE; i++) {
		auto a = input.read();
		bus_local.write(a.data);
	}
}

void consumidor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &output){
	Loop_Consumidor:for (int i = 0; i < SIZE; i++) {
		AXISTREAM32 a;
		a.data = bus_local.read();
		a.tlast = (i == SIZE-1) ? 1 : 0;
		output.write(a);
	}
}
