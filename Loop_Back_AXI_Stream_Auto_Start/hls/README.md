# Descripción de la carpeta

Esta carpeta contiene el código fuente que se encarga de generar el loopback en su versión final donde utilizando una estructura productor consumidor se implementa el envió y recepción de arreglos de tamaño variable. El tamaño de este arreglo se control mediante la incorporación de una variable de entrada llamada len_dma. El tamaño máximo del arreglo lo define el tamaño del buffer interno, definido por el parámetro  depth de la directiva ```set_directive_stream -depth 2048 -dim 1 "loopback" bus_local``` localizada dentro del archivo directive_PC_VS.tcl. 

## Lista de documentos

Se encuentra dentro de esta carpeta los diferentes archuvos contenidos dentro de esta carpeta.

* *loopback_PC_VS.cpp:* Esta archivo contiene el código fuente que se encarga de generar el loopback.
* *loopback_PC_VS.hpp:* Este archivo contiene el header file asociado al loopback.
* *loopback_PC_VS_tb.cpp:* Este archivo contiene el testbench encargado de estimular el loopback.
* *directives_PC_VS.tcl:* Este archivo contiene todas las directivas tanto de los puertos de entrada que se declara como AXIStream, el control del IP el cual se realiza por AXI Lite, y optimizaciones como la aplicación de pipeline a los diferentes for y la directiva dataflow. Además 
* *run_hls_PC_VS.tcl:* Este archivo se encarga de ejecutar de forma automatizada el IP core del Loopback.


## Creación del IP personalizado del Loopback

Se realiza mediante la ejecución del script  run_hls_PC_VS.tcl mediante la ejecución del comando.

```
vivado_hls -f run_hls_PC_VS.tcl
```

Esto se encargará de generar de forma automatizada el IP. Finalmente, en caso de que se desee explorar las caracteristicas del IP generado se deberá ejecutar el comando

```
vivado_hls -p hls_loop_back_axi_stream_prj/
```

## Tareas pendientes

Explorar adecuadamente el funcionamiento de los parámetros depth y dim de la directiva ```set_directive_stream -depth 2048 -dim 1 "loopback" bus_local```. Con el fin de conocer si se está utilizando bien o no.

## Limitaciones

El tamaño máximo que puede ser seleccionado es 2048, aunque en realidad pueden ser números más grandes, en Vivado, las transferencias dma fueron seteadas a un valor máximo de 2048 enteros, por lo tanto si se desea extender dicho máximo deberá cambiarse el parámetro del DMA llamado *Width of buffer length register*. En este momento se encuentra seteado en 16, loq eu implica que se pueden enviar 2^16 bits, es decir, 65536 bits, lo que equivale a 2048 elementos de tipo int. el máximo valor que se le puede ajustar a este parámetro es 26, lo que implica que hay bastante más rango para extender su funcionamiento.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
