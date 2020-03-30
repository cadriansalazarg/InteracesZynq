# Loop Back con DMAs e interfaz FIFO

## Descripción

Este proyecto presenta un caso de estudio tomado del sitio web disponible [aquí](http://www.fpgadeveloper.com/2014/08/using-the-axi-dma-in-vivado.html). El proyecto consiste en generar un loop back utilizando el DMA y un FIFO el cual es un IP de propietario de XIlinx, de esta forma los mismos datos que se envían deberán ser recibidos por el microprocesador Zynq. La aplicación se verificó utilizando el DMA en modo Scatter/Gather y sin Scatter/Gather. Adicionalmente, la aplicación se verificó utilizando sondeo (polling) e interrupciones.

Este proyecto constituye un primer acercamiento sobre el uso del DMA tanto desde Vivado como desde el SDK, por lo tanto es ideal para aquellos que no saben como se utiliza el DMA, para comprender su uso a un nivel básico.

A continuación se muestra una figura que ilustra desde una perspectiva de alto nivel el funcionamiento del sistema.

![Loopback utilizando una IP de XIlinx de FIFO donde se realizand transferencias desde y hacia el Zynq mediante el uso del DMA](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Loop_Back_FIFO_DMA/Picture/LoopBack_AXI4_Stream_Data_FIFO.png)

## Plataforma de hardware

Para verificar el funcionamiento del sistema, todo el sistema fue testeado  utilizando una tarjeta de evaluación ZedBoard.

## Herramienta de software

Se utilizó Vivado y Vivado SDK en su versión 2018.3. Además se requiere instalar Minicom y configurar el puerto serial para recibir los datos provenientes de la ZedBoard mediante UART. El puerto serial deberá configurarse con Minicom tal y como se describe [aquí](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug871-vivado-high-level-synthesis-tutorial.pdf) en la página 237 del documento. Todas estas herramientas se ejecutaron sobre Ubuntu 16.04.6 LTS. 

## Descripción de las carpetas

Dentro de este repositorio se encuentran tres carpetas llamadas  Vivado, SDK e Picture. La primera se encargada de crear todo el proyecto de Vivado automáticamente mediante el uso de scripts tcl. Se cuenta con dos scripts, uno cuando se desea utilizar el Scatter/Gather y otro cuando más bien se deshabilita. En la segunda se encuentran las diferentes versiones del software embebido que corre sobre el ARM y la última carpeta simplemente fue creada para agregar las imágenes como la utilizada en esta descripción por lo tanto, no aporta valor para crear el proyecto.

## Autores

El principal autor de este trabajo es:

* **Carlos Salazar-García** 

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 


