#include<hls_stream.h>
#include<ap_int.h>


#define PACKAGE_SIZE_BYTES 128
#define MESSAGE_SIZE_BYTES 4004
#define NUMBER_OF_PACKETS (MESSAGE_SIZE_BYTES-4)/(PACKAGE_SIZE_BYTES-8)+ 1 // Se suma 1, debido a que la división casi siempre no dae entera
#define PAYLOAD_PACKET_BYTES (PACKAGE_SIZE_BYTES-8)
#define PAYLOAD_MESSAGE_BYTES (MESSAGE_SIZE_BYTES-4)

#define NUM_OF_TESTS 1

typedef int	data_t;

typedef struct packaging_data {
   unsigned char BS_ID;
   unsigned char FPGA_ID;
   unsigned short int PCKG_ID;
   unsigned char TX_UID;
   unsigned char RX_UID;
   unsigned short int VALID_PACKET_BYTES;
   int MESSAGE[PAYLOAD_PACKET_BYTES/4];
} packaging_data;

typedef int data_type;

struct AXISTREAM32{
	data_t data;
	ap_int<1> tlast;
};

void packaging_IP_block(hls::stream<packaging_data>& in_fifo, hls::stream<AXISTREAM32> &output);
