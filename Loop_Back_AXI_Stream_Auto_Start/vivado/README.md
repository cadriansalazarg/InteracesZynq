# Descripción del contenido de esta carpeta

En esta carpeta se encuentra contenido el script tcl que se encarga de generar todo el proyecto en Vivado. En dicho proyecto de Vivado, se agrega el Zynq como elemento de procesamiento de software, se agrega el IP core personalzado del LoopBack, un AXI DMA para la comunicación entre el IP y el Zynq. Además, se utiliza AXI_Lite para el control del IP personalizado, el DMA y un AXI Timer, el cual será utilizado para medir el tiempo de procesamiento. Además se interconectan todas las interrupciones tanto del DMA como del IP. Finalmente se realiza la interconexión adecuada de todo y se setean los parámetros necesarios para que todo funcione.

## Configuración del proyecto

Para crear el proyecto en Vivado lo primero que se debe hacer es abrir Vivado dentro de esta carpeta.
```
vivado &
```
Una vez abierto Vivado, se deberá seleccionar la pestaña de Tools y se elige la opción de Run Tcl Script, luego se selecciona el script tcl contenido dentro de esta carpeta y nombrado como script_dma_LoopBack_IP.tcl. Así, todo el proyecto se generará hasta que finalmente,el bitstream sea generado.

## Posibles errores en la ejecución del script

Ambos scripts consideran que la PC donde se ejecuta puede realizar 8 jobs. Si la PC solo es capaz de ejecutar 4 de forma simultánea la ejecución va dar un error y de deberá buscar dentro del script la palabra jobs 8 y reemplazarla por jobs 4. Adicionalmente, en caso contrario donde este script se ejecute en una PC muy potente, se recomienda subir los jobs a lo máximo que da la PC para maximizar el rendimiento.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
