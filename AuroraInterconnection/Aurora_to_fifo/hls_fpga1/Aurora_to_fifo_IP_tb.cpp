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
	hls::stream<unsigned int> input_fifo;

	hls::stream<packaging_data> output_fifo;

	packaging_data Data_Received_fifo;
	packaging_data Expected_Value;
	unsigned char bus_id;
	
	ap_uint<1> SequenceError;
	unsigned char sequencer = 0;
	
	unsigned int i, j, k;  // Loops variables

	// Initilizing input array
	ExpectedMessage: for(i=0; i<PACKAGE_SIZE_BYTES/4; i++){
		if(i==0) //Header Message
			Data_Sent[i] = (sequencer>>24);
		else if (i==1)
			Data_Sent[i] = 0x01020018;
		else
			Data_Sent[i] = i - 1;
	}

	
	// Creating expected packet
	bus_id = (unsigned char)(((0x00FF0000)&Data_Sent[1])>>16);
	Expected_Value.FPGA_ID = (unsigned char)(((0x00FF0000)&Data_Sent[0])>>16);
	Expected_Value.PCKG_ID = (unsigned short int)((0x0000FFFF)&Data_Sent[0]);
	Expected_Value.BS_ID = sequencer;


	Expected_Value.TX_UID = (unsigned char)(((0xFF000000)&Data_Sent[1])>>24);
	Expected_Value.RX_UID = (unsigned char)(((0x00FF0000)&Data_Sent[1])>>16);
	Expected_Value.VALID_PACKET_BYTES = (unsigned short int)(((0x0000FFFF)&Data_Sent[1]));


	for (i=2; i<PACKAGE_SIZE_BYTES/4; i++){
		Expected_Value.MESSAGE[(PACKAGE_SIZE_BYTES/4)-1-i] = Data_Sent[i];
	}


	// Start Execution
	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS ; j++){
		
		Data_Sent[0] = (sequencer << 24); // Uodating sequencer
		

		WRITE_INPUT_BUFFER: for (i=0; i<PACKAGE_SIZE_BYTES/4;i++){
			input_fifo.write(Data_Sent[i]);
		}
		
		// invoking the uut
		Aurora_to_fifo_IP_fpga1_block(input_fifo,  output_fifo, &SequenceError);
		
		Data_Received_fifo = output_fifo.read();
		
		if (SequenceError == 1){
			return 1;
		}
		
		sequencer++;

		printf("\n\n\n **************************** Starting Validation **************************** \n\n\n");
		printf("\n\n\n ************************** Simulation step number %d ************************ \n\n\n",j);

		if (!checkForEqualityUnsignedChar(Data_Received_fifo.BS_ID, Expected_Value.BS_ID)){
			printf("Valor recibido %d. Valor esperado %d \n",Data_Received_fifo.BS_ID,Expected_Value.BS_ID);
			printf("Error in BS_ID identifier.\n");
			return 1;
		}

		if (!checkForEqualityUnsignedChar(Data_Received_fifo.FPGA_ID, Expected_Value.FPGA_ID)){
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
