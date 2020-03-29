/***************************** Include Files *********************************/
#include <stdio.h>
#include <stdlib.h>
#include "platform.h"
#include "xparameters.h"
#include "xaxidma.h"
#include "xdebug.h"
#include "xloopback.h"
#include "xscugic.h"
#include "xtmrctr.h"

/**************************** Type Definitions *******************************/
#define XPAR_AXI_TIMER_DEVICE_ID 		(XPAR_AXI_TIMER_0_DEVICE_ID)
#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID

#define SIZE 8 // Como el tamaño está alambrado en hardware, debe asegurarse que está variable coincida con el valor de SIZE seleccionado en el HLS cuando se creo el IP


/*************************** Global variables *******************************/

const unsigned int dma_size = SIZE*4;
const unsigned int num_tests = 1000000;
int input_bffr[SIZE]; // Deben ser globales porque sino algunas veces en el SDK se cuelga el DMA y lee valores erroneos
int output_bffr[SIZE]; // Deben ser globales porque sino algunas veces en el SDK se cuelga el DMA y lee valores erroneos
/************************** Function Prototypes ******************************/

int XAxiDma_SimplePollExample(u16 DeviceId);
void XLoopBackStart(void *InstancePtr);
int XLoopBackSetup();

/************************** Variable Definitions *****************************/
/*
 * Device instance definitions
 */
XAxiDma AxiDma;

XLoopback xloopback_dev;

XTmrCtr timer_dev;

XLoopback_Config xloopback_config = {
	0,
	XPAR_LOOPBACK_0_S_AXI_AXILITES_BASEADDR
};

//Interrupt Controller Instance
XScuGic ScuGic;


volatile static int RunExample = 0;
volatile static int ResultExample = 0;


int main()
{
	int Status,k;

	for(k=0;k<SIZE;k++)
		input_bffr[k] = k;

	xil_printf("\r\n--- Entering main() --- \r\n");

	/* Run the poll example for simple transfer */
	Status = XAxiDma_SimplePollExample(DMA_DEV_ID);

	if (Status != XST_SUCCESS) {
		xil_printf("XAxiDma_SimplePoll Example Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran XAxiDma_SimplePoll Example\r\n");

	xil_printf("--- Exiting main() --- \r\n");

	return XST_SUCCESS;

}

int XAxiDma_SimplePollExample(u16 DeviceId)
{
	XAxiDma_Config *CfgPtr;
	int Status;
	unsigned int j,i;

	unsigned int init_time, curr_time, calibration;
	unsigned int begin_time;
	unsigned int end_time;
	unsigned int run_time = 0;

	CfgPtr = XAxiDma_LookupConfig(DeviceId);
	if (!CfgPtr) {
		xil_printf("No config found for %d\r\n", DeviceId);
		return XST_FAILURE;
	}

	Status = XAxiDma_CfgInitialize(&AxiDma, CfgPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}

	if(XAxiDma_HasSg(&AxiDma)){
		xil_printf("Device configured as SG mode \r\n");
		return XST_FAILURE;
	}

	// Setup HW timer
	Status = XTmrCtr_Initialize(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	if(Status != XST_SUCCESS){
		xil_printf("Error: timer setup failed\n");
		return XST_FAILURE;
	}
	XTmrCtr_SetOptions(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID, XTC_ENABLE_ALL_OPTION);

	Status = XLoopBackSetup();
	if(Status != XST_SUCCESS){
		xil_printf("IP Initialization failed \r\n");
		return XST_FAILURE;
	}

	/* Disable interrupts, we use polling mode
	 */
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DMA_TO_DEVICE);

	// Calibrate HW timer
	XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	init_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	curr_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	calibration = curr_time - init_time;

	// Se inicia el timer para la  medición
	XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	begin_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);

	for (j=0; j<num_tests;j++){
		XLoopBackStart(&xloopback_dev);

		Xil_DCacheFlushRange((unsigned int)input_bffr,dma_size);
		Xil_DCacheFlushRange((unsigned int)output_bffr,dma_size);

		Status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) output_bffr, dma_size,
			XAXIDMA_DEVICE_TO_DMA);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		Status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) input_bffr, dma_size,
			XAXIDMA_DMA_TO_DEVICE);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		while ((XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA)) ||
				(XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE))) {
		}

		for (i=0; i<SIZE;i++){
			if(output_bffr[i] != input_bffr[i])
				return XST_FAILURE;
		}
	}

	// Se finaliza la lectura del Timer y se obtienen los resultados

	end_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	run_time = end_time - begin_time - calibration;
	xil_printf("\nTotal run time is %d cycles over %d tests.\r\n",
					run_time/num_tests, num_tests);


	return XST_SUCCESS;
}


void XLoopBackStart(void *InstancePtr){
	XLoopback *pExample = (XLoopback *)InstancePtr;
	XLoopback_InterruptEnable(pExample,1);
	XLoopback_InterruptGlobalEnable(pExample);
	XLoopback_Start(pExample);
}

int XLoopBackSetup(){
	return XLoopback_CfgInitialize(&xloopback_dev,&xloopback_config);
}
