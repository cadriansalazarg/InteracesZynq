#ifndef H_LIB_EXAMPLE_HW_H
#define H_LIB_EXAMPLE_HW_H

#define SIZE  8
#define DMA_SIZE SIZE*4

int Setup_HW_Accelerator(int inputbuffer[SIZE], int outputbuffer[SIZE]);

int Run_HW_Accelerator(int inputbuffer[SIZE], int outputbuffer[SIZE]);

int Start_HW_Accelerator(void);

//void matrix_multiply_ref(float a[DIM][DIM], float b[DIM][DIM], float out[DIM][DIM]);

#endif
