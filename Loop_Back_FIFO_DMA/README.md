# Loop Back con DMAs e interfaz FIFO

## Descripción

Este proyecto presenta un caso de estudio tomado del sitio web disponible [aquí](http://www.fpgadeveloper.com/2014/08/using-the-axi-dma-in-vivado.html). El proyecto consiste en generar un loop back utilizando el DMA y una interfaz FIFO, de esta forma los mismos datos que se envían deberán ser recibidos por el microprocesador Zynq. La aplicación se verificó utilizando el DMA en modo Scatter/Gather y sin Scatter/Gather. Adicionalmente, la aplicación se verificó utilizando sondeo (polling) e interrupciones.

A continuación se muestra una figura que ilustra desde una perspectiva de alto nivel el funcionamiento del sistema.

![Loopback utilizando una IP de XIlinx de FIFO donde se realizand transferencias desde y hacia el Zynq mediante el uso del DMA](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Loop_Back_AXI_FIFO_DMA/Picture/LoopBack_AXI4_Stream_Data_FIFO.png)

## Versión de Vivado utilizada

Todo el proyecto fue creado utilizando la versión de Vivado 2018.3


