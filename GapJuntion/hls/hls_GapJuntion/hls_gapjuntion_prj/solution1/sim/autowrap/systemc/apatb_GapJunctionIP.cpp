// ==============================================================
// File generated on Sat May 15 00:03:37 CST 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#define AP_INT_MAX_W 32678

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->
    template< typename T ,int dataQuantity > struct dataPackage;
    template<> struct dataPackage<float, 2> {
        float data[2];
       } ;

          template< typename T > struct dataPackage32;
          template<> struct dataPackage32<float> {
              float data;
              ap_int<1> tlast;
             } ;



// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "input_V_data"
#define AUTOTB_TVIN_input_V_data  "../tv/cdatafile/c.GapJunctionIP.autotvin_input_V_data.dat"
#define WRAPC_STREAM_SIZE_IN_input_V_data  "../tv/stream_size/stream_size_in_input_V_data.dat"
#define WRAPC_STREAM_INGRESS_STATUS_input_V_data  "../tv/stream_size/stream_ingress_status_input_V_data.dat"
// wrapc file define: "output_V_data"
#define AUTOTB_TVOUT_output_V_data  "../tv/cdatafile/c.GapJunctionIP.autotvout_output_V_data.dat"
#define AUTOTB_TVIN_output_V_data  "../tv/cdatafile/c.GapJunctionIP.autotvin_output_V_data.dat"
#define WRAPC_STREAM_SIZE_OUT_output_V_data  "../tv/stream_size/stream_size_out_output_V_data.dat"
#define WRAPC_STREAM_EGRESS_STATUS_output_V_data  "../tv/stream_size/stream_egress_status_output_V_data.dat"
// wrapc file define: "output_V_tlast_V"
#define AUTOTB_TVOUT_output_V_tlast_V  "../tv/cdatafile/c.GapJunctionIP.autotvout_output_V_tlast_V.dat"
#define AUTOTB_TVIN_output_V_tlast_V  "../tv/cdatafile/c.GapJunctionIP.autotvin_output_V_tlast_V.dat"
#define WRAPC_STREAM_SIZE_OUT_output_V_tlast_V  "../tv/stream_size/stream_size_out_output_V_tlast_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_output_V_tlast_V  "../tv/stream_size/stream_egress_status_output_V_tlast_V.dat"
// wrapc file define: "size"
#define AUTOTB_TVIN_size  "../tv/cdatafile/c.GapJunctionIP.autotvin_size.dat"
// wrapc file define: "FirstRow"
#define AUTOTB_TVIN_FirstRow  "../tv/cdatafile/c.GapJunctionIP.autotvin_FirstRow.dat"
// wrapc file define: "LastRow"
#define AUTOTB_TVIN_LastRow  "../tv/cdatafile/c.GapJunctionIP.autotvin_LastRow.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "output_V_data"
#define AUTOTB_TVOUT_PC_output_V_data  "../tv/rtldatafile/rtl.GapJunctionIP.autotvout_output_V_data.dat"
// tvout file define: "output_V_tlast_V"
#define AUTOTB_TVOUT_PC_output_V_tlast_V  "../tv/rtldatafile/rtl.GapJunctionIP.autotvout_output_V_tlast_V.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			input_V_data_depth = 0;
			output_V_data_depth = 0;
			output_V_tlast_V_depth = 0;
			size_depth = 0;
			FirstRow_depth = 0;
			LastRow_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{input_V_data " << input_V_data_depth << "}\n";
			total_list << "{output_V_data " << output_V_data_depth << "}\n";
			total_list << "{output_V_tlast_V " << output_V_tlast_V_depth << "}\n";
			total_list << "{size " << size_depth << "}\n";
			total_list << "{FirstRow " << FirstRow_depth << "}\n";
			total_list << "{LastRow " << LastRow_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int input_V_data_depth;
		int output_V_data_depth;
		int output_V_tlast_V_depth;
		int size_depth;
		int FirstRow_depth;
		int LastRow_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void GapJunctionIP (
hls::stream<dataPackage<float, 2 > > (&input),
hls::stream<dataPackage32<float > > (&output),
int size,
int FirstRow,
int LastRow);

void AESL_WRAP_GapJunctionIP (
hls::stream<dataPackage<float, 2 > > (&input),
hls::stream<dataPackage32<float > > (&output),
int size,
int FirstRow,
int LastRow)
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;

		// pop stream input: "input"
		aesl_fh.read(WRAPC_STREAM_SIZE_IN_input_V_data, AESL_token); // [[transaction]]
		aesl_fh.read(WRAPC_STREAM_SIZE_IN_input_V_data, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(WRAPC_STREAM_SIZE_IN_input_V_data, AESL_token); // pop_size
			int aesl_tmp_7 = atoi(AESL_token.c_str());
			for (int i = 0; i < aesl_tmp_7; i++)
			{
				input.read();
			}
			aesl_fh.read(WRAPC_STREAM_SIZE_IN_input_V_data, AESL_token); // [[/transaction]]
		}

		// define output stream variables: "output"
		std::vector<dataPackage32<float > > aesl_tmp_9;
		int aesl_tmp_10;
		int aesl_tmp_11 = 0;

		// read output stream size: "output"
		aesl_fh.read(WRAPC_STREAM_SIZE_OUT_output_V_data, AESL_token); // [[transaction]]
		aesl_fh.read(WRAPC_STREAM_SIZE_OUT_output_V_data, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(WRAPC_STREAM_SIZE_OUT_output_V_data, AESL_token); // pop_size
			aesl_tmp_10 = atoi(AESL_token.c_str());
			aesl_fh.read(WRAPC_STREAM_SIZE_OUT_output_V_data, AESL_token); // [[/transaction]]
		}

		// output port post check: "output_V_data"
		aesl_fh.read(AUTOTB_TVOUT_PC_output_V_data, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_output_V_data, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_output_V_data, AESL_token); // data

			std::vector<sc_bv<32> > output_V_data_pc_buffer;
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'output_V_data', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'output_V_data', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					output_V_data_pc_buffer.push_back(AESL_token.c_str());
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_output_V_data, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_output_V_data))
				{
					exit(1);
				}
			}

			// correct the buffer size the current transaction
			if (i != aesl_tmp_10)
			{
				aesl_tmp_10 = i;
			}

			if (aesl_tmp_10 > 0 && aesl_tmp_9.size() < aesl_tmp_10)
			{
				int aesl_tmp_9_size = aesl_tmp_9.size();

				for (int tmp_aesl_tmp_9 = 0; tmp_aesl_tmp_9 < aesl_tmp_10 - aesl_tmp_9_size; tmp_aesl_tmp_9++)
				{
					dataPackage32<float > tmp;
					aesl_tmp_9.push_back(tmp);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: output_V_data
				{
					// bitslice(31, 0)
					// {
						// celement: output.V.data(31, 0)
						// {
							sc_lv<32>* output_V_data_lv0_0_0_1_lv1_0_0_1 = new sc_lv<32>[aesl_tmp_10 - aesl_tmp_11];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: output.V.data(31, 0)
						{
							// carray: (aesl_tmp_11) => (aesl_tmp_10 - 1) @ (1)
							for (int i_0 = aesl_tmp_11; i_0 <= aesl_tmp_10 - 1; i_0 += 1)
							{
								// carray: (0) => (0) @ (1)
								for (int i_1 = 0; i_1 <= 0; i_1 += 1)
								{
									if (&(aesl_tmp_9[0].data) != NULL) // check the null address if the c port is array or others
									{
										output_V_data_lv0_0_0_1_lv1_0_0_1[hls_map_index].range(31, 0) = sc_bv<32>(output_V_data_pc_buffer[hls_map_index].range(31, 0));
										hls_map_index++;
									}
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: output.V.data(31, 0)
						{
							// carray: (aesl_tmp_11) => (aesl_tmp_10 - 1) @ (1)
							for (int i_0 = aesl_tmp_11; i_0 <= aesl_tmp_10 - 1; i_0 += 1)
							{
								// carray: (0) => (0) @ (1)
								for (int i_1 = 0; i_1 <= 0; i_1 += 1)
								{
									// sub                    : i_0 i_1
									// ori_name               : aesl_tmp_9[i_0].data
									// sub_1st_elem           : 0 0
									// ori_name_1st_elem      : aesl_tmp_9[0].data
									// output_left_conversion : *(int*)&aesl_tmp_9[i_0].data
									// output_type_conversion : (output_V_data_lv0_0_0_1_lv1_0_0_1[hls_map_index]).to_uint64()
									if (&(aesl_tmp_9[0].data) != NULL) // check the null address if the c port is array or others
									{
										*(int*)&aesl_tmp_9[i_0].data = (output_V_data_lv0_0_0_1_lv1_0_0_1[hls_map_index]).to_uint64();
										hls_map_index++;
									}
								}
							}
						}
					}
				}
			}
		}

		// output port post check: "output_V_tlast_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_output_V_tlast_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_output_V_tlast_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_output_V_tlast_V, AESL_token); // data

			std::vector<sc_bv<1> > output_V_tlast_V_pc_buffer;
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'output_V_tlast_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'output_V_tlast_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					output_V_tlast_V_pc_buffer.push_back(AESL_token.c_str());
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_output_V_tlast_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_output_V_tlast_V))
				{
					exit(1);
				}
			}

			// correct the buffer size the current transaction
			if (i != aesl_tmp_10)
			{
				aesl_tmp_10 = i;
			}

			if (aesl_tmp_10 > 0 && aesl_tmp_9.size() < aesl_tmp_10)
			{
				int aesl_tmp_9_size = aesl_tmp_9.size();

				for (int tmp_aesl_tmp_9 = 0; tmp_aesl_tmp_9 < aesl_tmp_10 - aesl_tmp_9_size; tmp_aesl_tmp_9++)
				{
					dataPackage32<float > tmp;
					aesl_tmp_9.push_back(tmp);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: output_V_tlast_V
				{
					// bitslice(0, 0)
					// {
						// celement: output.V.tlast.V(0, 0)
						// {
							sc_lv<1>* output_V_tlast_V_lv0_0_0_1_lv1_0_0_1 = new sc_lv<1>[aesl_tmp_10 - aesl_tmp_11];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: output.V.tlast.V(0, 0)
						{
							// carray: (aesl_tmp_11) => (aesl_tmp_10 - 1) @ (1)
							for (int i_0 = aesl_tmp_11; i_0 <= aesl_tmp_10 - 1; i_0 += 1)
							{
								// carray: (0) => (0) @ (1)
								for (int i_1 = 0; i_1 <= 0; i_1 += 1)
								{
									if (&(aesl_tmp_9[0].tlast) != NULL) // check the null address if the c port is array or others
									{
										output_V_tlast_V_lv0_0_0_1_lv1_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(output_V_tlast_V_pc_buffer[hls_map_index].range(0, 0));
										hls_map_index++;
									}
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: output.V.tlast.V(0, 0)
						{
							// carray: (aesl_tmp_11) => (aesl_tmp_10 - 1) @ (1)
							for (int i_0 = aesl_tmp_11; i_0 <= aesl_tmp_10 - 1; i_0 += 1)
							{
								// carray: (0) => (0) @ (1)
								for (int i_1 = 0; i_1 <= 0; i_1 += 1)
								{
									// sub                    : i_0 i_1
									// ori_name               : aesl_tmp_9[i_0].tlast
									// sub_1st_elem           : 0 0
									// ori_name_1st_elem      : aesl_tmp_9[0].tlast
									// output_left_conversion : aesl_tmp_9[i_0].tlast
									// output_type_conversion : (output_V_tlast_V_lv0_0_0_1_lv1_0_0_1[hls_map_index]).to_string(SC_BIN).c_str()
									if (&(aesl_tmp_9[0].tlast) != NULL) // check the null address if the c port is array or others
									{
										aesl_tmp_9[i_0].tlast = (output_V_tlast_V_lv0_0_0_1_lv1_0_0_1[hls_map_index]).to_string(SC_BIN).c_str();
										hls_map_index++;
									}
								}
							}
						}
					}
				}
			}
		}

		// push back output stream: "output"
		for (int i = 0; i < aesl_tmp_10; i++)
		{
			output.write(aesl_tmp_9[i]);
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "input_V_data"
		char* tvin_input_V_data = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_input_V_data);
		char* wrapc_stream_size_in_input_V_data = new char[50];
		aesl_fh.touch(WRAPC_STREAM_SIZE_IN_input_V_data);
		char* wrapc_stream_ingress_status_input_V_data = new char[50];
		aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_input_V_data);

		// "output_V_data"
		char* tvin_output_V_data = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_output_V_data);
		char* tvout_output_V_data = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_output_V_data);
		char* wrapc_stream_size_out_output_V_data = new char[50];
		aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_output_V_data);
		char* wrapc_stream_egress_status_output_V_data = new char[50];
		aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_output_V_data);

		// "output_V_tlast_V"
		char* tvin_output_V_tlast_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_output_V_tlast_V);
		char* tvout_output_V_tlast_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_output_V_tlast_V);
		char* wrapc_stream_size_out_output_V_tlast_V = new char[50];
		aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_output_V_tlast_V);
		char* wrapc_stream_egress_status_output_V_tlast_V = new char[50];
		aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_output_V_tlast_V);

		// "size"
		char* tvin_size = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_size);

		// "FirstRow"
		char* tvin_FirstRow = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_FirstRow);

		// "LastRow"
		char* tvin_LastRow = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_LastRow);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// dump stream tvin: "input"
		std::vector<dataPackage<float, 2 > > aesl_tmp_6;
		int aesl_tmp_7 = 0;
		while (!input.empty())
		{
			aesl_tmp_6.push_back(input.read());
			aesl_tmp_7++;
		}

		// dump stream tvin: "output"
		std::vector<dataPackage32<float > > aesl_tmp_9;
		int aesl_tmp_10 = 0;
		while (!output.empty())
		{
			aesl_tmp_9.push_back(output.read());
			aesl_tmp_10++;
		}

		// [[transaction]]
		sprintf(tvin_size, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_size, tvin_size);

		sc_bv<32> size_tvin_wrapc_buffer;

		// RTL Name: size
		{
			// bitslice(31, 0)
			{
				// celement: size(31, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : size
						// sub_1st_elem          : 
						// ori_name_1st_elem     : size
						// regulate_c_name       : size
						// input_type_conversion : size
						if (&(size) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> size_tmp_mem;
							size_tmp_mem = size;
							size_tvin_wrapc_buffer.range(31, 0) = size_tmp_mem.range(31, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_size, "%s\n", (size_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_size, tvin_size);
		}

		tcl_file.set_num(1, &tcl_file.size_depth);
		sprintf(tvin_size, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_size, tvin_size);

		// [[transaction]]
		sprintf(tvin_FirstRow, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_FirstRow, tvin_FirstRow);

		sc_bv<32> FirstRow_tvin_wrapc_buffer;

		// RTL Name: FirstRow
		{
			// bitslice(31, 0)
			{
				// celement: FirstRow(31, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : FirstRow
						// sub_1st_elem          : 
						// ori_name_1st_elem     : FirstRow
						// regulate_c_name       : FirstRow
						// input_type_conversion : FirstRow
						if (&(FirstRow) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> FirstRow_tmp_mem;
							FirstRow_tmp_mem = FirstRow;
							FirstRow_tvin_wrapc_buffer.range(31, 0) = FirstRow_tmp_mem.range(31, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_FirstRow, "%s\n", (FirstRow_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_FirstRow, tvin_FirstRow);
		}

		tcl_file.set_num(1, &tcl_file.FirstRow_depth);
		sprintf(tvin_FirstRow, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_FirstRow, tvin_FirstRow);

		// [[transaction]]
		sprintf(tvin_LastRow, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_LastRow, tvin_LastRow);

		sc_bv<32> LastRow_tvin_wrapc_buffer;

		// RTL Name: LastRow
		{
			// bitslice(31, 0)
			{
				// celement: LastRow(31, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : LastRow
						// sub_1st_elem          : 
						// ori_name_1st_elem     : LastRow
						// regulate_c_name       : LastRow
						// input_type_conversion : LastRow
						if (&(LastRow) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> LastRow_tmp_mem;
							LastRow_tmp_mem = LastRow;
							LastRow_tvin_wrapc_buffer.range(31, 0) = LastRow_tmp_mem.range(31, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_LastRow, "%s\n", (LastRow_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_LastRow, tvin_LastRow);
		}

		tcl_file.set_num(1, &tcl_file.LastRow_depth);
		sprintf(tvin_LastRow, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_LastRow, tvin_LastRow);

		// push back input stream: "input"
		for (int i = 0; i < aesl_tmp_7; i++)
		{
			input.write(aesl_tmp_6[i]);
		}

		// push back input stream: "output"
		for (int i = 0; i < aesl_tmp_10; i++)
		{
			output.write(aesl_tmp_9[i]);
		}

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		GapJunctionIP(input, output, size, FirstRow, LastRow);

		CodeState = DUMP_OUTPUTS;
		// record input size to tv3: "input"
		int aesl_tmp_8 = input.size();

		// pop output stream: "output"
		int aesl_tmp_11 = aesl_tmp_10;
		aesl_tmp_10 = 0;
     aesl_tmp_9.clear();
		while (!output.empty())
		{
			aesl_tmp_9.push_back(output.read());
			aesl_tmp_10++;
		}

		// [[transaction]]
		sprintf(tvin_input_V_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_input_V_data, tvin_input_V_data);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_input_V_data, tvin_input_V_data);

		sc_bv<64>* input_V_data_tvin_wrapc_buffer = new sc_bv<64>[aesl_tmp_7 - aesl_tmp_8];

		// RTL Name: input_V_data
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: input.V.data(31, 0)
				{
					// carray: (0) => (aesl_tmp_7 - aesl_tmp_8 - 1) @ (1)
					for (int i_0 = 0; i_0 <= aesl_tmp_7 - aesl_tmp_8 - 1; i_0 += 1)
					{
						// carray: (0) => (0) @ (2)
						for (int i_1 = 0; i_1 <= 0; i_1 += 2)
						{
							// sub                   : i_0 i_1
							// ori_name              : aesl_tmp_6[i_0].data[i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : aesl_tmp_6[0].data[0]
							// regulate_c_name       : input_V_data
							// input_type_conversion : *(int*)&aesl_tmp_6[i_0].data[i_1]
							if (&(aesl_tmp_6[0].data[0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<32> input_V_data_tmp_mem;
								input_V_data_tmp_mem = *(int*)&aesl_tmp_6[i_0].data[i_1];
								input_V_data_tvin_wrapc_buffer[hls_map_index].range(31, 0) = input_V_data_tmp_mem.range(31, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
			// bitslice(63, 32)
			{
				int hls_map_index = 0;
				// celement: input.V.data(31, 0)
				{
					// carray: (0) => (aesl_tmp_7 - aesl_tmp_8 - 1) @ (1)
					for (int i_0 = 0; i_0 <= aesl_tmp_7 - aesl_tmp_8 - 1; i_0 += 1)
					{
						// carray: (1) => (1) @ (2)
						for (int i_1 = 1; i_1 <= 1; i_1 += 2)
						{
							// sub                   : i_0 i_1
							// ori_name              : aesl_tmp_6[i_0].data[i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : aesl_tmp_6[0].data[0]
							// regulate_c_name       : input_V_data
							// input_type_conversion : *(int*)&aesl_tmp_6[i_0].data[i_1]
							if (&(aesl_tmp_6[0].data[0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<32> input_V_data_tmp_mem;
								input_V_data_tmp_mem = *(int*)&aesl_tmp_6[i_0].data[i_1];
								input_V_data_tvin_wrapc_buffer[hls_map_index].range(63, 32) = input_V_data_tmp_mem.range(31, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < aesl_tmp_7 - aesl_tmp_8; i++)
		{
			sprintf(tvin_input_V_data, "%s\n", (input_V_data_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_input_V_data, tvin_input_V_data);
		}

		// dump stream ingress status to file
     if (aesl_tmp_7 > aesl_tmp_8)
     {
		sc_int<32> stream_ingress_size_input_V_data = aesl_tmp_7;
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_input_V_data, stream_ingress_size_input_V_data.to_string().c_str());
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_input_V_data, "\n");

		for (int i = 0; i < aesl_tmp_7 - aesl_tmp_8; i++)
		{
			stream_ingress_size_input_V_data--;
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_input_V_data, stream_ingress_size_input_V_data.to_string().c_str());
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_input_V_data, "\n");
		}
     }
     else {
		    sc_int<32> stream_ingress_size_input_V_data = 0;
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_input_V_data, stream_ingress_size_input_V_data.to_string().c_str());
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_input_V_data, "\n");
     }

		tcl_file.set_num(aesl_tmp_7 - aesl_tmp_8, &tcl_file.input_V_data_depth);
		sprintf(tvin_input_V_data, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_input_V_data, tvin_input_V_data);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_input_V_data, tvin_input_V_data);

		// release memory allocation
		delete [] input_V_data_tvin_wrapc_buffer;

		// dump stream size
		sprintf(wrapc_stream_size_in_input_V_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_input_V_data, wrapc_stream_size_in_input_V_data);
		sprintf(wrapc_stream_size_in_input_V_data, "%d\n", aesl_tmp_7 - aesl_tmp_8);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_input_V_data, wrapc_stream_size_in_input_V_data);
		sprintf(wrapc_stream_size_in_input_V_data, "[[/transaction]] \n");
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_input_V_data, wrapc_stream_size_in_input_V_data);

		// [[transaction]]
		sprintf(tvout_output_V_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_output_V_data, tvout_output_V_data);

		sc_bv<32>* output_V_data_tvout_wrapc_buffer = new sc_bv<32>[aesl_tmp_10 - aesl_tmp_11];

		// RTL Name: output_V_data
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: output.V.data(31, 0)
				{
					// carray: (aesl_tmp_11) => (aesl_tmp_10 - 1) @ (1)
					for (int i_0 = aesl_tmp_11; i_0 <= aesl_tmp_10 - 1; i_0 += 1)
					{
						// carray: (0) => (0) @ (1)
						for (int i_1 = 0; i_1 <= 0; i_1 += 1)
						{
							// sub                   : i_0 i_1
							// ori_name              : aesl_tmp_9[i_0].data
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : aesl_tmp_9[0].data
							// regulate_c_name       : output_V_data
							// input_type_conversion : *(int*)&aesl_tmp_9[i_0].data
							if (&(aesl_tmp_9[0].data) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<32> output_V_data_tmp_mem;
								output_V_data_tmp_mem = *(int*)&aesl_tmp_9[i_0].data;
								output_V_data_tvout_wrapc_buffer[hls_map_index].range(31, 0) = output_V_data_tmp_mem.range(31, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < aesl_tmp_10 - aesl_tmp_11; i++)
		{
			sprintf(tvout_output_V_data, "%s\n", (output_V_data_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_output_V_data, tvout_output_V_data);
		}

		tcl_file.set_num(aesl_tmp_10 - aesl_tmp_11, &tcl_file.output_V_data_depth);
		sprintf(tvout_output_V_data, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_output_V_data, tvout_output_V_data);

		// release memory allocation
		delete [] output_V_data_tvout_wrapc_buffer;

		// dump stream size
		sprintf(wrapc_stream_size_out_output_V_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(WRAPC_STREAM_SIZE_OUT_output_V_data, wrapc_stream_size_out_output_V_data);
		sprintf(wrapc_stream_size_out_output_V_data, "%d\n", aesl_tmp_10 - aesl_tmp_11);
		aesl_fh.write(WRAPC_STREAM_SIZE_OUT_output_V_data, wrapc_stream_size_out_output_V_data);
		sprintf(wrapc_stream_size_out_output_V_data, "[[/transaction]] \n");
		aesl_fh.write(WRAPC_STREAM_SIZE_OUT_output_V_data, wrapc_stream_size_out_output_V_data);

		// [[transaction]]
		sprintf(tvout_output_V_tlast_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_output_V_tlast_V, tvout_output_V_tlast_V);

		sc_bv<1>* output_V_tlast_V_tvout_wrapc_buffer = new sc_bv<1>[aesl_tmp_10 - aesl_tmp_11];

		// RTL Name: output_V_tlast_V
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: output.V.tlast.V(0, 0)
				{
					// carray: (aesl_tmp_11) => (aesl_tmp_10 - 1) @ (1)
					for (int i_0 = aesl_tmp_11; i_0 <= aesl_tmp_10 - 1; i_0 += 1)
					{
						// carray: (0) => (0) @ (1)
						for (int i_1 = 0; i_1 <= 0; i_1 += 1)
						{
							// sub                   : i_0 i_1
							// ori_name              : aesl_tmp_9[i_0].tlast
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : aesl_tmp_9[0].tlast
							// regulate_c_name       : output_V_tlast_V
							// input_type_conversion : (aesl_tmp_9[i_0].tlast).to_string(2).c_str()
							if (&(aesl_tmp_9[0].tlast) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<1> output_V_tlast_V_tmp_mem;
								output_V_tlast_V_tmp_mem = (aesl_tmp_9[i_0].tlast).to_string(2).c_str();
								output_V_tlast_V_tvout_wrapc_buffer[hls_map_index].range(0, 0) = output_V_tlast_V_tmp_mem.range(0, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < aesl_tmp_10 - aesl_tmp_11; i++)
		{
			sprintf(tvout_output_V_tlast_V, "%s\n", (output_V_tlast_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_output_V_tlast_V, tvout_output_V_tlast_V);
		}

		tcl_file.set_num(aesl_tmp_10 - aesl_tmp_11, &tcl_file.output_V_tlast_V_depth);
		sprintf(tvout_output_V_tlast_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_output_V_tlast_V, tvout_output_V_tlast_V);

		// release memory allocation
		delete [] output_V_tlast_V_tvout_wrapc_buffer;

		// dump stream size
		sprintf(wrapc_stream_size_out_output_V_tlast_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(WRAPC_STREAM_SIZE_OUT_output_V_tlast_V, wrapc_stream_size_out_output_V_tlast_V);
		sprintf(wrapc_stream_size_out_output_V_tlast_V, "%d\n", aesl_tmp_10 - aesl_tmp_11);
		aesl_fh.write(WRAPC_STREAM_SIZE_OUT_output_V_tlast_V, wrapc_stream_size_out_output_V_tlast_V);
		sprintf(wrapc_stream_size_out_output_V_tlast_V, "[[/transaction]] \n");
		aesl_fh.write(WRAPC_STREAM_SIZE_OUT_output_V_tlast_V, wrapc_stream_size_out_output_V_tlast_V);

		// push back output stream: "output"
		for (int i = 0; i < aesl_tmp_10; i++)
		{
			output.write(aesl_tmp_9[i]);
		}

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "input_V_data"
		delete [] tvin_input_V_data;
		delete [] wrapc_stream_size_in_input_V_data;
		// release memory allocation: "output_V_data"
		delete [] tvout_output_V_data;
		delete [] tvin_output_V_data;
		delete [] wrapc_stream_size_out_output_V_data;
		// release memory allocation: "output_V_tlast_V"
		delete [] tvout_output_V_tlast_V;
		delete [] tvin_output_V_tlast_V;
		delete [] wrapc_stream_size_out_output_V_tlast_V;
		// release memory allocation: "size"
		delete [] tvin_size;
		// release memory allocation: "FirstRow"
		delete [] tvin_FirstRow;
		// release memory allocation: "LastRow"
		delete [] tvin_LastRow;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

