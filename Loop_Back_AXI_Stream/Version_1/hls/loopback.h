#include<hls_stream.h>
#include<ap_int.h>

const int SIZE = 8;

struct AXISTREAM32{
	int data;
	ap_int<1> tlast;
};

void loopback(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output);
