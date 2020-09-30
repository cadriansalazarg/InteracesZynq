#include <hls_stream.h>
#include "packaging_IP.hpp"

void packaging_IP_block(hls::stream<AXISTREAM32> &input, hls::stream<packaging_data>& out_fifo){


	data_type input_buff[MESSAGE_SIZE_BYTES/4];
	packaging_data packet_data;

	unsigned short int i, j;
	unsigned short int k = 1;

	Loop_Productor: for (i = 0; i < (MESSAGE_SIZE_BYTES>>2); i++) {
		auto a = input.read();
		input_buff[i] = a.data;
	}

	Loop_Packaging: for (i = 0; i < NUMBER_OF_PACKETS; i++) {
		//Adding Header
		packet_data.BS_ID = ROM_FOR_BUS_ID[(unsigned char)((0xFF000000)&input_buff[0])>>24];
		packet_data.FPGA_ID = (unsigned char)0x0F;
		packet_data.TX_UID = (unsigned char)(((0xFF000000)&input_buff[0])>>24);
		packet_data.RX_UID = (unsigned char)(((0x00FF0000)&input_buff[0])>>16);
		packet_data.PCKG_ID = i;

		//Adding Message
		Loop1: for (j = 0; j < PAYLOAD_PACKET_BYTES>>2; j++){
			if (k < MESSAGE_SIZE_BYTES>>2){
				packet_data.MESSAGE[j] = input_buff[k];
				k = k + 1;
			}
			else{
				break;
			}
		}
		packet_data.VALID_PACKET_BYTES = (j<<2);

		//Sending Package
		out_fifo.write(packet_data);
	}
}
