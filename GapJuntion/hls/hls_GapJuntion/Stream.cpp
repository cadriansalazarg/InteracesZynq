#include "Stream.h"

#include "modules/blockControl/blockControl.hpp"
#include "modules/V_read/V_read.hpp"
#include "modules/calc/calc.hpp"
#include "modules/acc/acc.hpp"
#include "modules/I_calc/I_calc.hpp"

template<typename ConfigurationType>
void simulationConfig(ConfigurationType &simConfig,int &FirstRow,int &LastRow,int &size, unsigned char &bus_id, unsigned char &fpga_id, unsigned char &uid) {
#pragma HLS inline
    	simConfig.rowBegin=FirstRow;
    	simConfig.rowEnd=LastRow; //V_SIZE All the matrix
    	simConfig.rowsToSimulate=(LastRow-FirstRow)/BLOCK_SIZE;//(simConfig.rowEnd-simConfig.rowBegin)/BLOCK_SIZE;
    	simConfig.BLOCK_NUMBERS=size/BLOCK_SIZE;
    	simConfig.bus_id = bus_id;
    	simConfig.fpga_id = fpga_id;
    	simConfig.uid = uid;
}
void execute(hls::stream<packaging_data> &input, hls::stream<packaging_data> &output, Config &simConfig, int size){

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
void GapJunctionIP(hls::stream<packaging_data> &in_fifo, hls::stream<packaging_data>& out_fifo, int size,int FirstRow, int LastRow, unsigned char bus_id, unsigned char fpga_id, unsigned char uid) {

	#pragma HLS DATA_PACK variable=in_fifo
	#pragma HLS INTERFACE ap_fifo  port=in_fifo
	
	#pragma HLS DATA_PACK variable=out_fifo
	#pragma HLS INTERFACE ap_fifo  port=out_fifo
	
	#pragma HLS INTERFACE ap_stable register port=size
	#pragma HLS INTERFACE ap_stable register port=FirstRow
	#pragma HLS INTERFACE ap_stable register port=LastRow
	
	#pragma HLS INTERFACE ap_stable port=bus_id
	#pragma HLS INTERFACE ap_stable port=fpga_id
	#pragma HLS INTERFACE ap_stable port=uid
	
	
	
	#pragma HLS INTERFACE ap_ctrl_chain register port=return

	Config simConfig;
	simulationConfig<Config>(simConfig,FirstRow,LastRow,size, bus_id, fpga_id, uid);
	execute(in_fifo,out_fifo,simConfig,size);

}
