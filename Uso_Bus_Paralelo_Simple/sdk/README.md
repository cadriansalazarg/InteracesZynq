# Descripción de esta carpeta

Esta carpeta contiene el software que deber ejecutar sobre el procesador Zynq utilizando Vivado SDK. Aquí el software diseñado envía dos arreglo de 512 elementos de tipo entero vía AXI Lite hacia el IP personalizado. Luego, el software inicia la ejecución del IP y espera hasta que los resultados sean devueltos hacia el Zynq igualmente vía AXI Lite. Esta espera se realiza ya sea utilizando interrupciones o utilizando sondeo (polling), esta acción se controla mediante la constante InterruptEnable_IP, cuando está es true opera con interrupción y cuando esta es false opera con sondeo.

Finalmente se realiza una validación de los resultados y en caso de que esta funcione correctamente se imprimirá un mensaje llamado Successful Validation.

Por otro lado, se agregó un macro para utilizar el AXI TIMER llamado TIMER_AVAILABLE, por lo que en caso de que se quiera medir el tiempo de las transacciones, es posible realizarlo habilitando este macro.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
