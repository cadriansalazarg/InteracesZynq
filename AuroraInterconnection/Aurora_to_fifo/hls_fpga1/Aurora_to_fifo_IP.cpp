#include <hls_stream.h>
#include "Aurora_to_fifo_IP.hpp"

void Aurora_to_fifo_IP_fpga1_block(hls::stream<unsigned int> &input_fifo, hls::stream<packaging_data>& out_fifo, ap_uint<1> *SequenceError){


	unsigned int input_buff[PACKAGE_SIZE_BYTES/4];
	packaging_data packet_data;
	static unsigned char sequencer = 0;
	unsigned char current_sequencer_id;


	//unsigned char ROM_Address;
	unsigned char bus_id;
	unsigned char i = 0;


	// Read input stream

	LoopProducer: for (i=0; i<(PACKAGE_SIZE_BYTES/4); i++)
	{
		while(input_fifo.empty());
		input_buff[i] = input_fifo.read();
	}


	// Write packet


	bus_id = (unsigned char)(((0x00FF0000)&input_buff[1])>>16);
	current_sequencer_id = (unsigned char)(((0xFF000000)&input_buff[0])>>24);
	
		
	packet_data.FPGA_ID = (unsigned char)(((0x00FF0000)&input_buff[0])>>16);
	packet_data.PCKG_ID = (unsigned short int)((0x0000FFFF)&input_buff[0]);

	packet_data.TX_UID = (unsigned char)(((0xFF000000)&input_buff[1])>>24);
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	packet_data.VALID_PACKET_BYTES = (unsigned short int)(((0x0000FFFF)&input_buff[1]));

#if PACKAGE_SIZE_BYTES == 32
	packet_data.MESSAGE[5] = input_buff[2];
	packet_data.MESSAGE[4] = input_buff[3];
	packet_data.MESSAGE[3] = input_buff[4];
	packet_data.MESSAGE[2] = input_buff[5];
	packet_data.MESSAGE[1] = input_buff[6];
	packet_data.MESSAGE[0] = input_buff[7];
#elif PACKAGE_SIZE_BYTES == 64
	packet_data.MESSAGE[13] = input_buff[2];
	packet_data.MESSAGE[12] = input_buff[3];
	packet_data.MESSAGE[11] = input_buff[4];
	packet_data.MESSAGE[10] = input_buff[5];
	packet_data.MESSAGE[9] = input_buff[6];
	packet_data.MESSAGE[8] = input_buff[7];
	packet_data.MESSAGE[7] = input_buff[8];
	packet_data.MESSAGE[6] = input_buff[9];
	packet_data.MESSAGE[5] = input_buff[10];
	packet_data.MESSAGE[4] = input_buff[11];
	packet_data.MESSAGE[3] = input_buff[12];
	packet_data.MESSAGE[2] = input_buff[13];
	packet_data.MESSAGE[1] = input_buff[14];
	packet_data.MESSAGE[0] = input_buff[15];
#elif PACKAGE_SIZE_BYTES == 128
	packet_data.MESSAGE[29] = input_buff[2];
	packet_data.MESSAGE[28] = input_buff[3];
	packet_data.MESSAGE[27] = input_buff[4];
	packet_data.MESSAGE[26] = input_buff[5];
	packet_data.MESSAGE[25] = input_buff[6];
	packet_data.MESSAGE[24] = input_buff[7];
	packet_data.MESSAGE[23] = input_buff[8];
	packet_data.MESSAGE[22] = input_buff[9];
	packet_data.MESSAGE[21] = input_buff[10];
	packet_data.MESSAGE[20] = input_buff[11];
	packet_data.MESSAGE[19] = input_buff[12];
	packet_data.MESSAGE[18] = input_buff[13];
	packet_data.MESSAGE[17] = input_buff[14];
	packet_data.MESSAGE[16] = input_buff[15];
	packet_data.MESSAGE[15] = input_buff[16];
	packet_data.MESSAGE[14] = input_buff[17];
	packet_data.MESSAGE[13] = input_buff[18];
	packet_data.MESSAGE[12] = input_buff[19];
	packet_data.MESSAGE[11] = input_buff[20];
	packet_data.MESSAGE[10] = input_buff[21];
	packet_data.MESSAGE[9] = input_buff[22];
	packet_data.MESSAGE[8] = input_buff[23];
	packet_data.MESSAGE[7] = input_buff[24];
	packet_data.MESSAGE[6] = input_buff[25];
	packet_data.MESSAGE[5] = input_buff[26];
	packet_data.MESSAGE[4] = input_buff[27];
	packet_data.MESSAGE[3] = input_buff[28];
	packet_data.MESSAGE[2] = input_buff[29];
	packet_data.MESSAGE[1] = input_buff[30];
	packet_data.MESSAGE[0] = input_buff[31];
#else
	#error "El tamaño de paquete solo está definido para paquetes de tamaño de 32 bytes (256 bits), 64 bytes (512 bits), 128 bytes (1024 bits)."
#endif


	
	out_fifo.write(packet_data);
	
		
	// Flag for Sequence Error
	if (current_sequencer_id != sequencer)
		*SequenceError = 1;
	else 
		*SequenceError = 0;
		
	sequencer ++;
	
}
