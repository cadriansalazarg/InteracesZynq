# Desripción de la carpeta

Esta carpeta contiene el código fuente que se encarga de generar el loopback en su versión más simple de entender. En esta versión el tamaño del loopback es fijo, y definido por el macro SIZE contenido dentro del archivo loopback.hpp.

## Lista de documentos

Se encuentra dentro de esta carpeta los diferentes archuvos contenidos dentro de esta carpeta.

* *loopback.cpp:* Esta archivo contiene el código fuente que se encarga de generar el loopback.
* *loopback.hpp:* Este archivo contiene el header file asociado al loopback.
* *loopback_tb.cpp:* Este archivo contiene el testbench encargado de estimular el loopback.
* *directives.tcl:* Este archivo contiene todas las directivas tanto de los puertos de entrada que se declara como AXIStream, el control del IP el cual se realiza por AXI Lite, y optimizaciones como la aplicación de pipeline a los diferentes for y la directiva dataflow.
* *run_hls.tcl:* Este archivo se encarga de ejecutar de forma automatizada el IP core del Loopback.


## Creación del IP personalizado del Loopback

Se realiza mediante la ejecución del script  run_hls.tcl mediante la ejecución del comando.

```
vivado_hls -f run_hls.tcl
```

Esto se encargará de generar de forma automatizada el IP. Finalmente, en caso de que se desee explorar las caracteristicas del IP generado se deberá ejecutar el comando

```
vivado_hls -p hls_loop_back_axi_stream_prj/
```

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
