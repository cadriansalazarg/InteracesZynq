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
#include "Aurora_to_fifo_IP.hpp"

void Aurora_to_fifo_IP_fpga5_block(hls::stream<AXISTREAM32> &input, hls::stream<packaging_data>& out_fifo){



	data_type input_buff[PACKAGE_SIZE_BYTES/4];
	packaging_data packet_data;


	AXISTREAM32 auxiliar_var;

	//unsigned char ROM_Address;
	unsigned char bus_id;
	unsigned char i;
	i = 0;

	// Read input stream

	LoopProducer: do
	{
		auxiliar_var = input.read();
		input_buff[i] = auxiliar_var.data;
		i++;
	}
	while (!(auxiliar_var.tlast));



	// Write packet


	bus_id = (unsigned char)(((0x00FF0000)&input_buff[1])>>16);

	packet_data.FPGA_ID = (unsigned char)(((0x00FF0000)&input_buff[0])>>16);
	packet_data.PCKG_ID = (unsigned short int)((0x0000FFFF)&input_buff[0]);

	packet_data.TX_UID = (unsigned char)(((0xFF000000)&input_buff[1])>>24);
	packet_data.RX_UID = bus_id;
	packet_data.BS_ID = ROM_FOR_BUS_ID[bus_id];

	packet_data.VALID_PACKET_BYTES = (unsigned short int)(((0x0000FFFF)&input_buff[1]));

	packet_data.MESSAGE[5] = input_buff[2];
	packet_data.MESSAGE[4] = input_buff[3];
	packet_data.MESSAGE[3] = input_buff[4];
	packet_data.MESSAGE[2] = input_buff[5];
	packet_data.MESSAGE[1] = input_buff[6];
	packet_data.MESSAGE[0] = input_buff[7];
	
	out_fifo.write(packet_data);
	
}
