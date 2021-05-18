#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "Aurora_to_fifo_IP.hpp"
#include <stdbool.h>
#define DEBUG 1   // Uncomment for debugging

bool checkForEqualityUnsignedChar(unsigned char x, unsigned char y);
bool checkForEqualityUnsignedShortInt(unsigned short int x, unsigned short int y);
bool checkForEquality(data_type x, data_type y);

const unsigned char fpga_id = 0xF1;
const unsigned char rx_uid_1 = 0x02;
const unsigned char tx_uid_0 = 0x01;


int main(){

	data_type  Data_Sent[PACKAGE_SIZE_BYTES/4];
	
	ap_uint<1> SequenceErrorFlag;
	
	ap_uint<(32*NUMBER_OF_LANES)> Data_Sent_hw[PACKAGE_SIZE_BYTES/(4*NUMBER_OF_LANES)];
	hls::stream< ap_uint<(32*NUMBER_OF_LANES)> > input_fifo;

	hls::stream<packaging_data> output_fifo;

	packaging_data Data_Received_fifo;
	packaging_data Expected_Value;
	unsigned char bus_id;
	unsigned char bus_id_1;
	
	ap_uint<(32*NUMBER_OF_LANES)> auxvar1;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar2;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar3;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar4;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar5;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar6;
	ap_uint<(32*NUMBER_OF_LANES)> auxvar7;
	
	unsigned char sequencer = 0;
	unsigned int sequencer_shift;
	
	unsigned int i, j, k;  // Loops variables

	// Initilizing input array
	ExpectedMessage: for(i=0; i<PACKAGE_SIZE_BYTES/4; i++){
		if(i==0) //Header Message
			Data_Sent[i] = 0x00FFCC12;
		else if (i==1)
			Data_Sent[i] = 0x01020018;
		else
			Data_Sent[i] = i - 1;
	}

	
	// Creating expected packet
	bus_id = (unsigned char)(((0x00FF0000)&Data_Sent[1])>>16);
	bus_id_1 = ROM_FOR_BUS_ID[bus_id];
	Expected_Value.FPGA_ID = (unsigned char)(((0x00FF0000)&Data_Sent[0])>>16);
	Expected_Value.PCKG_ID = (unsigned short int)((0x0000FFFF)&Data_Sent[0]);
	
	Expected_Value.BS_ID = bus_id_1;


	Expected_Value.TX_UID = (unsigned char)(((0xFF000000)&Data_Sent[1])>>24);
	Expected_Value.RX_UID = (unsigned char)(((0x00FF0000)&Data_Sent[1])>>16);
	Expected_Value.VALID_PACKET_BYTES = (unsigned short int)(((0x0000FFFF)&Data_Sent[1]));


	for (i=2; i<PACKAGE_SIZE_BYTES/4; i++){
		Expected_Value.MESSAGE[(PACKAGE_SIZE_BYTES/4)-1-i] = Data_Sent[i];
	}


	// Start Execution
	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS ; j++){
		
		sequencer_shift = (unsigned short int)(sequencer<<24); 
		Data_Sent[0] = Data_Sent[0] | sequencer_shift;
		
		REORGANIZING_DATA: for (i=0; i<PACKAGE_SIZE_BYTES/(4*NUMBER_OF_LANES);i++){
#if NUMBER_OF_LANES == 1
			Data_Sent_hw[i] = Data_Sent[i];
#elif NUMBER_OF_LANES == 2
			auxvar1 = (ap_uint<(32*NUMBER_OF_LANES)>) Data_Sent[2*i];
			auxvar2 = auxvar1<<32;
			auxvar3 = (ap_uint<(32*NUMBER_OF_LANES)>) Data_Sent[(2*i)+1];
			Data_Sent_hw[i] = auxvar2 | auxvar3;
#elif NUMBER_OF_LANES == 4
			auxvar1 = (ap_uint<(32*NUMBER_OF_LANES)>) Data_Sent[4*i];
			auxvar2 = auxvar1<<96;
			auxvar3 = (ap_uint<(32*NUMBER_OF_LANES)>) Data_Sent[(4*i)+1];
			auxvar4 = auxvar3<<64;
			auxvar5 = (ap_uint<(32*NUMBER_OF_LANES)>) Data_Sent[(4*i)+2];
			auxvar6 = auxvar5<<32;
			auxvar7 = (ap_uint<(32*NUMBER_OF_LANES)>) Data_Sent[(4*i)+3];
			Data_Sent_hw[i] = auxvar2 | auxvar4 | auxvar6 | auxvar7;
#else
	#error "Este número de lanes no está definido. SOlo está definifo la aplicación para 1, 2 y 4 lanes"
#endif
		}
		

		WRITE_INPUT_BUFFER: for (i=0; i<PACKAGE_SIZE_BYTES/(4*NUMBER_OF_LANES);i++){
			input_fifo.write(Data_Sent_hw[i]);
		}
		
		// invoking the uut
		Aurora_to_fifo_IP_fpga7_block(input_fifo,  output_fifo, &SequenceErrorFlag);
		
		
		Data_Received_fifo = output_fifo.read();
		
		if (SequenceErrorFlag){
				printf("La bandera Sequence Error se puso en 1\n");
				return 1;
		}
		
		sequencer = sequencer + 1;
		

		printf("\n\n\n **************************** Starting Validation **************************** \n\n\n");
		printf("\n\n\n ************************** Simulation step number %d ************************ \n\n\n",j);

		if (!checkForEqualityUnsignedChar(Data_Received_fifo.BS_ID, Expected_Value.BS_ID)){
			printf("Valor recibido %d. Valor esperado %d \n",Data_Received_fifo.BS_ID,Expected_Value.BS_ID);
			printf("Error in BS_ID identifier.\n");
			return 1;
		}

		if (!checkForEqualityUnsignedChar(Data_Received_fifo.FPGA_ID, Expected_Value.FPGA_ID)){
			printf("Valor recibido %X. Valor esperado %X \n",Data_Received_fifo.FPGA_ID,Expected_Value.FPGA_ID);
			printf("Error in FPGA_ID identifier. \n");
			return 1;
		}

		if (!checkForEqualityUnsignedShortInt(Data_Received_fifo.PCKG_ID, Expected_Value.PCKG_ID)){
			printf("Error in PCKG_ID identifier.\n");
			return 1;
		}

		if (!checkForEqualityUnsignedChar(Data_Received_fifo.TX_UID, Expected_Value.TX_UID)){
			 printf("Error in TX_UID identifier. \n");
			 return 1;
		}

		if (!checkForEqualityUnsignedChar(Data_Received_fifo.RX_UID, Expected_Value.RX_UID)){
			 printf("Error in RX_UID identifier.\n");
			 return 1;
		}

		if (!checkForEqualityUnsignedShortInt(Data_Received_fifo.VALID_PACKET_BYTES, Expected_Value.VALID_PACKET_BYTES)){
			 printf("Error in VALID_PACKET_BYTES identifier. \n");
			 return 1;
		}

		for (i=0; i<PAYLOAD_PACKET_BYTES/4; i++){
			if (!checkForEquality(Data_Received_fifo.MESSAGE[((PAYLOAD_PACKET_BYTES/4)-1)-i], Expected_Value.MESSAGE[((PAYLOAD_PACKET_BYTES/4)-1)-i])){
				 printf("Valor recibido %d. Valor esperado %d. Valor de i es %d \n.",Data_Received_fifo.MESSAGE[((PAYLOAD_PACKET_BYTES/4)-1)-i], Expected_Value.MESSAGE[((PAYLOAD_PACKET_BYTES/4)-1)-i], i);
				 return 1;
			}
		}
		
		
	}
	
	printf("The simulation was successfully completed\n");
	return 0;
}


bool checkForEqualityUnsignedChar(unsigned char x, unsigned char y)
{
	return !(x ^ y);
}


bool checkForEqualityUnsignedShortInt(unsigned short int x, unsigned short int y)
{
	return !(x ^ y);
}


bool checkForEquality(data_type x, data_type y)
{
	return !(x ^ y);
}
