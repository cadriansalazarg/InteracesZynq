#include "../../Stream.h"

template<typename dataType,typename streamType>
void getVj(dataType &Vj,streamType &processedData){
        Vj = processedData.read();
}

template<typename dataType,typename streamType>
void getVi(dataType &Vi,streamType &savedData){
        Vi=savedData.read();
}

template<typename dataType,typename streamType,typename fixedDataType,int PackageDataQuantity>
void V_calculation(fixedDataType &Vi,dataType &Vj,dataType &V_calc,streamType &V){
        for (ap_int<4> i = 0; i < PackageDataQuantity; i++) {
            V_calc.data[i]=Vi.data - Vj.data[i];
        }
        V.write(V_calc);
}

template<typename dataType,typename streamType,typename fixedDataType,int PackageDataQuantity>
void F_calculation(fixedDataType &Vi,dataType &Vj,dataType &F_calc,dataType &V_calc,streamType &F){
        for (ap_int<4> i = 0; i < PackageDataQuantity; i++) {
            F_calc.data[i]=V_calc.data[i] * expf(V_calc.data[i] * V_calc.data[i] * hundred);
        }
        F.write(F_calc);
}


void calc(VC_Stream &processedData, Stream &savedData,VC_Stream &F, VC_Stream &V, Config &simConfig){
        dataStream Vi;
        VC_Package Vj;
        VC_Package V_calc;
        VC_Package F_calc;

        assert(simConfig.rowsToSimulate<2500);
        for(ap_int<32> RowOfBlocks=0; RowOfBlocks<simConfig.rowsToSimulate; RowOfBlocks++) {
            #pragma HLS loop_tripcount min=1 max=2500
            assert(simConfig.BLOCK_NUMBERS*BLOCK_SIZE<2500*4);
            for(ap_int<27> i=0; i<simConfig.BLOCK_NUMBERS*BLOCK_SIZE; i++) {
                #pragma HLS loop_tripcount min=1 max=2500*4
                #pragma HLS pipeline ii=2
                getVj<VC_Package,VC_Stream>(Vj,processedData);
                getVi<dataStream,Stream>(Vi,savedData);
                V_calculation<VC_Package,VC_Stream,dataStream,4>(Vi,Vj,V_calc,V);
                F_calculation<VC_Package,VC_Stream,dataStream,4>(Vi,Vj,F_calc,V_calc,F);
            }
    }

}
