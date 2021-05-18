#include <hls_stream.h>
#include "Aurora_to_fifo_IP.hpp"

void Aurora_to_fifo_IP_fpga2_block(hls::stream< ap_uint<(32*NUMBER_OF_LANES)> > &input_fifo, hls::stream<packaging_data>& out_fifo, volatile ap_uint<1> *SequenceErrorFlag)
{


	ap_uint<(32*NUMBER_OF_LANES)>  input_buff[PACKAGE_SIZE_BYTES/(4*NUMBER_OF_LANES)];
	
	packaging_data packet_data;
	
	static unsigned char sequencer_rx = 0;
	unsigned char sequencer_tx;

	//unsigned char ROM_Address;
	unsigned char bus_id;
	unsigned char i = 0;


	// Read input stream

	LoopProducer: for (i=0; i<(PACKAGE_SIZE_BYTES/(4*NUMBER_OF_LANES)); i++)
	{
		while(input_fifo.empty());
		input_buff[i] = input_fifo.read();
	}
	
	// Reorganizing data
	
#if NUMBER_OF_LANES == 1 && PACKAGE_SIZE_BYTES == 32
	
	bus_id = (unsigned char)(((0x00FF0000)&input_buff[1])>>16);
	
	sequencer_tx = (unsigned char)(((0xFF000000)&input_buff[0])>>24);
	
	packet_data.FPGA_ID = (unsigned char)(((0x00FF0000)&input_buff[0])>>16);
	packet_data.PCKG_ID = (unsigned short int)((0x0000FFFF)&input_buff[0]);

	packet_data.TX_UID = (unsigned char)(((0xFF000000)&input_buff[1])>>24);
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	packet_data.VALID_PACKET_BYTES = (unsigned short int)(((0x0000FFFF)&input_buff[1]));
	
	packet_data.MESSAGE[5] = input_buff[2];
	packet_data.MESSAGE[4] = input_buff[3];
	packet_data.MESSAGE[3] = input_buff[4];
	packet_data.MESSAGE[2] = input_buff[5];
	packet_data.MESSAGE[1] = input_buff[6];
	packet_data.MESSAGE[0] = input_buff[7];
	
#elif NUMBER_OF_LANES == 2 && PACKAGE_SIZE_BYTES == 32
	
	bus_id = (unsigned char)(((0x0000000000FF0000)&input_buff[0])>>16);
	
	sequencer_tx = (unsigned char)(((0xFF00000000000000)&input_buff[0])>>54);
		
	packet_data.FPGA_ID = (unsigned char)(((0x00FF000000000000)&input_buff[0])>>48);
	packet_data.PCKG_ID = (unsigned short int)(((0x0000FFFF00000000)&input_buff[0])>>32);

	packet_data.TX_UID = (unsigned char)(((0x00000000FF000000)&input_buff[0])>>24);
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	packet_data.VALID_PACKET_BYTES = (unsigned short int)(((0x000000000000FFFF)&input_buff[0]));
	
	packet_data.MESSAGE[5] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[1])>>32);
	packet_data.MESSAGE[4] = (unsigned int)(((0x00000000FFFFFFFF)&input_buff[1]));
	packet_data.MESSAGE[3] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[2])>>32);
	packet_data.MESSAGE[2] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[2]);
	packet_data.MESSAGE[1] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[3])>>32);
	packet_data.MESSAGE[0] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[3]);

#elif NUMBER_OF_LANES == 4 && PACKAGE_SIZE_BYTES == 32
	
	ap_uint<(32*NUMBER_OF_LANES)> auxvar1;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar2;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar3;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar4;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar5;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar6;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar7;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar8;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar9;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar10;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar11;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar12;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar13;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar14;
	
	ap_uint<(32*NUMBER_OF_LANES)> auxvar_sequencer_tx;
	
	auxvar_sequencer_tx = input_buff[0] >>120;
	sequencer_tx = (unsigned char)auxvar_sequencer_tx;
	
	auxvar1 = input_buff[0] >>112;
	auxvar2 = (0x000000FF)&auxvar1;
	packet_data.FPGA_ID = (unsigned char)auxvar2;
	
	auxvar3 = input_buff[0] >>96;
	auxvar4 = (0x0000FFFF)&auxvar3;
	packet_data.PCKG_ID = (unsigned short int)auxvar4;

	auxvar5 = input_buff[0] >>88;
	auxvar6 = (0x000000FF)&auxvar5;
	packet_data.TX_UID = auxvar6;
	
	auxvar7 = input_buff[0] >>80;
	auxvar8 = (0x000000FF)&auxvar7;
	bus_id = (unsigned char)auxvar8;
	
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	auxvar9 = input_buff[0] >>64;
	auxvar10 = (0x0000FFFF)&auxvar9;
	packet_data.VALID_PACKET_BYTES = (unsigned short int)auxvar10;
	
	auxvar11 = input_buff[0] >>32;
	packet_data.MESSAGE[5] = (unsigned int)auxvar11;
	
	packet_data.MESSAGE[4] = (unsigned int)input_buff[0];
	
	auxvar12 = input_buff[1] >>96;
	packet_data.MESSAGE[3] = (unsigned int)auxvar12;
	
	auxvar13 = input_buff[1] >>64;
	packet_data.MESSAGE[2] = (unsigned int)auxvar13;
	
	auxvar14 = input_buff[1] >>32;
	packet_data.MESSAGE[1] = (unsigned int)auxvar14;
	
	packet_data.MESSAGE[0] = (unsigned int)input_buff[1];
	
#elif NUMBER_OF_LANES == 1 && PACKAGE_SIZE_BYTES == 64
	
	bus_id = (unsigned char)(((0x00FF0000)&input_buff[1])>>16);
	
	sequencer_tx = (unsigned char)(((0xFF000000)&input_buff[0])>>24);
			
	packet_data.FPGA_ID = (unsigned char)(((0x00FF0000)&input_buff[0])>>16);
	packet_data.PCKG_ID = (unsigned short int)((0x0000FFFF)&input_buff[0]);

	packet_data.TX_UID = (unsigned char)(((0xFF000000)&input_buff[1])>>24);
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	packet_data.VALID_PACKET_BYTES = (unsigned short int)(((0x0000FFFF)&input_buff[1]));
	
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

#elif NUMBER_OF_LANES == 2 && PACKAGE_SIZE_BYTES == 64

	bus_id = (unsigned char)(((0x0000000000FF0000)&input_buff[0])>>16);
	
	sequencer_tx = (unsigned char)(((0xFF00000000000000)&input_buff[0])>>54);
		
	packet_data.FPGA_ID = (unsigned char)(((0x00FF000000000000)&input_buff[0])>>48);
	packet_data.PCKG_ID = (unsigned short int)(((0x0000FFFF00000000)&input_buff[0])>>32);

	packet_data.TX_UID = (unsigned char)(((0x00000000FF000000)&input_buff[0])>>24);
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	packet_data.VALID_PACKET_BYTES = (unsigned short int)(((0x000000000000FFFF)&input_buff[0]));
	
	packet_data.MESSAGE[13] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[1])>>32);
	packet_data.MESSAGE[12] = (unsigned int)(((0x00000000FFFFFFFF)&input_buff[1]));
	packet_data.MESSAGE[11] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[2])>>32);
	packet_data.MESSAGE[10] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[2]);
	packet_data.MESSAGE[9] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[3])>>32);
	packet_data.MESSAGE[8] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[3]);
	packet_data.MESSAGE[7] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[4])>>32);
	packet_data.MESSAGE[6] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[4]);
	packet_data.MESSAGE[5] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[5])>>32);
	packet_data.MESSAGE[4] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[5]);
	packet_data.MESSAGE[3] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[6])>>32);
	packet_data.MESSAGE[2] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[6]);
	packet_data.MESSAGE[1] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[7])>>32);
	packet_data.MESSAGE[0] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[7]);
	
#elif NUMBER_OF_LANES == 4 && PACKAGE_SIZE_BYTES == 64

	ap_uint<(32*NUMBER_OF_LANES)> auxvar1;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar2;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar3;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar4;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar5;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar6;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar7;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar8;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar9;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar10;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar11;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar12;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar13;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar14;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar15;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar16;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar17;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar18;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar19;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar20;
	
	ap_uint<(32*NUMBER_OF_LANES)> auxvar_sequencer_tx;
	
	auxvar_sequencer_tx = input_buff[0] >>120;
	sequencer_tx = (unsigned char)auxvar_sequencer_tx;
	
	auxvar1 = input_buff[0] >>112;
	auxvar2 = (0x000000FF)&auxvar1;
	packet_data.FPGA_ID = (unsigned char)auxvar2;
	
	auxvar3 = input_buff[0] >>96;
	auxvar4 = (0x0000FFFF)&auxvar3;
	packet_data.PCKG_ID = (unsigned short int)auxvar4;

	auxvar5 = input_buff[0] >>88;
	auxvar6 = (0x000000FF)&auxvar5;
	packet_data.TX_UID = auxvar6;
	
	auxvar7 = input_buff[0] >>80;
	auxvar8 = (0x000000FF)&auxvar7;
	bus_id = (unsigned char)auxvar8;
	
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	auxvar9 = input_buff[0] >>64;
	auxvar10 = (0x0000FFFF)&auxvar9;
	packet_data.VALID_PACKET_BYTES = (unsigned short int)auxvar10;
	
	auxvar11 = input_buff[0] >>32;
	packet_data.MESSAGE[13] = (unsigned int)auxvar11;
	
	packet_data.MESSAGE[12] = (unsigned int)input_buff[0];
	
	auxvar12 = input_buff[1] >>96;
	packet_data.MESSAGE[11] = (unsigned int)auxvar12;
	
	auxvar13 = input_buff[1] >>64;
	packet_data.MESSAGE[10] = (unsigned int)auxvar13;
	
	auxvar14 = input_buff[1] >>32;
	packet_data.MESSAGE[9] = (unsigned int)auxvar14;
	
	packet_data.MESSAGE[8] = (unsigned int)input_buff[1];
	
	auxvar15 = input_buff[2] >>96;
	packet_data.MESSAGE[7] = (unsigned int)auxvar15;
	
	auxvar16 = input_buff[2] >>64;
	packet_data.MESSAGE[6] = (unsigned int)auxvar16;
	
	auxvar17 = input_buff[2] >>32;
	packet_data.MESSAGE[5] = (unsigned int)auxvar17;
	
	packet_data.MESSAGE[4] = (unsigned int)input_buff[2];
	
	auxvar18 = input_buff[3] >>96;
	packet_data.MESSAGE[3] = (unsigned int)auxvar18;
	
	auxvar19 = input_buff[3] >>64;
	packet_data.MESSAGE[2] = (unsigned int)auxvar19;
	
	auxvar20 = input_buff[3] >>32;
	packet_data.MESSAGE[1] = (unsigned int)auxvar20;
	
	packet_data.MESSAGE[0] = (unsigned int)input_buff[3];
	
#elif NUMBER_OF_LANES == 1 && PACKAGE_SIZE_BYTES == 128
	
	bus_id = (unsigned char)(((0x00FF0000)&input_buff[1])>>16);
	
	sequencer_tx = (unsigned char)(((0xFF000000)&input_buff[0])>>24);
	
	packet_data.FPGA_ID = (unsigned char)(((0x00FF0000)&input_buff[0])>>16);
	packet_data.PCKG_ID = (unsigned short int)((0x0000FFFF)&input_buff[0]);

	packet_data.TX_UID = (unsigned char)(((0xFF000000)&input_buff[1])>>24);
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	packet_data.VALID_PACKET_BYTES = (unsigned short int)(((0x0000FFFF)&input_buff[1]));
	
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
	
#elif NUMBER_OF_LANES == 2 && PACKAGE_SIZE_BYTES == 128

	bus_id = (unsigned char)(((0x0000000000FF0000)&input_buff[0])>>16);
	
	sequencer_tx = (unsigned char)(((0xFF00000000000000)&input_buff[0])>>54);
		
	packet_data.FPGA_ID = (unsigned char)(((0x00FF000000000000)&input_buff[0])>>48);
	packet_data.PCKG_ID = (unsigned short int)(((0x0000FFFF00000000)&input_buff[0])>>32);

	packet_data.TX_UID = (unsigned char)(((0x00000000FF000000)&input_buff[0])>>24);
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	packet_data.VALID_PACKET_BYTES = (unsigned short int)(((0x000000000000FFFF)&input_buff[0]));
	
	packet_data.MESSAGE[29] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[1])>>32);
	packet_data.MESSAGE[28] = (unsigned int)(((0x00000000FFFFFFFF)&input_buff[1]));
	packet_data.MESSAGE[27] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[2])>>32);
	packet_data.MESSAGE[26] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[2]);
	packet_data.MESSAGE[25] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[3])>>32);
	packet_data.MESSAGE[24] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[3]);
	packet_data.MESSAGE[23] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[4])>>32);
	packet_data.MESSAGE[22] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[4]);
	packet_data.MESSAGE[21] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[5])>>32);
	packet_data.MESSAGE[20] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[5]);
	packet_data.MESSAGE[19] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[6])>>32);
	packet_data.MESSAGE[18] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[6]);
	packet_data.MESSAGE[17] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[7])>>32);
	packet_data.MESSAGE[16] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[7]);
	
	packet_data.MESSAGE[15] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[8])>>32);
	packet_data.MESSAGE[14] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[8]);
	packet_data.MESSAGE[13] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[9])>>32);
	packet_data.MESSAGE[12] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[9]);
	packet_data.MESSAGE[11] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[10])>>32);
	packet_data.MESSAGE[10] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[10]);
	packet_data.MESSAGE[9] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[11])>>32);
	packet_data.MESSAGE[8] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[11]);
	packet_data.MESSAGE[7] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[12])>>32);
	packet_data.MESSAGE[6] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[12]);
	packet_data.MESSAGE[5] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[13])>>32);
	packet_data.MESSAGE[4] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[13]);
	packet_data.MESSAGE[3] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[14])>>32);
	packet_data.MESSAGE[2] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[14]);
	packet_data.MESSAGE[1] = (unsigned int)(((0xFFFFFFFF00000000)&input_buff[15])>>32);
	packet_data.MESSAGE[0] = (unsigned int)((0x00000000FFFFFFFF)&input_buff[15]);
	
#elif NUMBER_OF_LANES == 4 && PACKAGE_SIZE_BYTES == 128

	ap_uint<(32*NUMBER_OF_LANES)> auxvar1;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar2;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar3;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar4;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar5;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar6;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar7;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar8;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar9;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar10;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar11;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar12;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar13;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar14;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar15;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar16;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar17;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar18;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar19;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar20;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar21;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar22;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar23;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar24;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar25;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar26;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar27;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar28;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar29;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar30;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar31;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar32;
	
	ap_uint<(32*NUMBER_OF_LANES)> auxvar_sequencer_tx;
	
	auxvar_sequencer_tx = input_buff[0] >>120;
	sequencer_tx = (unsigned char)auxvar_sequencer_tx;
	
	auxvar1 = input_buff[0] >>112;
	auxvar2 = (0x000000FF)&auxvar1;
	packet_data.FPGA_ID = (unsigned char)auxvar2;
	
	auxvar3 = input_buff[0] >>96;
	auxvar4 = (0x0000FFFF)&auxvar3;
	packet_data.PCKG_ID = (unsigned short int)auxvar4;

	auxvar5 = input_buff[0] >>88;
	auxvar6 = (0x000000FF)&auxvar5;
	packet_data.TX_UID = auxvar6;
	
	auxvar7 = input_buff[0] >>80;
	auxvar8 = (0x000000FF)&auxvar7;
	bus_id = (unsigned char)auxvar8;
	
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	auxvar9 = input_buff[0] >>64;
	auxvar10 = (0x0000FFFF)&auxvar9;
	packet_data.VALID_PACKET_BYTES = (unsigned short int)auxvar10;
	
	auxvar11 = input_buff[0] >>32;
	packet_data.MESSAGE[29] = (unsigned int)auxvar11;
	
	packet_data.MESSAGE[28] = (unsigned int)input_buff[0];
	
	auxvar12 = input_buff[1] >>96;
	packet_data.MESSAGE[27] = (unsigned int)auxvar12;
	
	auxvar13 = input_buff[1] >>64;
	packet_data.MESSAGE[26] = (unsigned int)auxvar13;
	
	auxvar14 = input_buff[1] >>32;
	packet_data.MESSAGE[25] = (unsigned int)auxvar14;
	
	packet_data.MESSAGE[24] = (unsigned int)input_buff[1];
	
	auxvar15 = input_buff[2] >>96;
	packet_data.MESSAGE[23] = (unsigned int)auxvar15;
	
	auxvar16 = input_buff[2] >>64;
	packet_data.MESSAGE[22] = (unsigned int)auxvar16;
	
	auxvar17 = input_buff[2] >>32;
	packet_data.MESSAGE[21] = (unsigned int)auxvar17;
	
	packet_data.MESSAGE[20] = (unsigned int)input_buff[2];
	
	auxvar18 = input_buff[3] >>96;
	packet_data.MESSAGE[19] = (unsigned int)auxvar18;
	
	auxvar19 = input_buff[3] >>64;
	packet_data.MESSAGE[18] = (unsigned int)auxvar19;
	
	auxvar20 = input_buff[3] >>32;
	packet_data.MESSAGE[17] = (unsigned int)auxvar20;
	
	packet_data.MESSAGE[16] = (unsigned int)input_buff[3];
	
	
	auxvar21 = input_buff[4] >>96;
	packet_data.MESSAGE[15] = (unsigned int)auxvar21;
	
	auxvar22 = input_buff[4] >>64;
	packet_data.MESSAGE[14] = (unsigned int)auxvar22;
	
	auxvar23 = input_buff[4] >>32;
	packet_data.MESSAGE[13] = (unsigned int)auxvar23;
	
	packet_data.MESSAGE[12] = (unsigned int)input_buff[4];
	
	
	auxvar24 = input_buff[5] >>96;
	packet_data.MESSAGE[11] = (unsigned int)auxvar24;
	
	auxvar25 = input_buff[5] >>64;
	packet_data.MESSAGE[10] = (unsigned int)auxvar25;
	
	auxvar26 = input_buff[5] >>32;
	packet_data.MESSAGE[9] = (unsigned int)auxvar26;
	
	packet_data.MESSAGE[8] = (unsigned int)input_buff[5];
	
	
	auxvar27 = input_buff[6] >>96;
	packet_data.MESSAGE[7] = (unsigned int)auxvar27;
	
	auxvar28 = input_buff[6] >>64;
	packet_data.MESSAGE[6] = (unsigned int)auxvar28;
	
	auxvar29 = input_buff[6] >>32;
	packet_data.MESSAGE[5] = (unsigned int)auxvar29;
	
	packet_data.MESSAGE[4] = (unsigned int)input_buff[6];
	
	
	auxvar30 = input_buff[7] >>96;
	packet_data.MESSAGE[3] = (unsigned int)auxvar30;
	
	auxvar31 = input_buff[7] >>64;
	packet_data.MESSAGE[2] = (unsigned int)auxvar31;
	
	auxvar32 = input_buff[7] >>32;
	packet_data.MESSAGE[1] = (unsigned int)auxvar32;
	
	packet_data.MESSAGE[0] = (unsigned int)input_buff[7];
	
#else
	#error "El tamaño de paquete solo está definido para paquetes de tamaño de 32 bytes (256 bits), 64 bytes (512 bits), 128 bytes (1024 bits)."
#endif


	// Write packet
	
	out_fifo.write(packet_data);
	
	if (sequencer_rx == sequencer_tx) 
		*SequenceErrorFlag = 0;
	else 
		*SequenceErrorFlag = 1;
	
}
