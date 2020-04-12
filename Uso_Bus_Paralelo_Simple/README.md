# Creación de un proyecto básico que muestra el uso del bus paralelo integrado en el ambiente del block design de Vivado

## Objetivo del proyecto

El objetivo de este proyecto es familiarizarse con el flujo de trabajo que debe usarse cuando se utiliza el bus paralelo implementado por Ronny García, así como todos los detalles de la comunicación, entre el bus y IP personalizados creados en Vivado HLS mediante el uso de interfaces ap_fifo y FIFOs genéricos propietarios de Xilinx.

## Descripción del proyecto

Este proyecto pretende mostrar una aplicación sencilla donde se utiliza el bus parelelo implementado por el Ing. Ronny García. Para ello se desarrolló una aplicación simple que emula dos dispositivos que se conectan al bus y se comparten información entre ellos. Para hacer esto se creo un IP en Vivado HLS cuyo pseudocódigo se muestra a continuación:
```C
void customized_IP_block( hls::stream<data_t>& out_fifo_drvr_0,
                     hls::stream<data_t>& in_fifo_drvr_0,
                     hls::stream<data_t>& out_fifo_drvr_1,
                     hls::stream<data_t>& in_fifo_drvr_1,
                     data_t output_port_axi_lite_drvr_0[SIZE],
                     data_t output_port_axi_lite_drvr_1[SIZE],
                     data_t input_port_axi_lite_drvr_0[SIZE],
                     data_t input_port_axi_lite_drvr_1[SIZE]){				
    
    Loop1: for (int i=0;i<SIZE;i++) { 
		out_fifo_drvr_0.write(input_port_axi_lite_drvr_0[i]); 
		out_fifo_drvr_1.write(input_port_axi_lite_drvr_1[i]);
    } 
    
    Loop2: for (int i=0;i<SIZE;i++) { 
		while(in_fifo_drvr_1.empty());
		output_port_axi_lite_drvr_1[i] = in_fifo_drvr_1.read();
    } 
    
    Loop3: for (int i=0;i<SIZE;i++) { 
		while(in_fifo_drvr_0.empty());
		output_port_axi_lite_drvr_0[i] = in_fifo_drvr_0.read();
    } 
}
```
Como se observa en el pseudocódigo, la apliación en HLS recibirá dos arreglos de entrada, uno es el arreglo del driver 0, y el otro es el arreglo del driver 1. Estos arreglos se reciben vía AXI Lite. Seguidamente, ambos arreglos son enviados vía dos interfaces ap_fifo llamadas out_fifo_drvr_0 y out_fifo_drvr_1, una para cada arreglo, respectivamente.

El arreglo que se envía por el puerto out_fifo_drvr_0, será escrito en una FIFO genérica la cuál es un IP propietario de Xilinx. Dicho arreglo será leído dentro de la FIFO por el bus paralelo, y el bus se encargará de escribir este arreglo en otra FIFO, cuyo puerto de lectura se conecta a la entrada del puerto in_fifo_drvr_1, cuya interfaz es igualmente de tipo ap_fifo. De esta forma, nótese que el arreglo que se encontraba en el driver 0, se desplaza hacia el driver 1. De la misma forma, el arreglo que se encuentra en el driver 1 es desplazado hacia el driver 0. Dentro del mensaje a transmitir por cada driver, los primeros 8 bits representan el destino del mensaje, así, si el mensaje inicia con 0x00, el destino será el driver 0, y si el mensaje inicia con 0x01, el destino será el driver 1. Adicionalmente, los siguientes 8 bits representan la fuente del mensaje, debe aclararse que para efectos prácticos del uso del bus, lo único que es estrictamente obligatorio de enviar, es el destino en los primeros 8 bits, la fuente puede ser omitida, en caso de que la aplicación no la necesite.

Finalmente, una vez que ambos arreglos llegan al IP nuevamente, pero ahora, el arreglo del driver 0 se encuentra contenido en el driver 1, y el del driver 1 se encuentra contenido en el driver 0. Ambos arreglos son enviados vía AXI Lite hacia el procesador Zynq nuevamente.

En el Zynq, tan pronto como los datos son recibidos, esto puede ser completados vía sondeo o por interrupciones, se valida que efectivamente en el driver 0 se encuentre contenido el arreglo que inicialmente fue enviado por el driver 1 y en el caso del driver 1, se valida que el arreglo que este contiene sea el que fue enviado inicialmente por el driver 0.

Como aspecto adicional, un AXI Timer fue incorporado en el diseño para realizar mediciones de tiempo.

A continuación se muestra una figura que ilustra el diseño modular del sistema implementado aquí.

![Diseño modular que muestra el uso del bus paralelo ysu integración en el Block Design de Vivado](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Uso_Bus_Paralelo_Simple/images/Uso_Bus_Paralelo_simple.png)

Figura 1: Diseño modular del sistema implementado en esta carpeta.

## Consideraciones importantes sobre el proyecto que construye este sistema

Observe que la lectura de los FIFOs se realiza de lasiguiente forma:
```C
for (int i=0;i<SIZE;i++) { 
   while(in_fifo_drvr_0.empty());
   output_port_axi_lite_drvr_0[i] = in_fifo_drvr_0.read();
}
```
Nóte que, primero, ***el for limita la cantidad de elementos que se van a leer***, de esta forma, el IP ya conoce que debe leer una cantidad de elementos definidos por el macro SIZE y por otro lado, observe que dentro del for, se establece un while de la bandera empty, esto se realiza ya que, ***la lectura tiene que ser bloqueante en el sentido de que sólo se leerá la FIFO en caso de que existan elementos dentro de esta***, y por lo tanto, en caso de que esta se encuentre vacía, pero aún falten elementos por recibir,  ***la transacción quedará bloqueada hasta que los datos lleguen a la FIFO***. Esto es sumamente necesario en este ejemplo, ya que desde luego sin esto, la ejecución del HLS será mucho más rápida que la escritura en ambos FIFOs y la transmisión a través del bus, por lo tanto, en caso de que la lectura no fuera bloqueante, con seguridad, se leerá el FIFO cuando este se encuentre vacío. Incluso no se puede limitar con solo la sentencia miéntras no este vacío, ya que con sólo que llegue un elemento, ya la FIFO no estará vacía y la transacción iniciaría pero esto no es garantía de que ya llegaon todos los elementos, esto solo significa que ya llegó un elemento.


Preste especial atención a la conexión entre los puertos generados por el HLS con una interfaz ap_fifo y la FIFO, ya que por naturaleza ***existe una incompatibilidad entre los puertos full y empty***, ya que el HLS genera estas banderas negadas, mientras que el IP de Xilinx, el FIFO generator, utiliza estas banderas sin negar, por lo tanto, se requiere de dos inversores para reparar este problema.

Este mismo detalle sucede cuando ***se interconecta el FIFO con el bus paralelo***, específicamente la conexión entre la ***bandera de salida de la FIFO empty*** y la ***bandera de entrada del bus paralelo pndng***, dado que la polaridad entre ambas está invertida, se debe colocar un inversor externo para corregir dicho problema. 

Por otra parte, observe que ***el bus paralelo, no contiene una bandera de entrada llamada full,*** por lo tanto, observe que cuando el bus se conecta a un puerto de escritura de una FIFO, ***la bandera de salida de la FIFO full, se deja desconectada***.

Adicionalmente, ***el reset de cada uno de los IP FIFO Generator funciona con la polaridad invertida al del resto de los IPs***, por lo tanto, se utiliza un reset que opere con la polaridad invertida.

Cuando ***se instancia el bus paralelo en el ambiente del block design***, por defecto, ***Vivado detecta que el reset del sistema es con cero, en lugar de uno, lo cuál es erróneo***, ya que el bus está pensado para ser reseteado, con un valor igual a uno. Por lo tanto, se ejecuta un comando tcl, el cuál se encuentra dentro del script el cual soluciona este problema y que así se realice la interconexión adecuada.

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

