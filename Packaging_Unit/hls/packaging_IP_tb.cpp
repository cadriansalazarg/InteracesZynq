#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "packaging_IP.hpp"
#include <stdbool.h>
#define DEBUG 1   // Uncomment for debugging

bool checkForEqualityUnsignedChar(unsigned char x, unsigned char y);
bool checkForEqualityUnsignedShortInt(unsigned short int x, unsigned short int y);
bool checkForEquality(data_type x, data_type y);


int main(){

	data_type  Data_Sent[MESSAGE_SIZE_BYTES/4];
	hls::stream<AXISTREAM32> input_buffer;

	hls::stream<packaging_data> output_fifo;

	packaging_data Data_Received_fifo[NUMBER_OF_PACKETS];
	packaging_data Expected_Value[NUMBER_OF_PACKETS];
	const unsigned char fpga_id = 0xF1;

	unsigned int i, j, k;  // Loops variables

	#ifdef DEBUG
	printf("NUMBER_OF_PACKETS = %d\n", NUMBER_OF_PACKETS);
	#endif

	Initialize_Message_Array: for(i=0; i<MESSAGE_SIZE_BYTES/4; i++){
		if(i==0) //Header Message
			Data_Sent[i] = 0x0201A000;
		else  // Payload
			Data_Sent[i] = i - 1;
	}

	printf("************  Creating the validation model  ************\n");
	
	Adding_Expected_Header: for (i = 0; i < NUMBER_OF_PACKETS; i++) {
		Expected_Value[i].FPGA_ID = fpga_id;
		Expected_Value[i].TX_UID = (unsigned char)(((0x00FF0000)&Data_Sent[0])>>16);
		Expected_Value[i].RX_UID = (unsigned char)(((0xFF000000)&Data_Sent[0])>>24);
		Expected_Value[i].PCKG_ID = i;
		Expected_Value[i].BS_ID = ROM_FOR_BUS_ID[Expected_Value[i].RX_UID];
	}
	

	k = 1;  // Must be set to 1, considering that the first four-byte are the  message headers

	Expected_Loop_Packaging: for (i = 0; i < NUMBER_OF_PACKETS; i++) {
		Loop1: for (j = 0; j < PAYLOAD_PACKET_BYTES>>2; j++){
			if (k < MESSAGE_SIZE_BYTES>>2){
				Expected_Value[i].MESSAGE[j] = Data_Sent[k];
				k = k + 1;
			}
			else{
				Expected_Value[i].VALID_PACKET_BYTES = (j<<2);
			    goto jump;
			}
		}
		Expected_Value[i].VALID_PACKET_BYTES = (j<<2);
	}

jump:

	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS ; j++){

		WRITE_INPUT_BUFFER: for (i=0; i<MESSAGE_SIZE_BYTES/4;i++){
			AXISTREAM32 a;
			a.data = Data_Sent[i];
			a.tlast = (i==(MESSAGE_SIZE_BYTES/4)-1)? 1:0;
			input_buffer.write(a);
		}
		
		// invoking the uut
		packaging_IP_block(input_buffer,  output_fifo, fpga_id);

		i = 0;
	    READ_FIFO: while(!output_fifo.empty()){
		   Data_Received_fifo[i] = output_fifo.read();
		   i++;
	    }
	    
	    // ********************************** Validation *********************************************
	    
	    printf("\n\n\n **************************** Starting Validation **************************** \n\n\n");
	    printf("\n\n\n ************************** Simulation step number %d ************************ \n\n\n",j);

	    HEADER_VALIDATION: for (i=0; i<NUMBER_OF_PACKETS;i++){
	    	if (!checkForEqualityUnsignedChar(Data_Received_fifo[i].BS_ID, Expected_Value[i].BS_ID)){
	    		printf("Error in BS_ID identifier. Packet number %d \n",i);
	    		return 1;
	    	}
	    	printf("BS_ID identifier 0x%02x. Packet number %d \n",Data_Received_fifo[i].BS_ID, i);
	    	    	
	    	if (!checkForEqualityUnsignedChar(Data_Received_fifo[i].FPGA_ID, Expected_Value[i].FPGA_ID)){
	    		printf("Error in FPGA_ID identifier. Packet number %d \n",i);
	    		return 1;
	    	}
	    	printf("FPGA_ID identifier 0x%02x. Packet number %d \n", Data_Received_fifo[i].FPGA_ID, i);
	    	
	    	if (!checkForEqualityUnsignedShortInt(Data_Received_fifo[i].PCKG_ID, Expected_Value[i].PCKG_ID)){
	    		printf("Error in PCKG_ID identifier. Packet number %d \n",i);
	    		return 1;
	    	}
	    	printf("PCKG_ID identifier 0x%02x. Packet number %d \n",Data_Received_fifo[i].PCKG_ID, i);
	    	
	    	if (!checkForEqualityUnsignedChar(Data_Received_fifo[i].TX_UID, Expected_Value[i].TX_UID)){
	    		printf("Error in TX_UID identifier. Packet number %d \n",i);
	    		return 1;
	    	}
	    	printf("TX_UID identifier 0x%02x. Packet number %d \n", Data_Received_fifo[i].TX_UID, i);
	    	
	    	if (!checkForEqualityUnsignedChar(Data_Received_fifo[i].RX_UID, Expected_Value[i].RX_UID)){
	    		printf("Error in RX_UID identifier. Packet number %d \n",i);
	    		return 1;
	    	}
			printf("RX_UID identifier 0x%02x. Packet number %d \n", Data_Received_fifo[i].RX_UID, i);

	    	
	    	if (!checkForEqualityUnsignedShortInt(Data_Received_fifo[i].VALID_PACKET_BYTES, Expected_Value[i].VALID_PACKET_BYTES)){
	    		printf("Error in VALID_PACKET_BYTES identifier. Packet number %d \n",i);
	    		return 1;
	    	}
	    	printf("VALID_PACKET_BYTES identifier 0x%02x. Packet number %d \n", Data_Received_fifo[i].VALID_PACKET_BYTES, i);
	    }
		#ifdef DEBUG
	    PRINT_MESSAGES: for (i=0; i<NUMBER_OF_PACKETS;i++){
	    	for(k=0; k < PAYLOAD_PACKET_BYTES/4; k++){
	    		printf("Packet %d. Message %d. Value: %d \n",i, k, Data_Received_fifo[i].MESSAGE[k]);
	    	}
	    }
		#endif

	    printf("\n\n\n **************************** Starting Validation **************************** \n\n\n");

	    MESSAGE_VALIDATION: for (i=0; i<NUMBER_OF_PACKETS;i++){
	    	for(k=0; k < Data_Received_fifo[i].VALID_PACKET_BYTES/4; k++){
	    		if (!checkForEquality(Data_Received_fifo[i].MESSAGE[k], Expected_Value[i].MESSAGE[k])){
	    			printf("Error en paquete %d. Message %d. Valor Esperado: %d. Valor Recibido: %d \n",i+1, k+1, Expected_Value[i].MESSAGE[k], Data_Received_fifo[i].MESSAGE[k]);
	    			return 1;
	    		}
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
