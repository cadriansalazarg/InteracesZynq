#include "V_read.hpp"


template<typename dataType,typename streamType,int maxBits>
void indexGeneration(streamType &Vi_idx,streamType &Vj_idx,Config &simConfig){
    for (ap_uint<maxBits> rowOffset = simConfig.rowBegin; rowOffset < simConfig.rowEnd;
        rowOffset+=BLOCK_SIZE){ //Rows Quantity
        #pragma HLS loop_tripcount min=1 max=2500
        dataType idx;
        idx.data[0]=rowOffset;
        idx.data[1]=rowOffset+1;
        idx.data[2]=rowOffset+2;
        idx.data[3]=rowOffset+3;
        Vi_idx.write(idx);

        assert(simConfig.BLOCK_NUMBERS<2500);
        for (ap_uint<maxBits> block = 0; block < simConfig.BLOCK_NUMBERS; block++) { //Number of Blocks
            #pragma HLS loop_tripcount min=1 max=2500
        	ap_uint<maxBits> column = block*BLOCK_SIZE;
        	dataType jdx;
        	jdx.data[0]=column;
        	jdx.data[1]=column+1;
        	jdx.data[2]=column+2;
        	jdx.data[3]=column+3;
        	Vj_idx.write(jdx);
        }
    }
}

template<typename dataType,typename streamType,unsigned int PackageDataQuantity,int maxBits>
void readVoltages(streamType &input,float voltagesBackup[], int &V_SIZE){
    assert(V_SIZE<MAX_V_SIZE);
	#pragma HLS pipeline
    for (ap_int<maxBits> i = 0; i < V_SIZE; i+=BLOCK_SIZE) {
    	#pragma HLS loop_tripcount min=1 max=MAX_V_SIZE/4
    	dataType readData = input.read();
    	for (ap_int<4> j = 0; j < PackageDataQuantity; j++) {
    		voltagesBackup[i+j]=readData.data[j];
        }
    }
}

template<typename dataType,typename streamType,typename idxType,typename idxStreamType>
void dataToProcess(idxStreamType &Vj_idx,streamType &processedData,float voltagesBackup[]) {
#pragma HLS inline
	dataType newData;
    idxType idx;
    idx=Vj_idx.read();
    for (ap_int<4> i = 0; i < BLOCK_SIZE; i++) {
    	#pragma HLS unroll
        newData.data[i]=voltagesBackup[idx.data[i]];
    }
    processedData.write(newData);
    processedData.write(newData);
    processedData.write(newData);
    processedData.write(newData);
}

void writeV2calc(
	float voltagesBackup[MAX_V_SIZE],
	Config& simConfig,
	Stream& fixedData,
	VC_Stream& processedData,
	idxStream &Vi_idx,
	idxStream &Vj_idx
){


	assert(simConfig.rowsToSimulate < 2500);
	for (ap_uint<idxMaxBits> i = 0; i < simConfig.rowsToSimulate; i++) {
		idxArray<wordDataPack> idx = Vi_idx.read();
		dataStream rowData[wordDataPack];
		rowData[0].data = voltagesBackup[idx.data[0]];
		rowData[1].data = voltagesBackup[idx.data[1]];
		rowData[2].data = voltagesBackup[idx.data[2]];
		rowData[3].data = voltagesBackup[idx.data[3]];
		assert(simConfig.BLOCK_NUMBERS < 2500);
		for (ap_uint<idxMaxBits> j = 0; j < simConfig.BLOCK_NUMBERS; j++) {
			#pragma HLS pipeline
			fixedData.write(rowData[0]);
			fixedData.write(rowData[1]);
			fixedData.write(rowData[2]);
			fixedData.write(rowData[3]);
			dataToProcess<VC_Package, VC_Stream, idxArray<wordDataPack>,
					idxStream>(Vj_idx, processedData, voltagesBackup);
		}
	}
}

void V_read(VC_Stream &input, VC_Stream &processedData, Stream &fixedData,Config &simConfig, int &V_SIZE){

	//V_Control saveVoltages;
	float voltagesBackup[MAX_V_SIZE];
	#pragma HLS RESOURCE variable=voltagesBackup core=RAM_T2P_BRAM

	static idxStream Vi_idx("Vi_idx");
	static idxStream Vj_idx("Vj_idx");

	#pragma HLS STREAM variable=Vi_idx depth=1024 dim=1
	#pragma HLS STREAM variable=Vj_idx depth=1024 dim=1


	readVoltages<VC_Package,VC_Stream,wordDataPack,idxMaxBits>(input, voltagesBackup,V_SIZE);

	#pragma HLS DATAFLOW

	indexGeneration<idxArray<wordDataPack>, idxStream, idxMaxBits>(Vi_idx,Vj_idx, simConfig);
	writeV2calc(voltagesBackup, simConfig, fixedData,processedData,Vi_idx,Vj_idx);
}
