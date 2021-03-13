#ifndef __MATRIXMUL_H__
#define __MATRIXMUL_H__

#include <cmath>
#include <hls_stream.h>
#include <ap_int.h>

using namespace std;

// Compare TB vs HW C-model and/or RTL without prints
#define HW_COSIM

// Print the matrix results
//#define PRINT_RESULTS

#define MAT_A_ROWS 10
#define MAT_A_COLS MAT_A_ROWS // Because A is a square matrix

#define MAT_B_ROWS MAT_A_COLS // the numbers of rows in matrix B must be the same value of the number of colunms in matrix A
#define MAT_B_COLS 4

#define MAT_Y_ROWS MAT_A_ROWS
#define MAT_Y_COLS MAT_B_COLS

#define NUM_OF_TESTS 10

#define PACKAGE_SIZE_BYTES 32
#define PAYLOAD_PACKET_BYTES (PACKAGE_SIZE_BYTES-8)

// NUM_TOTAL_OF_PACKETS_RX se calcula como el resultado de 
//                        (MAT_A_ROWS * MAT_A_COLS) + (MAT_B_ROWS * MAT_B_COLS)   
//                        -----------------------------------------------------
//                                      (PAYLOAD_PACKET_BYTES / 4)
//
// Este resultado en caso de que de decimal, deberá redondearse una unidad hacia arriba, ya que el define no admite enteros

// NUM_TOTAL_OF_PACKETS_TX se calcula como el resultado de 
//                         (MAT_Y_ROWS * MAT_Y_COLS)   
//                        ---------------------------
//                         (PAYLOAD_PACKET_BYTES / 4)
//
// Este resultado en caso de que de decimal, deberá redondearse una unidad hacia arriba, ya que el define no admite enteros

#define NUM_TOTAL_OF_PACKETS_RX 24 // Número de paquetes recibidos, matriz A + columnas de matriz B
#define NUM_TOTAL_OF_PACKETS_TX 7 // Número de paquetes a transmitir, matriz de resultados

typedef unsigned int data_type;

typedef int mat_a_t;
typedef int mat_b_t;
typedef int result_t;

typedef struct packaging_data {
   unsigned char BS_ID;
   unsigned char FPGA_ID;
   unsigned short int PCKG_ID;
   unsigned char TX_UID;
   unsigned char RX_UID;
   unsigned short int VALID_PACKET_BYTES;
   data_type MESSAGE[PAYLOAD_PACKET_BYTES/4];
} packaging_data;


// Prototype of top level function for C-synthesis
void Wrapper_Matrix_Multiplier(hls::stream<packaging_data>& in_fifo, hls::stream<packaging_data>& out_fifo);

void matrixmul( mat_a_t a[MAT_A_ROWS][MAT_A_COLS], mat_b_t b[MAT_B_ROWS][MAT_B_COLS], result_t res[MAT_Y_ROWS * MAT_Y_COLS]);

#endif // __MATRIXMUL_H__ not defined

