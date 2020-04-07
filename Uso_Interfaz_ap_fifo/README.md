# Creación de un proyecto básico que muestra el uso de la interfaz ap_fifo en conjunto con la interfaz AXI Lite

## Objetivo del proyecto

El objetivo de este proyecto es familiarizarse con el flujo de trabajo de las interfaces ap_fifo utilizando IPs personalizados creados en Vivado HLS.

## Descripción del proyecto

Este proyecto consiste en la creación de un IP personalizado en Vivado HLS donde el flujo de datos va de la siguiente forma: Primero un arreglo de tamaño definido por el macro SIZE es recibido por el IP vía AXI LITE, el cual es enviado desde el procesador Zynq. Una vez que se recibe este arreglo, el mismo se envía directamente hacia la salida out_fifo, la cual es declarada como una interfaz de tipo ap_fifo. 

Dicha salida out_fifo se conecta con un IP de Xilinx de una FIFO (se utilizó el IP de Xilinx FIFO Generator), por lo tanto, todo el arreglo es copiado en dicha FIFO. Posteriormente, la salida de esta FIFO, se conecta a la entrada del IP llamada in_fifo, cuya interfaz es igualmente de tipo ap_fifo. Así, los datos, son devueltos nuevamente de la FIFO hacia el IP personalizado, donde este finalmente reenviará este arreglo de datos hacia el Zynq vía AXI Lite.

A continuación se muestra una figura que ilustra el diseño modular del sistema implementado aquí.

![Diseño modular que muestra el uso de la interfaz ap_fifo en conjunto con la interfaz AXI Lite mediante la implementación de un loopback](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Uso_Interfaz_ap_fifo/images/ap_fifo_simple_use.png)

Figura 1: Diseño modular del sistema implementado en esta carpeta.

Por último, dentro del Zynq, se valida que dichos datos sean igual a los enviados al inicio, y en caso de serlo, finaliza la ejecución sin dar ningún error. El Zynq recibe los datos usando ambos, sondeo o interrupciones. Por lo tanto, se puede concluir, que en realidad lo que se genera aquí es un loopback donde se utiliza desde el protocolo AXI Lite, las interfaces de E/S ap_fifo y las FIFOs que proporciona Xilinx, todo esto testeado mediante la implementación de un LoopBack de un arreglo de datos.

Adcionalmente, se proporciona aquí un pseudocódigo de la función implementada en C utilizando síntesis de alto nivel (HLS):
```C
void customized_IP_block( hls::stream<data_t>& in_fifo,
                     hls::stream<data_t>& out_fifo,
                     data_t input_axi_lite[SIZE],
                     data_t output_axi_lite[SIZE]){
	int i = 0;
	int j = 0;
	
	SendData_To_FIFO: for (i=0; i<SIZE; i++) 
		out_fifo.write(input_axi_lite[i]);
     
	Receive_From_FIFO: while(!in_fifo.empty()){
		output_axi_lite[j] = in_fifo.read();
		j++;}
}
```



## Consideraciones importantes sobre el diagrama de bloques del sistema

Preste especial atención a la conexión entre los puertos generados por el HLS con una interfaz ap_fifo y la FIFO, ya que por naturaleza ***existe una incompatibilidad entre los puertos full y empty***, ya que el HLS genera estas banderas negadas, mientras que el IP de Xilinx, el FIFO generator, utiliza estas banderas sin negar, por lo tanto, se requiere de dos inversores para reparar este problema.

Adicionalmente, ***el reset del IP FIFO Generator funciona con la polaridad invertida al del resto de los IPs***, por lo tanto, se utiliza un reset que opere con la polaridad invertida.

Finalmente, en el modo de lectura de la FIFO, en sus configuraciones, ***no deberá utilizarse la opción estandar***, sino más bien ***el modo de lectura First Word Fall Through***, ya que sino, se cambia, existirá una incompatibilidad entre el HLS el FIFO, y siempre quedará colgado el último elemento dentro de la FIFO y por lo tanto, la aplicación se caerá.


## Plataforma de hardware

Para verificar el funcionamiento del sistema, todo el sistema fue testeado  utilizando una tarjeta de evaluación ZedBoard.

## Herramienta de software

Como herramienta de diseño del software embebido en el cual se creó todo el proyecto se utilizó Vivado HLS, Vivado y Vivado SDK en su versión 2018.3. Además se requiere instalar Minicom y configurar el puerto serial para recibir los datos provenientes de la ZedBoard mediante UART. Todas estas herramientas se ejecutaron sobre Ubuntu 16.04.6 LTS. 

## Descripción de las carpetas

Dentro de este repositorio se encuentran cuatro carpetas llamadas hls, vivado, sdk e images. La primera es la encargada de generar el Ip customizado que utiliza la interfaz ap_fifo y al interfaz AXI Lite, la segunda se encarga de crear todo el proyecto de Vivado automáticamente mediante un script tcl y el código en Verilog del inversor. En la tercera se encuentran el software embebido que corre sobre el Zynq y la última carpeta simplemente fue creada para agregar las imágenes como la utilizada en esta descripción por lo tanto, no aport valor para crear el proyecto.

## Descripción de pasos 

Los pasos para la ejecución de este proyecto se muestran de forma detallada [aquí](https://youtu.be/PeXQbFlYlIE).

El diagrama de bloques generado por Vivado de este proyecto deberá verse muy similar al que se muestra en la siguiente figura:

![Diagrama de bloques que muestra el uso de la interfaz ap_fifo en conjunto con la interfaz AXI Lite mediante la implementación de un loopback](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Uso_Interfaz_ap_fifo/images/Block_Diagram_Simple_Use_of_ap_fifo.png)

Figura 2: Captura de pantalla del diagrama de bloques generado en Vivado.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

