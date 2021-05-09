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
	hls::stream<AXISTREAM32> input_buffer;

	hls::stream<packaging_data> output_fifo;

	packaging_data Data_Received_fifo;
	packaging_data Expected_Value;
	unsigned char bus_id;
	
	unsigned int i, j, k;  // Loops variables

	// Initilizing input array
	Initialize_Message_Array: for(i=0; i<PACKAGE_SIZE_BYTES/4; i++){
			if(i==0) //Header Message
				Data_Sent[i] = 0x02000000;
			else if (i==1)
				Data_Sent[i] = 0x01020018;
			else
				Data_Sent[i] = i - 1;
		}

	
	// Creating expected packet
	bus_id = (unsigned char)(((0x00FF0000)&Data_Sent[1])>>16);
	Expected_Value.FPGA_ID = (unsigned char)(((0x00FF0000)&Data_Sent[0])>>16);
	Expected_Value.PCKG_ID = (unsigned short int)((0x0000FFFF)&Data_Sent[0]);
	Expected_Value.BS_ID = ROM_FOR_BUS_ID[bus_id];


	Expected_Value.TX_UID = (unsigned char)(((0xFF000000)&Data_Sent[1])>>24);
	Expected_Value.RX_UID = (unsigned char)(((0x00FF0000)&Data_Sent[1])>>16);
	Expected_Value.VALID_PACKET_BYTES = (unsigned short int)(((0x0000FFFF)&Data_Sent[1]));

	Expected_Value.MESSAGE[5] = Data_Sent[2];
	Expected_Value.MESSAGE[4] = Data_Sent[3];
	Expected_Value.MESSAGE[3] = Data_Sent[4];
	Expected_Value.MESSAGE[2] = Data_Sent[5];
	Expected_Value.MESSAGE[1] = Data_Sent[6];
	Expected_Value.MESSAGE[0] = Data_Sent[7];


	// Start Execution
	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS ; j++){

		WRITE_INPUT_BUFFER: for (i=0; i<PACKAGE_SIZE_BYTES/4;i++){
			AXISTREAM32 a;
			a.data = Data_Sent[i];
			a.tlast = (i==(PACKAGE_SIZE_BYTES/4)-1)? 1:0;
			input_buffer.write(a);
		}
		
		// invoking the uut
		Aurora_to_fifo_IP_fpga2_block(input_buffer,  output_fifo);

	    
		Data_Received_fifo = output_fifo.read();

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
				 printf("Valor recibido %d \n",Data_Received_fifo.MESSAGE[((PAYLOAD_PACKET_BYTES/4)-1)-i]);
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
