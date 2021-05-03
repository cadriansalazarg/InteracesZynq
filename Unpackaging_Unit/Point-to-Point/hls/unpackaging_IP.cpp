#include <hls_stream.h>
#include "unpackaging_IP.hpp"

data_type Message[PAYLOAD_MESSAGE_BYTES/4];

void memcopy(data_type Payload[PAYLOAD_PACKET_BYTES/4], unsigned int offset, unsigned short int valid_bytes);

void unpackaging_IP_block(hls::stream<packaging_data>& in_fifo, hls::stream<AXISTREAM32> &output){

	packaging_data packet;
	unsigned short int offset = 0;
	
	
	Loop_Producer: for (unsigned short int i=0; i<NUMBER_OF_PACKETS; i++) {
		while(in_fifo.empty())
		;  // I put the semicolon on this separate line to silence a warning
        packet = in_fifo.read();
        memcopy(packet.MESSAGE, offset, packet.VALID_PACKET_BYTES);
        offset = offset + (packet.VALID_PACKET_BYTES>>2);
    } 
    
    Loop_Consumer: for(unsigned short int i = 0; i<(PAYLOAD_MESSAGE_BYTES>>2); i++){
        AXISTREAM32 a;
		a.data = Message[i];
		a.tlast = (i==((PAYLOAD_MESSAGE_BYTES>>2)-1)) ? 1 : 0;
		output.write(a);
    } 
	
}

void memcopy(data_type Payload[PAYLOAD_PACKET_BYTES/4], unsigned int offset, unsigned short int valid_bytes) {
	unsigned char i;
	LoopPayload: for (i = 0; i<(valid_bytes>>2); i++){
		Message[i+offset] = Payload[OFFSET_READ_PAYLOAD-i]; //Esto porque cuando se crea un paquete, el primer datos siempre se gurada en el último elemento del arreglo, por esta razón para emparejar esto, se agregó esto Payload[OFFSET_READ_PAYLOAD-i]
	}
}
