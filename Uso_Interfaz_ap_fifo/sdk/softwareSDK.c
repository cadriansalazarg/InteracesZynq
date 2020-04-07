#include <stdio.h>
#include "platform.h"
#include <stdlib.h>  // Standard C functions, e.g. exit()
#include <stdbool.h> // Provides a Boolean data type for ANSI/ISO-C
#include "xparameters.h" // Parameter definitions for processor periperals
#include "xscugic.h"     // Processor interrupt controller device driver
#include "xcustomized_ip_block.h"   // Device driver for HLS HW block

#define SIZE 16 // Asegurarse que SIZE tenga el mismo valor, que el SIZE contenido en el archivo ../hls/customized_IP.hpp
const bool InterruptEnable_IP = true; //true IP works with interrupts, //false IP works with polling

// HLS macc HW instance
XCustomized_ip_block HlsMacc;

//Interrupt Controller Instance
XScuGic ScuGic;

// Global variable definitions - used by ISR
volatile static int RunHlsMacc = 0;
volatile static int ResultAvailHlsMacc = 0;

// Setup and helper functions
int setup_interrupt();
int customized_ip_block_init(XCustomized_ip_block *hls_maccPtr);
void customized_ip_block_start(void *InstancePtr);
// The ISR prototype
void hls_macc_isr(void *InstancePtr);
// Software model of HLS hardware
void sw_macc(int a, int b, int *accum, bool accum_clr);

int main()
{

   int input_axi_lite [SIZE];
   int output_axi_lite [SIZE];

   int status;
   int i;

   //Setup the matrix mult
   status = customized_ip_block_init(&HlsMacc);
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

   // Se inicializa la entrada con datos
   for (i=1; i <=SIZE; i++ )
	   input_axi_lite[i-1] = i;

   XCustomized_ip_block_Write_input_axi_lite_Words(&HlsMacc, 0, input_axi_lite, SIZE);

   if (XCustomized_ip_block_IsReady(&HlsMacc))
      print("HLS IP peripheral block is ready.  Starting... ");
   else {
      print("!!! HLS IP peripheral block is not ready! Exiting...\n\r");
      exit(-1);
   }

   if (InterruptEnable_IP) { // use interrupt
	   customized_ip_block_start(&HlsMacc);
      while(!ResultAvailHlsMacc)
         ; // spin
      XCustomized_ip_block_Read_output_axi_lite_Words(&HlsMacc, 0, output_axi_lite, SIZE);
      print("Interrupt received from HLS HW.\n\r");
   } else { // Simple non-interrupt driven test
	   customized_ip_block_start(&HlsMacc);
      do {
    	 XCustomized_ip_block_Read_output_axi_lite_Words(&HlsMacc, 0, output_axi_lite, SIZE);

      } while (!XCustomized_ip_block_IsReady(&HlsMacc));
      print("Detected HLS peripheral complete. Result received.\n\r");
   }

   // Validation
   for (i=0; i < SIZE; i++)
   	   printf("SW results: %d. HW results: %d. Element number: %d.\n\r", input_axi_lite[i], output_axi_lite[i], i);





   cleanup_platform();
   //return status;
   return 0;
}



int customized_ip_block_init(XCustomized_ip_block *hls_maccPtr)
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

void customized_ip_block_start(void *InstancePtr){
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
	   customized_ip_block_start(pAccelerator);
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

