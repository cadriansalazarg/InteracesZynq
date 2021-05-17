#include <hls_stream.h>
#include "fifo_to_Aurora_IP.hpp"

void fifo_to_Aurora_IP(hls::stream<AXISTREAM32> &output, hls::stream<packaging_data>& in_fifo, unsigned char id_next_fpga){


	static unsigned char sequencer = 0;
	unsigned int output_buff[PACKAGE_SIZE_BYTES/4];
	packaging_data packet_data;


	// Read input from fifo
	while(in_fifo.empty());
	packet_data = in_fifo.read();

	// Write packet

#if PACKAGE_SIZE_BYTES == 32 
	output_buff[0] = (0xFF000000&(sequencer<<24)) | (0x00FF0000&(packet_data.FPGA_ID<<16)) | (0x0000FFFF&(packet_data.PCKG_ID));
	output_buff[1] = (0xFF000000&(packet_data.TX_UID<<24)) | (0x00FF0000&(packet_data.RX_UID<<16)) | (0x0000FFFF&(packet_data.VALID_PACKET_BYTES));
	output_buff[2] = packet_data.MESSAGE[5];
	output_buff[3] = packet_data.MESSAGE[4];
	output_buff[4] = packet_data.MESSAGE[3];
	output_buff[5] = packet_data.MESSAGE[2];
	output_buff[6] = packet_data.MESSAGE[1];
	output_buff[7] = packet_data.MESSAGE[0];
#elif PACKAGE_SIZE_BYTES == 64
	output_buff[0] = (0xFF000000&(sequencer<<24)) | (0x00FF0000&(packet_data.FPGA_ID<<16)) | (0x0000FFFF&(packet_data.PCKG_ID));
	output_buff[1] = (0xFF000000&(packet_data.TX_UID<<24)) | (0x00FF0000&(packet_data.RX_UID<<16)) | (0x0000FFFF&(packet_data.VALID_PACKET_BYTES));
	output_buff[2] = packet_data.MESSAGE[13];
	output_buff[3] = packet_data.MESSAGE[12];
	output_buff[4] = packet_data.MESSAGE[11];
	output_buff[5] = packet_data.MESSAGE[10];
	output_buff[6] = packet_data.MESSAGE[9];
	output_buff[7] = packet_data.MESSAGE[8];
	output_buff[8] = packet_data.MESSAGE[7];
	output_buff[9] = packet_data.MESSAGE[6];
	output_buff[10] = packet_data.MESSAGE[5];
	output_buff[11] = packet_data.MESSAGE[4];
	output_buff[12] = packet_data.MESSAGE[3];
	output_buff[13] = packet_data.MESSAGE[2];
	output_buff[14] = packet_data.MESSAGE[1];
	output_buff[15] = packet_data.MESSAGE[0];
#elif PACKAGE_SIZE_BYTES == 128
	output_buff[0] = (0xFF000000&(sequencer<<24)) | (0x00FF0000&(packet_data.FPGA_ID<<16)) | (0x0000FFFF&(packet_data.PCKG_ID));
	output_buff[1] = (0xFF000000&(packet_data.TX_UID<<24)) | (0x00FF0000&(packet_data.RX_UID<<16)) | (0x0000FFFF&(packet_data.VALID_PACKET_BYTES));
	output_buff[2] = packet_data.MESSAGE[29];
	output_buff[3] = packet_data.MESSAGE[28];
	output_buff[4] = packet_data.MESSAGE[27];
	output_buff[5] = packet_data.MESSAGE[26];
	output_buff[6] = packet_data.MESSAGE[25];
	output_buff[7] = packet_data.MESSAGE[24];
	output_buff[8] = packet_data.MESSAGE[23];
	output_buff[9] = packet_data.MESSAGE[22];
	output_buff[10] = packet_data.MESSAGE[21];
	output_buff[11] = packet_data.MESSAGE[20];
	output_buff[12] = packet_data.MESSAGE[19];
	output_buff[13] = packet_data.MESSAGE[18];
	output_buff[14] = packet_data.MESSAGE[17];
	output_buff[15] = packet_data.MESSAGE[16];
	output_buff[16] = packet_data.MESSAGE[15];
	output_buff[17] = packet_data.MESSAGE[14];
	output_buff[18] = packet_data.MESSAGE[13];
	output_buff[19] = packet_data.MESSAGE[12];
	output_buff[20] = packet_data.MESSAGE[11];
	output_buff[21] = packet_data.MESSAGE[10];
	output_buff[22] = packet_data.MESSAGE[9];
	output_buff[23] = packet_data.MESSAGE[8];
	output_buff[24] = packet_data.MESSAGE[7];
	output_buff[25] = packet_data.MESSAGE[6];
	output_buff[26] = packet_data.MESSAGE[5];
	output_buff[27] = packet_data.MESSAGE[4];
	output_buff[28] = packet_data.MESSAGE[3];
	output_buff[29] = packet_data.MESSAGE[2];
	output_buff[30] = packet_data.MESSAGE[1];
	output_buff[31] = packet_data.MESSAGE[0];
#else
	#error "El tamaño de paquete solo está definido para paquetes de tamaño de 32 bytes (256 bits), 64 bytes (512 bits), 128 bytes (1024 bits)."
#endif


#if NUMBER_OF_LANES == 1
	if(id_next_fpga != packet_data.FPGA_ID) {
		Loop_Consumer: for(unsigned short int i = 0; i<(PACKAGE_SIZE_BYTES/4); i++){
			AXISTREAM32 a;
			a.data = output_buff[i];
			a.tlast = (i==((PACKAGE_SIZE_BYTES/4)-1)) ? 1 : 0;
			output.write(a);
		}
		sequencer ++;
	}
#elif NUMBER_OF_LANES == 2
	ap_uint<(32*NUMBER_OF_LANES)> aux_var1;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var2;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var3;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var4;
	
	if(id_next_fpga != packet_data.FPGA_ID) {
		Loop_Consumer: for(unsigned short int i = 0; i<(PACKAGE_SIZE_BYTES/4); i = i + 2){
			AXISTREAM32 a;
			aux_var1 = (output_buff[i]);                     
			aux_var2 = (ap_uint<(32*NUMBER_OF_LANES)>) output_buff[i+1];
			aux_var3 = aux_var1 << 32;
			aux_var4 =  aux_var3 | aux_var2;
			a.data = aux_var4;
			a.tlast = (i==(((PACKAGE_SIZE_BYTES/4)-2))) ? 1 : 0;
			output.write(a);
		}
		sequencer ++;
	}
#elif NUMBER_OF_LANES == 4
	ap_uint<(32*NUMBER_OF_LANES)> aux_var1;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var2;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var3;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var4;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var5;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var6;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var7;
	ap_uint<(32*NUMBER_OF_LANES)> aux_var8;
	
	if(id_next_fpga != packet_data.FPGA_ID) {
		Loop_Consumer: for(unsigned short int i = 0; i<(PACKAGE_SIZE_BYTES/4); i = i + 4){
			AXISTREAM32 a;
			aux_var1 = (ap_uint<(32*NUMBER_OF_LANES)>) output_buff[i];                     
			aux_var2 = (ap_uint<(32*NUMBER_OF_LANES)>) output_buff[i+1];
			aux_var3 = (ap_uint<(32*NUMBER_OF_LANES)>) output_buff[i+2];                     
			aux_var4 = (ap_uint<(32*NUMBER_OF_LANES)>) output_buff[i+3];
			aux_var5 = aux_var1 << 96;
			aux_var6 = aux_var2 << 64;
			aux_var7 = aux_var3 << 32;
			aux_var8 =  aux_var5 | aux_var6 | aux_var7 | aux_var4;
			a.data = aux_var8;
			a.tlast = (i==(((PACKAGE_SIZE_BYTES/4)- 4))) ? 1 : 0;
			output.write(a);
		}
		sequencer ++;
	}
#else
	#error "Número de lanes no definido corectamente. El número de lanes debe ser 1, 2 o 4."
#endif

	
}
