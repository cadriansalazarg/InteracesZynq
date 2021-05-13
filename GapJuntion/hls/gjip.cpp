#include "gjip.hpp"

#define PRAGMA_SUB(x) _Pragma (#x)
#define DO_PRAGMA(x) PRAGMA_SUB(x)

void load_vdend(float vdend[MAX_POPULATION], Config& config,
		AXIS_interface_in& input, half_word &tx_uid, half_word &rx_uid)
{
	for (uint i = 0; i < NUM_TOTAL_OF_PACKETS_RX; i ++) {
DO_PRAGMA(HLS LOOP_TRIPCOUNT min=64/2 max=MAX_POPULATION/2)
		auto package_raw = input.read();
		auto package = package_raw.MESSAGE;
		vdend[i*6] = package[0];
		vdend[i*6 + 1] = package[1];
		vdend[i*6 + 2] = package[2];
		vdend[i*6 + 3] = package[3];
		vdend[i*6 + 4] = package[4];
		vdend[i*6 + 5] = package[5];
		tx_uid = package_raw.TX_UID;
		rx_uid = package_raw.RX_UID;
	}
}

void stream_vdend(float vdend[MAX_POPULATION], Config& config,
		hls::stream<vector_datapack >& v_row_fifo,
		hls::stream<vector_datapack >& v_col_fifo)
{
	static vector_datapack v_col;
	static vector_datapack v_row;
	for (uint row = config.start_limit; row < config.end_limit; row += VECTOR_SIZE) {
		DO_PRAGMA(HLS LOOP_TRIPCOUNT min=64/VECTOR_SIZE max=MAX_POPULATION/VECTOR_SIZE)

		const auto row_cp =row;
		const auto row_lim =row_cp + VECTOR_SIZE;
		for (uint i = row_cp; i < row_lim; i++) {
			DO_PRAGMA(HLS LOOP_TRIPCOUNT min=VECTOR_SIZE max=VECTOR_SIZE)
			v_row.data[i] = vdend[i];
		}
		v_row_fifo.write(v_row);
		for (uint col = 0; col < config.population; col += VECTOR_SIZE) {
			DO_PRAGMA(HLS LOOP_TRIPCOUNT min=64/VECTOR_SIZE max=MAX_POPULATION/VECTOR_SIZE)
#pragma HLS PIPELINE II=16
			for (uint i = 0; i < VECTOR_SIZE; i++) {
#pragma HLS UNROLL
				v_col.data[i] = vdend[i+col];

			}
			v_col_fifo.write(v_col);
		}
	}
}

void calc(hls::stream<vector_datapack >& v_row_fifo,
		hls::stream<vector_datapack >& v_col_fifo, Config& config,
		hls::stream<vector_datapack >& block_row_f_fifo,
		hls::stream<vector_datapack >& block_row_v_fifo)
{
	for (uint row = config.start_limit; row < config.end_limit; row += VECTOR_SIZE) {
		DO_PRAGMA(HLS LOOP_TRIPCOUNT min=64/VECTOR_SIZE max=MAX_POPULATION/VECTOR_SIZE)
		auto v_row = v_row_fifo.read();
		for (uint col = 0; col < config.population; col += VECTOR_SIZE) {
#pragma HLS PIPELINE II=2
			DO_PRAGMA(HLS LOOP_TRIPCOUNT min=64/VECTOR_SIZE max=MAX_POPULATION/VECTOR_SIZE)
			auto v_block = v_col_fifo.read();
			for (uint i = 0; i < VECTOR_SIZE; i++) {
				vector_datapack block_row_f;
				vector_datapack block_row_v;
				for (uint j = 0; j < VECTOR_SIZE; j++) {
#pragma HLS UNROLL
					auto vdiff = v_row.data[i] - v_block.data[j];
					auto f = vdiff * exp(vdiff * vdiff * (-0.001f));
					block_row_v.data[j] = vdiff;
					block_row_f.data[j] = f;
				}
				block_row_f_fifo.write(block_row_f);
				block_row_v_fifo.write(block_row_v);
			}
		}
	}
}

void cond_product(
		hls::stream<vector_datapack >& block_row_f_fifo,
		hls::stream<vector_datapack >& block_row_v_fifo, Config& config,
		hls::stream<vector_datapack >& block_row_facc_fifo,
		hls::stream<vector_datapack >& block_row_vacc_fifo)
{
	//Iterate over each row block
	for (uint row = config.start_limit; row < config.end_limit; row += VECTOR_SIZE){
		DO_PRAGMA(HLS LOOP_TRIPCOUNT min=64/VECTOR_SIZE max=MAX_POPULATION/VECTOR_SIZE)
		for (uint col = 0; col < config.population; col += VECTOR_SIZE) {
#pragma HLS PIPELINE II=2
			DO_PRAGMA(HLS LOOP_TRIPCOUNT min=64/VECTOR_SIZE max=MAX_POPULATION/VECTOR_SIZE)
			auto block_row_facc = vector_datapack { };
			auto block_row_vacc = vector_datapack { };
			for (uint i = 0; i < VECTOR_SIZE; i++) {
				auto block_row_f = block_row_f_fifo.read();
				auto block_row_v = block_row_v_fifo.read();
				auto facc = 0.0f;
				auto vacc = 0.0f;
				auto brf= vector_datapack{};
				auto brv = vector_datapack{};
				for (uint j = 0; j < VECTOR_SIZE; j++) {
#pragma HLS UNROLL factor=2
					const auto cond = CONDUCTANCE;
					brf.data[j] = block_row_f.data[j] * cond;
					brv.data[j] = block_row_v.data[j] * cond;
				}
				for (uint j = 0; j < VECTOR_SIZE; j++) {
#pragma HLS PIPELINE
					facc += brf.data[j];
					vacc += brv.data[j];
				}
				block_row_facc.data[i] = facc;
				block_row_facc.data[i] = vacc;
			}
			block_row_facc_fifo.write(block_row_facc);
			block_row_vacc_fifo.write(block_row_vacc);
		}
	}
}

void package_assembly(hls::stream<float> &igp_fifo, AXIS_interface_out &output,Config &config,
		half_word tx_uid, half_word rx_uid) {
	auto package = packaging_data { };
	package.BS_ID = config.bus_id;
	package.TX_UID = rx_uid;
	package.RX_UID = config.uid;
	package.VALID_PACKET_BYTES = PAYLOAD_PACKET_BYTES;
	package.FPGA_ID = config.fpga_id;
	package.PCKG_ID = 0;
	for(uint i=0; i<NUM_TOTAL_OF_PACKETS_TX; i++){
		for(uint counter = 0; counter<6; counter++){
			auto data = igp_fifo.read();
			package.MESSAGE[counter] = data;
		}
		package.PCKG_ID = i;
		output.write(package);
	}
}

void acc(hls::stream<vector_datapack >& block_row_facc_fifo,
		hls::stream<vector_datapack >& block_row_vacc_fifo,
		Config& config,hls::stream<float> &igp_fifo)
{

	for (uint row = config.start_limit; row < config.end_limit; row += VECTOR_SIZE) {
#pragma HLS PIPELINE II=4
		DO_PRAGMA(HLS LOOP_TRIPCOUNT min=64/VECTOR_SIZE max=MAX_POPULATION/VECTOR_SIZE)
		auto block_row_facc = vector_datapack { };
		auto block_row_vacc = vector_datapack { };
		for (uint i = 0; i < VECTOR_SIZE; i++) {
			block_row_facc.data[i] = 0.0f;
			block_row_vacc.data[i] = 0.0f;
		}
		for (uint col = 0; col < config.population; col += VECTOR_SIZE) {
			DO_PRAGMA(HLS LOOP_TRIPCOUNT min=64/VECTOR_SIZE max=MAX_POPULATION/VECTOR_SIZE)
#pragma HLS PIPELINE II=4
			auto block_row_facc_partial = block_row_facc_fifo.read();
			auto block_row_vacc_partial = block_row_vacc_fifo.read();
			for (uint i = 0; i < VECTOR_SIZE; i++) {
#pragma HLS UNROLL factor=2
				block_row_facc.data[i] += block_row_facc_partial.data[i];
				block_row_vacc.data[i] += block_row_vacc_partial.data[i];
			}
		}
		for(uint i =0; i<VECTOR_SIZE; i++){
			auto igp  = 0.8f * block_row_facc.data[i] + 0.2f * block_row_vacc.data[i];
			igp_fifo.write(igp);
		}
	}
}

void Execute(float vdend[MAX_POPULATION],
		Config& config, AXIS_interface_out& output,
		half_word &tx_uid, half_word &rx_uid) {

#pragma HLS DATAFLOW
	static hls::stream<vector_datapack > v_col_fifo("v_col_fifo");
	static hls::stream<vector_datapack > v_row_fifo("v_row_fifo");
#pragma HLS STREAM variable=v_col_fifo depth=8 dim=1
#pragma HLS STREAM variable=v_row_fifo depth=8 dim=1
	static hls::stream<vector_datapack > block_row_f_fifo("block_row_f_fifo");
	static hls::stream<vector_datapack > block_row_v_fifo("block_row_v_fifo");
#pragma HLS STREAM variable=block_row_f_fifo depth=8 dim=1
#pragma HLS STREAM variable=block_row_v_fifo depth=8 dim=1
	static hls::stream<vector_datapack > block_row_facc_fifo("block_row_facc_fifo");
	static hls::stream<vector_datapack > block_row_vacc_fifo("block_row_vacc_fifo");
#pragma HLS STREAM variable=block_row_facc_fifo depth=8 dim=1
#pragma HLS STREAM variable=block_row_vacc_fifo depth=8 dim=1

	static hls::stream<float> igp_fifo("igp_fifo");
#pragma HLS STREAM variable=igp_fifo depth=8 dim=1


	stream_vdend(vdend, config, v_row_fifo, v_col_fifo);
	calc(v_row_fifo, v_col_fifo, config, block_row_f_fifo, block_row_v_fifo);
	cond_product( block_row_f_fifo, block_row_v_fifo, config,
			block_row_facc_fifo, block_row_vacc_fifo);
	acc(block_row_facc_fifo, block_row_vacc_fifo, config, igp_fifo);
	package_assembly(igp_fifo, output, config, tx_uid, rx_uid);

}

int GapJunctionIP(AXIS_interface_in &input,AXIS_interface_out &output,Config &config){
#pragma HLS DATA_PACK variable=input
#pragma HLS INTERFACE ap_fifo register port=input
#pragma HLS INTERFACE ap_fifo register port=output
#pragma HLS INTERFACE ap_stable register port=config
#pragma HLS INTERFACE ap_ctrl_chain port=return

	static float vdend[MAX_POPULATION];
#pragma HLS RESOURCE variable=vdend core=RAM_2P

	static half_word tx_uid = 0;
	static half_word rx_uid = 0;

	load_vdend(vdend, config, input,tx_uid,rx_uid);
	Execute(vdend, config, output,tx_uid,rx_uid);

	return 0;
}


