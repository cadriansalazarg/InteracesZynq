# Descripción de esta carpeta

Esta carpeta contiene el software que deber ejecutar sobre el procesador Zynq utilizando Vivado SDK. Aquí el software diseñado envía dos arreglos cada uno con 10 elementos de tipo flotantes hacia elIP vía AXI4-Lite, luego inicia el IP e igualmente inicia el AXI Timer para medir el tiempo. Para recibir el dato, este se recibde de dos formas, ya sea con interrupciones o con sondeo (polling), esta acción se controla mediante la constante InterruptEnable_IP, cuando está es true opera con interrupción y cuando esta es false opera con sondeo. Cuando los datos son recibidos, se detiene el Timer, se imprime la medición de tiempo y se comparan los resultados obtenidos con un modelo de referencia ejecutado en el propio Zynq.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
