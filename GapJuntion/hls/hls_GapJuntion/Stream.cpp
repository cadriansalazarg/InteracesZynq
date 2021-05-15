#include "Stream.h"

#include "modules/blockControl/blockControl.hpp"
#include "modules/V_read/V_read.hpp"
#include "modules/calc/calc.hpp"
#include "modules/acc/acc.hpp"
#include "modules/I_calc/I_calc.hpp"

template<typename ConfigurationType>
void simulationConfig(ConfigurationType &simConfig,int &FirstRow,int &LastRow,int &size ) {
#pragma HLS inline
    	simConfig.rowBegin=FirstRow;
    	simConfig.rowEnd=LastRow; //V_SIZE All the matrix
    	simConfig.rowsToSimulate=(LastRow-FirstRow)/BLOCK_SIZE;//(simConfig.rowEnd-simConfig.rowBegin)/BLOCK_SIZE;
    	simConfig.BLOCK_NUMBERS=size/BLOCK_SIZE;
}
void execute(hls::stream<packaging_data> &input, Stream &output,Config &simConfig,int size){

	static VC_Stream V_data("V_data");
    #pragma HLS STREAM variable=V_data depth=128 dim=1

	static VC_Stream processedData("processedData");
	static Stream fixedData("fixedData");
    #pragma HLS STREAM variable=processedData depth=128 dim=1
    #pragma HLS STREAM variable=fixedData depth=128 dim=1

	static VC_Stream F("F");
	static VC_Stream V("V");
    #pragma HLS STREAM variable=F depth=128 dim=1
    #pragma HLS STREAM variable=V depth=128 dim=1

	static VC_Stream F_acc("F_acc");
	static VC_Stream V_acc("V_acc");
    #pragma HLS STREAM variable=F_acc depth=128 dim=1
    #pragma HLS STREAM variable=V_acc depth=128 dim=1

  #pragma HLS dataflow
	blockControl(input,V_data,size);
	V_read(V_data,processedData,fixedData,simConfig,size);
	calc(processedData, fixedData,F,V,simConfig);
	acc(F,V,F_acc,V_acc,simConfig);
	I_calc(output,F_acc,V_acc,simConfig,size);

}
void GapJunctionIP(hls::stream<packaging_data> &in_fifo, Stream &output, int size,int FirstRow, int LastRow) {

	#pragma HLS DATA_PACK variable=in_fifo
	#pragma HLS INTERFACE ap_fifo  port=in_fifo
	#pragma HLS INTERFACE axis  port=output
	#pragma HLS INTERFACE ap_stable register port=size
	#pragma HLS INTERFACE ap_stable register port=FirstRow
	#pragma HLS INTERFACE ap_stable register port=LastRow
	#pragma HLS INTERFACE ap_ctrl_chain register port=return

	Config simConfig;
	simulationConfig<Config>(simConfig,FirstRow,LastRow,size);
	execute(in_fifo,output,simConfig,size);

}
