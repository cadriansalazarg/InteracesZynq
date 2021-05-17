#include <hls_stream.h>
#include <ap_int.h>

#define NUM_OF_TESTS 1000
#define PACKAGE_SIZE_BYTES 32
#define NUMBER_OF_LANES 1


#define PAYLOAD_PACKET_BYTES (PACKAGE_SIZE_BYTES-8)

#define OFFSET_READ_PAYLOAD ((PAYLOAD_PACKET_BYTES/4) - 1)




typedef unsigned int data_type;

// Se reordena el struct porque con la directiva datapack, colocado de esta forma, el BS_ID queda en la posición MSB
// La palabra queda entonces ordenada de la siguiente forma, al aplicar el datapack para un paquete de 256 bits
// BS_ID  FPGA_ID   PCKG ID    TX_UID   RX_UID   VALID_PACKET_BYTES   MESSAGE[5]   MESSAGE[4]   MESSAGE[3]   MESSAGE[2]   MESSAGE[1]   MESSAGE[0]     
typedef struct packaging_data {
   data_type MESSAGE[PAYLOAD_PACKET_BYTES/4]; // Carga útil del paquete.
   unsigned short int VALID_PACKET_BYTES; // Número de bytes válidos del mensaje contenido en el paquete.
   unsigned char RX_UID;  // Identificador universal del nodo receptor en la red.
   unsigned char TX_UID;  // Identificador universal del nodo transmisor en la red
   unsigned short int PCKG_ID; // Número de secuenciación de paquete.
   unsigned char FPGA_ID; // Identificador de la FPGA transmisora
   unsigned char BS_ID; // Identificador del bus, se utiliza para la comunicación intra-FPGA usando el  bus.
} packaging_data;

struct AXISTREAM32{
	ap_uint<(32*NUMBER_OF_LANES)> data;
	ap_uint<1> tlast;
};



void fifo_to_Aurora_IP(hls::stream<AXISTREAM32> &output, hls::stream<packaging_data>& in_fifo, unsigned char id_next_fpga);
