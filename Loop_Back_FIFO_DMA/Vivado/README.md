# Creación del proyecto en Vivado

## Descripción de la carpeta

Dentro de esta carpeta se encuentran dos scripts tcl llamados script_dma.tcl y script_dma_sg.tcl. El primero crea un proyecto llamado zedboard_axi_dma donde el DMA se configura sin utilizar el modo Scatter/Gather y el segundo crea el mismo proyecto pero configura el DMA para utilizar el modo Scatter/Gather.

## Ejecución del script que controla el proyecto

* Abra Vivado dentro de esta carpeta. Para abrir Vivado se utiliza el comando ```vivado &``` suponiendo que se exportaron correctamente las variables de ambiente de Vivado.
* Para ejecutar el script, click en la pestaña Tools y se selecciona la opción Run TCL Script. Luego se selecciona alguno de los dos scripts que se desea ejecutar. Si se quiere crear un proyecto donde el dma opere utilizando Scatter/Gather se selecciona el archivo script_dma_sg.tcl miéntras que si por el contrario se desea crear un proyecto que opere sin Scatter/Gather se selecciona el script script_dma.tcl.
* Espere hasta que el bitstream haya sido generado correctamente.


## Autores

El principal autor de este trabajo es:

* **Carlos Salazar-García** 

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
