#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "unpackaging_IP.hpp"

//#define DEBUG 1   // Uncomment for debugging

bool checkForEquality(data_type x, data_type y);

int main(){
	
	char current_node = 0;
	
	unsigned int i, j;
	unsigned int offset = 1;  // Starts in 1, because the first four bytes,are part of the header
	
	unsigned short int valid = PAYLOAD_PACKET_BYTES;
	
	unsigned int count_valid = 0;
	
	hls::stream<packaging_data> input_fifo;
	hls::stream<AXISTREAM32> output_buffer;
	
	packaging_data Data_Input [NUM_TOTAL_OF_PACKETS];
	data_type Data_Received_AXIStream[(PAYLOAD_MESSAGE_BYTES/4)*NUM_OF_NODES_EXCLUDE];
	
	data_type Original_Message[(NUM_TOTAL_OF_PACKETS)*(PAYLOAD_PACKET_BYTES/4)+1]; // This is the original Message
		
	data_type Validation_Message[(PAYLOAD_MESSAGE_BYTES/4)*NUM_OF_NODES_EXCLUDE];
	// ************************************ Creating a message for validation *****************************************************
	int offset_validation;
	int index_validation = 0;
	for(int i = 0; i<NUM_OF_NODES_EXCLUDE; i++){
		offset_validation = i*(PAYLOAD_PACKET_BYTES/4);
		for(int p = 0; p<NUMBER_OF_PACKETS; p++){
			for (j = 0; j<(PAYLOAD_PACKET_BYTES/4); j++){
				if((p*(PAYLOAD_PACKET_BYTES/4)+j)<(PAYLOAD_MESSAGE_BYTES/4)){
					Validation_Message[index_validation] = offset_validation+j;
					index_validation += 1;
					
				}
			}
			offset_validation += (PAYLOAD_PACKET_BYTES/4)*(NUM_OF_NODES_EXCLUDE);

		}
			
	}	
		
	// ************************************ Creating the original message to be transmitted ************************************
	for(j=0; j<=(NUM_TOTAL_OF_PACKETS)*(PAYLOAD_PACKET_BYTES/4); j++){
		if (j==0)
			Original_Message[j] = 0x00020000; 
		else
			Original_Message[j] = j-1;
	}
	
	
	// ************************************ Creating the reference model ************************************	

	unsigned char TX_Node;
	for(j=0; j<NUM_TOTAL_OF_PACKETS; j++){
		Data_Input[j].BS_ID = 0x00;
		Data_Input[j].FPGA_ID = 0x00;
		Data_Input[j].PCKG_ID = j;
		Data_Input[j].RX_UID = (0x00FF0000&Original_Message[0])>>16;
		TX_Node = j % NUM_OF_NODES_EXCLUDE;
		TX_Node = (TX_Node >= current_node)? TX_Node+1: TX_Node;
		Data_Input[j].TX_UID = (TX_Node);
	}
	
	for (i=0; i<NUM_TOTAL_OF_PACKETS; i++){  
		for (j=0; j<PAYLOAD_PACKET_BYTES/4; j++){
			Data_Input[i].MESSAGE[j] = Original_Message[j+offset];
		}

		offset = offset +j;
		if (i >= NUM_TOTAL_OF_PACKETS - (NUM_OF_NODES_EXCLUDE))
			valid = (PAYLOAD_MESSAGE_BYTES)-((NUMBER_OF_PACKETS-1)*(PAYLOAD_PACKET_BYTES));
		Data_Input[i].VALID_PACKET_BYTES = valid;
	}
	
	// ************************************ Just for debugging, uncomment the macro for starting debugging *****************
	#ifdef DEBUG
		printf("Parameter NUMBER_OF_PACKETS is equal to: %d \n",(MESSAGE_SIZE_BYTES/4)+(PAYLOAD_MESSAGE_BYTES*(NUM_OF_NODES_EXCLUDE-1)));
		printf("Parameter NUMBER_OF_PACKETS is equal to: %d \n",NUMBER_OF_PACKETS);
		printf("Parameter PAYLOAD_PACKET_BYTES is equal to: %d \n",PAYLOAD_PACKET_BYTES);
		printf("Parameter MESSAGE_SIZE_BYTES is equal to: %d \n",MESSAGE_SIZE_BYTES);
		printf("Parameter NUM_TOTAL_OF_PACKETS is equal to: %d \n",NUM_TOTAL_OF_PACKETS);
		printf("valid value is equal to: %d \n", valid);
   
		for(i=0; i<NUM_TOTAL_OF_PACKETS; i++){
			printf("************************************************************ \n");
			printf("BS_ID identifier is equal to: %x \n",Data_Input[i].BS_ID);
			printf("FPGA_ID identifier is equal to: %x \n",Data_Input[i].FPGA_ID);
			printf("TX_UID identifier is equal to: %x \n",Data_Input[i].TX_UID);
			printf("RX_UID identifier is equal to: %x \n",Data_Input[i].RX_UID);
			printf("PCKG_ID identifier is equal to: %d \n",Data_Input[i].PCKG_ID);
			printf("VALID_PACKET_BYTES is equal to: %d \n",Data_Input[i].VALID_PACKET_BYTES);
			printf("************************************************************ \n");
		}
		
		for (j=0; j<NUM_TOTAL_OF_PACKETS; j++){
			for (i=0;i<(PAYLOAD_PACKET_BYTES/4); i++){
				printf("Data number %d is equal to %d\n",i,Data_Input[j].MESSAGE[i]);
			}
			printf("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \n");
		}
    #endif
	 
	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS; j++){

		printf("***************Number of test %d*******************\n", j);
		
		WriteFIFO: for (i=0; i<NUM_TOTAL_OF_PACKETS;i++){
			input_fifo.write(Data_Input[i]);
		}
		
		// Invoking the uut
		unpackaging_IP_block(input_fifo, output_buffer, current_node);
		
		ReadBuffer: for (i=0; i<(PAYLOAD_MESSAGE_BYTES/4)*(NUM_OF_NODES_EXCLUDE); i++){
			AXISTREAM32 a;
			a = output_buffer.read();
			Data_Received_AXIStream[i] = a.data;
		} 
		
		Validation: for (i=0; i<(PAYLOAD_MESSAGE_BYTES/4)*(NUM_OF_NODES_EXCLUDE); i++){
		#ifdef DEBUG
			printf("Data received: %d. Expected Data: %d .\n",Data_Received_AXIStream[i],Validation_Message[i]);
		#endif
			if (!checkForEquality(Data_Received_AXIStream[i], Validation_Message[i])){
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
