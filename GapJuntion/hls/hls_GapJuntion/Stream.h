#ifndef STREAM
#define STREAM

#ifdef __SYNTHESIS__
#include <assert.h>
#endif
#include "/tools/Xilinx/Vivado/2018.3/include/gmp.h"
#include <hls_stream.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include "ap_int.h"
#include "templates/stream_templates.hpp"


const int inputBusSize=64;
const int PORT_SIZE=inputBusSize/32;


const int BLOCK_SIZE=4;  //Tamaño del bloque nxn, donde n es igual a block_size original 8
const int MAX_V_SIZE=10000;

float const hundred = -1.0 / 100.0;


template< int maxBits>
struct config {
	ap_int<maxBits> rowBegin;
	ap_int<maxBits> rowEnd;
	ap_int<maxBits> rowsToSimulate;
	ap_int<maxBits> BLOCK_NUMBERS;
};
typedef config<27> Config;

typedef dataPackage32<float> dataStream;
typedef hls::stream<dataStream> Stream ;

typedef dataPackage<float,PORT_SIZE> Package64Bits;
typedef hls::stream<Package64Bits> in64Bits ;

typedef dataPackage<float,BLOCK_SIZE> VC_Package;
typedef hls::stream<VC_Package> VC_Stream ;

void GapJunctionIP(in64Bits &input,Stream &output,
    int size,int FirstRow,int LastRow);

#endif
