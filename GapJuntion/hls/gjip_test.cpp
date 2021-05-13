#include "gjip.hpp"
#include <iostream>

const int size_cell_population = 216;

void setConfigSim(Config &config, int population){
	config.population = population;
	config.start_limit = 0;
	config.end_limit = population;
	config.fpga_id = 1;
	config.uid = 1;
	config.bus_id = 1;
}


void fillVdend(AXIS_interface_in &input,int population){
	for(int i=0; i<population; i+=6){
		packaging_data p;
		float value = -50.0f;
		p.MESSAGE[0]= *reinterpret_cast<int *>(&value);
		p.MESSAGE[1]= *reinterpret_cast<int *>(&value);
		p.MESSAGE[2]= *reinterpret_cast<int *>(&value);
		p.MESSAGE[3]= *reinterpret_cast<int *>(&value);
		p.MESSAGE[4]= *reinterpret_cast<int *>(&value);
		p.MESSAGE[5]= *reinterpret_cast<int *>(&value);
		p.BS_ID = 1;
		p.FPGA_ID = 1;
		p.RX_UID = 1;
		p.TX_UID = 2;
		p.PCKG_ID = i;
		p.VALID_PACKET_BYTES = PAYLOAD_PACKET_BYTES;
		input.write(p);
	}
}

//template<typename T, typename S>
//void SimulateSW(const T &C,const T &V, S &output_Software) {
//        const float hundred = -1.0f / 100.0f;
//        const auto size = V.size();
//        auto k = 0;
//        for (int i = 0; i < size; i++) {
//                auto f_acc = 0.0f;
//                auto v_acc = 0.0f;
//                for (int j = 0; j < size; j++) {
//                        auto v = V.data()[i] - V.data()[j];
//                        auto f = v * expf(v * v * hundred);
//                        f_acc += f * C.data()[k];
//                        v_acc += v * C.data()[k];
//                        k++;
//                }
//                auto I_c = (0.8f * f_acc + 0.2f * v_acc);
//                output_Software.write(I_c);
//        }
//}

void readIcurr(AXIS_interface_out &output, int population){
	int count=0;
	int id = 0;
	while(!output.empty()){
		auto p = output.read();
		auto &message = p.MESSAGE;
		float data[6];
		data[0] = *reinterpret_cast<int*>(&message[0]);
		data[1] = *reinterpret_cast<int*>(&message[1]);
		data[2] = *reinterpret_cast<int*>(&message[2]);
		data[3] = *reinterpret_cast<int*>(&message[3]);
		data[4] = *reinterpret_cast<int*>(&message[4]);
		data[5] = *reinterpret_cast<int*>(&message[5]);
		std::cout<<
				"Out: "<<data[id]<<"\n"<<
				"Out: "<<data[id+1]<<"\n"<<
				"Out: "<<data[id+2]<<"\n"<<
				"Out: "<<data[id+3]<<"\n"<<
				"Out: "<<data[id+4]<<"\n"<<
				"Out: "<<data[id+5]<<"\n";
		count += 6;
	}
	std::cout<< "received data: "<< count << "\n";
}

int main(int argc, char** argv){

	std::cout<< "Simulation initialization\n";

	static AXIS_interface_in input;
	static AXIS_interface_out output;
	static Config config;

	setConfigSim(config,size_cell_population);
	fillVdend(input, size_cell_population);

	GapJunctionIP(input, output, config);

	readIcurr(output, size_cell_population);

	return 0;
}
