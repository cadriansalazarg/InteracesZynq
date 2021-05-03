/*//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////       Guía de uso de la unidad de empaquetamiento de datos       /////////////////////////
// 1. Abrir el archivo packaging_IP.hpp y editar los siguientes parámetos en función de cada aplicación
//           * PACKAGE_SIZE_BYTES = Se debe colocar aquí el número de bytes que tendrá cada paquete. Por ejemplo
//								    si los paquetes seŕan de 256 bits, este parámetro debe colocarse en 32.
//           * MESSAGE_SIZE_BYTES = Se debe colocar aquí, el número de bytes totales que tendrá el mensaje a transmitir
//                                  incluyendo el encabezado. Por lo tanto, dado que el encabezado siempre son 4 bytes,
//                                  y el payload del mensaje no debe superar los 8kB, la suma de ambos será el valor de este 
//                                  parámetro. Por ejemplo. Si se desean transmitir 200 enteros y cada entero tiene 4 bytes, 
//                                  esto significa que el mensaje tendrá 800 bytes por concepto de la carga útil (payload). 
//                                  Si a esto le sumamos los 4 bytes del encabezado. Para este caso, este parámetro deberá
//                                  colocarse en 804.
//           * MAXIMUM_MESSAGE_SIZE_BYTES = Este parámetro define el tamaño máximo del mensaje a transmitir. Para PlasticNet, 
//                                  el tamaño máximo  de mensaje está definido en 8kB (8192 bytes). Sin embargo, para aplicaciones
//                                  que no requieran esta cantidad de bytes, este parámetro puede reducirse de valor para ahorrar
//                                  BRAMs. Sin embargo, tenga en cuanta, que este parámetro, deberá ser como mínimo, 4 byes más 
//                                  que el parámetro MESSAGE_SIZE_BYTES. Por lo tanto si MESSAGE_SIZE_BYTES se define por ejemplo
//                                  en 100, el menor número que podrá tener MAXIMUM_MESSAGE_SIZE_BYTES será 104. No se realizó una 
//                                  evaluación de PlasticNet para valores de mensaje superior a 8kB. Pero en todo caso puede ser 
//                                  evaluado, ya que teóricamente no debería haber ningún efecto, siempre y cuando, se mantenga la 
//                                  relación de 4 bytes en exceso del parámero MAXIMUM_MESSAGE_SIZE_BYTES con respecto al 
//                                  parámetro  MESSAGE_SIZE_BYTES.
//            * NUM_OF_TESTS = Número de veces que se verificará la unidad en simulación.
//
//
// 2. Abrir el archivo packaging_IP.hpp y revisar que la memoria ROM definida por la constante ROM_FOR_BUS_ID, tenga
//    los valores correcto de salida, en función del RX_UID.Esto desde luego es función de cada aplicación y topología
//    de interconexión usada, por lo tanto, cada vez que se verifica un nuevo caso, estos valores deben de revisarse
//    para evitar errores.
//
//
// 3. Para una cosimulación o verificación individual de este IP, además del ajuste de los pasos 1 y 2 descritos arriba, en el 
//    testbench, únicamente se debe modificar las tres constantes de tipo char nombradas como fpga_id, rx_uid_1 y tx_uid_0. Recorar
//    que estas constantes son de tamaño igual a un byte.
//
//
// 4. Para la utilización de este bloque, recordar que el mensaje debe codificarse con un encabezado de 32 bits, y luego el 
//    payload del mensaje. Con respecto al encabezado, el byte 3 (MSB) representa el identificador universal del receptor (RX_UID), 
//    el byte 2 representa el identificador universal del nodo transmisor (TX_UID), y los últimos dos bytes, representa la 
//    cantidad de bytes de la carga útil del mensaje. Con respecto a este último, por ejemplo, si se va  transmitir 200 enteros
//    más 4 bytes del header, los últimos dos bytes deben colocarse en un valor igual a 800, pues este valor corresponde a la 
//    cantidad de bytes de la carga útil del mensaje.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

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

const unsigned char fpga_id = 0xF1;
const unsigned char rx_uid_1 = 0x02;
const unsigned char tx_uid_0 = 0x01;


int main(){

	data_type  Data_Sent[MESSAGE_SIZE_BYTES/4];
	hls::stream<AXISTREAM32> input_buffer;

	hls::stream<packaging_data> output_fifo;

	packaging_data Data_Received_fifo[NUMBER_OF_PACKETS];
	packaging_data Expected_Value[NUMBER_OF_PACKETS];
	

	const unsigned int payload_message_size = PAYLOAD_MESSAGE_BYTES;

	unsigned int i, j, k;  // Loops variables

	#ifdef DEBUG
	printf("NUMBER_OF_PACKETS = %d\n", NUMBER_OF_PACKETS);
	#endif

	Initialize_Message_Array: for(i=0; i<MESSAGE_SIZE_BYTES/4; i++){
		if(i==0) //Header Message
			Data_Sent[i] = (rx_uid_1 << 24) | (tx_uid_0<<16) | payload_message_size;
		else  // Payload
			Data_Sent[i] = i - 1;
	}
	
	printf("El valor del encabezado del mensaje es 0x%x \n", Data_Sent[0]);

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
				Expected_Value[i].MESSAGE[OFFSET_READ_PAYLOAD-j] = Data_Sent[k]; // Observe que en cada paquete, primero se llena el último elemento del arreglo y el último en completarse es el primero del arreglo
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
	    		printf("Valor recibido %d. Valor esperado %d \n",Data_Received_fifo[i].BS_ID,Expected_Value[i].BS_ID);
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
	    	printf("Número de paquete %d. \n", i);
	    	for(k=0; k < Data_Received_fifo[i].VALID_PACKET_BYTES/4; k++){
	    		if (!checkForEquality(Data_Received_fifo[i].MESSAGE[k], Expected_Value[i].MESSAGE[k])){
	    			printf("Valor recibido %d \n",Data_Received_fifo[i].MESSAGE[k]);
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
