#include <iostream>
#include <vector>
#include <array>
#include <random>
#include "customized_IP.hpp"


int main(){
	
  data_t input_AXI_lite [SIZE] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
  int i, j;
  
  hls::stream<data_t> output_fifo; //Esta es la salida en formato tipo fifo que devuelve el hardware
  hls::stream<data_t> input_fifo; // Esta es la entrada en formato tipó fifo que será retroalimentada con los mismos datos que contiene la interfaz FIFO
  
  //auto values = std::vector<int>{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}; //Se agregó un elemento para corregir el desfase de los elementos
  //for(auto &v : values){input_fifo.write(v);}

  data_t Single_Element_Output_FIFO; // Se almacena un elemento del FIFO y se utiliza para la verificación del FIFO

  for (i=0; i<SIZE; i++) {
	  input_fifo.write(input_AXI_lite[i]);
  }
  
  data_t output_AXI_lite[SIZE]; // Esta variable la devuelve el hardware
  
  
  

    
  for (j=1; j<= SimSteps; j++){
	  	  
	  customized_IP_block(input_fifo, output_fifo, input_AXI_lite,  output_AXI_lite);
	  
	  // ************** Se carga el FIFO de entrada nuevamente *********************************************
	  if(j<= SimSteps-1){
		  for (i=0; i<SIZE; i++) {
			  input_fifo.write(input_AXI_lite[i]);
		  }
	  }
	  
	  //************** Verificación del fifo de salida ************************************************************
	  i=0;
	  while(!output_fifo.empty()){
		  //printf("El valor leído es: %i \n",output_fifo_HW.read());
		  Single_Element_Output_FIFO = output_fifo.read();
		  if(Single_Element_Output_FIFO != input_AXI_lite[i]){
				printf("El valor del hardware es: %i. El valor esperado en el software es: %i. Iteración: %i. Elemento del arreglo: %i.\n", Single_Element_Output_FIFO, input_AXI_lite[i], j, i);
		  }
		  i++;
	  }
	  
	  // ****************   Verificación el resultado del loopback devuelto vía AXI Lite ***********************************************
	  for (i=0; i<SIZE; i++){
		if(input_AXI_lite[i] != output_AXI_lite[i]){ // Se verifica el arreglo de salida ResultOpe // Se cambia la variable OpeA por OpeA1
			printf("El valor outaxilite en hardware es: %i. El valor de esperado  en software es: %i. Iteración: %i. Elemento del arreglo: %i. \n", output_AXI_lite[i], input_AXI_lite[i],j, i);
			return 1;
		}
	  }
  }
	
    
  return 0;
}



