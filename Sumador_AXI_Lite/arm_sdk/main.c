#include <stdio.h>
#include "platform.h"
// Add BSP header files
#include <stdlib.h>  // Standard C functions, e.g. exit()
#include <stdbool.h> // Provides a Boolean data type for ANSI/ISO-C
#include "xparameters.h" // Parameter definitions for processor periperals
#include "xscugic.h"     // Processor interrupt controller device driver
#include "xadder.h"   // Device driver for HLS HW block
#include "xtmrctr.h"

const bool InterruptEnable_IP = true; //true IP works with interrupts, //false IP works with polling


#define XPAR_AXI_TIMER_DEVICE_ID 		(XPAR_AXI_TIMER_0_DEVICE_ID)

// HLS macc HW instance
XAdder HlsMacc;
//Interrupt Controller Instance
XScuGic ScuGic;

// Timer instance
XTmrCtr timer_dev;

// Global variable definitions - used by ISR
volatile static int RunHlsMacc = 0;
volatile static int ResultAvailHlsMacc = 0;


// Setup and helper functions
int setup_interrupt();
int hls_macc_init(XAdder *hls_maccPtr);
void hls_macc_start(void *InstancePtr);
// The ISR prototype
void hls_macc_isr(void *InstancePtr);
// Software model of HLS hardware
void sw_macc(float a[10], float b[10], float Q[10]);

int main()
{
   int k;
   int status;
   int length = 10;
   float OpeA[10] = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f, 9.0f, 10.0f};
   float OpeB[10] = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f, 9.0f, 10.0f};
   float Result_HW_Q[10];
   float Result_SW_Q[10];
   int Data_Input = 30;
   int Data_Output;

   unsigned int init_time, curr_time, calibration;
   unsigned int begin_time;
   unsigned int end_time;
   unsigned int run_time = 0;


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

   // Setup HW timer
   status = XTmrCtr_Initialize(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
   if(status != XST_SUCCESS){
	   xil_printf("Error: timer setup failed\n");
	   return XST_FAILURE;
   }
   XTmrCtr_SetOptions(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID, XTC_ENABLE_ALL_OPTION);

   //set the input parameters of the HLS block

   XAdder_Write_A_Words(&HlsMacc, 0, (int *)OpeA, length);
   XAdder_Write_B_Words(&HlsMacc, 0, (int *)OpeB, length);
   XAdder_Set_DataInput(&HlsMacc, Data_Input);

   if (XAdder_IsReady(&HlsMacc))
      print("HLS peripheral is ready.  Starting... ");
   else {
      print("!!! HLS peripheral is not ready! Exiting...\n\r");
      exit(-1);
   }

   // Calibrate HW timer
   XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
   init_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
   curr_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
   calibration = curr_time - init_time;

   // Se inicia el timer para la  medición
   XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
   begin_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);

   if (InterruptEnable_IP) { // use interrupt
      hls_macc_start(&HlsMacc);
      while(!ResultAvailHlsMacc)
         ; // spin
      XAdder_Read_Q_Words(&HlsMacc, 0, (int *)Result_HW_Q, length);
      Data_Output = XAdder_Get_DataOutput(&HlsMacc);
      print("Interrupt received from HLS HW.\n\r");
   } else { // Simple non-interrupt driven test
	   XAdder_Start(&HlsMacc);
      do {
    	  XAdder_Read_Q_Words(&HlsMacc, 0, (int *)Result_HW_Q, length);
    	  Data_Output = XAdder_Get_DataOutput(&HlsMacc);
      } while (!XAdder_IsReady(&HlsMacc));
      print("Detected HLS peripheral complete. Result received.\n\r");
   }

   end_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
   run_time = end_time - begin_time - calibration;

   printf("\nTotal run time is %d cycles.\n", run_time);

   sw_macc(OpeA, OpeB, Result_SW_Q);
   for (k= 0; k<10;k++){
	   printf("SW: %f. HW: %f.\n",Result_SW_Q[k],Result_HW_Q[k]);
   }

   printf("Data Output: %d.\n",Data_Output);

   cleanup_platform();
   return status;
}

void sw_macc(float a[10], float b[10], float Q[10])
{
   for(int i=0; i<10; i++){
	   Q[i] = a[i] + b[i];
   }
}

int hls_macc_init(XAdder *hls_maccPtr)
{
	XAdder_Config *cfgPtr;
   int status;

   cfgPtr = XAdder_LookupConfig(XPAR_ADDER_0_DEVICE_ID);
   if (!cfgPtr) {
      print("ERROR: Lookup of acclerator configuration failed.\n\r");
      return XST_FAILURE;
   }
   status = XAdder_CfgInitialize(hls_maccPtr, cfgPtr);
   if (status != XST_SUCCESS) {
      print("ERROR: Could not initialize accelerator.\n\r");
      return XST_FAILURE;
   }
   return status;
}

void hls_macc_start(void *InstancePtr){
	XAdder *pAccelerator = (XAdder *)InstancePtr;
   XAdder_InterruptEnable(pAccelerator,1);
   XAdder_InterruptGlobalEnable(pAccelerator);
   XAdder_Start(pAccelerator);
}

void hls_macc_isr(void *InstancePtr){
	XAdder *pAccelerator = (XAdder *)InstancePtr;

   //Disable the global interrupt
	XAdder_InterruptGlobalDisable(pAccelerator);
   //Disable the local interrupt
	XAdder_InterruptDisable(pAccelerator,0xffffffff);

   // clear the local interrupt
	XAdder_InterruptClear(pAccelerator,1);

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
   result = XScuGic_Connect(&ScuGic,XPAR_FABRIC_ADDER_0_INTERRUPT_INTR,(Xil_InterruptHandler)hls_macc_isr,&HlsMacc);
   if(result != XST_SUCCESS){
      return result;
   }
   //print("Enable the Adder ISR\n\r");
   XScuGic_Enable(&ScuGic,XPAR_FABRIC_ADDER_0_INTERRUPT_INTR);
   return XST_SUCCESS;
}
