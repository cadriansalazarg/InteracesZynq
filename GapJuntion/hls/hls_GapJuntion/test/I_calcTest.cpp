#include "../modules/I_calc/I_calc.hpp"

#include "../Stream.h"
#include <math.h>
#include <time.h>
#include <stdlib.h>



void Simulate_SW(float *V,float *F,hls::stream<float> &I_acc_Software,int &V_SIZE,Config &simConfig) {
    int block = 0;
	int row = 0;

	float i_acc[V_SIZE];

    for (int i = 0; i < V_SIZE; i++) {
        i_acc[i] = 0.0;
    }

	float const hundred = -1.0 / 100.0;

    for (size_t i = 0; i < simConfig.rowsToSimulate; i++) {

		for (block = 0; block < simConfig.BLOCK_NUMBERS; block++) {
            for (row = 0; row < BLOCK_SIZE; row++) {
                i_acc[row]+=0.8 * F[i*BLOCK_SIZE+block*BLOCK_SIZE+row] + 0.2 * V[i*BLOCK_SIZE+block*BLOCK_SIZE+row];
            }
		}

        for (row = 0; row < BLOCK_SIZE; row++) {
            I_acc_Software.write(i_acc[row]);
        }
    }


}

void Generate_Data( float *V,float *F,int &V_SIZE,Config &simConfig) {
		//printf("Original Data____________________________________________\n");
		for (int i = 0; i < simConfig.rowsToSimulate*simConfig.BLOCK_NUMBERS*BLOCK_SIZE; i++) {
				V[i] = 1.568656-2.910938 * i;
						//printf("V%d = %f \n", i, V[i]);
		}
        for (int i = 0; i < simConfig.rowsToSimulate*simConfig.BLOCK_NUMBERS*BLOCK_SIZE; i++) {
                F[i] = 3.34453232-2.45436654 * i;
                        //printf("V%d = %f \n", i, V[i]);
        }
		//printf("_________________________________________________________\n");
}


void prepare_HW_input(float *V,float *F,VC_Stream &F_acc_Hardware,VC_Stream &V_acc_Hardware,int &V_SIZE,Config &simConfig) {
    VC_Package newF;
    VC_Package newV;

            for (int i = 0; i < simConfig.rowsToSimulate; i++) {
                for (int j = 0; j < simConfig.BLOCK_NUMBERS; j++) {

                    for (int k = 0; k < BLOCK_SIZE; k++) {
                    newF.data[k]=F[i*BLOCK_SIZE+j*BLOCK_SIZE+k];
                    newV.data[k]=V[i*BLOCK_SIZE+j*BLOCK_SIZE+k];

                }
                    //std::cout << "F  " << j << " = " << newF.data <<"\n";
                    //std::cout << "V  " << j << " = " << newV.data <<"\n";

                    F_acc_Hardware.write(newF);
                    V_acc_Hardware.write(newV);
                }
            }

}

void Check_Results(hls::stream<float> &output_Software,Stream &output_Hardware) {
		int successful = 0;
		float sw_result, hw_result;
		float precision = 0.01;
		while (!output_Software.empty()) {
				sw_result = output_Software.read();
				hw_result = output_Hardware.read().data;
				printf("Software Result %f \n", sw_result);
				printf("Hardware Result %f \n \n", hw_result);
				if (fabs(sw_result - hw_result) >= precision) {
					successful = 1;
					//break;
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

#ifdef COSIM_DEBUG
void Cosim_debug(dbg_stream &debugStream) {

    printf("Debug=================================\n");
    while (!debugStream.empty()) {
        printf("%c",(char) debugStream.read());
    }
}
#endif

void adjustIPsize(int &sizeGJ) {
	while (sizeGJ % BLOCK_SIZE != 0) {
			sizeGJ++;
			//printf("sizeGJ  = %d \n", sizeGJ);
	}
}



VC_Stream F_in("F");
VC_Stream V_in("V");


VC_Stream F_acc_Hardware("F_acc_Hardware");
VC_Stream V_acc_Hardware("V_acc_Hardware");

Stream I_acc_Hardware("I_acc_Hardware");
hls::stream<float> I_acc_Software("I_acc_Software");

int I_calcTest() {


int lenghtTest1=1;
    //int Test1Values[6] = {1,5,101,200,559,1400}; // list-initialization of a non-static member
int TestValues1[1] = {4};

for (int testValue = 0; testValue < lenghtTest1; testValue++) { //test V_SIZE


    #ifdef COSIM_DEBUG
    dbg_stream debugStream;
    #endif


    int V_SIZE=TestValues1[testValue];
    printf("Test with V_SIZE= %d_______________________________________ \n",V_SIZE);

    Config simConfig;

    int sizeGJ=V_SIZE;
    adjustIPsize(sizeGJ);

    simConfig.rowBegin=0;
    simConfig.rowEnd=sizeGJ; //V_SIZE All the matrix
    simConfig.rowsToSimulate=(simConfig.rowEnd-simConfig.rowBegin)/BLOCK_SIZE;
    simConfig.BLOCK_NUMBERS=sizeGJ/BLOCK_SIZE;

    const int blockNumbers=simConfig.BLOCK_NUMBERS;

    float V[blockNumbers*sizeGJ];
    float F[blockNumbers*sizeGJ];


    Generate_Data(V,F,sizeGJ,simConfig);
    //printf("HW_______________________________________ \n");

    prepare_HW_input(V,F,F_acc_Hardware,V_acc_Hardware,sizeGJ,simConfig);

    I_calc(I_acc_Hardware,F_acc_Hardware,V_acc_Hardware,simConfig,
         sizeGJ,debugStream);
    //printf("_______________________________________ \n");
    //printf("SW_______________________________________ \n");
    Simulate_SW(V,F,I_acc_Software,sizeGJ,simConfig);
    //printf("_______________________________________ \n");

    printf("_______________________________________ \n");
    printf("I_calc Test\n");
    printf("_______________________________________ \n");
    Check_Results(I_acc_Software,I_acc_Hardware);

    #ifdef COSIM_DEBUG
    Cosim_debug(debugStream);
    #endif


}
return 0;
}


int main() {

srand(time(NULL));


I_calcTest();


    return 0;
}
