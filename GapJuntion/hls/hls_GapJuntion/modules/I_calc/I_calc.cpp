#include "I_calc.hpp"

template<typename dataType>
void initIacc(dataType &F_temp,dataType &V_temp) {
init_Loop:  for (size_t i = 0; i < BLOCK_SIZE; i++) {
//
            #pragma HLS UNROLL
                    F_temp.data[i]=0;
                    V_temp.data[i]=0;
            }

}

template<typename dataType,typename streamType,int maxBits,int PackageDataQuantity>
void accBlockCurrents(streamType &F_acc,streamType &V_acc,dataType &F_acc_read,
    dataType &V_acc_read,dataType &F_temp,dataType &V_temp) {
#pragma HLS INLINE
        F_acc_read=F_acc.read();
        V_acc_read=V_acc.read();

        for (ap_int<4> i = 0; i < PackageDataQuantity; i++) {
            #pragma HLS UNROLL
            F_temp.data[i]+=F_acc_read.data[i];
            V_temp.data[i]+=V_acc_read.data[i];
        }

}


template<typename outDataType,int maxBits>
void tlastAssign(ap_int<maxBits> row,outDataType &I_calc,ap_int<27> &RowOfBlocks,
    Config &simConfig) {
//
  I_calc.tlast= (row==BLOCK_SIZE-1 &&
	      RowOfBlocks==simConfig.rowsToSimulate-1)?
		  1:0;
}

template<typename outDataType,typename outStreamType,typename inDataType,int maxBits>
void getTotalCurrent(ap_int<maxBits> row,outStreamType &I,outDataType &I_calc,ap_int<27> &RowOfBlocks,
    Config &simConfig,inDataType &F_temp,inDataType &V_temp) {
//
        I_calc.data = 0.8*F_temp.data[row]+ 0.2*V_temp.data[row];
        tlastAssign<outDataType,maxBits>(row,I_calc,RowOfBlocks,simConfig);
        I.write(I_calc);

}

void I_calc(Stream &I,VC_Stream &F_acc,VC_Stream &V_acc,Config &simConfig, int &V_SIZE){
//
        VC_Package F_acc_read;
        VC_Package V_acc_read;


        dataStream I_calc;

        assert(simConfig.rowsToSimulate<2500);
RowOfBlocks_Loop:for(ap_int<27> RowOfBlocks=0; RowOfBlocks<simConfig.rowsToSimulate; RowOfBlocks++) {
        #pragma HLS loop_tripcount min=1 max=2500
    VC_Package F_temp;
    VC_Package V_temp;
    initIacc(F_temp,V_temp);

        assert(simConfig.BLOCK_NUMBERS<2500);
Blocks_Loop: for(int block=0; block<simConfig.BLOCK_NUMBERS; block++) {
    #pragma HLS loop_tripcount min=1 max=2500
	#pragma HLS pipeline
                    accBlockCurrents<VC_Package,VC_Stream,14,4>(F_acc,V_acc,F_acc_read,V_acc_read,
                        F_temp,V_temp);
            }

getTotalCurrent_Loop: for(int row=0; row<BLOCK_SIZE; row++) {
                getTotalCurrent<dataStream,Stream,VC_Package,14>(row,I,I_calc,RowOfBlocks,simConfig,F_temp,V_temp);
            }
        }

}
