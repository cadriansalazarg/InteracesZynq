#include "blockControl.hpp"



template<typename inType,typename outType,int maxBits,int PackageDataQuantity>
void getVoltages(hls::stream<inType> &input, hls::stream<outType> &V_data,
     int V_SIZE) {

        inType input_read;
        inType input_read_h;

        outType newData;

        ap_int<maxBits> blockFinIdx;

        assert(V_SIZE<MAX_V_SIZE);
        for (ap_int<maxBits> i = 0; i < V_SIZE; i+=PackageDataQuantity) {
                #pragma HLS loop_tripcount min=1 max=MAX_V_SIZE/4
                input_read=input.read();
                newData.data[0]=input_read.data[0];
                newData.data[1]=input_read.data[1];

                input_read_h=input.read();
                newData.data[2]=input_read_h.data[0];
                newData.data[3]=input_read_h.data[1];

                V_data.write(newData);
        }


}






void blockControl(in64Bits &input, VC_Stream &V_data, int V_SIZE){

        getVoltages<Package64Bits,VC_Package,27,4>(input,V_data,V_SIZE);//read all the voltages


}
