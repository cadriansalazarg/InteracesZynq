#include <hls_stream.h>
#include "packaging_IP.hpp"

// Para el mensaje, el Zynq debe enviar un encabezado de 32 bits, seguido por el payload del mensaje. 
// Con respecto al encabezado, el primer Byte (Byte MSB del mensaje) es el RX_UID (Identificador del nodo receptor), 
// el segundo Byte es el TX_UID (identificador del nodo transmisor), los últimos dos bytes, no tienen uso en este momento
// por lo tanto, pueden ser asignados a cualquier valor.


void packaging_IP_block(hls::stream<AXISTREAM32> &input, hls::stream<packaging_data>& out_fifo, unsigned char fpga_id){



	data_type input_buff[MESSAGE_SIZE_BYTES/4];
	packaging_data packet_data;

	//unsigned char ROM_Address;
	unsigned short int i, j;
	unsigned short int k = 1;

	Loop_Productor: for (i = 0; i < (MESSAGE_SIZE_BYTES>>2); i++) {
		auto a = input.read();
		input_buff[i] = a.data;
	}




	Loop_Packaging: for (i = 0; i < NUMBER_OF_PACKETS; i++) {
		// Header message structure:
		// Byte 3 = RX_UID
		// Byte 2 = TX_UID
		// Byte 0-1 = 0 always
		// {RX_UID, TXUID, 8'd0, 8'd0}

		//Adding Header		
		packet_data.FPGA_ID = fpga_id;
		packet_data.TX_UID = (unsigned char)(((0x00FF0000)&input_buff[0])>>16);
		packet_data.RX_UID = (unsigned char)(((0xFF000000)&input_buff[0])>>24);
		packet_data.PCKG_ID = i;
		packet_data.BS_ID = ROM_FOR_BUS_ID[packet_data.RX_UID];

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
