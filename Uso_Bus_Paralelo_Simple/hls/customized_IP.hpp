#include "hls_stream.h"
#ifndef FIR_H_
#define FIR_H_
#define SIZE	512
#define SimSteps	100


typedef int	data_t;
  
void customized_IP_block( hls::stream<data_t>& out_fifo_drvr_0,
                     hls::stream<data_t>& in_fifo_drvr_0,
                     hls::stream<data_t>& out_fifo_drvr_1,
                     hls::stream<data_t>& in_fifo_drvr_1,
                     data_t output_port_axi_lite_drvr_0[SIZE],
                     data_t output_port_axi_lite_drvr_1[SIZE],
                     data_t input_port_axi_lite_drvr_0[SIZE],
                     data_t input_port_axi_lite_drvr_1[SIZE]);

#endif
