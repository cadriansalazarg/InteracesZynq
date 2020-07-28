#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "packaging_IP.hpp"

int main(){

	data_t  Data_Sent[MESSAGE_SIZE_BYTES/4];
	hls::stream<AXISTREAM32> input_buffer;

	hls::stream<packaging_data> output_fifo;

	packaging_data Data_Received_fifo[NUMBER_OF_PACKETS];

	unsigned int i, j, k;  // Variables para los loops

	//printf("El número de paquetes es: %d\n", NUMBER_OF_PACKETS);
	//printf("El payload del mensaje es: %d\n", PAYLOAD_MESSAGE_BYTES);
	//printf("El payload del paquete es: %d\n", PAYLOAD_PACKET_BYTES);

	InicializarArregloEntrada: for(i=0; i<MESSAGE_SIZE_BYTES/4; i++){
		if(i==0) //HEader Message
			Data_Sent[i] = 0x00A1A000;
		else  // Payload
			Data_Sent[i] = i;
	}

	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS ; j++){

		EscribirBuffer: for (i=0; i<MESSAGE_SIZE_BYTES/4;i++){
			AXISTREAM32 a;
			a.data = Data_Sent[i];
			a.tlast = (i==(MESSAGE_SIZE_BYTES/4)-1)? 1:0;
			input_buffer.write(a);
		}

		packaging_IP_block(input_buffer,  output_fifo);

		i = 0;
	    LeerFIFO: while(!output_fifo.empty()){
		   Data_Received_fifo[i] = output_fifo.read();
		   i++;
	    }

	    Header_Validation: for (i=0; i<NUMBER_OF_PACKETS;i++){
	    	if (Data_Received_fifo[i].BS_ID != 0x00){
	    		printf("Error en el BS_ID en la iteración %d \n",i);
	    		return 1;
	    	}
	    	if (Data_Received_fifo[i].FPGA_ID != 0x0F){
	    		printf("Error en el FPGA_ID en la iteración %d \n",i);
	    		return 1;
	    	}
	    	if (Data_Received_fifo[i].PCKG_ID != ((0x0000FFFF)&i)){
	    		printf("Error en el PCKG_ID en la iteración %d \n",i);
	    		return 1;
	    	}
	    	if (Data_Received_fifo[i].TX_UID != ((0xFF000000)&Data_Sent[0])>>24){
	    		printf("Error en el TX_UID en la iteración %d \n",i);
	    		return 1;
	    	}
	    	if (Data_Received_fifo[i].RX_UID != ((0x00FF0000)&Data_Sent[0])>>16){
	    		printf("Error en el RX_UID en la iteración %d \n",i);
	    		return 1;
	    	}
	    }

	    IMPRIMIR_MENSAJES: for (i=0; i<NUMBER_OF_PACKETS;i++){
	    	for(k=0; k < PAYLOAD_PACKET_BYTES/4; k++){
	    		printf("Paquete %d. Message %d. Valor: %x \n",i+1, k+1, Data_Received_fifo[i].MESSAGE[k]);
	    	}
	    }

	    printf("\n ******************* INICIALIZANDO LA VALIDACION **********************\n");

	    VALIDAR_MENSAJES: for (i=0; i<NUMBER_OF_PACKETS;i++){
	    	for(k=0; k < PAYLOAD_PACKET_BYTES/4; k++){
	    		if (((unsigned int) Data_Received_fifo[i].MESSAGE[k]-k) < 0.01){
	    			printf("Error en paquete %d. Message %d. Valor Esperado: %x. Valor Recibido: %x \n",i+1, k+1, k+1, Data_Received_fifo[i].MESSAGE[k]);
	    			return 1;
	    		}
	    	}
	    }

	}
	
	printf("La simulación funcionó sin problemas\n");
	return 0;
}
