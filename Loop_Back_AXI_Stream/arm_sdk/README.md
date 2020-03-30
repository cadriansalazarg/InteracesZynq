# Descripción del contenido de esta carpeta

Dentro de esta carpeta se encuentran 4 carpetas, las cuales contienen diferentes versiones de software para ser ejecutado desde Vivado SDK y así, poder comprobar el correcto funcionamiento de todo el proyecto construido.

## Descripción de las subcarpetas.
Dentro de esta carpeta se encuentrans 4 subcarpetas, las cuales contienen diferentes versiones de software que corre sobre el microprocesador ARM. A continuación se detalla cada una de estas.

* *LoopBack_IP_DMA_simple_polling:* Esta versión debe utilizarse cuando el IP generado en en Vivado HLS fue cualquiera de los dos que cuyo tamaño de arreglo siempre está definido. Esta versión no es para tamaños del DMA variable. En este caso, la recepción de los datos se realiza vía sondeo (polling), por lo que no se utilizan las interrupciones.
* *LoopBack_IP_DMA_simple_intr:* Esta versión debe utilizarse cuando el IP generado en en Vivado HLS fue cualquiera de los dos que cuyo tamaño de arreglo siempre está definido. Esta versión no es para tamaños del DMA variable. En este caso, la recepción de los datos se realiza vía interrupciones.
* *LoopBack_IP_DMA_simple_polling_with_variable_dma_size:* Esta versión debe utilizarse cuando el IP generado en Vivado HLS fue la versión donde el tamaño del arreglo de entrada es variable y controlado mediante una variable llamada len_dma. Esta versión  es para tamaños del DMA variable. En este caso, la recepción de los datos se realiza vía sondeo (polling), por lo que no se utilizan las interrupciones.
* *LoopBack_IP_DMA_simple_intr_with_variable_dma_size:* Esta versión debe utilizarse cuando el IP generado en Vivado HLS fue la versión donde el tamaño del arreglo de entrada es variable y controlado mediante una variable llamada len_dma. Esta versión  es para tamaños del DMA variable. En este caso, la recepción de los datos se realiza vía interrupciones.

## Ejecución del software sobre la Zynq utilizando Vivado SDK

* Lo primero que se debe de hacer es en Vivado darle File, luego Export y finalmente Export Hardware. Se le debe dar click a incluir el bitstream y se le da OK.
* Luego se abre Vivado SDK dándole click a File y luego Launch SDK. De esta forma se abrirá Vivado SDK.
* Programar la FPGA, esto puede ser completado desde Vivado o desde el mismo Vivado SDK ya que el bitstream se incluyó.
* Conectar un cable adicional entre el UART de la ZedBoard y el puerto USB para recibir los datos provinientes de la ZedBoard vía interfaz serial UART.
* Abrir otra terminal y configurar minicom según la configuración que se presenta [aquí](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug871-vivado-high-level-synthesis-tutorial.pdf) en a página 237. Una vez configurado, abra ese puerto para recibir los datos de forma serial. Nota: Es posible utilizar la *SDK Terminal* en lugar de Minicom tal y como se muestra en esa misma página de ese documento, pero en ocasiones da problemas, por lo tanto, lo más recomendable es hacerlo con Minicom.
* Cree un nuevo proyecto utilizando la plantilla de Helloworld mediante la pestaña File, luego New, después Application Project. Así se abrirá una ventana emergente, se le pone un nombre adecuado, se le da Next y se selecciona la plantilla Helloworld.
* Con esto se creará dos carpetas con el nombre asignado, una con ese nombre asignado de color azul y otra llamada nombre asignado_bsp.
* Despliegue la carpeta azul, y en la subcarpeta src, abrá el archivo helloworld.c
* Seleccione el código que desea ejecutar sobre el microprocesador ARM contenido dentro de cualquiera de las 4 carpetas que tiene este folder. Recuerde elegir esta segun las caractersticas con que generó el hardware personalizado en Vivado HLS. Abra el archivo main.c de cualquiera de las subcarpetas y copie su contenido, y reemplacelo por el contenido del archivo helloworld.c
* Reconstruya el proyecto dándole click derecho a la carpeta color azúl y seleccionando la opción Clean Project.
* Finalmente ejecute el software sobre la ZedBoard, dándole click derecho a la  carpeta color azúl y seleccionando la opción *Run as* y luego dele click a la opción *Launch on Hardware (System Debugger)*.

## Cuidados al ejecutar el software

En aquellos casos donde el hardware fue creado utilizando cualquiera de los dos IP cores customizados donde el tamaño del arreglo es definido. Asegurese de que el macro SIZE en los archivos tanto el que opera con polling como el que opera con interrupciones tenga el mismo SIZE que el definido en la creación del hardware, De lo contrario, los tamaños del hardware y del software en el SDK no coincidiran y exisitirá un error.

Para aquellos casos donde el tamaño de los arreglos es de tamaño variable, asegurese de no exceder el valor del macro SIZE de 2048, ya que por defecto el tamaño máximo del buffer del DMA es de 2048 enteros. Solo se podrá exceder el tamaño cuando el parámetro del DMA Width of buffer length register  fue correctamente editado.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
