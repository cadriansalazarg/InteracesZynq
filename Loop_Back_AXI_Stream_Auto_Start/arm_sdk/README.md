# Descripción de esta carpeta

Esta carpeta contiene el software que deber ejecutar sobre el procesador Zynq utilizando Vivado SDK. Aquí el software diseñado siempre envía un arreglo de 2048 enteros, y finalmente, el software queda a la espera aplicando sondeo o interrupciones del DMA (dependiendo del archivo que se utilice, softwareSDK_polling.c para el caso de sondeo y el archivo softwareSDK_interrupciones.c para el caso de interrupciones), hasta que los datos retornan. Posterior a ello, se realiza una validación de los datos para comprobar que llegaron correctamente y finaliza un paso de simulación. El número de pasos de simulación se controla mediante la variable num_tests.

## Descripción de los arhivos contenidos aquí

Dentro de esta carpeta se encuentran dos versiones, una que opera con interrupciones y otra que opera con sondeo.

1) ***softwareSDK_polling.c:*** Versión del software que opera utilizando sondeo.
2) ***softwareSDK_interrupciones.c:*** Versión de software que opera utilizando interrupciones.

## Habilitar el AXI Timer

Ambas versiones del software, utilizan el AXI Timer, cuando se encuentra definido el macro ***TIMER_AVAILABLE***, por lo tanto, en caso de que se desee realizar mediciones de tiempo con el AXI Timer, se deberá agregar la bandera ***-DTIMER_AVAILABLE*** durante el proceso de compilación en Vivado SDK. Para hacer esto se dealiza los siguientes pasos:

1) Click derecho sobre la carpeta de la aplicación del proyecto (carpea color azúl) y se selecciona la opción C/C++ Build Settings.
2) En la pestaña de Tool Setting, se selecciona ARM v7 gcc compiler y se agrega la bandera en el Command line pattern, justo después de la opción $(FLAGS), de manera que quede de la siguiente forma ```${COMMAND} ${FLAGS} -DTIMER_AVAILABLE  ${OUTPUT_FLAG} ${OUTPUT_PREFIX}${OUTPUT} ${INPUTS}```. Si todo está correcto, debe observarse igual a como se observa en la siguiente imagen.

![LoopBack personalizado generado en HLS y donde la comunicación con el Zynq se realiza por DMA](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Loop_Back_AXI_Stream_Auto_Start/images/LoopBack_AXI_Stream_Auto_Start.png)

Figura 1. Captura de pantalla donde se muestra como se debe configurar el compilador del Vivado SDK para habilitar el macro TIMER_AVAILABLE y así, habilitar el timer.

3) Se le da click en Apply y se le da luego OK.
4) Luego se le da click derecho nuevamente a la carpeta de aplicación y se selecciona la opción, Clean Project. Así, es posible limpiar todo el proyecto y que se compilen el proyecto con el nuevo macro agregado.
5) Se ejecuta el proyecto, dandole click derecho al proyecto, seleccionado la opción Run As y escogiendo la opción Launch on Hardware (System Debugger).



## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
