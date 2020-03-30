# Loop Back con DMAs e interfaz FIFO

## Descripción

Este proyecto presenta un caso de estudio tomado del sitio web disponible [aquí](http://www.fpgadeveloper.com/2014/08/using-the-axi-dma-in-vivado.html). El proyecto consiste en generar un loop back utilizando el DMA y una interfaz FIFO, de esta forma los mismos datos que se envían deberán ser recibidos por el microprocesador Zynq. La aplicación se verificó utilizando el DMA en modo Scatter/Gather y sin Scatter/Gather. Adicionalmente, la aplicación se verificó utilizando sondeo (polling) e interrupciones.

## Versión de Vivado utilizada

Todo el proyecto fue creado utilizando la versión de Vivado 2018.3


