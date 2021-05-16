#include "Stream.h"
#include <math.h>
#include <iostream>
#include <vector>
#include <random>
#include <cassert>

template<typename T, typename S>
void SimulateSW(const T &V, S &output_Software, int FirstRow, int LastRow);

template<typename T>
void fillWithRandomData(T &V);

template<typename T>
void resizeToFitInIP(T &V);

template<typename S, typename SHW = Stream>
int checkResults(S &output_Software,hls::stream<float> &output_Hardware);


template<typename T>
void writeVoltages(T &V, hls::stream<packaging_data> &input_fifo, unsigned char bus_id, unsigned char fpga_id, unsigned char tx_uid, unsigned char rx_uid);

template<typename T>
void writeConductances(T &C, in64Bits &input, const int vsizeAd);

void readLeftovers(Stream &output_Hardware) {
	while (!output_Hardware.empty()){
		float hw_result = output_Hardware.read().data;
		assert(hw_result<0.0001f && hw_result>-0.0001f);
	}
}

void CheckHeader(unsigned short int packet_number, unsigned char bus_id_hw, unsigned char fpga_id_hw, unsigned char tx_uid_hw, unsigned char rx_uid_hw, unsigned short int pckg_id_hw, unsigned short int valid_packet_bytes);


int main() {

	//Test 1--------------------------------------------------
	std::cout
	<<"#############################################################\n"
	<<"Running Test 1\n"
	<<"#############################################################\n";

	auto success = 0;

	hls::stream<float> output_Software("output_Software");
	hls::stream<float>  output_Hardware;
	packaging_data Data_Received_fifo;
	hls::stream<packaging_data> input_fifo;
	hls::stream<packaging_data> out_fifo;
	
	unsigned char bus_id = 0xA0;
    unsigned char fpga_id = 0xF1;
    unsigned char tx_uid = 0x12;
    unsigned char rx_uid = 0x7C;
    
    int FirstRow = 0;
	int LastRow = N_SIZE/FUNCTIONAL_UNIT_NUMBER;
	
	//int FirstRow = N_SIZE/FUNCTIONAL_UNIT_NUMBER;
	//int LastRow = N_SIZE;

	unsigned int kkk;

	const auto Test1Values = std::vector<int>{N_SIZE,N_SIZE,N_SIZE,N_SIZE};

	for (auto it = Test1Values.begin(); it<Test1Values.end(); ++it) {
		auto &size = *it;
		std::cout<<"Testing IP with cell population of "<< size <<"_______________________________________ \n";

		auto V = std::vector<float>(size);

		fillWithRandomData(V);
		SimulateSW(V,output_Software, FirstRow, LastRow);
		resizeToFitInIP(V);
		const auto sizeGJ = V.size();
		writeVoltages(V,input_fifo, bus_id, fpga_id, tx_uid, rx_uid);
		GapJunctionIP(input_fifo,out_fifo,sizeGJ,FirstRow,LastRow, bus_id, fpga_id, rx_uid);
		// Uncomment for debugging
		//printf("El número de paquetes en TX es: %d \n",NUM_TOTAL_OF_PACKETS_TX);

		for (auto z = 0; z < NUM_TOTAL_OF_PACKETS_TX; z++){
			Data_Received_fifo = out_fifo.read();
			for (auto zz = 0; zz < (Data_Received_fifo.VALID_PACKET_BYTES >> 2); zz++){
				output_Hardware.write(Data_Received_fifo.MESSAGE[OFFSET_READ_PAYLOAD-zz]);
			}
			CheckHeader(z, Data_Received_fifo.BS_ID, Data_Received_fifo.FPGA_ID, Data_Received_fifo.TX_UID, Data_Received_fifo.RX_UID, Data_Received_fifo.PCKG_ID, Data_Received_fifo.VALID_PACKET_BYTES);
		}
		success |= checkResults(output_Software,output_Hardware);
		//readLeftovers(output_Hardware);
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
void SimulateSW(const T &V, S &output_Software, int FirstRow, int LastRow) {
	const float hundred = -1.0f / 100.0f;
	unsigned int size = V.size();
	auto k = 0;
	for (unsigned int i = FirstRow; i < LastRow; i++) {
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
int checkResults(S &output_Software,hls::stream<float> &output_Hardware) {
	const float precision = 0.01;
	int success = 0;
	while (!output_Software.empty()) {
		float sw_result, hw_result;
		sw_result = output_Software.read();
		hw_result = output_Hardware.read();
		if (fabs(sw_result - hw_result) >= precision) success = -1;
	}
	std::cout << "******************************************\n";
	if (success == 0) std::cout << "Successful result\n";
	else std::cout<<"Error\n";
	return success;
}

template<typename T>
void writeVoltages(T &V, hls::stream<packaging_data> &input_fifo, unsigned char bus_id, unsigned char fpga_id, unsigned char tx_uid, unsigned char rx_uid){
	const auto bs = BLOCK_SIZE;
	const auto vsize = V.size();
	const auto ps = PORT_SIZE; //port size
	unsigned int k = 0;
	assert(vsize%4==0);
	packaging_data input_packet;
	

	
	input_packet.BS_ID = bus_id; // 8 bits
	input_packet.FPGA_ID = fpga_id; // 8 bits
	input_packet.PCKG_ID = 0x0000; // 16 bits
	input_packet.TX_UID = tx_uid; // 8 bits // Global identifier of the transmitting node
	input_packet.RX_UID = rx_uid; // 8 bits // Global identifier of the receiving node
	input_packet.VALID_PACKET_BYTES = PAYLOAD_PACKET_BYTES; // 16 bits
	
	
	WriteFIFO: for (unsigned short int i = 0; i < NUM_TOTAL_OF_PACKETS_RX; i++) {
		for (unsigned short int j = 0; j < (PAYLOAD_PACKET_BYTES >> 2); j++){
			if (k < N_SIZE){
				input_packet.MESSAGE[OFFSET_READ_PAYLOAD -j] = V[k];
			}
			else{
				input_packet.MESSAGE[j] = 0;
				input_packet.VALID_PACKET_BYTES = (j << 2);
				break;
			}
			k++;
		}
		input_packet.PCKG_ID = i;			
		//Sending packet
		input_fifo.write(input_packet);
	}

}


void CheckHeader(unsigned short int packet_number, unsigned char bus_id_hw, unsigned char fpga_id_hw, unsigned char tx_uid_hw, unsigned char rx_uid_hw, unsigned short int pckg_id_hw, unsigned short int valid_packet_bytes){
	
	printf(" Verificando Header paquete %d \n", packet_number);
	printf(" Bus id 0x%X\n", bus_id_hw);
	printf(" FPGA id 0x%X\n", fpga_id_hw);
	printf(" PCKG id 0x%X\n", pckg_id_hw);
	printf(" TX UID 0x%X\n", tx_uid_hw);
	printf(" RX UID 0x%X\n", rx_uid_hw);
	printf(" Valid Packet bytes 0x%X\n", valid_packet_bytes);
	

}

