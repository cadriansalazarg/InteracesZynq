/***************************** Include Files *********************************/
#include <stdio.h>
#include <stdlib.h>
#include "platform.h"
#include "xaxidma.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xdebug.h"
#include "xloopback.h"
#include "xscugic.h"
#include "xtmrctr.h"


/************************** Constant Definitions *****************************/
#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID

#define RX_INTR_ID		XPAR_FABRIC_AXIDMA_0_S2MM_INTROUT_VEC_ID
#define TX_INTR_ID		XPAR_FABRIC_AXIDMA_0_MM2S_INTROUT_VEC_ID

#define INTC_DEVICE_ID          XPAR_SCUGIC_SINGLE_DEVICE_ID

#define XPAR_AXI_TIMER_DEVICE_ID 		(XPAR_AXI_TIMER_0_DEVICE_ID)

#define INTC		XScuGic
#define INTC_HANDLER	XScuGic_InterruptHandler

/* Timeout loop counter for reset
 */
#define RESET_TIMEOUT_COUNTER	10000000

#define SIZE  2048 // El maximo valor de SIZe lo define el parámetro Width of Length register buffer en el AXI DMA en Vivado, de momento está en 16 y por lo tanto el máximo es 2048
/**************************** Type Definitions *******************************/
typedef int data;

/*************************** Global variables ********************************/
const unsigned int num_tests = 10000;
unsigned int dma_length = SIZE;


data input_bffr[SIZE];
data output_bffr[SIZE];

/************************** Function Prototypes ******************************/
static void TxIntrHandler(void *Callback);
static void RxIntrHandler(void *Callback);
static int SetupIntrSystem(INTC * IntcInstancePtr,
			   XAxiDma * AxiDmaPtr, u16 TxIntrId, u16 RxIntrId);
static void DisableIntrSystem(INTC * IntcInstancePtr,
					u16 TxIntrId, u16 RxIntrId);
static void XLoopBackStart(void *InstancePtr);
static int XLoopBackSetup();
/************************** Variable Definitions *****************************/

static XAxiDma AxiDma;		/* Instance of the XAxiDma */

static INTC Intc;	/* Instance of the Interrupt Controller */

static XLoopback xloopback_dev;

static XLoopback_Config xloopback_config = {
	0,
	XPAR_LOOPBACK_0_S_AXI_AXILITES_BASEADDR
};

static XTmrCtr timer_dev; /* Instancia del AXI Timer  */

//static int XLoopBackSetup();


/*
 * Flags interrupt handlers use to notify the application context the events.
 */
volatile int TxDone;
volatile int RxDone;
volatile int Error;

/*****************************************************************************/
/**
*
* Main function
*
* This function is the main entry of the interrupt test. It does the following:
*	Set up the output terminal if UART16550 is in the hardware build
*	Initialize the DMA engine
*	Set up Tx and Rx channels
*	Set up the interrupt system for the Tx and Rx interrupts
*	Submit a transfer
*	Wait for the transfer to finish
*	Check transfer status
*	Disable Tx and Rx interrupts
*	Print test status and exit
*
* @param	None
*
* @return
*		- XST_SUCCESS if example finishes successfully
*		- XST_FAILURE if example fails.
*
* @note		None.
*
******************************************************************************/
int main(void)
{
	int Status, i, j;
	XAxiDma_Config *Config;

	//data input_bffr[SIZE];
	//data output_bffr[SIZE];

	unsigned int init_time, curr_time, calibration;
	unsigned int begin_time;
	unsigned int end_time;
	unsigned int run_time = 0;

	for (i=0; i<dma_length; i++)
		input_bffr[i] = i;

	xil_printf("\r\n--- Entering main() --- \r\n");

	Config = XAxiDma_LookupConfig(DMA_DEV_ID);
	if (!Config) {
		xil_printf("No config found for %d\r\n", DMA_DEV_ID);

		return XST_FAILURE;
	}

	/* Initialize DMA engine */
	Status = XAxiDma_CfgInitialize(&AxiDma, Config);

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

	//Status = XLoopback_CfgInitialize(&xloopback_dev,&xloopback_config);
	//if(Status != XST_SUCCESS){
	//	xil_printf("IP Initialization failed\n");
	//	return XST_FAILURE;
	//}

	//Status = XLoopback_CfgInitialize(&xloopback_dev,&xloopback_config);
	//	if(Status != XST_SUCCESS){
	//		xil_printf("IP Initialization failed\n");
	//		return XST_FAILURE;
	//	}

	Status = XLoopBackSetup();
	if(Status != XST_SUCCESS){
		xil_printf("Error: Customized IP setup failed \r\n");
		return XST_FAILURE;
	}

	/* Set up Interrupt system  */
	Status = SetupIntrSystem(&Intc, &AxiDma, TX_INTR_ID, RX_INTR_ID);
	if (Status != XST_SUCCESS) {

		xil_printf("Failed intr setup\r\n");
		return XST_FAILURE;
	}

	/* Disable all interrupts before setup */

	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DMA_TO_DEVICE);

	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
				XAXIDMA_DEVICE_TO_DMA);

	/* Enable all interrupts */
	XAxiDma_IntrEnable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
							XAXIDMA_DMA_TO_DEVICE);


	XAxiDma_IntrEnable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
							XAXIDMA_DEVICE_TO_DMA);

	/* Initialize flags before start transfer test  */
	TxDone = 0;
	RxDone = 0;
	Error = 0;

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	* is enabled
	*/

	//if(Status != XST_SUCCESS){
	//	print("Error: example setup failed\n");
	//	return XST_FAILURE;
	//}

	//flush the cache
	Xil_DCacheFlushRange((unsigned int)input_bffr,dma_length*sizeof(int));
	//Xil_DCacheFlushRange((unsigned int)B,dma_size);
	Xil_DCacheFlushRange((unsigned int)output_bffr,dma_length*sizeof(int));
	xil_printf("\rCache cleared\n\r");

	XLoopback_Set_len_dma(&xloopback_dev, dma_length);



	// Calibrate HW timer
	XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	init_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	curr_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	calibration = curr_time - init_time;

	// Se inicia el timer para la  medición
	XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	begin_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);




	for (j=0; j<num_tests; j++){
		XLoopBackStart(&xloopback_dev);

		//transfer A to the Vivado HLS block
		Status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) input_bffr, dma_length*sizeof(int),
				XAXIDMA_DMA_TO_DEVICE);
		if (Status != XST_SUCCESS) {
			//print("Error: DMA transfer to Vivado HLS block failed\n");
			return XST_FAILURE;
		}

		//get results from the Vivado HLS block
		Status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) output_bffr, dma_length*sizeof(int),
				XAXIDMA_DEVICE_TO_DMA);
		if (Status != XST_SUCCESS) {
			//print("Error: DMA transfer from Vivado HLS block failed\n");
			return XST_FAILURE;
		}


		/*
		 * Wait TX done and RX done
		 */
		while (!TxDone && !RxDone && !Error) {
				/* NOP */
		}

		if (Error) {
			xil_printf("Failed test transmit%s done, "
					"receive%s done\r\n", TxDone? "":" not",
						RxDone? "":" not");

			goto Done;

		}

		// Validation *************************************************
		for (i =0; i<dma_length;i++){
			if(output_bffr[i] != input_bffr[i]){
				xil_printf("Data validation failed\r\n");
				goto Done;
			}
		}

	}


	// Se finaliza la lectura del Timer y se obtienen los resultados

	end_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	run_time = end_time - begin_time - calibration;
	xil_printf("\nTotal run time is %d cycles over %d tests.\r\n",
					run_time/num_tests, num_tests);

	xil_printf("Successfully ran AXI DMA interrupt Example with variable DMA Size \r\n");




	DisableIntrSystem(&Intc, TX_INTR_ID, RX_INTR_ID);

Done:
	xil_printf("--- Exiting main() --- \r\n");


	return XST_SUCCESS;
}


static int XLoopBackSetup(){
	return XLoopback_CfgInitialize(&xloopback_dev,&xloopback_config);
}

static void XLoopBackStart(void *InstancePtr){
	XLoopback *pExample = (XLoopback *)InstancePtr;
	XLoopback_InterruptEnable(pExample,1);
	XLoopback_InterruptGlobalEnable(pExample);
	XLoopback_Start(pExample);
}



/*****************************************************************************/
/*
*
* This is the DMA TX Interrupt handler function.
*
* It gets the interrupt status from the hardware, acknowledges it, and if any
* error happens, it resets the hardware. Otherwise, if a completion interrupt
* is present, then sets the TxDone.flag
*
* @param	Callback is a pointer to TX channel of the DMA engine.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void TxIntrHandler(void *Callback)
{

	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DMA_TO_DEVICE);

	/* Acknowledge pending interrupts */


	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DMA_TO_DEVICE);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {

		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error = 1;

		/*
		 * Reset should never fail for transmit channel
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if (XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If Completion interrupt is asserted, then set the TxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		TxDone = 1;
	}
}

/*****************************************************************************/
/*
*
* This is the DMA RX interrupt handler function
*
* It gets the interrupt status from the hardware, acknowledges it, and if any
* error happens, it resets the hardware. Otherwise, if a completion interrupt
* is present, then it sets the RxDone flag.
*
* @param	Callback is a pointer to RX channel of the DMA engine.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void RxIntrHandler(void *Callback)
{
	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error = 1;

		/* Reset could fail and hang
		 * NEED a way to handle this or do not call it??
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if(XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If completion interrupt is asserted, then set RxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		RxDone = 1;
	}
}

/*****************************************************************************/
/*
*
* This function setups the interrupt system so interrupts can occur for the
* DMA, it assumes INTC component exists in the hardware system.
*
* @param	IntcInstancePtr is a pointer to the instance of the INTC.
* @param	AxiDmaPtr is a pointer to the instance of the DMA engine
* @param	TxIntrId is the TX channel Interrupt ID.
* @param	RxIntrId is the RX channel Interrupt ID.
*
* @return
*		- XST_SUCCESS if successful,
*		- XST_FAILURE.if not succesful
*
* @note		None.
*
******************************************************************************/
static int SetupIntrSystem(INTC * IntcInstancePtr,
			   XAxiDma * AxiDmaPtr, u16 TxIntrId, u16 RxIntrId)
{
	int Status;

	XScuGic_Config *IntcConfig;


	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, TxIntrId, 0xA0, 0x3);

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, RxIntrId, 0xA0, 0x3);
	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	Status = XScuGic_Connect(IntcInstancePtr, TxIntrId,
				(Xil_InterruptHandler)TxIntrHandler,
				AxiDmaPtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	Status = XScuGic_Connect(IntcInstancePtr, RxIntrId,
				(Xil_InterruptHandler)RxIntrHandler,
				AxiDmaPtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	XScuGic_Enable(IntcInstancePtr, TxIntrId);
	XScuGic_Enable(IntcInstancePtr, RxIntrId);

	/* Enable interrupts from the hardware */

	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)INTC_HANDLER,
			(void *)IntcInstancePtr);

	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function disables the interrupts for DMA engine.
*
* @param	IntcInstancePtr is the pointer to the INTC component instance
* @param	TxIntrId is interrupt ID associated w/ DMA TX channel
* @param	RxIntrId is interrupt ID associated w/ DMA RX channel
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void DisableIntrSystem(INTC * IntcInstancePtr,
					u16 TxIntrId, u16 RxIntrId){
	XScuGic_Disconnect(IntcInstancePtr, TxIntrId);
	XScuGic_Disconnect(IntcInstancePtr, RxIntrId);
}
