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

Como herramienta de diseño del software embebido en el cual se creó todo el proyecto se utilizó Vivado HLS, Vivado y Vivado SDK en su versión 2018.3. Además todas estas herramientas se ejecutaron sobre Ubuntu 16.04.6 LTS. 

## Descripción de las carpetas

Dentro de este repositorio se encuentran cuatro carpetas llamadas hls, vivado, arm_sdk e imágenes. La primera es la encargada de generar el Ip customizado del loopback, la segunda encargada de crear todo el proyecto de Vivado automáticamente mediante un script tcl. En la tercera se encuentran las diferentes versiones del software embebido que corre sobre el ARM y la última carpeta simplemente fue creada para agregar las imágenes como la utilizada en esta descripción por lo tanto, no aport valor para crear el proyecto.

## Descripción de pasos 

_Una serie de ejemplos paso a paso que te dice lo que debes ejecutar para tener un entorno de desarrollo ejecutandose_

_Dí cómo será ese paso_

```
Da un ejemplo
```

_Y repite_

```
hasta finalizar

```


A continuación se enlistan las tareas pendientes que se deben realizar:

* Limitar el máximo de las transferencias por AXI Stream, directamente desde el Vivado HLS, ya que de momento estas parecen no tener límite y más bien es Vivado quien lo limita mediante el parámetro del DMA Width of Length Buffer Register.
* Realizar una medición de tiempo de todas las versiones descritas aquí con el AXI Timer, así como el número de recursos utilizados para conocer cuales versiones son más eficientes.
* De acuerdo con el foro web descrito  [aquí](https://forums.xilinx.com/t5/Processor-System-Design/Axi-DMA-correct-parameters/td-p/639576). Para mejorar el rendimiento de las transferencias DMA se recomienda usar Scatter/Gather y aumentar el tamaño del parámetro del DMA llamado Max Burst Size, por lo tanto queda pendiente, elaborar una versión que utilice el modo Scatter/Gather del DMA y se compare su rendimiento contra la versión que ya es funcional de este repositorio.
* Manejar estas transferencias DMA y el control de los diferentes IPs utilizando directamente Linux en lugar del SDK como se utiliza aquí.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

