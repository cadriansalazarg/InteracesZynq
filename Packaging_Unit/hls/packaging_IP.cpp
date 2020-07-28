#include <hls_stream.h>
#include <ap_int.h>
#include "packaging_IP.hpp"



void packaging_IP_block(hls::stream<AXISTREAM32> &input, hls::stream<packaging_data>& out_fifo){

	unsigned int input_buff[MESSAGE_SIZE_BYTES/4];
	packaging_data packet_data[NUMBER_OF_PACKETS];
	int k = 1;

	Loop_Productor: for (int i = 0; i < MESSAGE_SIZE_BYTES/4; i++) {
		auto a = input.read();
		input_buff[i] = a.data;
	}

	AddingHeader: for (int i = 0; i < NUMBER_OF_PACKETS; i++) {
		packet_data[i].BS_ID = ROM_FOR_BUS_ID[(unsigned char)((0xFF000000)&input_buff[0])>>24];
		packet_data[i].FPGA_ID = (unsigned char)0x0F;
		packet_data[i].TX_UID = (unsigned char)(((0xFF000000)&input_buff[0])>>24);
		packet_data[i].RX_UID = (unsigned char)(((0x00FF0000)&input_buff[0])>>16);
		packet_data[i].MSSG_SZ_BYTES = (unsigned short int)((0x0000FFFF)&input_buff[0]);
		packet_data[i].PCKG_ID = (unsigned short int)((0x0000FFFF)&i);
	}

	Loop_Packaging: for (int i = 0; i < NUMBER_OF_PACKETS; i++) {
		Loop1: for (int j = 0; j < PAYLOAD_PACKET_BYTES/4; j++){
			if (k < MESSAGE_SIZE_BYTES/4)
				packet_data[i].MESSAGE[j] = input_buff[k];
			else
				packet_data[i].MESSAGE[j] = 0x00000000;
			k = k + 1;
		}
	}

	Loop_Consumidor: for (int i = 0; i < NUMBER_OF_PACKETS; i++) {
		out_fifo.write(packet_data[i]);
	}
}
