#include <hls_stream.h>
#include <string.h>
#include <ap_int.h>
#include "packaging_IP.hpp"

data_t Message[PAYLOAD_MESSAGE_BYTES/4];

void memcopy(int Payload[PAYLOAD_PACKET_BYTES/4], unsigned int offset, unsigned short int valid_bytes);

void packaging_IP_block(hls::stream<packaging_data>& in_fifo, hls::stream<AXISTREAM32> &output){

	
	packaging_data packet;
	unsigned int offset = 0;
	
	
	
	Loop_Productor: while(!in_fifo.empty()) {
        packet = in_fifo.read();
        memcopy(packet.MESSAGE, offset, packet.VALID_PACKET_BYTES);
        offset = offset + (packet.VALID_PACKET_BYTES>>2);
    } 
    
    Loop_Consumidor: for(int i = 0; i<(PAYLOAD_MESSAGE_BYTES>>2); i++){
        AXISTREAM32 a;
		a.data = Message[i];
		a.tlast = (i==((PAYLOAD_MESSAGE_BYTES>>2)-1)) ? 1 : 0;
		output.write(a);
    } 
	
}


void memcopy(int Payload[PAYLOAD_PACKET_BYTES/4], unsigned int offset, unsigned short int valid_bytes) {
	int i;
	for (int i = 0; i<(valid_bytes>>2); i++){
		Message[i+offset] = Payload[i];
	}
}
