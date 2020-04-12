#include <stdio.h>
#include "platform.h"
#include <stdlib.h>  // Standard C functions, e.g. exit()
#include <stdbool.h> // Provides a Boolean data type for ANSI/ISO-C
#include "xparameters.h" // Parameter definitions for processor periperals
#include "xscugic.h"     // Processor interrupt controller device driver
#include "xcustomized_ip_block.h"   // Device driver for HLS HW block

#ifdef TIMER_AVAILABLE
  #include "xtmrctr.h"
  #define XPAR_AXI_TIMER_DEVICE_ID 		(XPAR_AXI_TIMER_0_DEVICE_ID)
#endif

#define SIZE 512
const bool InterruptEnable_IP = true; //true IP works with interrupts, //false IP works with polling

// HLS macc HW instance
XCustomized_ip_block HlsMacc;
//Interrupt Controller Instance
XScuGic ScuGic;

#ifdef TIMER_AVAILABLE
	XTmrCtr timer_dev;
#endif


// Global variable definitions - used by ISR
volatile static int RunHlsMacc = 0;
volatile static int ResultAvailHlsMacc = 0;

// Setup and helper functions
int setup_interrupt();
int hls_macc_init(XCustomized_ip_block *hls_maccPtr);
void hls_macc_start(void *InstancePtr);
// The ISR prototype
void hls_macc_isr(void *InstancePtr);


int main()
{
   print("Program to test communication with HLS MACC block in PL\n\r");

   int Test_Start_Value_drvr_0 = 0x01000000;  // El primer 01 indica que el destino será el driver 1, y el segundo 00 indica que la fuente es el driver 0
   int Test_Start_Value_drvr_1 = 0x00010000;  // El primer 00 indica que el destino será el driver 0, y el segundo 01 indica que la fuente es el driver 1

   int input_port_axi_lite_drvr_0[SIZE];
   int input_port_axi_lite_drvr_1[SIZE];

   int output_port_axi_lite_drvr_0[SIZE];
   int output_port_axi_lite_drvr_1[SIZE];
   int status;
   int i;

   for (i=0; i<SIZE; i++){
	  input_port_axi_lite_drvr_0[i] = Test_Start_Value_drvr_0 + i;
	  input_port_axi_lite_drvr_1[i] = Test_Start_Value_drvr_1 + i;
    }

	#ifdef TIMER_AVAILABLE
	  unsigned int init_time, curr_time, calibration;
	  unsigned int begin_time;
	  unsigned int end_time;
	  unsigned int run_time = 0;
	#endif

   //Setup the matrix mult
   status = hls_macc_init(&HlsMacc);
   if(status != XST_SUCCESS){
      print("HLS peripheral setup failed\n\r");
      exit(-1);
   }
   //Setup the interrupt
   status = setup_interrupt();
   if(status != XST_SUCCESS){
      print("Interrupt setup failed\n\r");
      exit(-1);
   }

	#ifdef TIMER_AVAILABLE
	  // Setup HW timer
	  status = XTmrCtr_Initialize(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	  if(status != XST_SUCCESS){
		  xil_printf("Error: timer setup failed\n");
		  return XST_FAILURE;
	  }
	  XTmrCtr_SetOptions(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID, XTC_ENABLE_ALL_OPTION);
	#endif

   XCustomized_ip_block_Write_input_port_axi_lite_drvr_0_Words(&HlsMacc, 0, input_port_axi_lite_drvr_0, SIZE);
   XCustomized_ip_block_Write_input_port_axi_lite_drvr_1_Words(&HlsMacc, 0, input_port_axi_lite_drvr_1, SIZE);

   if (XCustomized_ip_block_IsReady(&HlsMacc))
      print("HLS peripheral is ready.  Starting... ");
   else {
      print("!!! HLS peripheral is not ready! Exiting...\n\r");
      exit(-1);
   }

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

   if (InterruptEnable_IP) { // use interrupt
      hls_macc_start(&HlsMacc);
      while(!ResultAvailHlsMacc)
         ; // spin
      XCustomized_ip_block_Read_output_port_axi_lite_drvr_0_Words(&HlsMacc, 0, output_port_axi_lite_drvr_0, SIZE);
      XCustomized_ip_block_Read_output_port_axi_lite_drvr_1_Words(&HlsMacc, 0, output_port_axi_lite_drvr_1, SIZE);

      print("Interrupt received from HLS HW.\n\r");
   } else { // Simple non-interrupt driven test
	   XCustomized_ip_block_Start(&HlsMacc);
      do {
         XCustomized_ip_block_Read_output_port_axi_lite_drvr_0_Words(&HlsMacc, 0, output_port_axi_lite_drvr_0, SIZE);
         XCustomized_ip_block_Read_output_port_axi_lite_drvr_1_Words(&HlsMacc, 0, output_port_axi_lite_drvr_1, SIZE);
         // res_verilog = XHls_macc_Get_result(&HlsMacc);
      } while (!XCustomized_ip_block_IsReady(&HlsMacc));
      print("Detected HLS peripheral complete. Result received.\n\r");
   }

   #ifdef TIMER_AVAILABLE
	  // Se finaliza la lectura del Timer y se obtienen los resultados
	  end_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	  run_time = end_time - begin_time - calibration;
	  xil_printf("\nTotal run time is %d cycles \r\n", run_time);
   #endif


   // Validación de los resultados
   status = 0;
   for (i=0; i < SIZE; i++){
   	  if(output_port_axi_lite_drvr_0[i] != input_port_axi_lite_drvr_1[i]){
   	     xil_printf("\nError at driver 0. Element number %d. Expected data: 0x%08X. Received data: 0x%08X. \r\n", i, input_port_axi_lite_drvr_1[i], output_port_axi_lite_drvr_0[i]);
   	     status = 1;
   	  }
   	  if(output_port_axi_lite_drvr_1[i] != input_port_axi_lite_drvr_0[i]){
   	   	 xil_printf("\nError at driver 1. Element number %d. Expected data: 0x%08X. Received data: 0x%08X. \r\n", i, input_port_axi_lite_drvr_0[i], output_port_axi_lite_drvr_1[i]);
   	   	 status = 1;
   	  }
   }

   if (status){
	  print("Validation failed. \n\r");
	  exit(-1);
   }
   else{
	  print("Successful Validation. \n\r");
   }

   cleanup_platform();
   return 0;
}


int hls_macc_init(XCustomized_ip_block *hls_maccPtr)
{
	XCustomized_ip_block_Config *cfgPtr;
   int status;

   cfgPtr = XCustomized_ip_block_LookupConfig(XPAR_CUSTOMIZED_IP_BLOCK_0_DEVICE_ID);
   if (!cfgPtr) {
      print("ERROR: Lookup of accelerator configuration failed.\n\r");
      return XST_FAILURE;
   }
   status = XCustomized_ip_block_CfgInitialize(hls_maccPtr, cfgPtr);
   if (status != XST_SUCCESS) {
      print("ERROR: Could not initialize accelerator.\n\r");
      return XST_FAILURE;
   }
   return status;
}

void hls_macc_start(void *InstancePtr){
	XCustomized_ip_block *pAccelerator = (XCustomized_ip_block *)InstancePtr;
	XCustomized_ip_block_InterruptEnable(pAccelerator,1);
	XCustomized_ip_block_InterruptGlobalEnable(pAccelerator);
	XCustomized_ip_block_Start(pAccelerator);
}

void hls_macc_isr(void *InstancePtr){
	XCustomized_ip_block *pAccelerator = (XCustomized_ip_block *)InstancePtr;

   //Disable the global interrupt
	XCustomized_ip_block_InterruptGlobalDisable(pAccelerator);
   //Disable the local interrupt
	XCustomized_ip_block_InterruptDisable(pAccelerator,0xffffffff);

   // clear the local interrupt
	XCustomized_ip_block_InterruptClear(pAccelerator,1);

   ResultAvailHlsMacc = 1;
   // restart the core if it should run again
   if(RunHlsMacc){
      hls_macc_start(pAccelerator);
   }
}

int setup_interrupt()
{
   //This functions sets up the interrupt on the ARM
   int result;
   XScuGic_Config *pCfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
   if (pCfg == NULL){
      print("Interrupt Configuration Lookup Failed\n\r");
      return XST_FAILURE;
   }
   result = XScuGic_CfgInitialize(&ScuGic,pCfg,pCfg->CpuBaseAddress);
   if(result != XST_SUCCESS){
      return result;
   }
   // self test
   result = XScuGic_SelfTest(&ScuGic);
   if(result != XST_SUCCESS){
      return result;
   }
   // Initialize the exception handler
   Xil_ExceptionInit();
   // Register the exception handler
   //print("Register the exception handler\n\r");
   Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,&ScuGic);
   //Enable the exception handler
   Xil_ExceptionEnable();
   // Connect the Adder ISR to the exception table
   //print("Connect the Adder ISR to the Exception handler table\n\r");
   result = XScuGic_Connect(&ScuGic,XPAR_FABRIC_CUSTOMIZED_IP_BLOCK_0_INTERRUPT_INTR,(Xil_InterruptHandler)hls_macc_isr,&HlsMacc);
   if(result != XST_SUCCESS){
      return result;
   }
   //print("Enable the Adder ISR\n\r");
   XScuGic_Enable(&ScuGic,XPAR_FABRIC_CUSTOMIZED_IP_BLOCK_0_INTERRUPT_INTR);
   return XST_SUCCESS;
}

