#include "../modules/blockControl/blockControl.hpp"

#include "../Stream.h"
#include <math.h>
#include <time.h>
#include <stdlib.h>



void Simulate_SW(float *C, float *V,hls::stream<float> &V_Software,hls::stream<float> &C_Software,int &V_SIZE) {

    for (int i = 0; i < V_SIZE; i++) {
            V_Software.write(V[i]);
    }
    for (int i = 0; i < V_SIZE * V_SIZE; i++) {
            C_Software.write(C[i]);
    }
}

void Generate_Data(float *C, float *V,int &V_SIZE) {
		//printf("Original Data____________________________________________\n");
		for (int i = 0; i < V_SIZE; i++) {
				V[i] =  1.568656-2.910938 * i;
		}
		for (int i = 0; i < V_SIZE * V_SIZE; i++) {
				C[i] = 0.04;
		}
		//printf("_________________________________________________________\n");
}


void prepare_HW_input(int blockNumber,float *C, float *V,in64Bits &input,int &V_SIZE) {
    Package64Bits newData;

    //printf("Input Data____________________________________________\n");

    for (int i = blockNumber*BLOCK_SIZE; i < (blockNumber*BLOCK_SIZE+BLOCK_SIZE); i+=2) {
            newData.data[0]=V[i];
            newData.data[1]=V[i+1];
            input.write(newData);
            printf("V%d=%f \n",i, newData.data[0]);
            printf("V%d=%f \n",i+1, newData.data[1]);
    }

    for (int i = blockNumber*BLOCK_SIZE*BLOCK_SIZE; i < (blockNumber*BLOCK_SIZE * BLOCK_SIZE +BLOCK_SIZE * BLOCK_SIZE) ; i+=2) {
        newData.data[0]=C[i];
        newData.data[1]=C[i+1];
        input.write(newData);
        printf("C%d=%f \n",i, newData.data[0]);
        printf("C%d=%f \n",i+1, newData.data[1]);
    }

    //printf("_________________________________________________________\n");




}

template< typename dataType>
void Check_Results(hls::stream<float> &output_Software,dataType &output_Hardware) {
		int successful = 0;
		float sw_result, hw_result;
		float precision = 0.01;
        VC_Package HW_temp;
		while (!output_Hardware.empty()) {
                HW_temp = output_Hardware.read();
                for (int i = 0; i < 4; i++) {
                    sw_result = output_Software.read();
    				hw_result = HW_temp.data[i];
    				printf("Software Result %f \n", sw_result);
    				printf("Hardware Result %f \n \n", hw_result);
    				if (fabs(sw_result - hw_result) >= precision) {
    					successful = 1;
    					//break;
    				}
                }

		}
		printf("******************************************\n");
		if (successful == 0) {
				printf("Successful result\n");
		} else {
				printf("Error\n");
		}
		printf("******************************************\n");
}


void simulationConfigBlockControl(Config &simConfig,int &FirstRow,int &LastRow,int &size ) {
	simConfig.rowBegin=FirstRow;
	simConfig.rowEnd=LastRow; //V_SIZE All the matrix
	simConfig.rowsToSimulate=(LastRow-FirstRow)/BLOCK_SIZE;//(simConfig.rowEnd-simConfig.rowBegin)/BLOCK_SIZE;
	simConfig.BLOCK_NUMBERS=size/BLOCK_SIZE;
}


int V_SIZE=4;
const int V_SIZE_const=4;
float V[V_SIZE_const];
float C[V_SIZE_const * V_SIZE_const];

in64Bits input("input");
int size=V_SIZE;
VC_Stream V_Hardware("V_Hardware");
VC_Stream C_Hardware("C_Hardware");
hls::stream<float> V_Software("V_Software");
hls::stream<float> C_Software("C_Software");



int main() {

srand(time(NULL));


for(int it=0;it<1;it++){

        Config simConfig;
        int FirstRow=0;
        int LastRow=V_SIZE;
        int size=V_SIZE;
        simulationConfigBlockControl(simConfig,FirstRow,LastRow,size );

    	Generate_Data(C,V,V_SIZE);
        for(int i=0;i<simConfig.BLOCK_NUMBERS;i++){
        prepare_HW_input(i,C, V,input,V_SIZE);
        }
        blockControl(input,V_Hardware,C_Hardware,simConfig,V_SIZE,0,V_SIZE);
    	Simulate_SW(C,V,V_Software,C_Software,V_SIZE);

    	printf("blockControl Test_______________________________________ \n");
        printf("Testing Voltages_______________________________________ \n");
    	Check_Results<VC_Stream>(V_Software,V_Hardware);
        printf("Testing Conductances_______________________________________ \n");
    	Check_Results<VC_Stream>(C_Software,C_Hardware);



	return 0;

	}
}
