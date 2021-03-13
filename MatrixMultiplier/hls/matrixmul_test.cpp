#include <iostream>
#include "matrixmul.h"

using namespace std;

int main(int argc, char **argv)
{
    mat_a_t in_mat_a[MAT_A_ROWS][MAT_A_COLS];   
    mat_b_t in_mat_b[MAT_B_ROWS][MAT_B_COLS];
   
    result_t hw_result[MAT_Y_ROWS][MAT_Y_COLS], sw_result[MAT_Y_ROWS][MAT_Y_COLS];
    
    packaging_data input_packet;
    
    data_type input_buffer[(MAT_A_ROWS*MAT_A_COLS) + (MAT_B_ROWS*MAT_B_COLS)];
    
    data_type output_buffer[MAT_Y_ROWS * MAT_Y_COLS];
    
    packaging_data Data_Received_fifo[NUM_TOTAL_OF_PACKETS_TX];
    
    hls::stream<packaging_data> input_fifo;
    hls::stream<packaging_data> output_fifo;

    unsigned short int err_cnt = 0;
    unsigned short int k = 0;
    
    data_type tmp = 0;
    mat_a_t a_row[MAT_A_COLS];
   	
    // Input stimulus
    k = 0;
    for(unsigned short int i = 0; i < MAT_A_ROWS; i++) {
		for(unsigned short int j = 0; j < MAT_A_COLS; j++) {
			in_mat_a[i][j] = 1;
			input_buffer[k] = in_mat_a[i][j];
			k++;
		}
	}
	
	for(unsigned short int i = 0; i < MAT_B_ROWS; i++) {
		for(unsigned short int j = 0; j < MAT_B_COLS; j++) {
			in_mat_b[i][j] = 1;
			input_buffer[k] = in_mat_b[i][j];
			k++;
		}
	}
	
    // Generate the expected result
    // Iterate over the rows of the A matrix  
    
    // Iterate over the row a of the A matrix
	Row: for(unsigned short int i = 0; i < MAT_A_ROWS; i++) {
		// Iterate over the columns of the B matrix
		Col: for(unsigned short int j = 0; j < MAT_B_COLS; j++) {
			// Do the inner product of a row of A and col of B
			tmp=0;
			// Cache each row (so it's only read once per function)
			if (j == 0)
				Cache_Row: for(unsigned short int k = 0; k < MAT_A_COLS; k++)
					a_row[k] = in_mat_a[i][k];

			Product: for(unsigned short int k = 0; k < MAT_B_ROWS; k++) {
				tmp += a_row[k] * in_mat_b[k][j];
			}
			sw_result[i][j] = tmp;
		}
    }
    
    ExecuteNumberOfSteps: for (unsigned short int zz=0; zz<NUM_OF_TESTS ; zz++){
   
		k = 0;
		input_packet.BS_ID = 0x00; // 8 bits
		input_packet.FPGA_ID = 0x00; // 8 bits
		input_packet.PCKG_ID = 0x0000; // 16 bits
		input_packet.TX_UID = 0x00; // 8 bits
		input_packet.RX_UID = 0x00; // 8 bits
		input_packet.VALID_PACKET_BYTES = PAYLOAD_PACKET_BYTES; // 16 bits
		
		
		WriteFIFO: for (unsigned short int i = 0; i < NUM_TOTAL_OF_PACKETS_RX; i++) {
			for (unsigned short int j = 0; j < (PAYLOAD_PACKET_BYTES >> 2); j++){
				if (k < (MAT_A_COLS * MAT_A_ROWS + MAT_B_COLS * MAT_B_ROWS )){
					input_packet.MESSAGE[j] = input_buffer[k];
				}
				else{
					input_packet.MESSAGE[j] = 0;
					input_packet.VALID_PACKET_BYTES = (j << 2);
					break;
				}
				k++;
			}			
			//Sending packet
			input_fifo.write(input_packet);
		}
	
		#ifdef HW_COSIM
		// Run the AutoESL matrix multiply block
		Wrapper_Matrix_Multiplier(input_fifo, output_fifo);
		
		k = 0;
		READ_FIFO: while(!output_fifo.empty()){
		    Data_Received_fifo[k] = output_fifo.read();
		    WRITE_RESULTS_IN_AN_ARRAY: for (unsigned short int i=0; i<(Data_Received_fifo[k].VALID_PACKET_BYTES >> 2); i++){ 
				output_buffer[(k*(PAYLOAD_PACKET_BYTES/4)) + i] = Data_Received_fifo[k].MESSAGE[i];
			}	
		    k++;
	    } 
	    
	    k = 0;
	    WRITE_RESULTS_IN_A_2D_ARRAY: for (unsigned short int j=0; j < MAT_Y_ROWS; j++) {
			for (unsigned short int i=0; i < MAT_Y_COLS; i++){ 
				hw_result[j][i] = output_buffer[k];
				k++;
			}
		}
		
	    CHECK_RESULTS: for (unsigned short int j=0; j < MAT_Y_ROWS; j++) {
			COMPARE_HW_RESULTS_AGAINST_SW_RESULTS: for (unsigned short int i=0; i < MAT_Y_COLS; i++){ 
				// Check HW result against SW
				if ( hw_result[j][i] != sw_result[j][i] ){
					err_cnt++;
				}
				
			}
		}
		#endif 
		
		#ifdef HW_COSIM
		if (err_cnt)
			cout << "ERROR: " << err_cnt << " mismatches detected!" << endl;
		else
			cout << "Test passes." << endl;
		#endif 
		
		
	}	
	return err_cnt;
}

