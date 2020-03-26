#include<hls_stream.h>
#include<ap_int.h>

const int SIZE = 8;
const unsigned int num_steps = 1000;

typedef int data_type;

struct AXISTREAM32{
	data_type data;
	ap_int<1> tlast;
};


void loopback(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output);
