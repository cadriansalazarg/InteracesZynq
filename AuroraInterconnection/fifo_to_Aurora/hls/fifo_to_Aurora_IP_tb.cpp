#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "fifo_to_Aurora_IP.hpp"
#include <stdbool.h>
#define DEBUG 1   // Uncomment for debugging



bool checkForEquality(ap_uint<(32*NUMBER_OF_LANES)> x, ap_uint<(32*NUMBER_OF_LANES)> y);


int main(){

	ap_uint<(32*NUMBER_OF_LANES)> Data_Receive_hw[(PACKAGE_SIZE_BYTES/(4*NUMBER_OF_LANES))];

	hls::stream<AXISTREAM32> output_buffer;

	hls::stream<packaging_data> input_fifo;

	packaging_data Expected_Value;
	const unsigned char bus_id = 0xCA;
	const unsigned char fpga_id = 0x1E;
	const unsigned char tx_uid = 0xAF;
	const unsigned char rx_uid = 0xE1;
	const unsigned short int pckg_id = 0xAAAA;
	const unsigned short int valid_packet_id = 0x0018;
	const unsigned int Data_Sent = 0xFAFA01F0;
	
	unsigned int i, j, k;  // Loops variables
	
	unsigned char sequencer = 0;
	
	const unsigned char next_id_fpga = 0x04;

	Expected_Value.BS_ID = bus_id;
	Expected_Value.FPGA_ID = fpga_id;
	Expected_Value.PCKG_ID = pckg_id;
	Expected_Value.TX_UID = tx_uid;
	Expected_Value.RX_UID = rx_uid;
	Expected_Value.VALID_PACKET_BYTES = valid_packet_id;
	
	ap_uint<(32*NUMBER_OF_LANES)> aux_var0;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var1;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var2;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var3;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var4;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var5;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var6;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var7;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var8;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var9;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var10;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var11;

	for (i = 0; i < (PAYLOAD_PACKET_BYTES/4); i++){
		Expected_Value.MESSAGE[OFFSET_READ_PAYLOAD-i] = Data_Sent + i;
	}


	// Start Execution
	ExecuteNumberOfSteps: for (j=0; j<NUM_OF_TESTS ; j++){
	
		input_fifo.write(Expected_Value);

		// invoking the uut
		fifo_to_Aurora_IP(output_buffer,  input_fifo, next_id_fpga);

	    
		ReadBuffer: for (i=0; i<PACKAGE_SIZE_BYTES/(4*NUMBER_OF_LANES); i++){
					AXISTREAM32 a;
					a = output_buffer.read();
					Data_Receive_hw[i] = a.data;
		}


		
#if NUMBER_OF_LANES == 1
		Validation: for (i=0; i<(PACKAGE_SIZE_BYTES/4); i++){
			if (i == 0){
				if (!checkForEquality(Data_Receive_hw[i], ((0xFF000000&(sequencer<<24)) | (0x00FF0000&(Expected_Value.FPGA_ID<<16)) | (0x0000FFFF&(Expected_Value.PCKG_ID)))   )){
					printf ("El primer encabezado recibido es %X.\n", Data_Receive_hw[i]);
					return 1;
				}	
			}
			else if (i == 0){
				if (!checkForEquality(Data_Receive_hw[i], ((0xFF000000&(Expected_Value.TX_UID<<24)) | (0x00FF0000&(Expected_Value.RX_UID<<16)) | (0x0000FFFF&(Expected_Value.VALID_PACKET_BYTES)))   )){
					printf ("El segundo encabezado recibido es %X.\n", Data_Receive_hw[i]);
					return 1;
				}	
			}
			else {	
				if (!checkForEquality(Data_Receive_hw[i], Expected_Value.MESSAGE[(PACKAGE_SIZE_BYTES/4)-i-1])){
					printf ("El dato recibido número %d es %X.\n", i+1, Data_Receive_hw[i]);
					return 1;
				}
			}
		}
#elif NUMBER_OF_LANES == 2 
		Validation: for (i=0; i<(PACKAGE_SIZE_BYTES/(4*NUMBER_OF_LANES)); i++){
			if (i == 0){
				aux_var0 = sequencer;
				aux_var1 = Expected_Value.FPGA_ID;
				aux_var2 = Expected_Value.PCKG_ID;
				aux_var3 = Expected_Value.TX_UID;
				aux_var4 = Expected_Value.RX_UID;
				aux_var5 = Expected_Value.VALID_PACKET_BYTES;
				aux_var6 = (aux_var0<<56);
				aux_var7 = (aux_var1<<48);
				aux_var8 = (aux_var2<<32);
				aux_var9 = (aux_var3<<24);
				aux_var10 = (aux_var4<<16);
				aux_var11 = (aux_var5 | aux_var6 | aux_var7 | aux_var8 | aux_var9 | aux_var10);
				if (!checkForEquality(Data_Receive_hw[i], aux_var11)){
					std::cout << "Valor esperado: " << std::hex << aux_var11;
					printf("\n");
					std::cout << "Valor recibido del hardware: " << std::hex << Data_Receive_hw[i];
					printf("\n");
					return 1;
				}	
			}
			else {	
				aux_var0 = Expected_Value.MESSAGE[(PACKAGE_SIZE_BYTES/4)-((2*i) + 1)     ]; //5
				aux_var1 = (aux_var0<<32);
				aux_var2 = Expected_Value.MESSAGE[(PACKAGE_SIZE_BYTES/4)-   ((2*i) + 2)]; //
				aux_var3 = aux_var1 | aux_var2;
				if (!checkForEquality(Data_Receive_hw[i], aux_var3 )){
					std::cout << "Valor esperado: " << std::hex << aux_var3;
					printf("\n");
					std::cout << "Valor recibido del hardware: " << std::hex << Data_Receive_hw[i];
					printf("\n");
					return 1;
				}
			}
		} 
#else
	#error "Número de lanes no definido corectamente."
#endif
		
		sequencer++;	
	}
	printf("The simulation was successfully completed\n");
	return 0;

}

bool checkForEquality(ap_uint<(32*NUMBER_OF_LANES)> x, ap_uint<(32*NUMBER_OF_LANES)> y)
{
	return !(x ^ y);
}
