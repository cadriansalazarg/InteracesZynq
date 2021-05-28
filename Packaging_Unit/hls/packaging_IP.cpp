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



#include <hls_stream.h>
#include "packaging_IP.hpp"

void packaging_IP_block(hls::stream<AXISTREAM32> &input, hls::stream<packaging_data>& out_fifo, unsigned char fpga_id){



	data_type input_buff[(MAXIMUM_MESSAGE_SIZE_BYTES/4) + 1];
	packaging_data packet_data;
	unsigned short int message_size_bytes_payload;
	unsigned short int number_of_packets, residuo, number_of_32_integers;

	AXISTREAM32 auxiliar_var;

	//unsigned char ROM_Address;
	unsigned short int i, j;
	unsigned short int k = 1;
	unsigned short int z;



	auxiliar_var = input.read();
	input_buff[0] = auxiliar_var.data;

	message_size_bytes_payload = (unsigned short int)(((0x0000FFFF)&input_buff[0]));
	number_of_32_integers = (message_size_bytes_payload>>2);

	Loop_Productor: for (i = 1; i <= number_of_32_integers; i++) {
		auxiliar_var = input.read();
		input_buff[i] = auxiliar_var.data;
	}
	
	number_of_packets = message_size_bytes_payload/(PAYLOAD_PACKET_BYTES);
	residuo = message_size_bytes_payload%(PAYLOAD_PACKET_BYTES);
	
	if (residuo > 0)
		number_of_packets = number_of_packets + 1;



	Loop_Packaging: for (i = 0; i < number_of_packets; i++) {
		// Header message structure:
		// Byte 3 = RX_UID
		// Byte 2 = TX_UID
		// Byte 0-1 = Número de bytes que contiene el dato útil a transmitir, debe ser menor o igual a 8192 (8kB)
		

		//Adding Header		
		packet_data.FPGA_ID = fpga_id;
		packet_data.TX_UID = (unsigned char)(((0x00FF0000)&input_buff[0])>>16);
		packet_data.RX_UID = (unsigned char)(((0xFF000000)&input_buff[0])>>24);
		packet_data.PCKG_ID = i;
		packet_data.BS_ID = ROM_FOR_BUS_ID[packet_data.RX_UID];

		//Adding Message
		Loop1: for (j = 0; j < PAYLOAD_PACKET_BYTES>>2; j++){
			if (k <= number_of_32_integers){
				z = OFFSET_READ_PAYLOAD-j;
				packet_data.MESSAGE[z] = input_buff[k]; // OFFSET_READ_PAYLOAD-j se hace para guardar el primer datos en el elemento MESSAGE[5], esto para que concuerde con el efecto de datapack
				k = k + 1;
			}
			else{
				break;
			}
		}
		packet_data.VALID_PACKET_BYTES = (j<<2);
		

		//Sending Package
		out_fifo.write(packet_data);
	}
}
