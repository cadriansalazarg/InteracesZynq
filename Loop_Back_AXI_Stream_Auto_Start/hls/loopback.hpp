#include<hls_stream.h>
#include<ap_int.h>

#define SIZE 2048
#define NUM_OF_TESTS 100


typedef int data_type;

struct AXISTREAM32{
	int data;
	ap_int<1> tlast;
};




void loopback(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output);
