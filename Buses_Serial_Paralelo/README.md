# Interfaces de bus paralelo y serial

## Objetivo de la carpeta

Comprender la forma en la que operan las tres interfaces de bus elaboradas por el Ing. Ronny García-Ramírez mediante su uso a través de tres diferentes testbench (uno para cada interfaz) elaborados en SystemVerilog.

## Interfaz de bus paralelo

La interfaz de bus paralelo, tienen la descripción de entradas y salidas que se muestra a continuación

![Diagrama de entradas y salidas del bus paralelo](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Buses_Serial_Paralelo/images/Interfaz_Bus_Paralelo.png)

Figura 1: Diagrama de entradas y salidas del bus paralelo.


### Parámetros del bus

Para el uso del bus se cuenta con una serie de parámetros los cuales se describen a continuación:

***1) BROADCAST:*** Es un parámetro de 8 bits el cual representa la dirección de la funcionalidad de broadcast. Por defecto se coloca este parámetro en el valor de 0xFF.
***2) DRVRS:*** Este parámetro especifica el número de drivers o dispositivos que van a conectarse a la interfaz de bus paralela. Para que el bus en sí mismo tenga sentido, este parámetro deberá colocarse en un valor mínimo igual a dos. El máximo teórico de dispositivos que se pueden conectar es de 128 dispositivos. El tener más drivers, afecta la cantidad de ciclos que dura el envio de un mensaje a través del bus.
***3) BITS:*** Especifica el número de bits que va tener cada mensaje que se transfiere a traves del bus. El tener más o menos bits, no afecta los ciclos de reloj que dura el envió de los mensajes.
***4) BUSES:*** Especifica el número de buses con los que contará cada driver para paralelizar la comunicación. Si se tienen dos buses, el ancho de banda se duplica, si se tienen 3 buses se triplica y así sucesivamente. Este duplicado de ancho de banda desde luego viene a un costo de área, por lo que se debe analizar adecuadamente cuando se va a utilizar. Incrementar el número de buses presentes en cada driver, no afecta la cantidad de ciclos de reloj que toma las transacciones.

### Puertos de Entrada/Salida del bus

Se describe a continuación la descripción de las entradas y salidas que posee el bus:

***1) CLK:*** Entrada del reloj principal del sistema.
***2) Reset:*** Entrada del reset del sistema, activa en alto.
***3) D_pop:*** Puerto de entrada de datos del bus, aquí entran al bus los datos que utilizarán los servicios del bus paralelo. El ancho de este puerto es definido por el valor del parámetro bits.  Cada driver tendrá N diferentes puertos D_pop, donde N es igual al número de buses (definido por el parámetro buses) que se están utilizando.
***4) pndng:*** Es una bandera de entrada del bus, la cual es usada para recibir los mensajes. Siempre que está en alto, significa que el FIFO a la entrada, tiene datos pendientes que deberán ser leídos por el bus. Es el puerto que deberá conectarse a la bandera de salida del FIFO en su puerto de lectura llamada no empty. Por cada driver se tendrá N diferentes banderas pndng, donde N es igual al número de buses (definido por el parámetro buses) que se están utilizando. 
***5) pop:*** Es una bandera de salida del bus, utilizado para indicarle al FIFO conectada a la entrada, cuando se está realizando una lectura de los datos. De esta forma, se lee el dato y se escribe en este momento el bus. Dicha bandera de salida, siempre se conecta a la bandera de entrada de la FIFO en su puerto de lectura llamada read.
***6) D_push:*** Puerto de salida de datos del bus, aquí salen del bus los datos que utilizaron los servicios del bus paralelo. El ancho de este puerto es definido por el valor del parámetro bits.  Cada driver tendrá N diferentes puertos D_pop, donde N es igual al número de buses (definido por el parámetro buses) que se están utilizando.
***5) push:*** Es una bandera de salida del bus, utilizado para indicarle al FIFO conectada a la salida, cuando se está realizando una escritura de un dato en la FIFO proveniente del bus. De esta forma, cuando el dato está a la salida del bus, luego de ser transportado, desde un driver hacia otro, está bandera le indica al FIFO del driver destino, que el dato que se encuentra en el puerto de salida D_push debe ser escrito en la FIFO. Dicha bandera de salida, siempre se conecta a la bandera de entrada de la FIFO en su puerto de escritura llamada write.

### Funcionamiento del bus 

Cada vez que se quiere usar los servicios del bus paralelo, todos los drivers que van a utilizar el bus, deberán hacerlo a través de interfaces FIFOs estándares. Se requiere por cada  driver 2*N fifos, donde N representa el número de buses que tiene el sistema. Así, si se configura el bus paralelo por ejemplo con dos drivers y un único bus. Se requeriran 4 FIFOs, dos en el driver 1, uno para escribir en el bus y otro para leer datos que provienen del bus y dos en el driver 0, uno para escribir en el bus y otro para leer datos que provienen del bus.

Para que el bus paralelo conozca el destino al que se debe enviar un paquete de datos, se tienen que conocer la siguiente información:

1) Primero cada driver tiene su propio identificador de destino, iniciando en 0  y así continua en funcion del número de drivers. Así, si se tiene 4 drivers por ejemplo, el primero tendrá el ID igual a cero, el segundo tendrá el ID igual a 1, el tercero tendrá el ID 2 y el cuarto ID tiene el ID igual a 3. 

2) Los primeros 8 bits más significativos en el mensaje que se coloca en el puerto de entrada D_pop, representan el destino del paquete. Así, por ejemplo, si se quiere enviar un paquete de tamaño igual a 32 bits, desde el driver 0 hasta el driver 3, los primeros 8 bits del mensaje a enviar por el driver 0 en su puerto D_pop deberán ser iguales a 03. Así, el mensaje  que envia el driver 0 deberá ser igual a D_pop[31:0] = 0x03XXXXXX.

3) Si los drivers tienen más de un bus (parámetro bus es mayor que 1), Sí los datos se envían por un bus, los datos llegarán siempre al destino exactamente en el mismo bus. Así por ejemplo, si se tienen dos drivers, con 4 buses cada uno, si se envía un dato desde el driver 1 hacia el driver 2, utilizando el bus 3, los datos llegaran al destino exactamente por el mismo bus. 


### Evaluación del desempeño del bus

| Número de drivers | Mejor caso | Peor caso |
| :---         |     :---:      |          ---: |
| git status   | git status     | git status    |
| git diff     | git diff       | git diff      |



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

