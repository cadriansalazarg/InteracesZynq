// To compile:  g++ unpackaging_high_level_model.cpp -std=c++11 -o unpackaging_high_level_model.o

#include <iostream>


#define PACKAGE_SIZE_BYTES 1024
#define MESSAGE_SIZE_BYTES 8192

#define PAYLOAD_PACKET_BYTES (PACKAGE_SIZE_BYTES-8)
#define PAYLOAD_MESSAGE_BYTES (MESSAGE_SIZE_BYTES-4)

//Checks if is necessary to add 1 due to rounding
#if ((PAYLOAD_MESSAGE_BYTES)/(PAYLOAD_PACKET_BYTES)+ 1)*(PAYLOAD_PACKET_BYTES)-(PAYLOAD_MESSAGE_BYTES)==(PAYLOAD_PACKET_BYTES)
	#define NUMBER_OF_PACKETS (MESSAGE_SIZE_BYTES-4)/(PACKAGE_SIZE_BYTES-8)
#else
	#define NUMBER_OF_PACKETS (MESSAGE_SIZE_BYTES-4)/(PACKAGE_SIZE_BYTES-8)+ 1 // One is added to compensate for truncation rounding
#endif

#define NUM_OF_TESTS 2

//#define DEBUG 1       // Uncomment for debugging

typedef unsigned int data_type;

typedef struct packaging_data {
   unsigned char BS_ID;
   unsigned char FPGA_ID;   
   unsigned short int PCKG_ID;
   unsigned char TX_UID;
   unsigned char RX_UID;
   unsigned short int VALID_PACKET_BYTES;
   data_type MESSAGE[PAYLOAD_PACKET_BYTES/4];
} packaging_data;


data_type Message[PAYLOAD_MESSAGE_BYTES/4];


void memcopy(data_type Payload[PAYLOAD_PACKET_BYTES/4], unsigned int offset, unsigned short int valid_bytes);

int main(){
	
	
	unsigned int i, j;
	unsigned short int offset = 1;  // Starts in 1, because the first four bytes,are part of the header
	unsigned short int valid = PAYLOAD_PACKET_BYTES;
	
	int count_valid = 0;
	
	
	packaging_data Data_Input [NUMBER_OF_PACKETS];
	data_type Data_Received_AXIStream[PAYLOAD_MESSAGE_BYTES/4];
	
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
	 
    
    offset = 0;
    
    Loop_Productor: for(i=0; i<NUMBER_OF_PACKETS; i++){
        memcopy(Data_Input[i].MESSAGE, offset, Data_Input[i].VALID_PACKET_BYTES);
        offset = offset + (Data_Input[i].VALID_PACKET_BYTES>>2);
    }
    
    Loop_Consumer: for(unsigned short int i = 0; i<(PAYLOAD_MESSAGE_BYTES>>2); i++){
#ifdef DEBUG
        printf("The value of the message in position %d is %d \n", i, Message[i]);
#endif
		if ((i==((PAYLOAD_MESSAGE_BYTES>>2)-1)))
		    printf("The flag tlast was raised in the iteration %d \n", i);
    }
    	
    Loop_Validation: for(unsigned short int i = 0; i<(PAYLOAD_MESSAGE_BYTES>>2); i++){
        if(Message[i] != Original_Message[i+1]){
            printf("Error in data [%d], expected %d and recieved %d \n", i, Original_Message[i+1], Message[i]);
            return 1;
        }
    }
	printf("\n\n The simulation has finished without a problem\n");
	return 0;
}


void memcopy(data_type Payload[PAYLOAD_PACKET_BYTES/4], unsigned int offset, unsigned short int valid_bytes) {
	unsigned char i;
	for (int i = 0; i<(valid_bytes>>2); i++){
		Message[i+offset] = Payload[i];
	}
}