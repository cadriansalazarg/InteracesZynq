#include "../modules/V_read/V_read.hpp"

#include "../Stream.h"
#include <math.h>
#include <time.h>
#include <stdlib.h>



void Simulate_SW(float *V,hls::stream<float> &VFixed_Software,hls::stream<float> &VProcessed_Software,int &V_SIZE,ap_int<27> &BLOCK_NUMBERS,Config &simConfig) {

    	float const hundred = -1.0 / 100.0;
        printf("sw-----------------------------------\n");
    for (int rowOfBlocks = 0; rowOfBlocks < simConfig.rowsToSimulate; rowOfBlocks++) {
            printf("rowOfBlocks %d--------------------------------\n",rowOfBlocks);

            for (int block = 0; block < simConfig.BLOCK_NUMBERS; block++) {

            	for (int row = rowOfBlocks*BLOCK_SIZE; row < rowOfBlocks*BLOCK_SIZE+BLOCK_SIZE; row++) {
                    printf("row %d--------------------------------\n",row);
                    VFixed_Software.write(V[row]);
                    //printf("-----------------------------------\n");
                    std::cout << "Vi" << row << " = " << V[row] <<"\n";
            		for (int column = block*BLOCK_SIZE; column < block*BLOCK_SIZE+BLOCK_SIZE; column++) {
                        //printf("column %d--------------------------------\n",column);
                        VProcessed_Software.write(V[column]);
                        std::cout << "Vj" << column << " = " << V[column] <<"\n";
            		}
            	}
        }
    }
}

void Generate_Data( float *V,int &V_SIZE,int &V_SIZE_AJUST) {

		for (int i = 0; i < V_SIZE_AJUST; i++) {
                if(i <V_SIZE){
                    V[i] = -2.910938 * i;
                }
                else{
                    V[i]=0;
                }
                //std::cout << "V" << i << " = " << V[i] <<"\n";


						//printf("V%d = %f \n", i, V[i]);
		}
}


void prepare_HW_input( float *V,VC_Stream &input,int &V_SIZE) {
    VC_Package newdata;

    for (int i = 0; i < V_SIZE; i+=BLOCK_SIZE) {
            for (int j = 0; j < BLOCK_SIZE; j++) {
                newdata.data[j]=V[i+j];
                //printf("V%d = %f\n",i+j,V[i+j]);
            }
            input.write(newdata);
    }
    //printf("_________________________________________________________\n");

}

template< typename dataType>
void Check_Results_Processed(hls::stream<float> &output_Software,dataType &output_Hardware) {
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

void adjustIPsize(int &sizeGJ) {
	while (sizeGJ % BLOCK_SIZE != 0) {
			sizeGJ++;
			//printf("sizeGJ  = %d \n", sizeGJ);
	}
}



template< typename dataType>
void Check_Results_Fixed(hls::stream<float> &output_Software,dataType &output_Hardware) {
		int successful = 0;
		float sw_result, hw_result;
		float precision = 0.01;
		while (!output_Hardware.empty()) {
                    sw_result = output_Software.read();
    				hw_result = output_Hardware.read().data;
    				//printf("Software Result %f \n", sw_result);
    				//printf("Hardware Result %f \n \n", hw_result);
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




VC_Stream Input("Input");
Stream VFixed_Hardware("VFixed_Hardware");
VC_Stream VProcessed_Hardware("VProcessed_Hardware");
hls::stream<float> VFixed_Software("VFixed_Software");
hls::stream<float> VProcessed_Software("VProcessed_Software");


int main() {

srand(time(NULL));

int lenghtTest1=6;
//int Test1Values[6] = {1,5,101,200,559,1400}; // list-initialization of a non-static member
int TestValues1[6] = {1,3,4,16,101,1005};

for (int testValue = 0; testValue < lenghtTest1; testValue++) { //test V_SIZE

        int V_SIZE=TestValues1[testValue];
        printf("Test with V_SIZE= %d_______________________________________ \n",V_SIZE);
        float V[V_SIZE];
        float C[V_SIZE * V_SIZE];

        Config simConfig;


        int sizeGJ=V_SIZE;
        adjustIPsize(sizeGJ);

        simConfig.rowBegin=0;
        simConfig.rowEnd=sizeGJ; //V_SIZE All the matrix
        simConfig.rowsToSimulate=(simConfig.rowEnd-simConfig.rowBegin)/BLOCK_SIZE;
        simConfig.BLOCK_NUMBERS=sizeGJ/BLOCK_SIZE;

        Generate_Data(V,V_SIZE,sizeGJ);


        prepare_HW_input( V,Input,sizeGJ);
        V_read(Input,VProcessed_Hardware,VFixed_Hardware,simConfig,sizeGJ);


    	Simulate_SW(V,VFixed_Software,VProcessed_Software,sizeGJ,simConfig.BLOCK_NUMBERS,simConfig);


        printf("_______________________________________ \n");
    	printf("V_read Test\n");
        printf("_______________________________________ \n");
        printf("Testing VFixed_______________________________________ \n");
    	Check_Results_Fixed<Stream>(VFixed_Software,VFixed_Hardware);
        printf("Testing VProcessed_______________________________________ \n");
    	Check_Results_Processed<VC_Stream>(VProcessed_Software,VProcessed_Hardware);


	}
    return 0;
}
