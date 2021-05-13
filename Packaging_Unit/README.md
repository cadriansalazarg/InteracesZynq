# Unidad de desempaquetamiento punto a punto

En esta carpeta  muestra el código en C, encargado de generar un IP core en HLS de la unidad de desempaquetamiento. La unidad de desempaquetamiento tiene por objetivo tomar un conjunto de paquetes de la FIFO,  y generar un mensaje que será transmitido en AXI Stream hacia el Zynq. 

A manera de resumen, este IP Core, tiene por objetivo tomar el payload de todos los datos leídos de la FIFO y generar un mensaje, que contenga toda la carga útil contenida en los diferentes paquetes. Hacia el Zynq, únicamente se eniviarán datos útiles. No se genera ningún tipo de encabezado.

A continuación se muestra una figura que ilustra el diagrama de entradas y salidas de esta unidad:

![Diseño modular que muestra el uso del bus paralelo ysu integración en el Block Design de Vivado](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/wikiimages/unpackaging_fig.PNG)

Debe ajustarse adecuadamente los parámetros de esta unidad que se encuentran en el archivo hls/unpackaging_IP.hpp. Se deben de editar dos parámetros los cuales se muestran a continuación:

***1) PACKAGE_SIZE_BYTES :*** Número de bytes de cada paquete. Este número debe incluir tanto el número de bytes del header, como el número de bytes del payload del mensaje. La suma de ambos será el valor de este parámetro.

***2) MESSAGE_SIZE_BYTES :*** Este parámetro especifica el número de bytes que serán transmitidos al Zynq, más 4 bytes. Por lo tanto, al número de bytes que se enviarán al Zynq, debe sumarsele 4 bytes para obtener este valor.


## Descripción del contenido de las carpetas

A continuación se describe el contenido de las carpetas:

***1) hls :*** Dentro de esta carpeta, se encuentra todo el código en C, así como los scripts tcl, encargados de generar el IP core de la unidad de desempaquetamiento.

***2) src :*** Dentro de esta carpeta, se encuentra un código en C, modelado en alto nivel, encargado de emular la unidad de desempaquetamiento.

## Autores

El principal autor de este trabajo es:

* **Carlos Salazar-García** 

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

