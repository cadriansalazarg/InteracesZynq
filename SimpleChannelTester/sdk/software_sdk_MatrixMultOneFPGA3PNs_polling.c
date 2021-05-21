/***************************** Include Files *********************************/
#include "xaxidma.h"
#include "xparameters.h"

/******************** Constant Definitions **********************************/

/*
 * Device hardware build related constants.
 */

#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID
#define DDR_BASE_ADDR	XPAR_PSU_DDR_0_S_AXI_BASEADDR

#define MEM_BASE_ADDR		0x01000000 //Check for the valid DDR ADDRESS IN xparameter.h, \ default set to 0x01000000

#define TX_BUFFER_BASE_1		(MEM_BASE_ADDR + 0x00100000)
#define TX_BUFFER_BASE_2		(MEM_BASE_ADDR + 0x00200000)
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00300000)
#define RX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x004FFFFF)

#ifdef TIMER_AVAILABLE
  #include "xtmrctr.h"
  #define XPAR_AXI_TIMER_DEVICE_ID 		(XPAR_AXI_TIMER_0_DEVICE_ID)
#endif


#define MAX_PKT_LEN_TX_1		0x91  // Number of u32 data to be transmitted (2048 elementos de tipo u32)

#define MAX_PKT_LEN_IN_BYTES_TX_1	MAX_PKT_LEN_TX_1*4  //Total de bytes por transferencia, en este caso, como el tipo de dato es u32, se multiplica por 4 para sacar el número de bytes (2048 por 4)

#define MAX_PKT_LEN_TX_2		0x49  // Number of u32 data to be transmitted (2048 elementos de tipo u32)

#define MAX_PKT_LEN_IN_BYTES_TX_2	MAX_PKT_LEN_TX_1*4  //Total de bytes por transferencia, en este caso, como el tipo de dato es u32, se multiplica por 4 para sacar el número de bytes (2048 por 4)

#define MAX_PKT_LEN_RX		0xD8  // Number of u32 data to be transmitted (2048 elementos de tipo u32)

#define MAX_PKT_LEN_IN_BYTES_RX	MAX_PKT_LEN_RX*4  //Total de bytes por transferencia, en este caso, como el tipo de dato es u32, se multiplica por 4 para sacar el número de bytes (2048 por 4)

#define MATRIZ_ELEMENT	0x00000001  //Todos los datos que se transfieren tienen este valor

#define MATRIZ_RESULT	0x0000000C  //Todos los datos que se transfieren tienen este valor

#define NUMBER_OF_TRANSFERS	1  // En cada transferencia se envía un arreglo con un tamaño igual a MAX_PKT_LEN elementos y se recibe estos datos, esto representa una transferencia. Este parámetro define cuantas veces se quiere ejecutar dicha transferencia

/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/
int XAxiDma_SimplePollExample(u16 DeviceId);
static int CheckData(void);

/************************** Variable Definitions *****************************/
/*
 * Device instance definitions
 */
XAxiDma AxiDma;

#ifdef TIMER_AVAILABLE
	XTmrCtr timer_dev;
#endif

/*****************************************************************************/
/**
* The entry point for this example. It invokes the example function,
* and reports the execution status.
*
* @param	None.
*
* @return
*		- XST_SUCCESS if example finishes successfully
*		- XST_FAILURE if example fails.
*
* @note		None.
*
******************************************************************************/
int main()
{
	int Status;

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


/*****************************************************************************/
/**
* The example to do the simple transfer through polling. The constant
* NUMBER_OF_TRANSFERS defines how many times a simple transfer is repeated.
*
* @param	DeviceId is the Device Id of the XAxiDma instance
*
* @return
*		- XST_SUCCESS if example finishes successfully
*		- XST_FAILURE if error occurs
*
* @note		None
*
*
******************************************************************************/
int XAxiDma_SimplePollExample(u16 DeviceId)
{
	XAxiDma_Config *CfgPtr;
	int Status;
	int Tries = NUMBER_OF_TRANSFERS;
	int Index;
	u32 *TxBufferPtr_1;
	u32 *TxBufferPtr_2;
	u32 *RxBufferPtr;
	u32 Value;

	TxBufferPtr_1 = (u32 *)TX_BUFFER_BASE_1;
	TxBufferPtr_2 = (u32 *)TX_BUFFER_BASE_2;
	RxBufferPtr = (u32 *)RX_BUFFER_BASE;

	#ifdef TIMER_AVAILABLE
		unsigned int init_time, curr_time, calibration;
		unsigned int begin_time;
		unsigned int end_time;
		unsigned int run_time = 0;
	#endif

	/* Initialize the XAxiDma device.
	 */
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

	#ifdef TIMER_AVAILABLE
		// Setup HW timer
		Status = XTmrCtr_Initialize(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
		if(Status != XST_SUCCESS){
			xil_printf("Error: timer setup failed\n");
			return XST_FAILURE;
		}
		XTmrCtr_SetOptions(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID, XTC_ENABLE_ALL_OPTION);
	#endif

	/* Disable interrupts, we use polling mode
	 */
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DMA_TO_DEVICE);

	Value = MATRIZ_ELEMENT;

	#ifdef TIMER_AVAILABLE
	    // Calibrate HW timer
		XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
		init_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
		curr_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
		calibration = curr_time - init_time;

		// Se inicia el timer para la  medición
		XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
		begin_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	#endif

	for(Index = 0; Index < MAX_PKT_LEN_TX_1; Index ++) {
		if (Index == 0)
			TxBufferPtr_1[Index] = 0xFF000240;
		else
			TxBufferPtr_1[Index] = Value;
	}

	for(Index = 0; Index < MAX_PKT_LEN_TX_2; Index ++) {
		if (Index == 0)
			TxBufferPtr_2[Index] = 0xFF000120;
		else
			TxBufferPtr_2[Index] = Value;
	}

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 * is enabled
	 */
	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr_1, MAX_PKT_LEN_IN_BYTES_TX_1);

	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr_2, MAX_PKT_LEN_IN_BYTES_TX_2);

	for(Index = 0; Index < Tries; Index ++) {


		Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) RxBufferPtr,
				MAX_PKT_LEN_IN_BYTES_RX, XAXIDMA_DEVICE_TO_DMA);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) TxBufferPtr_1,
				MAX_PKT_LEN_IN_BYTES_TX_1, XAXIDMA_DMA_TO_DEVICE);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}
		while (XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE)) {
			/* Wait */
		}

		Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) TxBufferPtr_2,
				MAX_PKT_LEN_IN_BYTES_TX_2, XAXIDMA_DMA_TO_DEVICE);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		while ((XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA)) ||
			(XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE))) {
				/* Wait */
		}

		Status = CheckData();
		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

	}

	#ifdef TIMER_AVAILABLE
		// Se finaliza la lectura del Timer y se obtienen los resultados
		end_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
		run_time = end_time - begin_time - calibration;
		xil_printf("\nTotal run time is %d cycles over %d tests.\r\n",
								run_time/Tries, Tries);
	#endif
	/* Test finishes successfully
	 */
	return XST_SUCCESS;
}



/*****************************************************************************/
/*
*
* This function checks data buffer after the DMA transfer is finished.
*
* @param	None
*
* @return
*		- XST_SUCCESS if validation is successful.
*		- XST_FAILURE otherwise.
*
* @note		None.
*
******************************************************************************/
static int CheckData(void)
{
	u32 *RxPacket;
	int Index = 0;
	u32 Value;

	RxPacket = (u32 *) RX_BUFFER_BASE;
	Value = MATRIZ_RESULT;

	/* Invalidate the DestBuffer before receiving the data, in case the
	 * Data Cache is enabled
	 */

	for(Index = 0; Index < MAX_PKT_LEN_RX; Index++) {
		if (RxPacket[Index] != Value) {
			xil_printf("Data error %d: %x/%x\r\n",
			Index, (unsigned int)RxPacket[Index],
				(unsigned int)Value);

			return XST_FAILURE;
		}
	}

	return XST_SUCCESS;
}
