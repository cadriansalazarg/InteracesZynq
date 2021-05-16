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


/////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////LISTA DE PARÁMETROS QUE SE DEBEN EDITAR /////////////////////////////
// La lista de parámetros editables se muestra a continuación
// MAX_V_SIZE = Tamaño máximo de la red neuronal. Este parámetro siempre debe ser mayor que el parámetro N_SIZE.
// bajo ninguna circunstancia, debe incumplir estar regla.
//
// N_SIZE = Tamaño de la red neuronal a simular. Este número representa el número de neuronas que compone la red.
//
// FUNCTIONAL_UNIT_NUMBER = Este parámetro representa el número de aceleradores de hardware de GapJuntion que 
// se tendrán en la red neuronal. si por ejemplo se tiene 4 FPGAs, y cada FPGA tiene dos aceleradores de GAP JUNCTION
// este parámetro deberá ser colocado en 8. Ya que hay 4 FPGAs y en cada FPGA existirán 2 aceleradores de hardware.
//
// PACKAGE_SIZE_BYTES = Número de bytes que tendrá cada paquete que se transmitirá por el bus. 
////////////////////////////////////////////////////////////////////////////////////////////

const int inputBusSize=64; // Este parámetro no se debe editar ya que el programa se cae si se pone en 32 bits
const int PORT_SIZE=inputBusSize/32;  // Este parámetro no se debe editar ya que el programa se cae si se pone en 32 bits


const int BLOCK_SIZE=4;  //Tamaño del bloque nxn, donde n es igual a block_size original 8. Este parámetro no se debe editar.
const int MAX_V_SIZE=10000;

float const hundred = -1.0 / 100.0; // Este parámetro no se debe editar
const unsigned int N_SIZE = 216;  // Tamaño de la red neuronal. Representa el número de neuronas de la red.

const unsigned int FUNCTIONAL_UNIT_NUMBER = 2; // Número de aceleradores de hardware de Gap Juntion que tendrá toda la red.

template< int maxBits>
struct config {
	ap_int<maxBits> rowBegin;
	ap_int<maxBits> rowEnd;
	ap_int<maxBits> rowsToSimulate;
	ap_int<maxBits> BLOCK_NUMBERS;
	unsigned char bus_id;
	unsigned char fpga_id;
	unsigned char uid;
	unsigned char tid;
};
typedef config<27> Config;

typedef dataPackage32<float> dataStream;
typedef hls::stream<dataStream> Stream ;

typedef dataPackage<float,PORT_SIZE> Package64Bits;
typedef hls::stream<Package64Bits> in64Bits ;

typedef dataPackage<float,BLOCK_SIZE> VC_Package;
typedef hls::stream<VC_Package> VC_Stream ;




const uint PACKAGE_SIZE_BYTES = 32; // Número de bytes que tendrá cada paquete.
const uint PAYLOAD_PACKET_BYTES = (PACKAGE_SIZE_BYTES-8);

const uint NUM_TOTAL_OF_PACKETS_RX = (N_SIZE*4)/PAYLOAD_PACKET_BYTES; // Tensiones de dendritas recibidas a la entrada del IP
const uint NUM_TOTAL_OF_PACKETS_TX = (NUM_TOTAL_OF_PACKETS_RX/FUNCTIONAL_UNIT_NUMBER); // Número de paquetes con el resultado de las gap juntions


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
		int FirstRow, int LastRow, unsigned char bus_id, 
		unsigned char fpga_id, unsigned char uid);



#endif
