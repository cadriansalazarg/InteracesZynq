// To compile:  g++ unpackaging_high_level_model.cpp -std=c++11 -o unpackaging_high_level_model.o

#include <iostream>
#include <vector>
#include <array>



#define PACKAGE_SIZE_BYTES 1024
#define MESSAGE_SIZE_BYTES 1356
#define NUM_OF_NODES 4

#define PAYLOAD_PACKET_BYTES (PACKAGE_SIZE_BYTES-8)
#define PAYLOAD_MESSAGE_BYTES (MESSAGE_SIZE_BYTES-4)

//Check if it is necessary to add 1 due to rounding
#if ((PAYLOAD_MESSAGE_BYTES)/(PAYLOAD_PACKET_BYTES)+ 1)*(PAYLOAD_PACKET_BYTES)-(PAYLOAD_MESSAGE_BYTES)==(PAYLOAD_PACKET_BYTES)
	#define NUMBER_OF_PACKETS (MESSAGE_SIZE_BYTES-4)/(PACKAGE_SIZE_BYTES-8)
#else
	#define NUMBER_OF_PACKETS (MESSAGE_SIZE_BYTES-4)/(PACKAGE_SIZE_BYTES-8)+ 1 // One is added to compensate for truncation rounding
#endif

#define NUM_OF_NODES_EXCLUDE (NUM_OF_NODES - 1)
#define NUM_TOTAL_OF_PACKETS  ((NUMBER_OF_PACKETS)*(NUM_OF_NODES_EXCLUDE))

#define NUM_OF_TESTS 2

//#define DEBUG 1   // Uncomment for debugging

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

data_type Message[(PAYLOAD_MESSAGE_BYTES/4)*NUM_OF_NODES_EXCLUDE];


void memcopy(data_type Payload[PAYLOAD_PACKET_BYTES/4], unsigned short int offset[NUM_OF_NODES-1], unsigned short int valid_bytes, unsigned char TX_UID);




int main(){
	char current_node = 0;
	int i, j;
	unsigned int offset = 1;  // Starts in 1, because the first four bytes,are part of the header
	unsigned short int valid = PAYLOAD_PACKET_BYTES;
	
	int count_valid = 0;
	
	
	packaging_data Data_Input [NUM_TOTAL_OF_PACKETS];
	
    data_type Original_Message[(NUM_TOTAL_OF_PACKETS)*(PAYLOAD_PACKET_BYTES/4)]; // This is the original Message
	
	data_type Validation_Message[(PAYLOAD_MESSAGE_BYTES/4)*(NUM_OF_NODES_EXCLUDE)];
	
	int offset_validation;
	int index_validation = 0;
	for(int i = 0; i<NUM_OF_NODES_EXCLUDE; i++){
		offset_validation = i*(PAYLOAD_PACKET_BYTES/4);
		for(int p = 0; p<NUMBER_OF_PACKETS; p++){
			for (j = 0; j<(PAYLOAD_PACKET_BYTES/4); j++){
				if((p*(PAYLOAD_PACKET_BYTES/4)+j)<(PAYLOAD_MESSAGE_BYTES/4)){
					Validation_Message[index_validation] = offset_validation+j;
					printf("Validation_Message in index: [%d] is: %d \n", index_validation, offset_validation+j);
					index_validation += 1;
					
				}
			}
			offset_validation += (PAYLOAD_PACKET_BYTES/4)*(NUM_OF_NODES_EXCLUDE);

		}
			
	}	
	
	
	printf("Indice final es %d:", index_validation);
	
	for(j=0; j<(NUM_TOTAL_OF_PACKETS)*(PAYLOAD_PACKET_BYTES/4); j++){
		if (j==0)
			Original_Message[j] = 0x00020000; 
		else
			Original_Message[j] = j-1; 
	}
	
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
	////****************************** Validación
	
	
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
			printf("++++++++++++++++++++++++++++ Finished packet %d ++++++++++++++++++++++++++++++++++++++++ \n", j);
		}
    #endif
    
    
	 
    unsigned short int offset_nodes[NUM_OF_NODES_EXCLUDE];
	
	Offset_Producer:for(char i = 0; i<NUM_OF_NODES_EXCLUDE; i++){
		offset_nodes[i] = (i*PAYLOAD_MESSAGE_BYTES)>>2;
	}
	

	unsigned char TX_offset;	
    Loop_Productor: for(i=0; i<(NUM_TOTAL_OF_PACKETS); i++){
		TX_offset = (Data_Input[i].TX_UID >= current_node)? (Data_Input[i].TX_UID-1): Data_Input[i].TX_UID ;
        memcopy(Data_Input[i].MESSAGE, offset_nodes, Data_Input[i].VALID_PACKET_BYTES, TX_offset);
        offset_nodes[TX_offset] = offset_nodes[TX_offset] + (Data_Input[i].VALID_PACKET_BYTES>>2);
        
    }
    
    int Nodo_Impresion;
    Loop_Consumidor:for(int i = 0; i<((PAYLOAD_MESSAGE_BYTES>>2)*NUM_OF_NODES_EXCLUDE); i++){
        Nodo_Impresion = i/(PAYLOAD_MESSAGE_BYTES>>2);
        if (Nodo_Impresion>=current_node)
            Nodo_Impresion += 1;
        printf("El i (%d) mensaje recibido de NODO: %d es:%d \n", i, Nodo_Impresion, Message[i]);
    	if ((i==(((PAYLOAD_MESSAGE_BYTES>>2)*NUM_OF_NODES_EXCLUDE)-1)))
    	    printf("En la iteración número %d se levantó la bandera tlast\n", i);
    }
    
    
    // Validation verification with Original Message
    for(int i = 0; i<(PAYLOAD_MESSAGE_BYTES*NUM_OF_NODES_EXCLUDE/4); i++){
        if(Validation_Message[i]!=Message[i]){
            printf("Error de igualdad en [%d] %d diferente de %d \n", i, Validation_Message[i], Message[i]);
			return 1;
		}
    }
    
    	
	printf("La simulación funcionó sin problemas \n");
	return 0;
}


void memcopy(data_type Payload[PAYLOAD_PACKET_BYTES/4], unsigned short int offset[NUM_OF_NODES-1], unsigned short int valid_bytes, unsigned char TX_UID) {
	unsigned char i;
	LoopPayload: for (i = 0; i<(valid_bytes>>2); i++){
		Message[i+offset[TX_UID]] = Payload[i];
	}
}
