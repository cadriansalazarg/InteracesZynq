#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "customized_IP.hpp"


int main(){
	
  data_t Test_Start_Value_drvr_0 = 0x01000000;  // El primer 01 indica que el destino será el driver 1, y el segundo 00 indica que la fuente es el driver 0
  data_t Test_Start_Value_drvr_1 = 0x00010000;  // El primer 00 indica que el destino será el driver 0, y el segundo 01 indica que la fuente es el driver 1
  int i, j;
  
  data_t input_port_axi_lite_drvr_0[SIZE];    // Entrada de datos del IP para el driver 0 enviados desde el micro hacia el IP vía AXI Lite
  data_t input_port_axi_lite_drvr_1[SIZE];    // Entrada de datos del IP para el driver 1 enviados desde el micro hacia el IP vía AXI Lite
  
  hls::stream<data_t> input_fifo_drvr_0;   // Entrada del fifo que emula el driver 0
  hls::stream<data_t> output_fifo_drvr_0;  // Salida del fifo que emula el driver 0
  
  hls::stream<data_t> output_fifo_drvr_1;  // Entrada del fifo que emula el driver 1
  hls::stream<data_t> input_fifo_drvr_1;   // Salida del fifo que emula el driver 1
  
  data_t output_port_axi_lite_drvr_0_SW[SIZE];  //Salida teórica esperada del driver 0, se utiliza para validar
  data_t output_port_axi_lite_drvr_1_SW[SIZE];  //Salida teórica esperada del driver 1, se utiliza para validar
  
  data_t output_port_axi_lite_drvr_0_HW[SIZE];  //Salida vía AXI LITE proveniente del driver 0 en el Hardware
  data_t output_port_axi_lite_drvr_1_HW[SIZE];  //Salida vía AXI LITE proveniente del driver 1 en el Hardware
  
  data_t out_fifo_HLS; //Dato utilizado para almacenar temporalmente la salida de los FIFOs y poder comprobarla
  
  for (i=0; i<SIZE; i++){
      input_port_axi_lite_drvr_0[i] = Test_Start_Value_drvr_0 + i;
	  input_port_axi_lite_drvr_1[i] = Test_Start_Value_drvr_1 + i;
	  input_fifo_drvr_0.write(Test_Start_Value_drvr_1 + i);
	  input_fifo_drvr_1.write(Test_Start_Value_drvr_0 + i);
	  output_port_axi_lite_drvr_0_SW[i] = Test_Start_Value_drvr_1 + i;
	  output_port_axi_lite_drvr_1_SW[i] = Test_Start_Value_drvr_0 + i;
  }	
	
 
  for (j=1; j<= SimSteps; j++){
	  	  
	  customized_IP_block(output_fifo_drvr_0, input_fifo_drvr_0, output_fifo_drvr_1, input_fifo_drvr_1, output_port_axi_lite_drvr_0_HW, output_port_axi_lite_drvr_1_HW, input_port_axi_lite_drvr_0, input_port_axi_lite_drvr_1);
	  
	  
	  //************** Verificación del fifo de salida ************************************************************
	  i=0;
	  while(!output_fifo_drvr_1.empty()){ // Se verifica el funcionamiento del fifo de salida del driver 0
		  out_fifo_HLS = output_fifo_drvr_1.read();
		  if(out_fifo_HLS != input_port_axi_lite_drvr_1[i]){
				printf("Variable output_fifo_drvr_1.read. El valor del hardware es: 0x%08X. El valor esperado en el software es: 0x%08X. Iteración: %i. Elemento del arreglo: %i.\n", out_fifo_HLS, input_port_axi_lite_drvr_1[i], j, i);
		  }
		  i++;
	  }
	  
	  i=0;
	  while(!output_fifo_drvr_0.empty()){ // Se verifica el funcionamiento del fifo de salida del driver 1
		  out_fifo_HLS = output_fifo_drvr_0.read();
		  if(out_fifo_HLS != input_port_axi_lite_drvr_0[i]){
				printf("Variable output_fifo_drvr_0.read. El valor del hardware es: 0x%08X. El valor esperado en el software es: 0x%08X. Iteración: %i. Elemento del arreglo: %i.\n", out_fifo_HLS, input_port_axi_lite_drvr_0[i], j, i);
		  }
		  i++;
	  }
	  
	  
	  // ****************   Verificación de la variable de salida out_axi_lite ***********************************************
	  
	  for (i=0; i<SIZE; i++){ // Se verifica que lo recibido por el fifo del drvr 0 sea correcto
		if(output_port_axi_lite_drvr_0_SW[i] != output_port_axi_lite_drvr_0_HW[i]){ // Se verifica el arreglo de salida ResultOpe // Se cambia la variable OpeA por OpeA1
			printf("El valor output_port_axi_lite_drvr_0 en hardware es: 0x%08X. El valor de esperado  en software es: 0x%08X. Iteración: %i. Elemento del arreglo: %i. \n", output_port_axi_lite_drvr_0_HW[i], output_port_axi_lite_drvr_0_SW[i],j, i);
			return 1;
		}
	  }
	  
	  for (i=0; i<SIZE; i++){ // Se verifica que lo recibido por el fifo del drvr 0 sea correcto
		if(output_port_axi_lite_drvr_1_SW[i] != output_port_axi_lite_drvr_1_HW[i]){ // Se verifica el arreglo de salida ResultOpe // Se cambia la variable OpeA por OpeA1
			printf("El valor output_port_axi_lite_drvr_1 en hardware es: 0x%08X. El valor de esperado  en software es: 0x%08X. Iteración: %i. Elemento del arreglo: %i. \n", output_port_axi_lite_drvr_1_HW[i], output_port_axi_lite_drvr_1_SW[i],j, i);
			return 1;
		}
	  }
	  
	  // ************** Se carga el FIFO de entrada nuevamente *********************************************
	  if(j<= SimSteps-1){
		  for (i=0; i<SIZE; i++){
			input_fifo_drvr_0.write(Test_Start_Value_drvr_1 + i);
			input_fifo_drvr_1.write(Test_Start_Value_drvr_0 + i);
		  }
	  }
  }
	
  printf("La simulación funcionó satisfactoriamente. \n");  
  return 0;
}
