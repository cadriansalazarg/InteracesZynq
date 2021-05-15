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
void writeVoltages(T &V,in64Bits &input);

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

	in64Bits input("input");
	Stream output_Hardware("output_Hardware");
	hls::stream<float> output_Software("output_Software");

	const auto Test1Values = std::vector<int>{24,48,72,96};

	for (auto it = Test1Values.begin(); it<Test1Values.end(); ++it) {
		auto &size = *it;
		std::cout<<"Testing IP with cell population of "<< size <<"_______________________________________ \n";

		auto V = std::vector<float>(size);

		fillWithRandomData(V);
		SimulateSW(V,output_Software);
		resizeToFitInIP(V);
		const auto sizeGJ = V.size();
		writeVoltages(V,input);
		GapJunctionIP(input,output_Hardware,sizeGJ,0,sizeGJ);
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
	const auto size = V.size();
	auto k = 0;
	for (int i = 0; i < size; i++) {
		auto f_acc = 0.0f;
		auto v_acc = 0.0f;
		for (int j = 0; j < size; j++) {
			auto v = V.data()[i] - V.data()[j];
			auto f = v * expf(v * v * hundred);
			f_acc += f * 1;
			v_acc += v * 1;
			k++;
		}
		auto I_c = (0.8f * f_acc + 0.2f * v_acc);
		output_Software.write(I_c);
	}
}

template<typename T>
void fillWithRandomData(T &V) {
	auto generator = std::default_random_engine{};
	auto distV = std::uniform_real_distribution<float>{2.0f, -70.0f};
	for (auto &v : V) v = distV(generator);
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
void writeVoltages(T &V,in64Bits &input){
	const auto bs = BLOCK_SIZE;
	const auto vsize = V.size();
	const auto ps = PORT_SIZE; //port size
	assert(vsize%4==0);
	for (auto i = 0; i < vsize; i+=ps){
		Package64Bits voltage;
		for (auto pack = 0; pack < ps; pack++)
			voltage.data[pack] = V[i+pack];
		input.write(voltage);
	}
}




