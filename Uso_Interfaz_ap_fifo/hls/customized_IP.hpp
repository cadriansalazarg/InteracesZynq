#include <hls_stream.h>

#ifndef FIR_H_
#define FIR_H_
#define SIZE	16
#define SimSteps	30


typedef int	data_t;
  
void customized_IP_block( hls::stream<data_t>& in_fifo,
                     hls::stream<data_t>& out_fifo,
                     data_t input_axi_lite[SIZE],
                     data_t output_axi_lite[SIZE]);

#endif
