# Descripción de esta carpeta

Esta carpeta contiene el software que deber ejecutar sobre el procesador Zynq utilizando Vivado SDK. Aquí el software diseñado envía un arreglo de 16 elementos de tipo entero vía AXI Lite hacia el IP personalizado. Luego, el software inicia la ejecución del IP y espera hasta que los resultados sean devueltos hacia el Zynq igualmente vía AXI Lite. Esta espera se realiza ya sea utilizando interrupciones o utilizando sondeo (polling), esta acción se controla mediante la constante InterruptEnable_IP, cuando está es true opera con interrupción y cuando esta es false opera con sondeo.

Finalmente se imprimen en la terminal los resultados.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
