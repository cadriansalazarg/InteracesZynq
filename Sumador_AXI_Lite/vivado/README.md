# Descripción del contenido de esta carpeta

En esta carpeta se encuentra contenido el script tcl que se encarga de generar todo el proyecto en Vivado. En dicho proyecto de Vivado, se agrega el Zynq como elemento de procesamiento de software, se agrega el IP core personalzado del Sumador, y un AXI TImer. Toda la comunicación entre estos dos últimos y el Zynq se realiza por AXI4-Lite.


## Configuración del proyecto

Para crear el proyecto en Vivado lo primero que se debe hacer es abrir Vivado dentro de esta carpeta.
```
vivado &
```
Una vez abierto Vivado, se deberá seleccionar la pestaña de Tools y se elige la opción de Run Tcl Script, luego se selecciona el script tcl contenido dentro de esta carpeta y nombrado como script_vivado.tcl. Así, todo el proyecto se generará hasta que finalmente,el bitstream sea generado.



## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
