#define XADDER_AXILITES_ADDR_AP_CTRL 0x00
#define XADDER_AXILITES_ADDR_GIE     0x04
#define XADDER_AXILITES_ADDR_IER     0x08
#define XADDER_AXILITES_ADDR_ISR     0x0c
#define XADDER_AXILITES_ADDR_A_BASE  0x40
#define XADDER_AXILITES_ADDR_A_HIGH  0x7f
#define XADDER_AXILITES_WIDTH_A      32
#define XADDER_AXILITES_DEPTH_A      10
#define XADDER_AXILITES_ADDR_B_BASE  0x80
#define XADDER_AXILITES_ADDR_B_HIGH  0xbf
#define XADDER_AXILITES_WIDTH_B      32
#define XADDER_AXILITES_DEPTH_B      10
#define XADDER_AXILITES_ADDR_Q_BASE  0xc0
#define XADDER_AXILITES_ADDR_Q_HIGH  0xff
#define XADDER_AXILITES_WIDTH_Q      32
#define XADDER_AXILITES_DEPTH_Q      10
#define XADDER_MAP_SIZE 0X10000

#define AXI_TIMER_MAP_SIZE 0x10000  // Taken from system-user.dtsi file, reg = <0x42800000 0x10000>; the second value is the size

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <time.h>

typedef unsigned int uint;

typedef struct { // Taken from https://www.xilinx.com/support/documentation/ip_documentation/axi_timer/v2_0/pg079-axi-timer.pdf
	uint TCSR0;	       // Description:		Timer 0 Control and Status Register             // Address Space Offset:	00h
	uint TLR0;	       // Description:		Timer 0 Load Register                           // Address Space Offset:	04h
	uint TCR0;	       // Description:		Timer 0 Counter Register                        // Address Space Offset:	08h
	uint RSVD0;	       // Description:		Reserved                                        // Address Space Offset:	0Ch
	uint TCSR1;	       // Description:		Timer 1 Control and Status Register             // Address Space Offset:	10h
	uint TLR1;	       // Description:		Timer 1 Load Register                           // Address Space Offset:	14h
	uint TCR1;	       // Description:		Timer 1 Counter Register                        // Address Space Offset:	18h
	uint RSVD1;	       // Description:		Reserved                                        // Address Space Offset:	1Ch
} __attribute__((packed)) TIMER_REG_MAP_t;


#define ARRAY_SIZE 10			//tamaño de los arreglos.

//ADDER
int adder(void *ptr_customized_IP,float A[ARRAY_SIZE],float B[ARRAY_SIZE],float Y[ARRAY_SIZE]){
	
	int i;	

	// Fill arrays
	for(i = 0; i < ARRAY_SIZE; i++){
		*((unsigned *)(ptr_customized_IP + XADDER_AXILITES_ADDR_A_BASE+i*sizeof(float))) = *(unsigned *)(A+i);
		*((unsigned *)(ptr_customized_IP + XADDER_AXILITES_ADDR_B_BASE+i*sizeof(float))) = *(unsigned *)(B+i);		
	}

	// AP START To 1
	*((unsigned *)(ptr_customized_IP + XADDER_AXILITES_ADDR_AP_CTRL)) = 0x01;

	// Polling looking for process ready
	while(
	(*((unsigned *)(ptr_customized_IP + XADDER_AXILITES_ADDR_AP_CTRL)) >>1)&0x01 == 0
	){}

	// Read resulta
	for(i = 0; i < ARRAY_SIZE; i++){
		*(unsigned *)(Y+i) = *((unsigned *)(ptr_customized_IP + XADDER_AXILITES_ADDR_Q_BASE+i*sizeof(float)));
	}
	return 0;
}

int main(int argc, char **argv)       //main
{
	int fd; // file descriptor for AXI Lite device
	int fd_timer;  // file descriptor for timer device
	char uiod[]="/dev/uio0";	//UIO device file
	char uiod_timer[]="/dev/uio1";	//UIO device file
	void *ptr_customized_IP;   // puntero a la base del IP personalizado creado en HLS
	volatile TIMER_REG_MAP_t *ptr_timer; // puntero a la base del dispositivo AXi Timer

	float A[ARRAY_SIZE];
	float B[ARRAY_SIZE];
	float Q_hw[ARRAY_SIZE];
	float Q_sw[ARRAY_SIZE];
	int i;
	
	uint Timer_Value; 
     
	clock_t start, end;		//inicializa variables para medir tiempo de ejecución
	double cpu_time_used;

	/* Open the UIO device file */
	fd = open(uiod, O_RDWR);
	if (fd < 1) {
		perror(argv[0]);
		printf("Invalid Adder UIO device file:%s.\n", uiod);
		return -1;
	}
	
	/* Open the UIO device file */
	fd_timer = open(uiod_timer, O_RDWR);
	if (fd_timer < 1) {
		perror(argv[0]);
		printf("Invalid Timer UIO device file:%s.\n", uiod);
		return -1;
	}
	
	/* mmap the Adder UIO device */
	ptr_customized_IP = mmap(NULL, XADDER_MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
	
	/* mmap the XTimer UIO device */
	ptr_timer = mmap(NULL, AXI_TIMER_MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd_timer, 0);
	
	ptr_timer->TLR0 = 0x00000000;  // Load register equal to zero
	ptr_timer->TCSR0 = 0x00000020; // Load timer with value in TLR0
	Timer_Value = ptr_timer->TCR0; // Read counter register value
	
	// Generate seed
	for(int i = 0; i < ARRAY_SIZE; i++)
	{
		A[i] = 1.0*i;
		B[i] = 2.0*i;
		Q_sw[i] = A[i]+B[i];
	}

	// Start timer
	start = clock();
	
	ptr_timer->TCSR0 = 0x00000080; // Enable timer (counter starts running)
	
	// Execute
	adder(ptr_customized_IP,A,B,Q_hw);
	
	ptr_timer->TCSR0 = 0x00000000; // Disable timer (counter halts)
	Timer_Value = ptr_timer->TCR0; // Read counter register value
	
	// Stop timer
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

	// Reveal data
	printf("Data available \n");
	printf("Execution time: %lf.\n", cpu_time_used);
	printf("Counter value: %u.\n", Timer_Value);
	
	for(int i = 0; i < ARRAY_SIZE; i++)
	{
		// Print values
		printf("Software: %f, Hardware: %f \n", Q_sw[i], Q_hw[i]);
	}
	
	munmap(ptr_timer, AXI_TIMER_MAP_SIZE);
	munmap(ptr_customized_IP, XADDER_MAP_SIZE);
}
