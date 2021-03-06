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




template<typename outDataType,typename outStreamType,typename inDataType,int maxBits>
void getTotalCurrent(ap_int<maxBits> row,hls::stream<float> &I_calc,
    inDataType &F_temp,inDataType &V_temp) {
//
		float I_curr_calc;
		I_curr_calc = 0.8*F_temp.data[row]+ 0.2*V_temp.data[row];
		I_calc.write(I_curr_calc);
		// Uncomment for debugging
		//static int i = 0;
		//printf("El valor de i es %d \n", i);
		//i++;

}

void I_calc(hls::stream<packaging_data> &I,VC_Stream &F_acc,VC_Stream &V_acc,Config &simConfig, int &V_SIZE){
//
        VC_Package F_acc_read;
        VC_Package V_acc_read;


        hls::stream<float> I_calc;
#pragma HLS STREAM variable=I_calc depth=1024 dim=1
        packaging_data output_packet;
        unsigned int k = 0;

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
                getTotalCurrent<dataStream,Stream,VC_Package,14>(row,I_calc,F_temp,V_temp);
            }
        }

	output_packet.BS_ID = simConfig.bus_id;
	output_packet.FPGA_ID = simConfig.fpga_id;
	output_packet.TX_UID = simConfig.uid; // 8 bits
	output_packet.RX_UID = simConfig.tid;
	output_packet.VALID_PACKET_BYTES = PAYLOAD_PACKET_BYTES;


	
	Loop_Consumer: for (unsigned short int i = 0; i < NUM_TOTAL_OF_PACKETS_TX; i++) {
		Creating_Output_Packet: for (unsigned short int j = 0; j < (PAYLOAD_PACKET_BYTES >> 2); j++){
			if (k < (N_SIZE/FUNCTIONAL_UNIT_NUMBER)){
				output_packet.MESSAGE[OFFSET_READ_PAYLOAD-j] = I_calc.read();
				// Uncomment for debugging
				//printf("Imprime el valor del mensaje %d del paquete %d y el dato es %f\n",j, i, output_packet.MESSAGE[OFFSET_READ_PAYLOAD-j]);
			}
			else{
				output_packet.MESSAGE[j] = 0;
				output_packet.VALID_PACKET_BYTES = (j << 2);
				break;
			}
			k++;
		}
		output_packet.PCKG_ID = i;
		//Sending packet
		I.write(output_packet);
	}


}
