#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xaxidma.h"
#include "xparameters.h"


/******************** Constant Definitions **********************************/

/*
 * Device hardware build related constants.
 */

#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID
#define DDR_BASE_ADDR	XPAR_PSU_DDR_0_S_AXI_BASEADDR

#define MEM_BASE_ADDR		0x01000000 //Check for the valid DDR ADDRESS IN xparameter.h, \ default set to 0x01000000

#define TX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00100000)
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00300000)
#define RX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x004FFFFF)

#ifdef TIMER_AVAILABLE
  #include "xtmrctr.h"
  #define XPAR_AXI_TIMER_DEVICE_ID 		(XPAR_AXI_TIMER_0_DEVICE_ID)
#endif


#define MAX_PKT_LEN_IN_BYTES	4004  // Número de bytes a transferir por el módulo transmisor, debe ser igual al parámetro definido en el archivo unpackaging_IP.hpp nombrado como MESSAGE_SIZE_BYTES

#define MAX_PKT_LEN		(MAX_PKT_LEN_IN_BYTES/4)  // Number of u32 data to be transmitted, dato que son datos de 32 bits, el número de bytes se divide entre 4, es válido para el transmisor

#define MAX_PKT_LEN_IN_BYTES_RX	(MAX_PKT_LEN_IN_BYTES - 4)  // Total de bytes que recibirá el nodo receptor. El receptor recibirá únicamente el Payload del mensaje, por lo tanto, no se utilizarán los 4 bytes del encabezado. Así las cosas, al tamaño del mensaje en bytes enviado por el transmisor se le resta 4 bytes del encabezado

#define MAX_PKT_LEN_RX		(MAX_PKT_LEN_IN_BYTES_RX/4)  // Number of u32 data to be received in the PN. Se divide entre 4 el número de bytes

#define MESSAGE_HEADER	0x01020000  //Todos los datos que se transfieren tienen este valor en su encabezado

#define NUMBER_OF_TRANSFERS	100  // En cada transferencia se envía un arreglo con un tamaño igual a MAX_PKT_LEN elementos y se recibe estos datos, esto representa una transferencia. Este parámetro define cuantas veces se quiere ejecutar dicha transferencia

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
	int Index, i;
	u32 *TxBufferPtr;
	u32 *RxBufferPtr;

	TxBufferPtr = (u32 *)TX_BUFFER_BASE ;
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

	// El primer dato del paquete constituye el encabezado del mensaje, luego será un contador ascendente que inicia en cero y continua incrementando con cada dato u32
	for(Index = 0; Index < MAX_PKT_LEN; Index ++) {
		if (Index==0)
			TxBufferPtr[Index] = MESSAGE_HEADER;
		else
			TxBufferPtr[Index] = Index-1;
	}

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 * is enabled
	 */
	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, MAX_PKT_LEN_IN_BYTES);

	for(Index = 0; Index < Tries; Index ++) {


		Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) RxBufferPtr,
				MAX_PKT_LEN_IN_BYTES_RX, XAXIDMA_DEVICE_TO_DMA);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) TxBufferPtr,
				MAX_PKT_LEN_IN_BYTES, XAXIDMA_DMA_TO_DEVICE);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		while ((XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA)) ||
			(XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE))) {
				/* Wait */
		}


		// ************** Descomente esta línea de código para imprimir todos los valores recibidos y su valor esperado *****
		/*
		for(i = 0; i < MAX_PKT_LEN_RX; i++) {
			xil_printf("Error in data number %d. Received Data: %d. Expected Data: %d. \r\n",
			i, (unsigned int)RxBufferPtr[i],
			(unsigned int)i);

		} // */

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

	RxPacket = (u32 *) RX_BUFFER_BASE;


	/* Invalidate the DestBuffer before receiving the data, in case the
	 * Data Cache is enabled
	 */

	for(Index = 0; Index < MAX_PKT_LEN_RX; Index++) {
		if (RxPacket[Index] != Index) {
			xil_printf("Error in data number %d. Received Data: %d. Expected Data: %d. \r\n",
				Index , (unsigned int)RxPacket[Index], (unsigned int)Index);

			return XST_FAILURE;
		}
	}

	return XST_SUCCESS;
}
