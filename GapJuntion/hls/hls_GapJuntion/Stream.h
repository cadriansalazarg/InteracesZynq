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
const uint nsize = 216;

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




const uint PACKAGE_SIZE_BYTES = 32;
const uint PAYLOAD_PACKET_BYTES = (PACKAGE_SIZE_BYTES-8);

const uint NUM_TOTAL_OF_PACKETS_RX = nsize*4/PAYLOAD_PACKET_BYTES; // Número de paquetes recibidos, matriz A + columnas de matriz B
const uint NUM_TOTAL_OF_PACKETS_TX = NUM_TOTAL_OF_PACKETS_RX; // Número de paquetes a transmitir, matriz de resultados


const uint OFFSET_READ_PAYLOAD = ((PAYLOAD_PACKET_BYTES/4) - 1);

struct packaging_data {
   float MESSAGE[PAYLOAD_PACKET_BYTES/4];
   unsigned short int VALID_PACKET_BYTES;
   unsigned char RX_UID;  // Global identifier of the receiving node
   unsigned char TX_UID;  // Global identifier of the transmitting node
   unsigned short int PCKG_ID;
   unsigned char FPGA_ID; // FPGA identifier of the transmitting FPGA
   unsigned char BS_ID;
};


using AXIS_interface_in = hls::stream<packaging_data>;
using AXIS_interface_out = hls::stream<packaging_data>;

void GapJunctionIP(hls::stream<packaging_data> &in_fifo,
		hls::stream<packaging_data>& out_fifo, int size,
		int FirstRow, int LastRow);



#endif
