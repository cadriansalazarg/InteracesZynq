## Descripción de la carpeta

Esta carpeta se utiliza para construir el diseño de hardware completo que se va a ejecutar dentro de las diferentes FPGA. Aquí se construye todo el diseño que va ser simulado. A continuación se describe detalladamente el contenido de la carpeta.

***1. Carpeta nombrada src_Verilog:*** Esta carpeta contiene todo el RTL del diseño, el cual en este caso corresponde, a un sumador full adder de un bit. Así las cosas, dentro de esta carpeta se encuentra un archivo llamado top_Design.v, el cual contiene el RTL de dicho diseño.

***2. Carpeta nombrada TestBench:*** Esta carpeta contiene el testbench en Verilog encargado de realizar la verificación funcional de nuestro diseño. Así, está carpeta contiene un archivo llamado TestBench_top_Design.v, la cual contiene el testbench encargado de simular el diseño.

***3. Carpeta nombrada constrs:*** Esta carpeta contiene toda la descripción de pines utilizada en el diseño. Para este caso, se utilizó el PMOD JA1 para todos los pines de entrada/salida y el pin Y9 para el reloj. Así, en esta carpeta se encuentra contenido un archivo XDC nombrado como pines.xdc, el cual contiene toda la descripción utilizada para la ZedBoard.

***4. Archivo nombrado como Run_my_design_Project_Mode.tcl:*** Script tcl el cual se encarga de construir todo el diseño en modo proyecto utilizando la interfaz GUI de Vivado.

***5. Archivo nombrado como Run_my_design_Non_Project_Mode.tcl:*** Script tcl el cual se encarga de construir todo el diseño utilizando el modo de no proyecto, es decir, utilizando la terminal directamente en modo bash.


## Pasos para construir el diseño utilizando la GUI de Vivado.

1) Dentro de esta terminal, abra la GUI de vivado mediante el comando:

```bash
vivado &
```

2) Tan pronto como la GUI de Vivado abra, seleecione la pestaña Tools y elija la opción Run Tcl Script... 

3) Tan pronto como aparezca la ventana emergente, seleccione el archivo Run_my_design_Project_Mode.tcl y dele click a Open. Este script se encargará de crear el proyecto, agregar el archivo fuente, el archivo xdc file con la descripción de pines, y agregar dos archivos de simulación, uno para simular solo una FPGA y el segundo que emula el sistema multi-FPGA con dos FPGAs conectadas. Luego, el script automáticamente realiza la síntesis y la implementación del diseño, necesarias para poder realizar la simulación post Place & Route.

4) Tan pronto como la implementación sea completada, aparecerá una ventana emergente llamada Implementation Completed. 

5) Ahora para realizar la simulación Post Place & Route del sistema multi-FPGA, primero en el Project Manager, en la parte de Sources, asegúrese en  Simulation Sources de que el TestBench_Multi_FPGA.v está colocado como Top.

6) Finalmente, en la opción de Simulation en el Flow Navigator, seleccione la opción de Simulation y para realizar la simulación post Place & Route elija la opción ***Run Post-Implementation Timing Simulation***. Así la simulación iniciará. Sugerencia. Siempre realice primero una simulación de comportamiento antes de realizar una simulación post Place & Route.

## Pasos para construir el diseño utilizando el modo Non Project de Vivado

El modo de no proyecto de Vivado permite construir un diseño sin la necesidad de utilizar la GUI de Vivado, utilizando para ello únicamente la terminal. Así, se maximiza el rendimiento en la construcción del diseño y es una opción siempre que se desee ganar tiempo. Para construir todo el diseño basta con únicamente ejecutar el script tcl nombrado como Run_my_design_Non_Project_Mode.tcl mediante el comando:

```bash
vivado -mode batch -source Run_my_design_Non_Project_Mode.tcl
```

Esto generará una carpeta llamada Netlist_Files la cual contendrá el diseño compilado dentro de un archivo llamado Top_FPGA_netlist.v y su respectivo archivo Top_FPGA.sdf. Estos dos archivos son los necesarios para realizar la simulación Post Place & Route directamente desde la terminal. Todos los detalles de como ejecutar esta simulación desde la terminal, se encuentra en la carpeta Multi-FPGA_Simulation.


## Autores

Los principales autores de este trabajo son:

* **Alfonso Chacón Rodríguez** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto.
