# Simulación Post Place and Route de un Sistema Multi FPGA Homogenéneo

## Objetivo del proyecto

Este proyecto muestra como realizar la simulación de un sistema multi-FPGA homogéneo utilizando el simulador que incorpora Vivado. 

## Descripción del proyecto

Este proyecto describe como realizar la simulación Post Place and Route de un sistema multi-FPGA homogéneo. 

Un sistema multi-FPGA homogéneo se define como aquel sistema multi-FPGA donde todas las FPGA que componen el sistema, están ejecutando el mismo bitstream , es decir, cada FPGA contiene exactamente la misma estructura lógica de configuración y desde luego, todas las FPGAs son exactamente el mismo chip.

La simulación presentada aquí se realiza de dos formas, utilizando la GUI de Vivado o simplemente simulando todo en modo batch o como lo denomina Xilinx en Vivado (Non project mode). Se plantea implementar tanto el proyecto como la simulación en modo batch ya que,la simulación Post Place & Route es computacionalmente muy costosa, por lo tanto, combiene ejecutar esta en modo script para aprovechar al máximo los recursos computacionales durante la simulación.

En cuanto al diseño del proyecto,cada FPGA implementa un sumador full adder de un bit, cuyas entradas y salidas se encuentran registradas. Todos los puertos de entrada y de salida se encuentran atados a los PMODs, específicamente al PMOD JA1 y el clock se encuentra conectado al pin Y9. En cuanto al sistema multi-FPGA, El Cout de la FPGA1 se conecta al Cin de la FPGA 2, por lo tanto, el diseño, como sistema multi-FPGA es un sumador full adder de dos bits. 

## Plataforma de hardware

Para verificar el funcionamiento del sistema, todo el sistema fue simulado utilizando una tarjeta de evaluación ZedBoard.

## Herramienta de software

Como herramienta de diseño del software embebido en el cual se creó todo el proyecto se utilizó Vivado HLS, Vivado y Vivado SDK en su versión 2018.3. Además se requiere instalar Minicom y configurar el puerto serial para recibir los datos provenientes de la ZedBoard mediante UART. Todas estas herramientas se ejecutaron sobre Ubuntu 16.04.6 LTS. 

## Descripćión de la carpeta

Dentro de esta carpeta se encuentran dos subcarpetas, la primera llamada FPGA la cual contiene todo el diseño que se implementa dentro de la FPGA, su respectivo testbench y dos scripts tcl, los cuales permiten construir el diseño tanto en modo proyecto, como en modo no proyecto.  

La segunda carpeta nombrada Multi-FPGA_Simulation, contiene el TestBench del sistema multi-FPGA el cual se utiliza para simular todo el sistema multi-FPGA completo, así como cinco scripts en bash para simular todo el proyecto vía terminal los cuales permiten, compilar, elaborar, simular, plotear y limpiar el proyecto. Finalmente, se encuentra un archivo tcl, el cual contiene todos los parámetros de simulación.

## Descripción de pasos 




## Autores

Los principales autores de este trabajo son:

* **Alfonso Chacón Rodríguez** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

