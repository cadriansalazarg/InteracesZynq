#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/time.h>

/*  MEMORY_SIZE macro is located in  system-user.dtsi file
 * reg = <0x18000000 0x00800000>;  the second value, is the MEMORY SIZE
reserved-memory {
		#address-cells = <1>;
		#size-cells = <1>;
		ranges;
		image_buf0: image_buf0@0 {
			compatible = "shared-dma-pool";
			reusable;
			reg = <0x18000000 0x00800000>; 
			label = "image_buf0";
		};
	};
*/

/* DMA_SIZE Macro is defined at system-user.dtsi file 
 * reg = <0x40400000 0x10000>;  the second value, is the MEMORY SIZE
 dma@40400000 {
		#dma-cells = <1>;
		clock-names = "s_axi_lite_aclk", "m_axi_mm2s_aclk", "m_axi_s2mm_aclk";
		clocks = <&clkc 15>, <&clkc 15>, <&clkc 15>;
		compatible = "generic-uio";
		interrupt-names = "mm2s_introut", "s2mm_introut";
		interrupt-parent = <&intc>;
		interrupts = <0 30 4>;
		reg = <0x40400000 0x10000>;
		xlnx,addrwidth = <0x20>;
		xlnx,sg-length-width = <0xe>;
		dma-channel@40400000 {
 */ 
 
#define MEMORY_SIZE 0x00800000
#define DMA_SIZE 0x10000
#define START_VALUE  0x1FEE0000
#define NUMBER_OF_ELEMENTS	256
#define NUMBER_OF_TRANSFERS	100

typedef unsigned int uint;

// Direct Register Mode Register Address Map
// Tomado del documento https://www.xilinx.com/support/documentation/ip_documentation/axi_dma/v7_1/pg021_axi_dma.pdf
// Tabla 2-6 página 12

typedef struct {
	uint MM2S_DMACR;   // Description:		MM2S DMA Control register  						// Address Space Offset:	00h
	uint MM2S_DMASR;   // Description:		MM2S DMA Status register   						// Address Space Offset:	04h
	uint Reserved_0;   // Description:		N/A						   						// Address Space Offset:	08h	
	uint Reserved_1;   // Description:		N/A						   						// Address Space Offset:	0Ch
	uint Reserved_2;   // Description:		N/A						   						// Address Space Offset:	10h
	uint Reserved_3;   // Description:		N/A						   						// Address Space Offset:	14h
	uint MM2S_SA;      // Description:		MM2S Source Address. Lower 32 bits of address	// Address Space Offset:	18h
	uint MM2S_SA_MSB;  // Description:		MM2S Source Address. Upper 32 bits of address.	// Address Space Offset:	1Ch
	uint Empty_0;      // Description:		N/A						   						// Address Space Offset:	20h
	uint Empty_1;      // Description:		N/A						   						// Address Space Offset:	24h
	uint MM2S_LENGTH;  // Description:		MM2S Transfer Length (Bytes)					// Address Space Offset:	28h
	uint Empty_2;      // Description:		N/A												// Address Space Offset:	2Ch
	uint S2MM_DMACR;   // Description:		S2MM DMA Control register						// Address Space Offset:	30h
	uint S2MM_DMASR;   // Description:		S2MM DMA Status register						// Address Space Offset:	34h
	uint Reserved_4;   // Description:		N/A												// Address Space Offset:	38h
	uint Reserved_5;   // Description:		N/A												// Address Space Offset:	3Ch	
	uint Reserved_6;   // Description:		N/A												// Address Space Offset:	40h	
	uint Reserved_7;   // Description:		N/A												// Address Space Offset:	44h 
	uint S2MM_DA;  	   // Description:		S2MM Destination Address. Lower 32 bit address.	// Address Space Offset:	48h 
	uint S2MM_DA_MSB;  // Description:		S2MM Destination Address. Upper 32 bit address. // Address Space Offset:	4Ch 
	uint Empty_3;      // Description:		N/A						   						// Address Space Offset:	50h
	uint Empty_4;      // Description:		N/A						   						// Address Space Offset:	54h
	uint S2MM_LENGTH;  // Description:		S2MM Buffer Length (Bytes) 						// Address Space Offset:	58h
} __attribute__((packed)) DMA_REG_MAP_t;

const uint len_bytes = sizeof(uint)*NUMBER_OF_ELEMENTS;

void AccelIP_run_exec(uint *ptr_RM, volatile DMA_REG_MAP_t *ptr_dma);
inline void AXIDMA_reset(volatile DMA_REG_MAP_t *ptr_dma);
inline void AXIDMA_mm2s_start(volatile DMA_REG_MAP_t *ptr_dma, uint length_bytes, uint phyaddr);
inline void AXIDMA_s2mm_start(volatile DMA_REG_MAP_t *ptr_dma, uint length_bytes, uint phyaddr);
void AXIDMA_wait_s2mm_polling(volatile DMA_REG_MAP_t *ptr_dma);
void AXIDMA_wait_mm2s_polling(volatile DMA_REG_MAP_t *ptr_dma);

int main(int argc, char **argv)
{
	int fd_RM; //file descriptor, reserve memory 
	int fd_dma; // file descriptor , dma UIO
	
	uint *ptr_RM;// puntero a la base de la memoria reservada
	volatile DMA_REG_MAP_t *ptr_dma; // puntero a la base del dispositivo DMA
	
	char uiod_dma[]="/dev/uio0";	//UIO DMA device file
	char uiod_RM[]="/dev/udmabuf0";	//UIO reserve memory
		
    printf("Starting...!\n");
    
    fd_dma = open(uiod_dma, O_RDWR);
    
	if (fd_dma < 1) {
		perror(argv[0]);
		printf("Invalid UIO device file:%s.\n", uiod_dma);
		return -1;
	}
		
    fd_RM = open(uiod_RM,O_RDWR | O_SYNC);
    
    if (fd_RM < 1) {
		perror(argv[0]);
		printf("Invalid reserve memory:%s.\n", uiod_RM);
		return -1;
	}
	
	/* mmap the UIO DMA device */
	ptr_dma = mmap(NULL, DMA_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd_dma, 0);
    
    /* mmap the RESERVE MEMORY device */
	ptr_RM = mmap(NULL, MEMORY_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd_RM, 0);
		
    AXIDMA_reset(ptr_dma);
     
    AccelIP_run_exec(ptr_RM, ptr_dma);
             
    munmap((uint *)ptr_RM,MEMORY_SIZE);
	munmap((uint *)ptr_dma,DMA_SIZE);
	
    return 0;
}

void AccelIP_run_exec(uint *ptr_RM, volatile DMA_REG_MAP_t *ptr_dma){
	uint *TxBufferPtr;
	uint *RxBufferPtr;
	uint  i, j;
	
	struct timeval stop, start; // Variable for measuring time
	unsigned long int calibration;
	unsigned long int delta;
	
	TxBufferPtr = (uint *)ptr_RM;
	RxBufferPtr = (uint *)(ptr_RM + 0x0400);
	
	gettimeofday(&start, NULL);
	
	for (j=0; j < NUMBER_OF_TRANSFERS; j++){
		
		for (i=0;i<NUMBER_OF_ELEMENTS;i++){ //Initialization transmitted values
			TxBufferPtr[i] = START_VALUE + j;
		}
	
		AXIDMA_mm2s_start(ptr_dma, len_bytes, 0x18000000); // Physical Address is taken from the first value of the reg, of the reserved-memory instance, taken from system-user.dtsi file
		
		AXIDMA_wait_mm2s_polling(ptr_dma);
		
		AXIDMA_s2mm_start(ptr_dma, len_bytes, 0x18001000); // The physical address for received data, must be in different part of the memorory for 
		
		AXIDMA_wait_s2mm_polling(ptr_dma);
		
		for (i=0;i<NUMBER_OF_ELEMENTS;i++){ 
			if (TxBufferPtr[i] != RxBufferPtr[i]){
				printf("Error!!!. Iteration: %d.  Element: %d. Transmitted Data: 0x%08X. Received Data: 0x%08X. \n",j, i, TxBufferPtr[i], RxBufferPtr[i]);
				return 1;
			}
		}
	}
	
	gettimeofday(&stop, NULL);	
	delta = (stop.tv_sec - start.tv_sec) * 1000000 + stop.tv_usec - start.tv_usec;
	
	gettimeofday(&start, NULL);
	gettimeofday(&stop, NULL);
	calibration = (stop.tv_sec - start.tv_sec) * 1000000 + stop.tv_usec - start.tv_usec;
	
	printf("Transaction done successfully by using polling.\n");
	printf("Transaction took %lu us.\n", delta-calibration);
}

inline void AXIDMA_reset(volatile DMA_REG_MAP_t *ptr_dma){
	ptr_dma->MM2S_DMACR = 0x100;
	ptr_dma->MM2S_DMACR = 0x000;
	ptr_dma->S2MM_DMACR = 0x100;
	ptr_dma->S2MM_DMACR = 0x000;
}

inline void AXIDMA_mm2s_start(volatile DMA_REG_MAP_t *ptr_dma, uint length_bytes, uint phyaddr){
	ptr_dma->MM2S_SA = phyaddr;
	ptr_dma->MM2S_DMACR = (uint)((0x1<<12)|1);
	ptr_dma->MM2S_LENGTH = length_bytes;
}

inline void AXIDMA_s2mm_start(volatile DMA_REG_MAP_t *ptr_dma, uint length_bytes, uint phyaddr){
	ptr_dma->S2MM_DA = phyaddr;
	ptr_dma->S2MM_DMACR = (uint)((0x1<<12)|1);
	ptr_dma->S2MM_LENGTH = length_bytes;
}

void AXIDMA_wait_s2mm_polling(volatile DMA_REG_MAP_t *ptr_dma){
	uint Finish = 0; 
	while(Finish != 1) {
		Finish = (ptr_dma->S2MM_DMASR) >>1;
		Finish &= 1;
	}
}

void AXIDMA_wait_mm2s_polling(volatile DMA_REG_MAP_t *ptr_dma){
	uint Finish = 0; 
	while(Finish != 1) {
		Finish = (ptr_dma->MM2S_DMASR) >>1;
		Finish &= 1;
	}
}
