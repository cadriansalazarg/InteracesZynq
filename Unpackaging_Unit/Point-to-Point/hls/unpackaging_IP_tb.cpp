#include <iostream>
#include "unpackaging_IP.hpp"

//#define DEBUG 1   // Uncomment for debugging

bool checkForEquality(data_type x, data_type y);

int main(){
	
	
	unsigned int i, j;
	unsigned short int offset = 1;  // Starts in 1, because the first four bytes,are part of the header
	
	unsigned short int valid = PAYLOAD_PACKET_BYTES;
	
	unsigned int count_valid = 0;
	
	hls::stream<packaging_data> input_fifo;
	hls::stream<AXISTREAM32> output_buffer;
	
	packaging_data Data_Input [NUMBER_OF_PACKETS];
	data_type Data_Received_AXIStream[PAYLOAD_MESSAGE_BYTES/4];
	
	data_type Original_Message[MESSAGE_SIZE_BYTES/4]; // This is the original Message
	
	
	// ************************************ Creating the original message to be transmitted ************************************
	for(j=0; j<MESSAGE_SIZE_BYTES/4; j++){
		if (j==0)
			Original_Message[j] = 0x01020000; 
		else
			Original_Message[j] = j-1; 
	}
	
	
	// ************************************ Creating the reference model ************************************	
	// Header message structure:
	// Byte 3 = RX_UID
	// Byte 2 = TX_UID
	// Byte 0-1 = 0 always
	// {RX_UID, TXUID, 4'd0, 4'd0}
	
	for(j=0; j< NUMBER_OF_PACKETS; j++){
		Data_Input[j].BS_ID = 0x00;
		Data_Input[j].FPGA_ID = 0x00;
		Data_Input[j].PCKG_ID = j;
		Data_Input[j].TX_UID = (0x00FF0000&Original_Message[0])>>16;
		Data_Input[j].RX_UID = (0xFF000000&Original_Message[0])>>24;
	}
	
	for (i=0; i<NUMBER_OF_PACKETS; i++){
		for (j=0; j<PAYLOAD_PACKET_BYTES/4; j++){
			if(j+offset < MESSAGE_SIZE_BYTES/4)
				Data_Input[i].MESSAGE[j] = Original_Message[j+offset];
			else { 
				if (count_valid == 0){
					count_valid = count_valid + 1;
					valid = (j<<2);  
				}
				Data_Input[i].MESSAGE[j] = Original_Message[j+offset];
			}
		}
		offset = offset +j;
		Data_Input[i].VALID_PACKET_BYTES = valid;
	}
	
	
	// ************************************ Just for debugging, uncomment the macro for starting debugging *****************
	#ifdef DEBUG
		printf("Parameter NUMBER_OF_PACKETS is equal to: %d \n",NUMBER_OF_PACKETS);
		printf("Parameter PAYLOAD_PACKET_BYTES is equal to: %d \n",PAYLOAD_PACKET_BYTES);
		printf("Parameter MESSAGE_SIZE_BYTES is equal to: %d \n",MESSAGE_SIZE_BYTES);
		printf("valid value is equal to: %d \n", valid);
   
		for(i=0; i<NUMBER_OF_PACKETS; i++){
			printf("************************************************************ \n");
			printf("BS_ID identifier is equal to: %x \n",Data_Input[i].BS_ID);
			printf("FPGA_ID identifier is equal to: %x \n",Data_Input[i].FPGA_ID);
			printf("TX_UID identifier is equal to: %x \n",Data_Input[i].TX_UID);
			printf("RX_UID identifier is equal to: %x \n",Data_Input[i].RX_UID);
			printf("PCKG_ID identifier is equal to: %d \n",Data_Input[i].PCKG_ID);
			printf("VALID_PACKET_BYTES is equal to: %d \n",Data_Input[i].VALID_PACKET_BYTES);
			printf("************************************************************ \n");
		}
		
		for (j=0; j<NUMBER_OF_PACKETS; j++){
			for (i=0;i<(PAYLOAD_PACKET_BYTES/4); i++){
				printf("Data number %d is equal to %d\n",i,Data_Input[j].MESSAGE[i]);
			}
			printf("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \n");
		}
    #endif
	
	 
	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS; j++){
		
		WriteFIFO: for (i=0; i<NUMBER_OF_PACKETS;i++){
			input_fifo.write(Data_Input[i]);
		}
		
		// Invoking the uut
		unpackaging_IP_block(input_fifo, output_buffer);
		
		ReadBuffer: for (i=0; i<PAYLOAD_MESSAGE_BYTES/4; i++){
			AXISTREAM32 a;
			a = output_buffer.read();
			Data_Received_AXIStream[i] = a.data;
		} 
		
		Validation: for (i=0; i<PAYLOAD_MESSAGE_BYTES/4; i++){
			#ifdef DEBUG
				printf("Data received: %d. Expected Data: %d .\n",Data_Received_AXIStream[i],Original_Message[i+1]);
			#endif
			if (!checkForEquality(Data_Received_AXIStream[i], Original_Message[i+1])){
				printf ("Error in element number %d of the message.\n", i);
				return 1;
			}
		}
		
		
	} 
	
	printf("The simulation was successfully completed\n");
	return 0;
}


bool checkForEquality(data_type x, data_type y)
{
	return !(x ^ y);
}
