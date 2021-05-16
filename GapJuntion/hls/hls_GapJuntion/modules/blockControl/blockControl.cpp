#include "blockControl.hpp"



template<typename inType,typename outType,int maxBits,int PackageDataQuantity>
void getVoltages(hls::stream<packaging_data> &input, hls::stream<outType> &V_data,
     int V_SIZE) {

        inType input_read;
        inType input_read_h;
        packaging_data input_packet;
        hls::stream<float> bus_local;
#pragma HLS STREAM variable=bus_local depth=256 dim=1

        outType newData;

        ap_int<maxBits> blockFinIdx;

        Loop_Producer: for (unsigned short int i=0; i<NUM_TOTAL_OF_PACKETS_RX; i++) {
        		while(input.empty())
        		;  // I put the semicolon on this separate line to silence a warning
                input_packet = input.read();
                		
				Store_Payload_In_Local_Bus: for (unsigned short int j=0; j<(input_packet.VALID_PACKET_BYTES>>2); j++) {
					bus_local.write(input_packet.MESSAGE[OFFSET_READ_PAYLOAD - j]);
				}	
		}
        

        assert(V_SIZE<MAX_V_SIZE);
        for (ap_int<maxBits> i = 0; i < V_SIZE; i+=PackageDataQuantity) {
                #pragma HLS loop_tripcount min=1 max=MAX_V_SIZE/4
                newData.data[0]=bus_local.read();
                newData.data[1]=bus_local.read();

                newData.data[2]=bus_local.read();
                newData.data[3]=bus_local.read();

                //printf("%d \n",newData.data[0]);
                //printf("%d \n",newData.data[1]);
                //printf("%d \n",newData.data[2]);
                //printf("%d \n",newData.data[3]);

                V_data.write(newData);
        }


}






void blockControl(hls::stream<packaging_data> &input, VC_Stream &V_data, int V_SIZE){

        getVoltages<Package64Bits,VC_Package,27,4>(input,V_data,V_SIZE);//read all the voltages


}
