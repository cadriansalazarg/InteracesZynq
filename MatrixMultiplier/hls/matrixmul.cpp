#include "matrixmul.h"

//****** Encabezado de las funciones que existen en esta función ***************
void productor(hls::stream<data_type> &bus_local, hls::stream<unsigned char> &bus_local_header, hls::stream<packaging_data>& in_fifo);
void consumidor(hls::stream<data_type> &bus_local, hls::stream<unsigned char> &bus_local_header, hls::stream<packaging_data>& out_fifo, unsigned char bus_id, unsigned char fpga_id, unsigned char uid);


void Wrapper_Matrix_Multiplier(hls::stream<packaging_data>& in_fifo, hls::stream<packaging_data>& out_fifo, unsigned char bus_id, unsigned char fpga_id, unsigned char uid){

	static hls::stream<data_type> bus_local;
	static hls::stream<unsigned char> bus_local_header;

	productor(bus_local, bus_local_header, in_fifo);
	consumidor(bus_local, bus_local_header, out_fifo, bus_id, fpga_id, uid);
}

void productor(hls::stream<data_type> &bus_local, hls::stream<unsigned char> &bus_local_header, hls::stream<packaging_data>& in_fifo) {
	packaging_data input_packet;
	
	Loop_Producer: for (unsigned short int i=0; i<NUM_TOTAL_OF_PACKETS_RX; i++) {
		while(in_fifo.empty())
		;  // I put the semicolon on this separate line to silence a warning
        input_packet = in_fifo.read();
        Store_Payload_In_Local_Bus: for (unsigned short int j=0; j<(input_packet.VALID_PACKET_BYTES>>2); j++) {
			bus_local.write(input_packet.MESSAGE[j]);
		}
    } 
    bus_local_header.write(input_packet.TX_UID);	
    bus_local_header.write(input_packet.RX_UID);
}

void consumidor(hls::stream<data_type> &bus_local, hls::stream<unsigned char> &bus_local_header, hls::stream<packaging_data>& out_fifo, unsigned char bus_id, unsigned char fpga_id, unsigned char uid) {
	mat_a_t in_mat_a[MAT_A_ROWS][MAT_A_COLS];
    mat_b_t in_mat_b[MAT_B_ROWS][MAT_B_COLS];
    result_t result[MAT_Y_ROWS * MAT_Y_COLS];
    
    packaging_data output_packet;
    unsigned short int k = 0;
    
    unsigned char tx_uid;
    unsigned char rx_uid;
    
    
    Loop_Reorganizing_Data_MatrixA: for (unsigned short int i = 0; i < MAT_A_ROWS ; i++) { 
		Matrix_A: for (unsigned short int j = 0; j < MAT_A_COLS; j++){
			in_mat_a[i][j] = bus_local.read();
		}
	}
	
	Loop_Reorganizing_Data_MatrixB: for (unsigned short int i = 0; i < MAT_B_ROWS ; i++) { 
		Matrix_B: for (unsigned short int j = 0; j < MAT_B_COLS; j++){
			in_mat_b[i][j] = bus_local.read();
		}
	} 
	
	tx_uid = bus_local_header.read();
	rx_uid = bus_local_header.read();
	
	matrixmul(in_mat_a, in_mat_b, result);
	
	output_packet.BS_ID = bus_id; // 8 bits
	output_packet.FPGA_ID = fpga_id; // 8 bits
	output_packet.TX_UID = uid; // 8 bits
	output_packet.RX_UID = tx_uid; // 8 bits
	output_packet.VALID_PACKET_BYTES = PAYLOAD_PACKET_BYTES; 
	
	
	Loop_Consumer: for (unsigned short int i = 0; i < NUM_TOTAL_OF_PACKETS_TX; i++) {
		Creating_Output_Packet: for (unsigned short int j = 0; j < (PAYLOAD_PACKET_BYTES >> 2); j++){
			if (k < (MAT_Y_COLS * MAT_Y_ROWS)){
				output_packet.MESSAGE[j] = result[k];
			}
			else{
				output_packet.MESSAGE[j] = 0;
				output_packet.VALID_PACKET_BYTES = (j << 2);
				break;
			}
			k++;
		}
		output_packet.PCKG_ID = i;
		//Sending packet
		out_fifo.write(output_packet);
	}
}

void matrixmul( mat_a_t a[MAT_A_ROWS][MAT_A_COLS], mat_b_t b[MAT_B_ROWS][MAT_B_COLS], result_t res[MAT_Y_ROWS * MAT_Y_COLS]){
	
	mat_a_t a_row[MAT_A_COLS];
	data_type tmp = 0;

	// Iterate over the rowa of the A matrix
	Row: for(unsigned short int i = 0; i < MAT_A_ROWS; i++) {
		// Iterate over the columns of the B matrix
		Col: for(unsigned short int j = 0; j < MAT_B_COLS; j++) {
			// Do the inner product of a row of A and col of B
			tmp=0;
			// Cache each row (so it's only read once per function)
			if (j == 0)
				Cache_Row: for(unsigned short int k = 0; k < MAT_A_COLS; k++)
					a_row[k] = a[i][k];

			Product: for(unsigned short int k = 0; k < MAT_B_ROWS; k++) {
				tmp += a_row[k] * b[k][j];
			}
			res[(i*MAT_B_COLS) + j] = tmp;
			//res[i][j] = tmp;
		}
    }
}

