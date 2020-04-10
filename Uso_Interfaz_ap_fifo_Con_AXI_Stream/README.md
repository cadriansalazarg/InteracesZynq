# Creación de un proyecto básico que muestra el uso de la interfaz ap_fifo en conjunto con la interfaz AXI Stream

## Objetivo del proyecto

El objetivo de este proyecto es familiarizarse con el flujo de trabajo de las interfaces ap_fifo, utilizando IPs personalizados creados en Vivado HLS, en conjunto con la interfaz axis, mediante AXI STREAM.

## Descripción del proyecto

Este proyecto consiste en la creación de un IP personalizado en Vivado HLS donde el flujo de datos va de la siguiente forma: Primero un arreglo de tamaño definido por el macro SIZE es enviado desde el ZYNQ, hacia el DMA. EL DMA por su parte, envía este arreglo hacia el IP personalizado, el cual, recibe estos datos utilizando una interfaz axis mediante AXI Stream. Para esto, se utiliza el puerto llamado input. Tan pronto como el arreglo llega al IP, este es enviado hacia un FIFO externo (Se utilizó el IP propietario de Xilinx llamado el FIFO Generator), para ello se utiliza el puerto out_fifo mediante una interfaz de tipo ap_fifo.

Por otra parte. la salida del FIFO se vuelve a conectar al IP, a través de una interfaz de tipo ap_fifo llamada in_fifo. Finalmente, tan pronto como se reciben  estos datos, son reenviados nuevamente hacia el Zynq, pasando por el DMA nuevamente, mediante una interfaz axis, cuyo puerto es nombrado como output. 

Finalmente, una vez que los datos llegan al Zynq, se comprueba que los mismos son correctos mediante una validación de los mismos. Este software que corre dentro del Zynq, opera con y sin interrupciones, em ambos casos sin utilizar el Scatter/Gather.

En resumen, en este tutorial se implementa un loopback, el cual busca ser una guía básica para demostrar como enviar y recibir arreglos mediante una interfaz axis, utilizando el DMA, al mismo tiempo que se utiliza una interfaz ap_fifo dentro de está.

A continuación se muestra una figura que ilustra el diseño modular del sistema implementado aquí.

![Diseño modular que muestra el uso de la interfaz ap_fifo en conjunto con la interfaz AXI Lite mediante la implementación de un loopback](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Uso_Interfaz_ap_fifo_Con_AXI_Stream/images/Block_Diagram_ap_fifo_with_axistream.png)

Figura 1: Diseño modular del sistema implementado en esta carpeta.

Observe en la Figura 1 que, el IP personalizado contrala su retorno mediante una interfaz ap_ctrl_chain, por lo tanto, el Zynq no controla el IP, y éste estará siempre listo a la espera de datos, desde el DMA o desde la FIFO. Un ejemplo de como manejar un IP que se auto reinicie y no ocupa ser controlado por el Zynq fue desarrollado anteriormente [aquí](https://github.com/cadriansalazarg/InterfacesZynq/tree/master/Loop_Back_AXI_Stream_Auto_Start), en un tutorial pasado, por lo que no se entrará en detalles de como se implementó esta parte.


Adcionalmente, se proporciona aquí un pseudocódigo de la función implementada en C utilizando síntesis de alto nivel (HLS):
```C
void customized_IP_block(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output, hls::stream<data_t>& in_fifo, hls::stream<data_t>& out_fifo){
	productor(out_fifo, input);
	consumidor(in_fifo, output);
}

void productor(hls::stream<data_t>& out_fifo, hls::stream<AXISTREAM32> &input) {
	Loop_Productor: for (int i = 0; i < SIZE; i++) {
		auto a = input.read();
		out_fifo.write(a.data);
	}
}

void consumidor(hls::stream<data_t>& in_fifo, hls::stream<AXISTREAM32> &output) {
	Loop_Consumidor: while(!in_fifo.empty()) {
        AXISTREAM32 a;
		a.data = in_fifo.read();
		a.tlast = (in_fifo.empty()) ? 1 : 0;
		output.write(a);
    } 
}
```



## Consideraciones importantes sobre el diagrama de bloques del sistema

Preste especial atención a la conexión entre los puertos generados por el HLS con una interfaz ap_fifo y la FIFO, ya que por naturaleza ***existe una incompatibilidad entre los puertos full y empty***, ya que el HLS genera estas banderas negadas, mientras que el IP de Xilinx, el FIFO generator, utiliza estas banderas sin negar, por lo tanto, se requiere de dos inversores para reparar este problema.

***El reset del IP FIFO Generator funciona con la polaridad invertida al del resto de los IPs***, por lo tanto, se utiliza un reset que opere con la polaridad invertida.

En el modo de lectura de la FIFO, en sus configuraciones, ***no deberá utilizarse la opción estandar***, sino más bien ***el modo de lectura First Word Fall Through***, ya que sino, se cambia, existirá una incompatibilidad entre el HLS el FIFO, y siempre quedará colgado el último elemento dentro de la FIFO y por lo tanto, la aplicación se caerá.

La profundidad de la FIFO (parámetro ***Write Depth***) deberá tener ***al menos la misma profundidad que el número de elementos que se va a enviar a través del arreglo***, en este caso definido por el macro SIZE en Vivado HLS, el cuál es 2048, de lo contrario, se generará congestionamiento de datos y el IP no podrá procesarlos todos de forma simultanea.

El parámetro ***Width of Buffer Length Register*** del IP AXI DMA, también debe de ajustarse cuidadosamente para evitar congestionamiento, en este caso se ajustó en 16, ya que se van a enviar 2^16 bits por el canal (2048 enteros, por lo tanto 2048*32 bits). Pero en caso de  que se quiera modificar el número de elementos enviados por el arreglo, se deberá determinar cual es el mínimo número permitido para este parámetro, mediante un cálculo de cuantos bits se requieren como máximo transferir por el canal.

Observe que todo el ***control del IP se realiza mediante la interfaz ap_ctrl_chain***, por lo tanto, el IP es completamente controlado desde el hardware, y ***está en una configuración de auto reinicio***, por lo tanto, siempre que le lleguen datos válidos por parte del DMA, o que la FIFO no esté vacía, este iniciará las transacciones.



## Plataforma de hardware

Para verificar el funcionamiento del sistema, todo el sistema fue testeado  utilizando una tarjeta de evaluación ZedBoard.

## Herramienta de software

Como herramienta de diseño del software embebido en el cual se creó todo el proyecto se utilizó Vivado HLS, Vivado y Vivado SDK en su versión 2018.3. Además se requiere instalar Minicom y configurar el puerto serial para recibir los datos provenientes de la ZedBoard mediante UART. Todas estas herramientas se ejecutaron sobre Ubuntu 16.04.6 LTS. 

## Descripción de las carpetas

Dentro de este repositorio se encuentran cuatro carpetas llamadas hls, vivado, sdk e images. La primera es la encargada de generar el Ip customizado que utiliza la interfaz ap_fifo y al interfaz AXI Lite, la segunda se encarga de crear todo el proyecto de Vivado automáticamente mediante un script tcl y el código en Verilog del inversor. En la tercera se encuentran el software embebido que corre sobre el Zynq y la última carpeta simplemente fue creada para agregar las imágenes como la utilizada en esta descripción por lo tanto, no aport valor para crear el proyecto.

## Descripción de pasos 

Los pasos para la ejecución de este proyecto se muestran de forma detallada [aquí](https://youtu.be/PeXQbFlYlIE).

El diagrama de bloques generado por Vivado de este proyecto deberá verse muy similar al que se muestra en la siguiente figura:

![Diagrama de bloques que muestra el uso de la interfaz ap_fifo en conjunto con la interfaz AXI Lite mediante la implementación de un loopback](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Uso_Interfaz_ap_fifo_Con_AXI_Stream/images/ScreenCapture_Block_Diagram_Vivado.png)

Figura 2: Captura de pantalla del diagrama de bloques generado en Vivado.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

