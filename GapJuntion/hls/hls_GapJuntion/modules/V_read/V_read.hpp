#include "../../Stream.h"

template< typename T,int voltagesBackupLenght>
struct voltagesControl {
				T voltagesBackup[voltagesBackupLenght];
};
typedef voltagesControl<float,MAX_V_SIZE> V_Control;


template< int maxBits>
struct control {
				ap_int<maxBits> fixedVoltageControl; //Max 16384 voltages
				ap_int<1> voltagesPending;
				ap_int<1> voltagesRead;
				ap_int<maxBits> blockInitialIdx;
				ap_int<1> completing;
				ap_int<maxBits> idxForBackup;
                ap_int<maxBits> columnBlock;
};
typedef control<14> Control;

const unsigned int idxMaxBits = 27;

template <unsigned int size>
struct idxArray{
	ap_uint<idxMaxBits> data[size];
};

const unsigned int wordDataPack = 4;

typedef hls::stream<idxArray<4> > idxStream ;

void V_read(VC_Stream &input,
            VC_Stream &processedData,
            Stream &fixedData,
			Config &simConfig,
			int &V_SIZE
            );
