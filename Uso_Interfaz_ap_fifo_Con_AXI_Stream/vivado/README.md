# Descripción del contenido de esta carpeta

En esta carpeta se encuentra dos subcarpetas, la primera carpeta llamada script, contiene el script tcl que genera todo el proyecto de vivado y la segunda llamada, src_Verilog, contiene el código de un inversor en Verilog, el cual se utiliza para las banderas full y empty del FIFO Generator. 


## Configuración del proyecto

Para crear el proyecto en Vivado lo primero que se debe hacer es abrir Vivado dentro de esta carpeta. ***Nota: Vivado deberá lanzarse exactamente dentro de esta carpeta, no lo haga dentro de la carpeta script porque el script tcl se caerá ya que no encontrará ni el IP en HLS, ni el código del inversor.***
```
vivado &
```
Una vez abierto Vivado, se deberá seleccionar la pestaña de Tools y se elige la opción de Run Tcl Script, luego entre a la carpeta llamada script y seleccioné el archivo tcl llamado script_To_Create_Vivado_project.tcl contenido dentro de ésta. Así, todo el proyecto se generará hasta que finalmente,el bitstream sea generado. ***Seguir este orden es indispensable ya que si Vivado se ejecuta en otra ruta, no se encontrarán los archivos fuentes del IP y del inversor.***



## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
