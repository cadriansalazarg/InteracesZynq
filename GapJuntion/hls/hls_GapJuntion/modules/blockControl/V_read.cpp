#include "V_read.hpp"


template<typename dataType,typename streamType,int maxBits>
void indexGeneration(streamType &Vi_idx,streamType &Vj_idx,Config &simConfig){

    dataType idx;

    for (ap_int<maxBits> RowOfBlocks = simConfig.rowBegin; RowOfBlocks < simConfig.rowEnd;
        RowOfBlocks+=BLOCK_SIZE){
        #pragma HLS loop_tripcount min=1 max=BLOCK_NUMBERS
        for (ap_int<maxBits> i = RowOfBlocks*BLOCK_SIZE; i < RowOfBlocks*BLOCK_SIZE+BLOCK_SIZE; i++) {
            #pragma HLS loop_tripcount avg=16
            for (ap_int<maxBits> j = 0; j < V_SIZE; j++) {
                idx.data=i;
                Vi_idx.write(idx);
                idx.data=j;
                Vj_idx.write(idx);
            }
        }
    }


}

template<typename dataType,typename streamType,int maxBits>
void readVoltages(streamType &input,V_Control &saveVoltages){
    for (ap_int<maxBits> i = 0; i < V_SIZE; i++) {
            //printf("Stream------------------\n");
            dataType readData = input.read();
            //std::cout << "VVR" << i << " = " << readData.data <<"\n";
            saveVoltages.voltagesBackup[i]=readData;
            //printf("New Backup data added = %f\n",readData.data);
    }
}

template<typename dataType,typename streamType,typename idxType,typename idxStreamType>
void dataToProcess(idxStreamType &Vj_idx,streamType &processedData,V_Control &saveVoltages) {
    idxType idx=Vj_idx.read();

    dataType newData;

    newData.data=saveVoltages.voltagesBackup[idx.data].data;
    processedData.write(newData);
    //std::cout << "Vj" << idx.data << " = " << newData.data <<"\n";
}

template<typename dataType,typename streamType,typename idxType,typename idxStreamType>
void dataFixed(idxStreamType &Vi_idx,streamType &fixedData,V_Control &saveVoltages) {
    idxType idx=Vi_idx.read();

    dataType newData;

    newData.data=saveVoltages.voltagesBackup[idx.data].data;
    fixedData.write(newData);
    //std::cout << "Vi" << idx.data << " = " << newData.data <<"\n";
}

void V_read(Stream &input, Stream &processedData, Stream &fixedData,Config &simConfig){


        Control control_data;
        V_Control saveVoltages;

        //New______________________________________
        idxStream Vi_idx("Vi_idx");
        idxStream Vj_idx("Vj_idx");

        indexGeneration<idxData,idxStream,18>(Vi_idx,Vj_idx,simConfig);
        readVoltages<dataStream,Stream,18>(input, saveVoltages);

        //for(ap_int<18> RowOfBlocks=0; RowOfBlocks<simConfig.rowsToSimulate; RowOfBlocks++) {
            //#pragma HLS loop_tripcount min=1 max=BLOCK_NUMBERS

            for(ap_int<18> i=0; i<BLOCK_NUMBERS*BLOCK_SIZE*BLOCK_SIZE; i++) {
                #pragma HLS DATAFLOW
                dataToProcess<dataStream,Stream,idxData,idxStream>
                (Vj_idx,processedData, saveVoltages);

                dataFixed<dataStream,Stream,idxData,idxStream>
                (Vi_idx,fixedData,saveVoltages);
            }
        //}
}
