# Descripción del contenido de esta carpeta

Esta carpeta contiene el script tcl llamado script_To_Create_Vivado_project.tcl que se encarga de construir todo el proyecto en Vivado. 

## Detalles del script


Preste especial atención a cómo se realiza la interconexión del IP personalizado generado en HLS con el IP propietario de Xilinx llamado FIFO Generator.

Preste especial atención a cómo se realiza la interconexión del RTL del bus y el IP propietario de Xilinx llamado FIFO Generator.

Note que cuando el Block Design instancia el bus, por defecto Vivado toma el RESET como si este se activa en bajo, esto inducirá a un error cuando se realiza la conexión automática. Por lo tanto, observe que en el script , antes de ejecutar la conexión automática, se le cambia con un comando tcl la polaridad al reset del bus a nivel del bloque generado.

El RTL del bus se instancia directamente desde la carpeta Buses_Serial_Paralelo/src_Verilog.

El RTL del bus contenido en dentro de la biblioteca Library.sv contenido dentro de la carpeta Buses_Serial_Paralelo/src_Verilog está descrito en System verilog. ***El block design de Vivado no admite RTLs generados en SystemVerilog, por lo tanto, para poder utilizar este, la recomendación de Xilinx es embeber el RTL dentro de otro RTL descrito en Verilog.*** Por lo tanto, se instancian en este proyecto además del bus, dos RTL uno es un Wrap descrito en System Verilog, el cual coloca los puertos de manera que sean instanciables por otro módulo en Verilog y finalmente, el Wrap en Verilog, instancia este Wrap en System Verilog pero con puertos compatibles, de esta forma es posible instanciar el bus dentro del proyecto.



## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
