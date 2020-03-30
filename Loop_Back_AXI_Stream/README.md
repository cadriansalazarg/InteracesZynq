# Creación de un LoopBack utilizando HLS Stream

## Objetivo del proyecto

La creación de este proyecto tienen como objetivo familiarizarse con el flujo de trabajo necesario para comprender el uso de la interfaz de entrada y salida del HLS llamada AXI Stream así como su comunicación con el Processing System mediante el uso de una interfaz DMA. 

## Descripción del proyecto

En este proyecto se creó un IP personalizado usando Vivado HLS, el cual recibe un arreglo de entrada y finalmente reenvia ese mismo arreglo hacia la salida, es decir, constituye en sí mismo la implementación de un LoopBack. Ambos la transmsión y recepción del arreglo se realizan utilizando la interfaz de comunicación AXI Stream. Todo lo que es el control del IP se realiza mendiante AXI Lite. Se crearon 3 versiones diferentes de este IP, en las primeras dos, el tamaño del arreglo es fijo, pero en ambas se utilizan diferentes estructura de codificación, y finalmente en la tercera versión, el tamaño del arreglo es variable hasta un máximo de 2048 elementos. Desde luego este máximo se puede aumentar pero requiere cambios a nivel de Vivado, no del HLS para lograrlo. Debe mencionarse además, que aunque el tamaño es variable, en casa transacción se debe específicar cual va ser el tamaño de cada mensaje, por lo tanto, dicho tamaño se controla mediante un entero al cual se le accesa mediante AXI Lite. Las diferentes versiones se encuentran dentro de la carpeta hls.

Luego, se creó un ambiente en Vivado donde se integra este IP personalizado con el Zynq. Para la comunicación entre el Zynq y el IP se utiliza el módulo AXI DMA sin Scatter/Gather utilizando el puerto de HP de la Zynq. Además se habilitaron las interrupciones para controlar el IP mediante interrupciones. Finalmente en el proyecto se agrega un AXI Timer, para poder extraer métricas del rendimiento de la ejecución del IP  y la velocidad de las transferencias con el DMA. Todo el entorno del proyecto se autogenera mediante un script. El script se encuentra dentro de la carpeta vivado.


Finalmente, se crearon distintas versiones de software que corren sobre el Zynq para testear la aplicación, donde en todos los casos se envía un arreglo y se espera hasta que el mismo sea devuelto a través de todo el flujo. Durante toda la transferencia se mide el tiempo de las transacciones para obtener metricas del desempeño.Así mismo, desde el software se pueden realizar N cantidades de pruebas de forma simultánea y el tamaño del arreglo a enviar se puede configurar igualmente mediante el uso de un parámetro. Las diferentes versiones se encuentran dentro de la carpeta arm_sdk.

A continuación se muestra una figura que ilustra desde una perspectiva de alto nivel el funcionamiento del sistema.

![LoopBack personalizado generado en HLS y donde la comunicación con el Zynq se realiza por DMA](https://raw.githubusercontent.com/cadriansalazarg/InteracesZynq/master/Loop_Back_AXI_Stream/images/LoopBack%20AXI%20Stream.png)

## Plataforma de hardware

Para verificar el funcionamiento del sistema, todo el sistema fue testeado  utilizando una tarjeta de evaluación ZedBoard.

## Herramienta de software

Como herramienta de diseño del software embebido en el cual se creó todo el proyecto se utilizó Vivado HLS, Vivado y Vivado SDK en su versión 2018.3. Además se requiere instalar Minicom y configurar el puerto serial para recibir los datos provenientes de la ZedBoard mediante UART. Todas estas herramientas se ejecutaron sobre Ubuntu 16.04.6 LTS. 

## Descripción de las carpetas

Dentro de este repositorio se encuentran cuatro carpetas llamadas hls, vivado, arm_sdk e imágenes. La primera es la encargada de generar el Ip customizado del loopback, la segunda encargada de crear todo el proyecto de Vivado automáticamente mediante un script tcl. En la tercera se encuentran las diferentes versiones del software embebido que corre sobre el ARM y la última carpeta simplemente fue creada para agregar las imágenes como la utilizada en esta descripción por lo tanto, no aport valor para crear el proyecto.

## Descripción de pasos 

_Lo primero que se debe hacer es crear  el IP personalizado, en Vivado HLS por lo tanto, dirijase en la consola de Linux hacia el interior de la carpeta hls._
```
cd hls
```
_Posteriormente, dentro de la carpeta hls se encuentran tres diferentes versiones del IP, escoja la que desea ejecutar y proceda a entrar al interior de la carpeta. Supondremos aquí que la versión del IP a crear es la más básica, el cual corresponde a la carpeta llamada _Posteriormente, dentro de la carpeta LoopBack_Simple_Structure por lo tanto debemos ingrear a esta y ejecutar el archivo run_hls.tcl localizado en su interior para automáticamente crear el IP personalizado._
```
cd LoopBack_Simple_Structure
```
```
vivado_hls -f run_hls.tcl
```
_Una vez que finaliza la creación del IP, se procede a crear todo el proyecto en Vivado, por lo tanto debemos ingresar a la carpeta vivado y lanzar vivado desde la terminal estando dentro de la carpeta vivado._
```
cd ../../vivado
```
```
vivado &
```
_Luego cuando vivado abre, seleccione la pestaña Tools y elija la opción llamada Run Tcl Script, posteriormente se selecciona el script llamado script_dma_LoopBack_IP.tcl y se le da la opción aceptar. Así, todo el proyecto se va a generar de forma automática hasta que termine de crear el bitstream._

_Antes de lanzar el SDK, finalizada la generación del bitstream, se le debeŕa seleccionar la pestaña File y se escoge la opción Export y se le da click a Export Hardware. Así, deberá aparecer una ventana emergente en la cual se deberá seleccionar la opción Include bitstream y darle click a OK. Posteriormente se debe lanzar el Vivado SDK seleccionando nuevamente la pestaña File y escogiendo la opción Launch SDK. Finalmente el Vivado SDK se abrirá._

_Asegúrese de haber programado la FPGA ya sea desde Vivado SDK o desde Vivado. Un LED azul encendido en la ZedBoard le indicará que está ya fue programada. Además,asegurese de conectar otro cable hacia la PC para conectar el UART de la ZedBoard hacia el puerto USB de la PC. Y abra el puerto utilizando Minicom, configurelo adecuadamente y dejelo abierto para utilizar la consola y monitorear el UART de la ZedBoard._

_Dentro del Vivado SDK seleccione la pestaña File, New y escoja la opción Application Project. Una ventana emergente se abrirá, deberá colocarsele un nombre adecuado, en este caso le pondremos el nombre helloworld y le damso click a la opción Next. Luego, cambiará la ventana emergente y se deberá seleccionar el Template de Helloworld y se le da la opción de Finish. Esto creará un template de proyecto Helloworld y aparecerán dos carpetas una llamada Helloworld y otra llamada Helloworld_bsp. Así, si se le da click derecho a la carpeta Helloworld de color azúl y se escoge la opción Run as y se elige la opción Launch on Hardware (System Debugger), deberá aparecer en la pantalla el mensaje Helloworld._

_Finalmente, despliegue la carpeta Helloworld, luego despliegue la subcarpeta src y finalmente  abra el archivo helloworld.c, luego borre todo el contenido de todo el archivo y cualquiera de las dos carpetas llamadas LoopBack_IP_DMA_simple_intr o LoopBack_IP_DMA_simple_polling, ambas son para transferencias de DMA de tamaño fijo, una utilizando interrupciones y otra polling. Así, seleccione la opción que prefiera, abra la carpeta que eligió y abra en un editor de texto el archivo llamado main.c. Copie su contenido y peguelo en el archivo helloworld.c. Reconstruya el proyecto, dandole click derecho a la carpeta color azul y seleccionando la opción Clean Project. Una vez que esto finaliza, ejecute el proyecto nuevamente seleccioanndo con click derecho la carpeta azul y escogiendo la opción Run as y eligiendo  Launch on Hardware (System Debugger).

## Tareas pendientes

A continuación se enlistan las tareas pendientes que se deben realizar:

* Limitar el máximo de las transferencias por AXI Stream, directamente desde el Vivado HLS, ya que de momento estas parecen no tener límite y más bien es Vivado quien lo limita mediante el parámetro del DMA Width of Length Buffer Register.
* Realizar una medición de tiempo de todas las versiones descritas aquí con el AXI Timer, así como el número de recursos utilizados para conocer cuales versiones son más eficientes.
* De acuerdo con el foro web descrito  [aquí](https://forums.xilinx.com/t5/Processor-System-Design/Axi-DMA-correct-parameters/td-p/639576). Para mejorar el rendimiento de las transferencias DMA se recomienda usar Scatter/Gather y aumentar el tamaño del parámetro del DMA llamado Max Burst Size, por lo tanto queda pendiente, elaborar una versión que utilice el modo Scatter/Gather del DMA y se compare su rendimiento contra la versión que ya es funcional de este repositorio.
* Manejar estas transferencias DMA y el control de los diferentes IPs utilizando directamente Linux en lugar del SDK como se utiliza aquí.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InteracesZynq/contributors) quíenes han participado en este proyecto. 

