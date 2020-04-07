#include "customized_IP.hpp"

void customized_IP_block( hls::stream<data_t>& in_fifo,
                     hls::stream<data_t>& out_fifo,
                     data_t input_axi_lite[SIZE],
                     data_t output_axi_lite[SIZE]){
	int i = 0;
	int j = 0;
	
	SendData_To_FIFO: for (i=0; i<SIZE; i++) {
		out_fifo.write(input_axi_lite[i]);
    } 
    
    
	Receive_From_FIFO: while(!in_fifo.empty()){
		output_axi_lite[j] = in_fifo.read();
		j++;
	  }
  
}
