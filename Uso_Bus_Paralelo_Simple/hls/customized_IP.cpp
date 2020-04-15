#include "customized_IP.hpp"

void customized_IP_block( hls::stream<data_t>& out_fifo_drvr_0,
                     hls::stream<data_t>& in_fifo_drvr_0,
                     hls::stream<data_t>& out_fifo_drvr_1,
                     hls::stream<data_t>& in_fifo_drvr_1,
                     data_t output_port_axi_lite_drvr_0[SIZE],
                     data_t output_port_axi_lite_drvr_1[SIZE],
                     data_t input_port_axi_lite_drvr_0[SIZE],
                     data_t input_port_axi_lite_drvr_1[SIZE]){				
    
    Loop1: for (int i=0;i<SIZE;i++) { 
		out_fifo_drvr_0.write(input_port_axi_lite_drvr_0[i]); 
		out_fifo_drvr_1.write(input_port_axi_lite_drvr_1[i]);
    } 
    
    Loop2: for (int i=0;i<SIZE;i++) { 
		while(in_fifo_drvr_1.empty());
		output_port_axi_lite_drvr_1[i] = in_fifo_drvr_1.read();
    } 
    
    Loop3: for (int i=0;i<SIZE;i++) { 
		while(in_fifo_drvr_0.empty());
		output_port_axi_lite_drvr_0[i] = in_fifo_drvr_0.read();
    } 
}
