# Interconexión entre los FIFOs y los Auroras en ambos sentidos de comunicación

## Objetivo de la carpeta

Albergar las descripciones de hardware de los bloques Aurora to FIFO y FIFO to Aurora, encargados de la comunicación entre los FIFOS y el Aurora. También, esta carpeta contiene una descripción de hardware encargada de la inicialización del Aurora.

## Descripción del contenido de las carpetas


***1) TestBench:*** Dentro de esta carpeta se encuentra los testbench de las unidades Aurora_init_tb.v, fifo_to_Aurora_One_lane_tb.v y fifo_to_Aurora_Two_lanes_tb.v

***2) hls_fpga1/Aurora_to_fifo:*** Dentro de estas carpetas, se encuentra el código en C y un script tcl para generar para generar un bloque de hardware en HLS encargado de generar la unidad Aurora_to_fifo. Se crearon 10 versiones de este bloque rotuladas como hls_fpga1/Aurora_to_fif0, hls_fpga2/Aurora_to_fifo, ..., hls_fpga10/Aurora_to_fifo. El objetivo de estas 10 versiones es colocar variantes de las diferentes ROMs que se encuentran dentro de este bloque. La ROM se genera con un arreglo inicializado en el archivo Aurora_to_fifo_IP.hpp, mediante la variable const unsigned char ROM_FOR_BUS_ID. Hay que asegurarse de siempre colocar esta variable al valor correcto.

***3) hls_fpga2/Aurora_to_fifo:*** Dentro de estas carpetas, se encuentra el código en C y un script tcl para generar para generar un bloque de hardware en HLS encargado de generar la unidad Aurora_to_fifo. Se crearon 10 versiones de este bloque rotuladas como hls_fpga1/Aurora_to_fif0, hls_fpga2/Aurora_to_fifo, ..., hls_fpga10/Aurora_to_fifo. El objetivo de estas 10 versiones es colocar variantes de las diferentes ROMs que se encuentran dentro de este bloque. La ROM se genera con un arreglo inicializado en el archivo Aurora_to_fifo_IP.hpp, mediante la variable const unsigned char ROM_FOR_BUS_ID. Hay que asegurarse de siempre colocar esta variable al valor correcto.

***4) hls_fpga3/Aurora_to_fifo:*** Dentro de estas carpetas, se encuentra el código en C y un script tcl para generar para generar un bloque de hardware en HLS encargado de generar la unidad Aurora_to_fifo. Se crearon 10 versiones de este bloque rotuladas como hls_fpga1/Aurora_to_fif0, hls_fpga2/Aurora_to_fifo, ..., hls_fpga10/Aurora_to_fifo. El objetivo de estas 10 versiones es colocar variantes de las diferentes ROMs que se encuentran dentro de este bloque. La ROM se genera con un arreglo inicializado en el archivo Aurora_to_fifo_IP.hpp, mediante la variable const unsigned char ROM_FOR_BUS_ID. Hay que asegurarse de siempre colocar esta variable al valor correcto.

***5) hls_fpga4/Aurora_to_fifo:*** Dentro de estas carpetas, se encuentra el código en C y un script tcl para generar para generar un bloque de hardware en HLS encargado de generar la unidad Aurora_to_fifo. Se crearon 10 versiones de este bloque rotuladas como hls_fpga1/Aurora_to_fif0, hls_fpga2/Aurora_to_fifo, ..., hls_fpga10/Aurora_to_fifo. El objetivo de estas 10 versiones es colocar variantes de las diferentes ROMs que se encuentran dentro de este bloque. La ROM se genera con un arreglo inicializado en el archivo Aurora_to_fifo_IP.hpp, mediante la variable const unsigned char ROM_FOR_BUS_ID. Hay que asegurarse de siempre colocar esta variable al valor correcto.

***6) hls_fpga5/Aurora_to_fifo:*** Dentro de estas carpetas, se encuentra el código en C y un script tcl para generar para generar un bloque de hardware en HLS encargado de generar la unidad Aurora_to_fifo. Se crearon 10 versiones de este bloque rotuladas como hls_fpga1/Aurora_to_fif0, hls_fpga2/Aurora_to_fifo, ..., hls_fpga10/Aurora_to_fifo. El objetivo de estas 10 versiones es colocar variantes de las diferentes ROMs que se encuentran dentro de este bloque. La ROM se genera con un arreglo inicializado en el archivo Aurora_to_fifo_IP.hpp, mediante la variable const unsigned char ROM_FOR_BUS_ID. Hay que asegurarse de siempre colocar esta variable al valor correcto.

***7) hls_fpga6/Aurora_to_fifo:*** Dentro de estas carpetas, se encuentra el código en C y un script tcl para generar para generar un bloque de hardware en HLS encargado de generar la unidad Aurora_to_fifo. Se crearon 10 versiones de este bloque rotuladas como hls_fpga1/Aurora_to_fif0, hls_fpga2/Aurora_to_fifo, ..., hls_fpga10/Aurora_to_fifo. El objetivo de estas 10 versiones es colocar variantes de las diferentes ROMs que se encuentran dentro de este bloque. La ROM se genera con un arreglo inicializado en el archivo Aurora_to_fifo_IP.hpp, mediante la variable const unsigned char ROM_FOR_BUS_ID. Hay que asegurarse de siempre colocar esta variable al valor correcto.

***8) hls_fpga7/Aurora_to_fifo:*** Dentro de estas carpetas, se encuentra el código en C y un script tcl para generar para generar un bloque de hardware en HLS encargado de generar la unidad Aurora_to_fifo. Se crearon 10 versiones de este bloque rotuladas como hls_fpga1/Aurora_to_fif0, hls_fpga2/Aurora_to_fifo, ..., hls_fpga10/Aurora_to_fifo. El objetivo de estas 10 versiones es colocar variantes de las diferentes ROMs que se encuentran dentro de este bloque. La ROM se genera con un arreglo inicializado en el archivo Aurora_to_fifo_IP.hpp, mediante la variable const unsigned char ROM_FOR_BUS_ID. Hay que asegurarse de siempre colocar esta variable al valor correcto.

***9) hls_fpga8/Aurora_to_fifo:*** Dentro de estas carpetas, se encuentra el código en C y un script tcl para generar para generar un bloque de hardware en HLS encargado de generar la unidad Aurora_to_fifo. Se crearon 10 versiones de este bloque rotuladas como hls_fpga1/Aurora_to_fif0, hls_fpga2/Aurora_to_fifo, ..., hls_fpga10/Aurora_to_fifo. El objetivo de estas 10 versiones es colocar variantes de las diferentes ROMs que se encuentran dentro de este bloque. La ROM se genera con un arreglo inicializado en el archivo Aurora_to_fifo_IP.hpp, mediante la variable const unsigned char ROM_FOR_BUS_ID. Hay que asegurarse de siempre colocar esta variable al valor correcto.

***10) hls_fpga9/Aurora_to_fifo:*** Dentro de estas carpetas, se encuentra el código en C y un script tcl para generar para generar un bloque de hardware en HLS encargado de generar la unidad Aurora_to_fifo. Se crearon 10 versiones de este bloque rotuladas como hls_fpga1/Aurora_to_fif0, hls_fpga2/Aurora_to_fifo, ..., hls_fpga10/Aurora_to_fifo. El objetivo de estas 10 versiones es colocar variantes de las diferentes ROMs que se encuentran dentro de este bloque. La ROM se genera con un arreglo inicializado en el archivo Aurora_to_fifo_IP.hpp, mediante la variable const unsigned char ROM_FOR_BUS_ID. Hay que asegurarse de siempre colocar esta variable al valor correcto.

***11) src_Verilog:*** Dentro de esta carpeta, se encuentra los archivos .v de los bloques Aurora_init.v y fifo_to_Aurora.v. El primero se encarga de inicializar el Aurora, mediante un manejo adecuado de los resets, el segundo se encarga de realizar de tomar los datos de la FIFO, y transmitirlos en AXI Stream hacia la FIFO.


## Autores

Los principales autores de este trabajo son:

* **Carlos Salazar-García** - *Diseño y documentación* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

