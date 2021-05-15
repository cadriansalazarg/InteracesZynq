#include "../modules/acc/acc.hpp"

#include "../Stream.h"
#include <math.h>
#include <time.h>
#include <stdlib.h>



void Simulate_SW(float *V,float *F,float *C,hls::stream<float> &V_acc_Software,hls::stream<float> &F_acc_Software,int &V_SIZE,Config &simConfig) {
    int i = 0;
	int j = 0;

	float f_acc = 0.0;
	float v_acc = 0.0;

	float const hundred = -1.0 / 100.0;
	int columnBlock=BLOCK_SIZE-1;


		for (j = 0; j < simConfig.BLOCK_NUMBERS*BLOCK_SIZE*BLOCK_SIZE; j++) {

			f_acc += F[j] * C[j];
			v_acc += V[j] * C[j];

            if(j==columnBlock){
                F_acc_Software.write(f_acc);
                V_acc_Software.write(v_acc);

                f_acc = 0.0;
            	v_acc = 0.0;
                columnBlock += BLOCK_SIZE;
            }
		}
}

void Generate_Data( float *V,float *F,float *C,int &V_SIZE,Config &simConfig) {
		//printf("Original Data____________________________________________\n");
		for (int i = 0; i < simConfig.BLOCK_NUMBERS*BLOCK_SIZE*BLOCK_SIZE; i++) {
				V[i] = 1.568656-2.910938 * i;
						//printf("V%d = %f \n", i, V[i]);
		}
        for (int i = 0; i < simConfig.BLOCK_NUMBERS*BLOCK_SIZE*BLOCK_SIZE; i++) {
                F[i] = 3.34453232-2.45436654 * i;
                        //printf("V%d = %f \n", i, V[i]);
        }

        for (int i = 0; i < simConfig.BLOCK_NUMBERS*BLOCK_SIZE*BLOCK_SIZE ; i++) {
            C[i] = 0.04;
        }
		//printf("_________________________________________________________\n");
}


void prepare_HW_input(float *V,float *F,float *C,VC_Stream &F_acc_Hardware,VC_Stream &V_acc_Hardware,VC_Stream &Conductances,int &V_SIZE,Config &simConfig) {
    VC_Package newF;
    VC_Package newV;
    VC_Package newC;

            //std::cout << "MaxIndex = " << BLOCK_NUMBERS*BLOCK_SIZE*BLOCK_SIZE <<"\n";
            //std::cout << "BLOCK_NUMBERS = " << BLOCK_NUMBERS <<"\n";
            for (int j = 0; j < simConfig.BLOCK_NUMBERS*BLOCK_SIZE*BLOCK_SIZE; j+=4) {
                for (int i = 0; i < 4; i++) {
                    newF.data[i]=F[j+i];
                    newV.data[i]=V[j+i];
                    //std::cout << "V_acc_Hardware" << j <<  " = " << newData.data <<"\n";
                    newC.data[i]=C[j+i];
                }
                F_acc_Hardware.write(newF);
                V_acc_Hardware.write(newV);
                 Conductances.write(newC);
            }

}

void Check_Results(hls::stream<float> &output_Software,VC_Stream &output_Hardware) {
		int successful = 0;
		float sw_result, hw_result;
		float precision = 0.01;
        VC_Package hwRead;
		while (!output_Software.empty()) {
				hwRead = output_Hardware.read();
                for (int i = 0; i < BLOCK_SIZE; i++) {
                    sw_result = output_Software.read();
                    hw_result=hwRead.data[i];
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


int V_SIZE=4;


VC_Stream F_in("F");
VC_Stream V_in("V");
VC_Stream C_in("C");

VC_Stream F_acc_Hardware("F_acc_Hardware");
VC_Stream V_acc_Hardware("V_acc_Hardware");

hls::stream<float> F_acc_Software("F_acc_Software");
hls::stream<float> V_acc_Software("V_acc_Software");

int accTest() {

    Config simConfig;

    simConfig.rowBegin=0;
    simConfig.rowEnd=BLOCK_SIZE; //V_SIZE All the matrix
    simConfig.rowsToSimulate=(simConfig.rowEnd-simConfig.rowBegin)/BLOCK_SIZE;
    simConfig.BLOCK_NUMBERS=V_SIZE/BLOCK_SIZE;

    const int blockNumbers=simConfig.BLOCK_NUMBERS;

    float V[blockNumbers*BLOCK_SIZE*BLOCK_SIZE];
    float F[blockNumbers*BLOCK_SIZE*BLOCK_SIZE];
    float C[blockNumbers*BLOCK_SIZE*BLOCK_SIZE];


    Generate_Data(V,F,C,V_SIZE,simConfig);
    //printf("HW_______________________________________ \n");

    prepare_HW_input(V,F,C,F_in,V_in,C_in,V_SIZE,simConfig);

    acc(F_in,V_in,C_in,F_acc_Hardware,V_acc_Hardware,simConfig);
    //printf("_______________________________________ \n");
    //printf("SW_______________________________________ \n");
    Simulate_SW(V,F,C,V_acc_Software,F_acc_Software,V_SIZE,simConfig);
    //printf("_______________________________________ \n");

    printf("_______________________________________ \n");
    printf("acc Test\n");
    printf("_______________________________________ \n");
    printf("Testing V_acc_______________________________________ \n");
    Check_Results(V_acc_Software,V_acc_Hardware);
    printf("Testing F_acc_______________________________________ \n");
    Check_Results(F_acc_Software,F_acc_Hardware);



return 0;
}


int main() {

srand(time(NULL));




for(int it=0;it<1;it++){

    accTest();

	}
    return 0;
}
