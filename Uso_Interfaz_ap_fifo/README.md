# Creación de un proyecto báscio de uso de la interfaz ap_fifo en conjunto con la interfaz AXI Lite

## Objetivo del proyecto

El objetivo de este proyecto es familiarizarse con el flujo de trabajo de las interfaces ap_fifo utilizando IPs personalizados creados en Vivado HLS.

## Descripción del proyecto

Este proyecto consiste en la creación de un IP personalizado en Vivado HLS donde un arreglo de tamaño definido por el macro SIZE es recibido por el IP vía AXI LITE, enviado desde el procesador Zynq. Este arreglo es enviado, sale del IP pero ahora mediante una interfaz ap_fifo. Estos datos, se almacenan dentro de un FIFO (se utilizó el IP de Xilinx IP Generator) y la salida de este FIFO, se conecta nuevamente a un puerto de entrada del IP personalizado, igualmente utilizando la interfaz FIFO. Una vez dentro del IP estos datos, son enviados vía AXI Lite hacia el Zynq nuevamente. Dentro del Zynq, se valida que dichos datos sean igual a los enviados originalmente, y en caso de serlo, finaliza la ejecución sin dar ningún error. El Zynq recibe los datos usando ambos, sondeo o interrupciones.

Un pseudocódigo de la función del HLS se muestra aquí:
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



A continuación se muestra una figura que ilustra desde una perspectiva de alto nivel el funcionamiento del sistema. 

![Sumador personalizado generado en HLS donde todas las interfaces son generadas con AXI4-Lite, de esta forma se realiza la comunicación con el Zynq](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Uso_Interfaz_ap_fifo/images/ap_fifo_simple _use.png)

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

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

