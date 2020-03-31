# Creación de un LoopBack utilizando HLS Stream

## Objetivo del proyecto

La creación de este proyecto tienen como objetivo familiarizarse con el flujo de trabajo necesario para comprender el uso de la interfaz de entrada y salida del HLS llamada ap_ctrl_chain para manejar el retorno de las funciones. 

## Descripción del proyecto

Este proyecto tiene como objetivo familiarizarse con la interfaz de E/S que proporciona el HLS llamada ap_ctrl_chain para manejar el retorno de las funciones. De esta forma, se puede crear IPs personalizados en HLS donde su inicio y continuación ya no depende del Zynq, sino que trabajand de forma independiente. Así, el Zynq ya no tiene que indicarle cuando iniciar al  IP y este trabajará de forma continua a la espera de que lleguen datos que puedan ser procesados. [Aquí](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug902-vivado-high-level-synthesis.pdf) se muestra un documento de Xilinx que explica muy bien como se utiliza el ap_ctrl_chain. La idea de esta interfaz, es familiarizarse con su uso ya que así, podrá integrarse a PlsticNet de forma muy simple sin necesidad de que el Zynq este controlando todo. De esta forma, los IP en los que se  pueda aplicar, estarán siempre iniciados pero esperando a que los datos de entrada lleguen. Además, una vez que todas las entradas con precesadas, no es necesario que la salida este lista sino que, en cuanto estas son procesadas, la señal ap_ready le indicará a la señal ap_continuos de que puede encadenar una nueva transacción. Lo cual favorece el objetivo de PlasticNet.

Finalmente en este tutorial se muestra un ejemplo de como construir un IP core personalizado en Vivado HLS. En este caso el IP es un loopback, donde tanto la entrada como la salida operan utilizando AXI Stream. De esta forma, el Zynq envia un arreglo de 2080 elementos, los datos pasan por el DMA y ingresan al IP vía AXI Stream, luego los datos son retornados igualmente vía AXI Stream, pasan por el DMA y llegan nuevamente al Zynq. Los datos son leídos en el Zynq vía sondeo (polling). La principal diferencia acá es que el Zynq no gobierna al IP, este se encuentra siempre ejecutandose gracias a la configuración seleccionada utilizando la interfaz ap_ctrl_chainseleccionada en el retorno de la función.

A continuación se muestra una figura que ilustra desde una perspectiva de alto nivel el funcionamiento del sistema.

![LoopBack personalizado generado en HLS y donde la comunicación con el Zynq se realiza por DMA. El retorno del IP se realiza utilizando ap_ctrl_chain por lo tanto no se requiere de la manipulación del Zynq sobre el IP para su uso.](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Loop_Back_AXI_Stream_Auto_Start/images/LoopBack_AXI_Stream_Auto_Start.png)

## Plataforma de hardware

Para verificar el funcionamiento del sistema, todo el sistema fue testeado  utilizando una tarjeta de evaluación ZedBoard.

## Herramienta de software

Como herramienta de diseño del software embebido en el cual se creó todo el proyecto se utilizó Vivado HLS, Vivado y Vivado SDK en su versión 2018.3. Además se requiere instalar Minicom y configurar el puerto serial para recibir los datos provenientes de la ZedBoard mediante UART. Todas estas herramientas se ejecutaron sobre Ubuntu 16.04.6 LTS. 

## Descripción de las carpetas

Dentro de este repositorio se encuentran cuatro carpetas llamadas hls, vivado, arm_sdk e imágenes. La primera es la encargada de generar el Ip customizado del loopback, la segunda encargada de crear todo el proyecto de Vivado automáticamente mediante un script tcl. En la tercera se encuentran el software embebido que corre sobre el ARM y la última carpeta simplemente fue creada para agregar las imágenes como la utilizada en esta descripción por lo tanto, no aporta valor para crear el proyecto.

## Descripción de pasos 

Para la ejecución de este proyecto, se debe seguir los pasos que se muestran en el video del siguiente [enlace](https://youtu.be/7ZEMxWgWtms).


## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

