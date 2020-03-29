#include <hls_stream.h>
#include <ap_int.h>
#include "loopback_PC_VS.hpp"

//****** Encabezado de las funciones que existen en esta función ***************
void productor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &input, unsigned int &len_dma);
void consumidor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &output, unsigned int &len_dma);




void loopback(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output, unsigned int &len_dma){
//#pragma HLS INTERFACE axis register port=output
//#pragma HLS INTERFACE axis register both port=input
	static hls::stream<int> bus_local;
//#pragma HLS STREAM variable=bus_local depth=64 dim=1
//#pragma HLS dataflow
	productor(bus_local, input, len_dma);
	consumidor(bus_local, output, len_dma);
}

void productor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &input, unsigned int &len_dma){
	Loop_Productor: for (int i = 0; i < len_dma; i++) {
		auto a = input.read();
		bus_local.write(a.data);
	}
}

void consumidor(hls::stream<int> &bus_local, hls::stream<AXISTREAM32> &output, unsigned int &len_dma){
	Loop_Consumidor:for (int i = 0; i < len_dma; i++) {
		AXISTREAM32 a;
		a.data = bus_local.read();
		a.tlast = (i == len_dma-1) ? 1 : 0;
		output.write(a);
	}
}
