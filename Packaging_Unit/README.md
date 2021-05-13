# Unidad de empaquetamiento punto a punto

Esta carpeta describe la funcionalidad del bloque de hardware creado en HLS, encargado de generar un IP core en HLS de la unidad de empaquetamiento. La unidad de empaquetamiento tiene por objetivo tomar un stream de datos enviado vía AXI Stream,  y generar un conjunto de paquetes que contenga la información transmitida.


A continuación se muestra una figura que ilustra el diagrama de entradas y salidas de esta unidad:

![Diseño modular que muestra el uso del bus paralelo ysu integración en el Block Design de Vivado](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/wikiimages/packaging_fig.PNG)

Debe ajustarse adecuadamente los parámetros de esta unidad que se encuentran en el archivo hls/packaging_IP.hpp. Se deben de editar dos parámetros los cuales se muestran a continuación:

***1) PACKAGE_SIZE_BYTES :*** Número de bytes de cada paquete. Este número debe incluir tanto el número de bytes del header, como el número de bytes del payload del mensaje. La suma de ambos será el valor de este parámetro.

***2) MESSAGE_SIZE_BYTES :*** Este parámetro especifica el número de bytes que serán transmitidos al Zynq, más 4 bytes. Por lo tanto, al número de bytes que se enviarán al Zynq, debe sumarsele 4 bytes para obtener este valor.

***2) MAXIMUM_MESSAGE_SIZE_BYTES  :*** Este parámetro especifica el máximo número de payload que transmitirá el Zynq. Se recomienda ajustarlo a lo menor posible, para ahorrar recursos. Su valor mnimo será siempre el payload más grande en bytes que se pretenda transmitir desde el Zynq. Por defecto está ajustado en 8192, pues es el caso que usará PlasticNet para transmitir 2048 neuronas.


## Descripción del contenido de las carpetas

A continuación se describe el contenido de las carpetas:

***1) hls :*** Dentro de esta carpeta, se encuentra todo el código en C, así como los scripts tcl, encargados de generar el IP core de la unidad de desempaquetamiento.

***2) src :*** Dentro de esta carpeta, se encuentra un código en C, modelado en alto nivel, encargado de emular la unidad de desempaquetamiento.

## Autores

El principal autor de este trabajo es:

* **Carlos Salazar-García** 

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

