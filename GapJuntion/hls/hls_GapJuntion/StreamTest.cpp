#include "Stream.h"
#include <math.h>
#include <iostream>
#include <vector>
#include <random>
#include <cassert>

template<typename T, typename S>
void SimulateSW(const T &V, S &output_Software);

template<typename T>
void fillWithRandomData(T &V);

template<typename T>
void resizeToFitInIP(T &V);

template<typename S, typename SHW = Stream>
int checkResults(S &output_Software,SHW &output_Hardware);


template<typename T>
void writeVoltages(T &V, hls::stream<packaging_data> &input_fifo);

template<typename T>
void writeConductances(T &C, in64Bits &input, const int vsizeAd);

void readLeftovers(Stream &output_Hardware) {
	while (!output_Hardware.empty()){
		float hw_result = output_Hardware.read().data;
		assert(hw_result<0.0001f && hw_result>-0.0001f);
	}
}


int main() {

	//Test 1--------------------------------------------------
	std::cout
	<<"#############################################################\n"
	<<"Running Test 1\n"
	<<"#############################################################\n";

	auto success = 0;

	Stream output_Hardware("output_Hardware");
	hls::stream<float> output_Software("output_Software");

	hls::stream<packaging_data> input_fifo;

	const auto Test1Values = std::vector<int>{216,216,216,216};

	for (auto it = Test1Values.begin(); it<Test1Values.end(); ++it) {
		auto &size = *it;
		std::cout<<"Testing IP with cell population of "<< size <<"_______________________________________ \n";

		auto V = std::vector<float>(size);

		fillWithRandomData(V);
		SimulateSW(V,output_Software);
		resizeToFitInIP(V);
		const auto sizeGJ = V.size();
		writeVoltages(V,input_fifo);
		GapJunctionIP(input_fifo,output_Hardware,sizeGJ,0,sizeGJ);
		success |= checkResults(output_Software,output_Hardware);
		readLeftovers(output_Hardware);
		std::cout << "________________________________________________________ \n";
	}
	return success;
}


template<typename T>
void resizeToFitInIP(T &V){
	const auto bs = BLOCK_SIZE;
	const auto vsize=V.size();
	const auto resVsize=vsize%bs;
	if(resVsize==0){}else{
		int vsizeAd=0;
		if(resVsize==1){
			vsizeAd = vsize+3;
			V.insert(V.end(),{0.0f,0.0f,0.0f});
		}else if(resVsize==2){
			vsizeAd = vsize+2;
			V.insert(V.end(),{0.0f,0.0f});
		}else if(resVsize==3){
			vsizeAd = vsize+1;
			V.insert(V.end(),{0.0f});
		}
	}
}

template<typename T, typename S>
void SimulateSW(const T &V, S &output_Software) {
	const float hundred = -1.0f / 100.0f;
	unsigned int size = V.size();
	auto k = 0;
	for (unsigned int i = 0; i < size; i++) {
		auto f_acc = 0.0f;
		auto v_acc = 0.0f;
		for (unsigned int j = 0; j < size; j++) {
			auto v = V.data()[i] - V.data()[j];
			auto f = v * expf(v * v * hundred);
			f_acc += f * 1;
			v_acc += v * 1;
			k++;
		}
		auto I_c = (0.8f * f_acc + 0.2f * v_acc);
		output_Software.write(I_c);
	}
	//printf ("Fin lista \n");
}

template<typename T>
void fillWithRandomData(T &V) {
	auto generator = std::default_random_engine{};
	auto distV = std::uniform_real_distribution<float>{2.0f, -70.0f};
	for (auto &v : V){
		v = distV(generator);
		//printf ("Value: %f. \n", v);
	}
}

template<typename S, typename SHW = Stream>
int checkResults(S &output_Software,SHW &output_Hardware) {
	const float precision = 0.01;
	int success = 0;
	while (!output_Software.empty()) {
		float sw_result, hw_result;
		sw_result = output_Software.read();
		hw_result = output_Hardware.read().data;
		if (fabs(sw_result - hw_result) >= precision) success = -1;
	}
	std::cout << "******************************************\n";
	if (success == 0) std::cout << "Successful result\n";
	else std::cout<<"Error\n";
	return success;
}

template<typename T>
void writeVoltages(T &V, hls::stream<packaging_data> &input_fifo){
	const auto bs = BLOCK_SIZE;
	const auto vsize = V.size();
	const auto ps = PORT_SIZE; //port size
	unsigned int k = 0;
	assert(vsize%4==0);
	packaging_data input_packet;
	for (auto i = 0; i < 216; i++){
		//printf("El valor de V es %f \n", V[i]);
	}

	
	for (auto i = 0; i < 36; i++){
		input_packet.BS_ID = 0x01; // 8 bits
		input_packet.FPGA_ID = 0xEE; // 8 bits
		input_packet.PCKG_ID = 0x0000; // 16 bits
		input_packet.TX_UID = 0x01; // 8 bits
		input_packet.RX_UID = 0x01; // 8 bits
		input_packet.VALID_PACKET_BYTES = PAYLOAD_PACKET_BYTES; // 16 bits
		input_packet.MESSAGE[5] = V[i*6 + 0];
		input_packet.MESSAGE[4] = V[i*6 + 1];
		input_packet.MESSAGE[3] = V[i*6 + 2];
		input_packet.MESSAGE[4] = V[i*6 + 3];
		input_packet.MESSAGE[1] = V[i*6 + 4];
		input_packet.MESSAGE[0] = V[i*6 + 5];
		
		for (auto j = 0; j < 6; j++){
			input_packet.MESSAGE[5 - j] = V[k];
			//printf("El valor puesto en el paquete es %f. \n", input_packet.MESSAGE[5 - j]);
			k++;
		}
		input_fifo.write(input_packet);
	}

}




