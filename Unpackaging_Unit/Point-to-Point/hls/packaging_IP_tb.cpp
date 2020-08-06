#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "packaging_IP.hpp"

//#define DEBUG 1

int checkForEquality(int x, int y);

int main(){
	
	
	int i, j;
	int offset = 1;  // Starts in 1, because the first four bytes,are part of the header
	unsigned short int valid = PAYLOAD_PACKET_BYTES;
	
	int count_valid = 0;
	
	hls::stream<packaging_data> input_fifo;
	hls::stream<AXISTREAM32> output_buffer;
	
	packaging_data Data_Input [NUMBER_OF_PACKETS];
	data_t Data_Received_AXIStream[PAYLOAD_MESSAGE_BYTES/4];
	
	int Original_Message[MESSAGE_SIZE_BYTES/4]; // This is the original Message
	
	for(j=0; j<MESSAGE_SIZE_BYTES/4; j++){
		if (j==0)
			Original_Message[j] = 0x01020000; 
		else
			Original_Message[j] = j-1; 
	}
		
	for(j=0; j< NUMBER_OF_PACKETS; j++){
		Data_Input[j].BS_ID = 0x00;
		Data_Input[j].FPGA_ID = 0x00;
		Data_Input[j].PCKG_ID = j;
		Data_Input[j].TX_UID = (0xFF000000&Original_Message[0])>>24;
		Data_Input[j].RX_UID = (0x00FF0000&Original_Message[0])>>16;
	}
	
	#ifdef DEBUG
		printf("Parámetro NUMBER_OF_PACKETS es : %d \n",NUMBER_OF_PACKETS);
		printf("Parámetro PAYLOAD_PACKET_BYTES es : %d \n",PAYLOAD_PACKET_BYTES);
		printf("Parámetro MESSAGE_SIZE_BYTES es : %d \n",MESSAGE_SIZE_BYTES);
		printf("El valor de valid es igual a %d \n", valid);
    #endif
	
	
	
	
	
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
	
		
	#ifdef DEBUG
		for(i=0; i<NUMBER_OF_PACKETS; i++){
			printf("************************************************************ \n");
			printf("El ID del bus es: %x \n",Data_Input[i].BS_ID);
			printf("El ID de la FPGA es: %x \n",Data_Input[i].FPGA_ID);
			printf("El identificador TX es: %x \n",Data_Input[i].TX_UID);
			printf("El identificador RX es: %x \n",Data_Input[i].RX_UID);
			printf("El identificador de paquete es: %d \n",Data_Input[i].PCKG_ID);
			printf("El número de bytes válidos es: %d \n",Data_Input[i].VALID_PACKET_BYTES);
			printf("************************************************************ \n");
		}
		
		for (j=0; j<NUMBER_OF_PACKETS; j++){
			for (i=0;i<(PAYLOAD_PACKET_BYTES/4); i++){
				printf("El dato %d es igual a %x\n",i,Data_Input[j].MESSAGE[i]);
			}
			printf("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \n");
		}
    #endif
	
	 
	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS; j++){
		
		EscribirFIFO: for (i=0; i<NUMBER_OF_PACKETS;i++){
			input_fifo.write(Data_Input[i]);
		}
		
		packaging_IP_block(input_fifo, output_buffer);
		
		LeerBuffer: for (i=0; i<PAYLOAD_MESSAGE_BYTES/4; i++){
			AXISTREAM32 a;
			a = output_buffer.read();
			Data_Received_AXIStream[i] = a.data;
		} 
		
		Validation: for (i=0; i<PAYLOAD_MESSAGE_BYTES/4; i++){
			printf("Dato recibido por AXI Stream es: %d. Dato esperado es: %d .\n",Data_Received_AXIStream[i],Original_Message[i+1]);
			if (!checkForEquality(Data_Received_AXIStream[i], Original_Message[i+1]))
				printf ("Error in element number %d of the message.\n", i);
		}
		
		
	} 
	
	printf("La simulación funcionó sin problemas\n");
	return 0;
}

// Determine if two integers are equal without using comparison
// and arithmetic operators
int checkForEquality(int x, int y)
{
	return !(x ^ y);
}

