#include "platform.h"
#include "xparameters.h"
#include "xscugic.h"
#include "xaxidma.h"
#include "xloopback.h"
#include "lib_hw_loopback.h"
#include "xil_printf.h"



volatile static int RunExample = 0;
volatile static int ResultExample = 0;

XLoopback xloopback_dev;

XLoopback_Config xloopback_config = {
	0,
	XPAR_LOOPBACK_0_S_AXI_AXILITES_BASEADDR
};


//Interrupt Controller Instance
XScuGic ScuGic;


// AXI DMA Instance
extern XAxiDma AxiDma;



int XLoopBackSetup(){
	return XLoopback_CfgInitialize(&xloopback_dev,&xloopback_config);
}


void XLoopBackStart(void *InstancePtr){
	XLoopback *pExample = (XLoopback *)InstancePtr;
	XLoopback_InterruptEnable(pExample,1);
	XLoopback_InterruptGlobalEnable(pExample);
	XLoopback_Start(pExample);
}



void XLoopBackIsr(void *InstancePtr){
	XLoopback *pExample = (XLoopback *)InstancePtr;

	//Disable the global interrupt
	XLoopback_InterruptGlobalDisable(pExample);
	//Disable the local interrupt
	XLoopback_InterruptDisable(pExample,0xffffffff);

	// clear the local interrupt
	XLoopback_InterruptClear(pExample,1);

	ResultExample = 1;
	// restart the core if it should run again
	if(RunExample){
		XLoopBackStart(pExample);
	}
}


int XLoopBackSetupInterrupt()
{

	// #define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID
	/* Initialize the XAxiDma device. *   */

	XAxiDma_Config *CfgPtr;
	int Status;

	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
	if (!CfgPtr) {
		xil_printf("No config found for %d\r\n", XPAR_AXI_DMA_0_DEVICE_ID);
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

	/* Disable interrupts, we use polling mode
	 */
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DMA_TO_DEVICE);


	return XST_SUCCESS;

}



int Setup_HW_Accelerator(int inputbuffer[SIZE], int outputbuffer[SIZE])
//Setup the Vivado HLS Block
{
	int status = XLoopBackSetup();
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  XLoopBackSetupInterrupt();
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}
	//XHls_accel_core_SetVal1(&xmmult_dev,val1);
	//XHls_accel_core_SetVal2(&xmmult_dev,val2);
	XLoopBackStart(&xloopback_dev);

	//flush the cache
	Xil_DCacheFlushRange((unsigned int)inputbuffer,DMA_SIZE);
	//Xil_DCacheFlushRange((unsigned int)B,dma_size);
	Xil_DCacheFlushRange((unsigned int)outputbuffer,DMA_SIZE);
	xil_printf("\rCache cleared\n\r");

	return 0;
}



int Start_HW_Accelerator(void)
{
	int status = XLoopBackSetup();
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  XLoopBackSetupInterrupt();
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}
	//XHls_accel_core_SetVal1(&xmmult_dev,val1);
	//XHls_accel_core_SetVal2(&xmmult_dev,val2);
	XLoopBackStart(&xloopback_dev);

	//xil_printf("\rStarted HW Accelerator\n\r");
	return 0;
}



int Run_HW_Accelerator(int inputbuffer[SIZE], int outputbuffer[SIZE])
{
	//transfer A to the Vivado HLS block
	int status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) inputbuffer, DMA_SIZE,
			XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}

	//get results from the Vivado HLS block
	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) outputbuffer, DMA_SIZE,
			XAXIDMA_DEVICE_TO_DMA);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer from Vivado HLS block failed\n");
		return XST_FAILURE;
	}

	while ((XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE)));



	while((XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA)));


	return 0;

}
