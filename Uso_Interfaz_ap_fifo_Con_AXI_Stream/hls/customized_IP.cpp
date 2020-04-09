#include <hls_stream.h>
#include <ap_int.h>
#include "customized_IP.hpp"

//****** Encabezado de las funciones que existen en esta función ***************
void productor(hls::stream<data_t>& out_fifo, hls::stream<AXISTREAM32> &input);
void consumidor(hls::stream<data_t>& in_fifo, hls::stream<AXISTREAM32> &output);


void customized_IP_block(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output, hls::stream<data_t>& in_fifo, hls::stream<data_t>& out_fifo){
	productor(out_fifo, input);
	consumidor(in_fifo, output);
}

void productor(hls::stream<data_t>& out_fifo, hls::stream<AXISTREAM32> &input) {
	Loop_Productor: for (int i = 0; i < SIZE; i++) {
		auto a = input.read();
		//while(out_fifo.full());
		out_fifo.write(a.data);
	}
}

void consumidor(hls::stream<data_t>& in_fifo, hls::stream<AXISTREAM32> &output) {
	Loop_Consumidor: while(!in_fifo.empty()) {
        AXISTREAM32 a;
		a.data = in_fifo.read();
		a.tlast = (in_fifo.empty()) ? 1 : 0;
		output.write(a);
    } 
}


/*
    Loop_Consumidor:for (int i = 0; i < SIZE; i++) {
		AXISTREAM32 a;
		a.data = in_fifo.read();
		a.tlast = (i == SIZE-1) ? 1 : 0;
		output.write(a);
	} */
