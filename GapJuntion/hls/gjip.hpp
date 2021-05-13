#include <hls_stream.h>
#include <ap_int.h>
#include <math.h>

const uint nsize = 216;

using uint=unsigned int;
using data_type = uint;
using byte = unsigned char;
using half_word = unsigned short int;

const uint MAX_POPULATION=1024;

const uint VECTOR_SIZE=4;

const float CONDUCTANCE = 0.04f;


template<uint size=VECTOR_SIZE>
struct template_vector_datapack{
	float data[size];
};

using vector_datapack = template_vector_datapack<>;

template<uint size=VECTOR_SIZE>
struct conductances_datapack{
	ap_uint<32> data[size];
};

struct Config{
	uint population;
	uint start_limit;
	uint end_limit;
	byte bus_id;
	byte fpga_id;
	byte uid;
};



const uint PACKAGE_SIZE_BYTES = 32;
const uint PAYLOAD_PACKET_BYTES = (PACKAGE_SIZE_BYTES-8);

// NUM_TOTAL_OF_PACKETS_RX se calcula como el resultado de
//                                              (NSIZE)
//                        -----------------------------------------------------
//                                      (PAYLOAD_PACKET_BYTES / 4)
//
// Este resultado en caso de que de decimal, deberá redondearse una unidad hacia arriba, ya que el define no admite enteros

// NUM_TOTAL_OF_PACKETS_TX se calcula como el resultado de
//                                   (NSIZE)
//                        ---------------------------
//                         (PAYLOAD_PACKET_BYTES / 4)
//
// Este resultado en caso de que de decimal, deberá redondearse una unidad hacia arriba, ya que el define no admite enteros

const uint NUM_TOTAL_OF_PACKETS_RX = nsize*4/PAYLOAD_PACKET_BYTES; // Número de paquetes recibidos, matriz A + columnas de matriz B
const uint NUM_TOTAL_OF_PACKETS_TX = NUM_TOTAL_OF_PACKETS_RX; // Número de paquetes a transmitir, matriz de resultados


const uint OFFSET_READ_PAYLOAD = ((PAYLOAD_PACKET_BYTES/4) - 1);

struct packaging_data {
   data_type MESSAGE[PAYLOAD_PACKET_BYTES/4];
   half_word VALID_PACKET_BYTES;
   byte RX_UID;  // Global identifier of the receiving node
   byte TX_UID;  // Global identifier of the transmitting node
   half_word PCKG_ID;
   byte FPGA_ID; // FPGA identifier of the transmitting FPGA
   byte BS_ID;
};


using AXIS_interface_in = hls::stream<packaging_data>;
using AXIS_interface_out = hls::stream<packaging_data>;


int
GapJunctionIP(
		AXIS_interface_in &input,
		AXIS_interface_out &output,
		Config &config
);

