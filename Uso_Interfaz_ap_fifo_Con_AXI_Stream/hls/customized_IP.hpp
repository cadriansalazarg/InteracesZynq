#include<hls_stream.h>
#include<ap_int.h>

#define SIZE 2048
#define NUM_OF_TESTS 1000

typedef int	data_t;



typedef int data_type;

struct AXISTREAM32{
	data_t data;
	ap_int<1> tlast;
};


void customized_IP_block(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output , hls::stream<data_t>& in_fifo, hls::stream<data_t>& out_fifo);
