#include<hls_stream.h>
#include<ap_int.h>


#define PACKAGE_SIZE_BYTES 256
#define MESSAGE_SIZE_BYTES 6000
#define NUM_OF_NODES 4

#define PAYLOAD_PACKET_BYTES (PACKAGE_SIZE_BYTES-8)
#define PAYLOAD_MESSAGE_BYTES (MESSAGE_SIZE_BYTES-4)

//Check if it is necessary to add 1 due to rounding
#if ((PAYLOAD_MESSAGE_BYTES)/(PAYLOAD_PACKET_BYTES)+ 1)*(PAYLOAD_PACKET_BYTES)-(PAYLOAD_MESSAGE_BYTES)==(PAYLOAD_PACKET_BYTES)
	#define NUMBER_OF_PACKETS (MESSAGE_SIZE_BYTES-4)/(PACKAGE_SIZE_BYTES-8)
#else
	#define NUMBER_OF_PACKETS (MESSAGE_SIZE_BYTES-4)/(PACKAGE_SIZE_BYTES-8)+ 1 // One is added to compensate for truncation rounding
#endif

#define NUM_OF_NODES_EXCLUDE (NUM_OF_NODES - 1)
#define NUM_TOTAL_OF_PACKETS  ((NUMBER_OF_PACKETS)*(NUM_OF_NODES_EXCLUDE))

#define NUM_OF_TESTS 2


typedef unsigned int data_type;

typedef struct packaging_data {
   unsigned char BS_ID;
   unsigned char FPGA_ID;
   unsigned short int PCKG_ID;
   unsigned char TX_UID;
   unsigned char RX_UID;
   unsigned short int VALID_PACKET_BYTES;
   data_type MESSAGE[PAYLOAD_PACKET_BYTES/4];
} packaging_data;


struct AXISTREAM32{
	data_type data;
	ap_int<1> tlast;
};

void unpackaging_IP_block(hls::stream<packaging_data>& in_fifo, hls::stream<AXISTREAM32> &output, unsigned char current_node);
