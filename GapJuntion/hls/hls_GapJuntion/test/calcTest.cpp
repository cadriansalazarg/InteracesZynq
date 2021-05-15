#include "../modules/calc/calc.hpp"

#include "../Stream.h"
#include <math.h>
#include <time.h>
#include <stdlib.h>



void Simulate_SW(float *V,hls::stream<float> &V_Software,hls::stream<float> &F_Software,int &V_SIZE) {
        int i = 0;
    	int j = 0;

    	float f = 0.0;
    	float v = 0.0;
    	float const hundred = -1.0 / 100.0;

    	for (i = 0; i < V_SIZE; i++) {
    		for (j = 0; j < V_SIZE; j++) {
    			v = V[i] - V[j];
    			f = v * expf(v * v * hundred);
                V_Software.write(v);
                F_Software.write(f);
                //std::cout << "Vj" << j << " = " << V[j] <<"\n";
                //std::cout << "Vi" << i << " = " << V[i] <<"\n";
                //std::cout << "V = " << v <<"\n";
    		}
    	}
}

void Generate_Data( float *V,int &V_SIZE) {
		//printf("Original Data____________________________________________\n");
		for (int i = 0; i < V_SIZE; i++) {
				V[i] = 1.568656-2.910938 * i;
						//printf("V%d = %f \n", i, V[i]);
		}
		//printf("_________________________________________________________\n");
}


void prepare_HW_input( int blockNumber,float *V,Stream &savedData,VC_Stream &processedData,int &V_SIZE) {
    dataStream newVi;
    VC_Package newVj;

    int blockOffset=blockNumber*BLOCK_SIZE;

    for (int i = blockOffset; i < blockOffset+BLOCK_SIZE; i++) {
            newVi.data=V[i];
            savedData.write(newVi);
        for (int j = 0; j < V_SIZE; j+=BLOCK_SIZE) {
            for (int i = 0; i < BLOCK_SIZE; i++) {
                newVj.data[i]=V[j+i];
            }

            processedData.write(newVj);


        }
    }

    //printf("_________________________________________________________\n");




}


void Check_Results(hls::stream<float> &output_Software,VC_Stream &output_Hardware) {
		int successful = 0;
		float sw_result, hw_result;
		float precision = 0.01;
        VC_Package HW_temp;
		while (!output_Hardware.empty()) {
                HW_temp = output_Hardware.read();
                for (int i = 0; i < 4; i++) {
                    sw_result = output_Software.read();
    				hw_result = HW_temp.data[i];
    				//printf("Software Result %f \n", sw_result);
    				//printf("Hardware Result %f \n \n", hw_result);
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

int V_SIZE=4;
const int V_SIZE_const=4;

float V[V_SIZE_const];
float C[V_SIZE_const * V_SIZE_const];

Stream savedData("savedData");
VC_Stream processedData("processedData");
VC_Stream V_Hardware("V_Hardware");
VC_Stream F_Hardware("F_Hardware");
hls::stream<float> V_Software("V_Software");
hls::stream<float> F_Software("F_Software");


int main() {

srand(time(NULL));

for(int it=0;it<1;it++){

        Config simConfig;

        simConfig.rowBegin=0;
        simConfig.rowEnd=BLOCK_SIZE; //V_SIZE All the matrix
        simConfig.rowsToSimulate=(simConfig.rowEnd-simConfig.rowBegin)/BLOCK_SIZE;
        simConfig.BLOCK_NUMBERS=V_SIZE/BLOCK_SIZE;

    	Generate_Data(V,V_SIZE);
        //printf("HW_______________________________________ \n");
        for (int i = 0; i < simConfig.BLOCK_NUMBERS; i++) {
            prepare_HW_input( i,V,savedData,processedData,V_SIZE);
            calc(processedData,savedData,F_Hardware,V_Hardware,simConfig);
        }

        //printf("_______________________________________ \n");
        //printf("SW_______________________________________ \n");
    	Simulate_SW(V,V_Software,F_Software,V_SIZE);
        //printf("_______________________________________ \n");

        printf("_______________________________________ \n");
    	printf("calc Test\n");
        printf("_______________________________________ \n");
        printf("Testing V_______________________________________ \n");
    	Check_Results(V_Software,V_Hardware);
        printf("Testing F_______________________________________ \n");
    	Check_Results(F_Software,F_Hardware);



	return 0;

	}
}
