# Creación de un LoopBack utilizando HLS Stream

## Objetivo del proyecto

La creación de este proyecto tienen como objetivo familiarizarse con el flujo de trabajo necesario para comprender el uso de la interfaz de entrada y salida del HLS llamada AXI Stream así como su comunicación con el Processing System mediante el uso de una interfaz DMA. 

## Descripción del proyecto

En este proyecto se creó un IP personalizado usando Vivado HLS, el cual recibe un arreglo de entrada y finalmente reenvia ese mismo arreglo hacia la salida, es decir, constituye en sí mismo la implementación de un LoopBack. Ambos la transmsión y recepción del arreglo se realizan utilizando la interfaz de comunicación AXI Stream. Todo lo que es el control del IP se realiza mendiante AXI Lite. Se crearon 3 versiones diferentes de este IP, en las primeras dos, el tamaño del arreglo es fijo, pero en ambas se utilizan diferentes estructura de codificación, y finalmente en la tercera versión, el tamaño del arreglo es variable hasta un máximo de 2048 elementos. Desde luego este máximo se puede aumentar pero requiere cambios a nivel de Vivado, no del HLS para lograrlo. Debe mencionarse además, que aunque el tamaño es variable, en casa transacción se debe específicar cual va ser el tamaño de cada mensaje, por lo tanto, dicho tamaño se controla mediante un entero al cual se le accesa mediante AXI Lite. Las diferentes versiones se encuentran dentro de la carpeta hls.

Luego, se creó un ambiente en Vivado donde se integra este IP personalizado con el Zynq. Para la comunicación entre el Zynq y el IP se utiliza el módulo AXI DMA sin Scatter/Gather utilizando el puerto de HP de la Zynq. Además se habilitaron las interrupciones para controlar el IP mediante interrupciones. Finalmente en el proyecto se agrega un AXI Timer, para poder extraer métricas del rendimiento de la ejecución del IP  y la velocidad de las transferencias con el DMA. Todo el entorno del proyecto se autogenera mediante un script. El script se encuentra dentro de la carpeta vivado.


Finalmente, se crearon distintas versiones de software que corren sobre el Zynq para testear la aplicación, donde en todos los casos se envía un arreglo y se espera hasta que el mismo sea devuelto a través de todo el flujo. Durante toda la transferencia se mide el tiempo de las transacciones para obtener metricas del desempeño.Así mismo, desde el software se pueden realizar N cantidades de pruebas de forma simultánea y el tamaño del arreglo a enviar se puede configurar igualmente mediante el uso de un parámetro. Las diferentes versiones se encuentran dentro de la carpeta arm_sdk.

A continuación se muestra una figura que ilustra desde una perspectiva de alto nivel el funcionamiento del sistema.

![LoopBack personalizado generado en HLS y donde la comunicación con el Zynq se realiza por DMA](https://raw.githubusercontent.com/cadriansalazarg/InteracesZynq/master/Loop_Back_AXI_Stream/images/LoopBack%20AXI%20Stream.png)



