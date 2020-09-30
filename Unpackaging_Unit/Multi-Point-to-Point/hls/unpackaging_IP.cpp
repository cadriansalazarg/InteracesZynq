#include <hls_stream.h>
#include <string.h>
#include "unpackaging_IP.hpp"

data_type Message[(PAYLOAD_MESSAGE_BYTES/4)*NUM_OF_NODES_EXCLUDE];

void memcopy(data_type Payload[PAYLOAD_PACKET_BYTES/4], unsigned short int offset[NUM_OF_NODES-1], unsigned short int valid_bytes, unsigned char TX_UID);

void unpackaging_IP_block(hls::stream<packaging_data>& in_fifo, hls::stream<AXISTREAM32> &output, unsigned char current_node){

	packaging_data packet;

	unsigned short int offset_nodes[NUM_OF_NODES_EXCLUDE];
	
	Offset_Producer:for(char i = 0; i<NUM_OF_NODES_EXCLUDE; i++){
		offset_nodes[i] = (i*PAYLOAD_MESSAGE_BYTES)>>2;
	}
	

	unsigned char TX_offset;
	Loop_Producer: for (unsigned int i=0; i<NUM_TOTAL_OF_PACKETS; i++) {
		while(in_fifo.empty())
		;  // I put the semicolon on this separate line to silence a warning
        packet = in_fifo.read();
        TX_offset = (packet.TX_UID >= current_node)? (packet.TX_UID-1): packet.TX_UID ;
        memcopy(packet.MESSAGE, offset_nodes, packet.VALID_PACKET_BYTES, TX_offset);
        offset_nodes[TX_offset] = offset_nodes[TX_offset] + (packet.VALID_PACKET_BYTES>>2);
    } 
    
    Loop_Consumer: for(unsigned int i = 0; i<((PAYLOAD_MESSAGE_BYTES>>2)*NUM_OF_NODES_EXCLUDE); i++){
        AXISTREAM32 a;
		a.data = Message[i];
		a.tlast = (i==(((PAYLOAD_MESSAGE_BYTES>>2)*NUM_OF_NODES_EXCLUDE)-1)) ? 1 : 0;
		output.write(a);

    } 
	
}

void memcopy(data_type Payload[PAYLOAD_PACKET_BYTES/4], unsigned short int offset[NUM_OF_NODES-1], unsigned short int valid_bytes, unsigned char TX_UID) {
	unsigned char i;
	LoopPayload: for (i = 0; i<(valid_bytes>>2); i++){
		Message[i+offset[TX_UID]] = Payload[i];
	}
}
