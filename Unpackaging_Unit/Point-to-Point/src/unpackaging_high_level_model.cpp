// To compile:  g++ unpackaging_high_level_model.cpp -std=c++11 -o unpackaging_high_level_model.o

#include <iostream>
#include <vector>
#include <array>
#include <random>



#define PACKAGE_SIZE_BYTES 128
#define MESSAGE_SIZE_BYTES 4004
#define NUMBER_OF_PACKETS (MESSAGE_SIZE_BYTES-4)/(PACKAGE_SIZE_BYTES-8)+ 1 // Se suma 1, debido a que la división casi siempre no dae entera
#define PAYLOAD_PACKET_BYTES (PACKAGE_SIZE_BYTES-8)
#define PAYLOAD_MESSAGE_BYTES (MESSAGE_SIZE_BYTES-4)

#define NUM_OF_TESTS 1

typedef int	data_t;

typedef struct packaging_data {
   unsigned char BS_ID;
   unsigned char FPGA_ID;
   unsigned short int PCKG_ID;
   unsigned char TX_UID;
   unsigned char RX_UID;
   unsigned short int VALID_PACKET_BYTES;
   int MESSAGE[PAYLOAD_PACKET_BYTES/4];
} packaging_data;

typedef int data_type;

data_t Message[PAYLOAD_MESSAGE_BYTES/4];


void memcopy(int Payload[PAYLOAD_PACKET_BYTES/4], unsigned int offset, unsigned short int valid_bytes);

int main(){
	
	
	int i, j;
	unsigned int offset = 1;  // Starts in 1, because the first four bytes,are part of the header
	unsigned short int valid = PAYLOAD_PACKET_BYTES;
	
	int count_valid = 0;
	
	
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
		
	printf("Parámetro NUMBER_OF_PACKETS es : %d \n",NUMBER_OF_PACKETS);
	printf("Parámetro PAYLOAD_PACKET_BYTES es : %d \n",PAYLOAD_PACKET_BYTES);
	printf("Parámetro MESSAGE_SIZE_BYTES es : %d \n",MESSAGE_SIZE_BYTES);
	
	
	printf("El valor de valid es igual a %d \n", valid);
	
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
		printf("La letra i es igual a %d \n",i);
		printf("La letra j es igual a %d \n",j);
		printf("El offset es igual a %d \n",offset);
		offset = offset +j;
		Data_Input[i].VALID_PACKET_BYTES = valid;
	}
			
	////****************************** Validación
	
	
	for(i=0; i<NUMBER_OF_PACKETS; i++){
	    printf("************************************************************ \n");
	    printf("El ID del bus es: %x \n",Data_Input[i].BS_ID);
	    printf("El ID del bus es: %x \n",Data_Input[i].FPGA_ID);
	    printf("El identificador TX es: %x \n",Data_Input[i].TX_UID);
	    printf("El identificador RX es: %x \n",Data_Input[i].RX_UID);
	    printf("El identificador de paquete es: %d \n",Data_Input[i].PCKG_ID);
	    printf("El número de bytes válidos es: %d \n",Data_Input[i].VALID_PACKET_BYTES);
	    printf("************************************************************ \n");
	}
	//*******************************
	
	for (i=0;i<PAYLOAD_PACKET_BYTES/4; i++){
		printf("El dato %d es igual a %d\n",i,Data_Input[33].MESSAGE[i]);
	} 
	 
    
    offset = 0;
    
    Loop_Productor: for(i=0; i<NUMBER_OF_PACKETS; i++){
        memcopy(Data_Input[i].MESSAGE, offset, Data_Input[i].VALID_PACKET_BYTES);
        offset = offset + (Data_Input[i].VALID_PACKET_BYTES>>2);
        printf("El valor de offset de valid es %d \n",  Data_Input[i].VALID_PACKET_BYTES>>2);
        printf("El valor de offset es %d en la iteración %d \n", offset, i);
    }
    
    Loop_Consumidor: for(int i = 0; i<(PAYLOAD_MESSAGE_BYTES>>2); i++){
        printf("El mensaje recibido es %d \n",  Message[i]);
		if ((i==((PAYLOAD_MESSAGE_BYTES>>2)-1)))
		    printf("En la iteración número %d se levantó la bandera tlast\n", i);
    }
    	
	printf("La simulación funcionó sin problemas\n");
	return 0;
}


void memcopy(int Payload[PAYLOAD_PACKET_BYTES/4], unsigned int offset, unsigned short int valid_bytes) {
	int i;
	for (int i = 0; i<(valid_bytes>>2); i++){
		Message[i+offset] = Payload[i];
	}
}
