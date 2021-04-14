# Interfaces de bus paralelo y serial

## Objetivo de la carpeta

Comprender la forma en la que operan las tres interfaces de bus elaboradas por el Ing. Ronny García-Ramírez mediante su uso a través de tres diferentes testbench (uno para cada interfaz) elaborados en SystemVerilog.

## Interfaz de bus paralelo sin árbitro

La interfaz de bus paralelo, tienen la descripción de entradas y salidas que se muestra a continuación

![Diagrama de entradas y salidas del bus paralelo sin árbitro](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Buses_Serial_Paralelo/images/Interfaz_Bus_Paralelo.png)

Figura 1: Diagrama de entradas y salidas del bus paralelo sin árbitro.


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

***5) pop:*** Es una bandera de salida del bus, utilizado para indicarle al FIFO conectada a la entrada, cuando se está realizando una lectura de los datos. De esta forma, se lee el dato y se escribe en este momento el bus. Dicha bandera de salida, siempre se conecta a la bandera de entrada de la FIFO en su puerto de lectura llamada read. Por cada driver se tendrá N diferentes banderas pop, donde N es igual al número de buses (definido por el parámetro buses) que se están utilizando.

***6) D_push:*** Puerto de salida de datos del bus, aquí salen del bus los datos que utilizaron los servicios del bus paralelo. El ancho de este puerto es definido por el valor del parámetro bits.  Cada driver tendrá N diferentes puertos D_pop, donde N es igual al número de buses (definido por el parámetro buses) que se están utilizando.

***5) push:*** Es una bandera de salida del bus, utilizado para indicarle al FIFO conectada a la salida, cuando se está realizando una escritura de un dato en la FIFO proveniente del bus. De esta forma, cuando el dato está a la salida del bus, luego de ser transportado, desde un driver hacia otro, está bandera le indica al FIFO del driver destino, que el dato que se encuentra en el puerto de salida D_push debe ser escrito en la FIFO. Dicha bandera de salida, siempre se conecta a la bandera de entrada de la FIFO en su puerto de escritura llamada write. Por cada driver se tendrá N diferentes banderas push, donde N es igual al número de buses (definido por el parámetro buses) que se están utilizando.

### Funcionamiento del bus 

Cada vez que se quiere usar los servicios del bus paralelo, todos los drivers que van a utilizar el bus, deberán hacerlo a través de interfaces FIFOs estándares. Se requiere por cada  driver 2*N fifos, donde N representa el número de buses que tiene el sistema. Así, si se configura el bus paralelo por ejemplo con dos drivers y un único bus. Se requeriran 4 FIFOs, dos en el driver 1, uno para escribir en el bus y otro para leer datos que provienen del bus y dos en el driver 0, uno para escribir en el bus y otro para leer datos que provienen del bus.

Para que el bus paralelo conozca el destino al que se debe enviar un paquete de datos, se tienen que conocer la siguiente información:

1) Primero cada driver tiene su propio identificador de destino, iniciando en 0  y así continua en funcion del número de drivers. Así, si se tiene 4 drivers por ejemplo, el primero tendrá el ID igual a cero, el segundo tendrá el ID igual a 1, el tercero tendrá el ID 2 y el cuarto ID tiene el ID igual a 3. 

2) Los primeros 8 bits más significativos en el mensaje que se coloca en el puerto de entrada D_pop, representan el destino del paquete. Así, por ejemplo, si se quiere enviar un paquete de tamaño igual a 32 bits, desde el driver 0 hasta el driver 3, los primeros 8 bits del mensaje a enviar por el driver 0 en su puerto D_pop deberán ser iguales a 03. Así, el mensaje  que envia el driver 0 deberá ser igual a D_pop[31:0] = 0x03XXXXXX.

3) Si los drivers tienen más de un bus (parámetro bus es mayor que 1), Sí los datos se envían por un bus, los datos llegarán siempre al destino exactamente en el mismo bus. Así por ejemplo, si se tienen dos drivers, con 4 buses cada uno, si se envía un dato desde el driver 1 hacia el driver 2, utilizando el bus 3, los datos llegaran al destino exactamente por el mismo bus. 


Finalmente, ***el bus es capaz de leer en el mismo instante, mensajes de múltiples drivers, pero solo es capaz de entregar un único mensaje en el mismo instante de tiempo a un único driver***. Así las cosas, por ejemplo, si se tienen cuatro drivers, y los cuatro drivers colocan su bandera de pndng en alto para indicarle al bus que deben de transmitir un mensaje en el mismo instante de tiempo, el bus leerá a los 4 drivers en el mismo flanco de reloj, es decir, le enviará un uno en la bandera de pop a los cuatro drivers, pero a la hora de entregar los mensajes, el bus es incapaz de completar las 4 solicitudes en el mismo instante de tiempo, por lo tanto, el bus irá entregando un mensaje a un driver, luego en otro instante entregará el otro y así, hasta acabar con el último mensaje.Pero de nuevo, esto ocurrirá en instantes de tiempo diferentes, a diferencia de lo que sucede con la lectura que sí puede ser simultanea.

Cuando ***se realiza una transmisión en modo broadcast***, en este modo, el driver emisor colocará en los primeros 8 bits el identificador de broadcast, una vez que el mensaje es leído por el bus, el mensaje será entregado en el mismo instante de tiempo a todos los drivers restantes en la red a excepción del driver transmisor, esto significa que en el mismo instante de tiempo, todos los drivers diferentes al emisor conectados al bus, se les proporcionará el mensaje en su puerto D_push y se levantará la bandera push en el mismo instante de tiempo. En la figura 2, se ilustra un diagrama de tiempos de una transmisión de tipo broadcast.

Otro detalle adicional, es que ***aunque un driver tenga múltiples datos que ser enviados a través del bus, solo se atenderá uno a la vez y hasta que la entrega de este no sea concluída, no se realizará la lectura de un nuevo mensaje, esto sin importar de que la bandera de pndng este en alto***. Para ser más exactos, una vez que el dato es entregado al driver receptor, es decir, el bus pone en alto la bandera push en el driver receptor, la siguente solicitud pendiente en el driver emisor, será atendida exactamente dos ciclos de reloj después. En la Figura 2 se muestra un diagrama de tiempos que muestra este efecto.

![Tiempo que dura en atenderse un nuevo dato](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Buses_Serial_Paralelo/images/Lectura_Bandera_Pop.png)

Figura 2: Diagrama de tiempo donde se muestra que el driver 0 realiza una transmisión de tipo Broadcast a los drivers 1, 2 y 3, Tan pronto como la bandera push le indica a los drivers receptores 1, 2 y 3, dos ciclos de reloj después, el driver 0, atiende la nueva solicitud pendiente, levantando la bandera pop.


### Evaluación del desempeño del bus

Para evaluar el rendimiento del bus paralelo se varío el número de drivers y se determinaron tres métricas, el mejor caso, el caso promedio y el peor caso, todos estos casos medidos en números de ciclos de reloj. 

***El mejor caso***, es aquel que se presenta cuando un driver intenta acceder al bus, y el bus está completamente desocupado, es decir, ninguno de los otros drivers está utilizando el bus, es decir, es una escritura en el bus cuando este se encuentra completamente libre. 

***El caso promedio***, es aquel que se presenta cuando todos los drivers están usando el bus y además, cada driver tiene  datos pendientes por ser procesados, que están a la espera de ser leído por el bus.

***El peor caso***, se presenta cuando el bus estaba vacío, y de repente, todos los drivers en el mismo instante de tiempo quieren escribir en el bus, por lo tanto, los mensajes se iran entregando a través del tiempo hacia los diferentes destinos, y exactamente el último dato en ser entregado, representa el peor caso.

Tabla 1: Mejor caso, caso promedio y peor caso en función del número de drivers. Estos datos se obtuvieron para el bus paralelo.

| Número de drivers | Mejor caso(# de ciclos) | Caso Promedio(# de ciclos) | Peor caso (# de ciclos) |
| :---              |     :---:               |         :---:              |          ---:           | 
| 2                 | 4                       | 9                          | 8                       |
| 3                 | 4                       | 14                         | 13                      |
| 4                 | 4                       | 18                         | 19                      |
| 5                 | 4                       | 24                         | 23                      |
| 6                 | 4                       | 28                         | 29                      |
| 7                 | 4                       | 33                         | 34                      |
| 8                 | 4                       | 38                         | 39                      |
| 9                 | 4                       | 43                         | 44                      |
| 10                | 4                       | 48                         | 49                      |
| 11                | 4                       | 53                         | 54                      |
| 12                | 4                       | 58                         | 59                      |
| 13                | 4                       | 63                         | 64                      |
| 14                | 4                       | 68                         | 69                      |
| 15                | 4                       | 73                         | 74                      |
| 16                | 4                       | 78                         | 79                      |

Observe que en esta evaluación no se varío el número de bits ni el número de buses, esto es porque estas métricas son invariantes ante el número de bits del mensaje a transmitir y la cantidad de buses para cada driver. Así, por ejemplo sí se utilizan 4 drivers y se transmiten mensajes de 1024 bits, de acuerdo con la tabla, en el mejor caso, esta transmisión durará igualmente 4 ciclos de reloj, por lo que esta métrica es invariante. Lo que si es claro, es que evidentemente el renidmiento mejora ya que no es lo mismo transportar en 4 ciclos de reloj 32 bits que 1024 bits. Por lo tanto, esto es un detalle de suma importancia para mejorar el rendimiento del sistema. Lo mismo sucede si cada driver tiene por ejemplo dos buses, no es lo mismo transportar 32 bits en un único bus, a transportar 32 bits en un bus y 32 bits en otro bus, donde la transacción durará los mismos 4 ciclos de reloj, pero se estará transportando el doble de datos.



## Interfaz de bus serial con árbitro

La interfaz de bus serial con árbitro, tienen la descripción de entradas y salidas que se muestra a continuación

![Diagrama de entradas y salidas del bus serial con árbitro](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Buses_Serial_Paralelo/images/Interfaz_Bus_Serial_con_Arbitro.png)

Figura 3: Diagrama de entradas y salidas del bus serial con árbitro.


### Parámetros del bus

Para el uso del bus se cuenta con una serie de parámetros los cuales se describen a continuación:

***1) BROADCAST:*** Es un parámetro de 8 bits el cual representa la dirección de la funcionalidad de broadcast. Por defecto se coloca este parámetro en el valor de 0xFF.

***2) DRVRS:*** Este parámetro especifica el número de drivers o dispositivos que van a conectarse a la interfaz de bus serial con árbitro. Para que el bus en sí mismo tenga sentido, este parámetro deberá colocarse en un valor mínimo igual a dos. El máximo teórico de dispositivos que se pueden conectar es de 128 dispositivos. El tener más drivers, afecta la cantidad de ciclos que dura el envio de un mensaje a través del bus.

***3) PCKG_SZ:*** Especifica el número de bits que va tener cada mensaje que se transfiere a traves del bus. Al ser un bus serial, es decir, internamente las transmisiones se realizan bit a bit, el número de bits sí afecta el rendimiento del bus, por lo tanto, a mayor cantidad de tiempo mayor durará las trasmisiones de los mensajes.

***4) BUSES:*** Especifica el número de buses con los que contará cada driver para paralelizar la comunicación. Si se tienen dos buses, el ancho de banda se duplica, si se tienen 3 buses se triplica y así sucesivamente. Este duplicado de ancho de banda desde luego viene a un costo de área, por lo que se debe analizar adecuadamente cuando se va a utilizar. Incrementar el número de buses presentes en cada driver, no afecta la cantidad de ciclos de reloj que toma las transacciones.

### Puertos de Entrada/Salida del bus

Se describe a continuación la descripción de las entradas y salidas que posee el bus:

***1) CLK:*** Entrada del reloj principal del sistema.

***2) Reset:*** Entrada del reset del sistema, activa en alto.

***3) D_pop:*** Puerto de entrada de datos del bus, aquí entran al bus los datos que utilizarán los servicios del bus paralelo. El ancho de este puerto es definido por el valor del parámetro pckg_sz.  Cada driver tendrá un único puerto D_pop.

***4) pndng:*** Es una bandera de entrada del bus, la cual es usada para recibir los mensajes. Siempre que está en alto, significa que el FIFO a la entrada, tiene datos pendientes que deberán ser leídos por el bus. Es el puerto que deberá conectarse a la bandera de salida del FIFO en su puerto de lectura llamada no empty. Por cada driver se tendrá una única bandera pndng. 

***5) pop:*** Es una bandera de salida del bus, utilizado para indicarle al FIFO conectada a la entrada, cuando se está realizando una lectura de los datos. De esta forma, se lee el dato y se escribe en este momento el bus. Dicha bandera de salida, siempre se conecta a la bandera de entrada de la FIFO en su puerto de lectura llamada read. Por cada driver se tiene una única bandera pop.

***6) D_push:*** Puerto de salida de datos del bus, aquí salen del bus los datos que utilizaron los servicios del bus serial. El ancho de este puerto es definido por el valor del parámetro pckg_sz.  Cada driver tendrá un único puerto D_pop.

***5) push:*** Es una bandera de salida del bus, utilizado para indicarle al FIFO conectada a la salida, cuando se está realizando una escritura de un dato en la FIFO proveniente del bus. De esta forma, cuando el dato está a la salida del bus, luego de ser transportado, desde un driver hacia otro, está bandera le indica al FIFO del driver destino, que el dato que se encuentra en el puerto de salida D_push debe ser escrito en la FIFO. Dicha bandera de salida, siempre se conecta a la bandera de entrada de la FIFO en su puerto de escritura llamada write. Por cada driver se tiene una única bandera push.

### Funcionamiento del bus 

Cada vez que se quiere usar los servicios del bus serial, todos los drivers que van a utilizar el bus, deberán hacerlo a través de interfaces FIFOs estándares. Se requiere por cada  driver 2 fifos. Para que el bus serial conozca el destino al que se debe enviar un paquete de datos, se tienen que conocer la siguiente información:

1) Primero cada driver tiene su propio identificador de destino, iniciando en 0  y así continua en funcion del número de drivers. Así, si se tiene 4 drivers por ejemplo, el primero tendrá el ID igual a cero, el segundo tendrá el ID igual a 1, el tercero tendrá el ID 2 y el cuarto ID tiene el ID igual a 3. 

2) Los primeros 8 bits más significativos en el mensaje que se coloca en el puerto de entrada D_pop, representan el destino del paquete. Así, por ejemplo, si se quiere enviar un paquete de tamaño igual a 32 bits, desde el driver 0 hasta el driver 3, los primeros 8 bits del mensaje a enviar por el driver 0 en su puerto D_pop deberán ser iguales a 03. Así, el mensaje  que envia el driver 0 deberá ser igual a D_pop[31:0] = 0x03XXXXXX.


Finalmente, ***el bus es capaz de leer en el mismo instante, mensajes de múltiples drivers, pero solo es capaz de entregar un único mensaje en el mismo instante de tiempo a un único driver***. Así las cosas, por ejemplo, si se tienen cuatro drivers, y los cuatro drivers colocan su bandera de pndng en alto para indicarle al bus que deben de transmitir un mensaje en el mismo instante de tiempo, el bus leerá a los 4 drivers en el mismo flanco de reloj, es decir, le enviará un uno en la bandera de pop a los cuatro drivers, pero a la hora de entregar los mensajes, el bus es incapaz de completar las 4 solicitudes en el mismo instante de tiempo, por lo tanto, el bus irá entregando un mensaje a un driver, luego en otro instante entregará el otro y así, hasta acabar con el último mensaje.Pero de nuevo, esto ocurrirá en instantes de tiempo diferentes, a diferencia de lo que sucede con la lectura que sí puede ser simultanea.

Cuando ***se realiza una transmisión en modo broadcast***, en este modo, el driver emisor colocará en los primeros 8 bits el identificador de broadcast, una vez que el mensaje es leído por el bus, el mensaje será entregado en el mismo instante de tiempo a todos los drivers restantes en la red a excepción del driver transmisor, esto significa que en el mismo instante de tiempo, todos los drivers diferentes al emisor conectados al bus, se les proporcionará el mensaje en su puerto D_push y se levantará la bandera push en el mismo instante de tiempo. 

Otro detalle adicional, es que ***aunque un driver tenga múltiples datos que ser enviados a través del bus, solo se atenderá uno a la vez y hasta que la entrega de este no sea concluída, no se realizará la lectura de un nuevo mensaje, esto sin importar de que la bandera de pndng este en alto***. Para ser más exactos, una vez que el dato es entregado al driver receptor, es decir, el bus pone en alto la bandera push en el driver receptor, la siguente solicitud pendiente en el driver emisor, será atendida exactamente tres ciclos de reloj después. En la Figura 2 se muestra un diagrama de tiempos que muestra este efecto.

![Tiempo que dura en atenderse un nuevo dato](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Buses_Serial_Paralelo/images/Lectura_Bandera_Pop_Serial.png)

Figura 4: Diagrama de tiempo donde se muestra al dirver 1 realizando una transmisión al driver 2. En este diagrama se observa que cuando el driver 2 recibe el mensaje, es decir, el bus levanta la bandera push en el driver 2, exactamente 3 ciclos de relojs después, el driver 1 atenderá la nueva solicitud de envió que tiene pendiente. 


### Evaluación del desempeño del bus

Para evaluar el rendimiento del bus paralelo se varío el número de drivers y se determinaron tres métricas, el mejor caso, el caso promedio y el peor caso, todos estos casos medidos en números de ciclos de reloj. 

***El mejor caso***, es aquel que se presenta cuando un driver intenta acceder al bus, y el bus está completamente desocupado, es decir, ninguno de los otros drivers está utilizando el bus, es decir, es una escritura en el bus cuando este se encuentra completamente libre. 

***El caso promedio***, es aquel que se presenta cuando todos los drivers están usando el bus y además, cada driver tiene  datos pendientes por ser procesados, que están a la espera de ser leído por el bus.

***El peor caso***, se presenta cuando el bus estaba vacío, y de repente, todos los drivers en el mismo instante de tiempo quieren escribir en el bus, por lo tanto, los mensajes se iran entregando a través del tiempo hacia los diferentes destinos, y exactamente el último dato en ser entregado, representa el peor caso.

Tabla 2: Mejor caso, caso promedio y peor caso en función del número de bits que tiene el mensaje (defino por el parámetro pckg_sz). Estos datos se obtuvieron para el bus serial con árbitro en una configuración de dos drivers.

| Número de bits    | Mejor caso(# de ciclos) | Caso Promedio(# de ciclos) | Peor caso (# de ciclos) |
| :---              |     :---:               |         :---:              |          ---:           | 
| 32                | 35                      | 69                         | 71                      |
| 64                | 67                      | 133                        | 135                     |
| 128               | 131                     | 261                        | 263                     |
| 256               | 259                     | 517                        | 519                     |
| 512               | 515                     | 1029                       | 1031                    |
| 1024              | 1027                    | 2053                       | 2055                    |


Tabla 3: Mejor caso, caso promedio y peor caso en función del número de drivers. Estos datos se obtuvieron para el bus serial con árbitro en una configuración con tamaño de paquete igual a 32 bits (pckg_sz =32).

| Número de drivers | Mejor caso(# de ciclos) | Caso Promedio(# de ciclos) | Peor caso (# de ciclos) |
| :---              |     :---:               |         :---:              |          ---:           | 
| 2                 | 35                      | 69                         | 71                      |
| 3                 | 35                      | 105                        | 107                     |
| 4                 | 35                      | 141                        | 143                     |
| 5                 | 35                      | 177                        | 179                     |
| 6                 | 35                      | 213                        | 215                     |
| 7                 | 35                      | 249                        | 251                     |
| 8                 | 35                      | 285                        | 287                     |



## Interfaz de bus serial sin arbitro

La interfaz de bus serial sin árbitro, tienen la descripción de entradas y salidas que se muestra a continuación

![Diagrama de entradas y salidas del bus serial sin árbitro](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Buses_Serial_Paralelo/images/Interfaz_Bus_Serial_Sin_Arbitro.png)

Figura 5: Diagrama de entradas y salidas del bus serial sin árbitro.


### Parámetros del bus

Para el uso del bus se cuenta con una serie de parámetros los cuales se describen a continuación:

***1) BROADCAST:*** Es un parámetro de 8 bits el cual representa la dirección de la funcionalidad de broadcast. Por defecto se coloca este parámetro en el valor de 0xFF.

***2) DRVRS:*** Este parámetro especifica el número de drivers o dispositivos que van a conectarse a la interfaz de bus serial. Para que el bus en sí mismo tenga sentido, este parámetro deberá colocarse en un valor mínimo igual a dos. El máximo teórico de dispositivos que se pueden conectar es de 128 dispositivos. El tener más drivers, afecta la cantidad de ciclos que dura el envio de un mensaje a través del bus.

***3) PCKG_SZ:*** Especifica el número de bits que va tener cada mensaje que se transfiere a traves del bus. El tener más o menos bits, sí afecta el rendimiento del sistema.

***4) BITS:*** Especifica el número de buses con los que contará cada driver para paralelizar la comunicación. Si se tienen dos buses, el ancho de banda se duplica, si se tienen 3 buses se triplica y así sucesivamente. Este duplicado de ancho de banda desde luego viene a un costo de área, por lo que se debe analizar adecuadamente cuando se va a utilizar. Incrementar el número de buses presentes en cada driver, no afecta la cantidad de ciclos de reloj que toma las transacciones.

### Puertos de Entrada/Salida del bus

Se describe a continuación la descripción de las entradas y salidas que posee el bus:

***1) CLK:*** Entrada del reloj principal del sistema.

***2) Reset:*** Entrada del reset del sistema, activa en alto.

***3) D_pop:*** Puerto de entrada de datos del bus, aquí entran al bus los datos que utilizarán los servicios del bus serial. El ancho de este puerto es definido por el valor del parámetro pckg_size.  Cada driver tendrá N diferentes puertos D_pop, donde N es igual al número de buses (definido por el parámetro bits) que se están utilizando.

***4) pndng:*** Es una bandera de entrada del bus, la cual es usada para recibir los mensajes. Siempre que está en alto, significa que el FIFO a la entrada, tiene datos pendientes que deberán ser leídos por el bus. Es el puerto que deberá conectarse a la bandera de salida del FIFO en su puerto de lectura llamada no empty. Por cada driver se tendrá N diferentes banderas pndng, donde N es igual al número de buses (definido por el parámetro bits) que se están utilizando. 

***5) pop:*** Es una bandera de salida del bus, utilizado para indicarle al FIFO conectada a la entrada, cuando se está realizando una lectura de los datos. De esta forma, se lee el dato y se escribe en este momento el bus. Dicha bandera de salida, siempre se conecta a la bandera de entrada de la FIFO en su puerto de lectura llamada read. Por cada driver se tendrá N diferentes banderas pop, donde N es igual al número de buses (definido por el parámetro bits) que se están utilizando.

***6) D_push:*** Puerto de salida de datos del bus, aquí salen del bus los datos que utilizaron los servicios del bus serial. El ancho de este puerto es definido por el valor del parámetro pckg_sz.  Cada driver tendrá N diferentes puertos D_pop, donde N es igual al número de buses (definido por el parámetro bits) que se están utilizando.

***5) push:*** Es una bandera de salida del bus, utilizado para indicarle al FIFO conectada a la salida, cuando se está realizando una escritura de un dato en la FIFO proveniente del bus. De esta forma, cuando el dato está a la salida del bus, luego de ser transportado, desde un driver hacia otro, está bandera le indica al FIFO del driver destino, que el dato que se encuentra en el puerto de salida D_push debe ser escrito en la FIFO. Dicha bandera de salida, siempre se conecta a la bandera de entrada de la FIFO en su puerto de escritura llamada write. Por cada driver se tendrá N diferentes banderas push, donde N es igual al número de buses (definido por el parámetro bits) que se están utilizando.

### Funcionamiento del bus 

Cada vez que se quiere usar los servicios del bus serial, todos los drivers que van a utilizar el bus, deberán hacerlo a través de interfaces FIFOs estándares. Se requiere por cada  driver 2 fifos. Para que el bus serial conozca el destino al que se debe enviar un paquete de datos, se tienen que conocer la siguiente información:

1) Primero cada driver tiene su propio identificador de destino, iniciando en 0  y así continua en funcion del número de drivers. Así, si se tiene 4 drivers por ejemplo, el primero tendrá el ID igual a cero, el segundo tendrá el ID igual a 1, el tercero tendrá el ID 2 y el cuarto ID tiene el ID igual a 3. 

2) Los primeros 8 bits más significativos en el mensaje que se coloca en el puerto de entrada D_pop, representan el destino del paquete. Así, por ejemplo, si se quiere enviar un paquete de tamaño igual a 32 bits, desde el driver 0 hasta el driver 3, los primeros 8 bits del mensaje a enviar por el driver 0 en su puerto D_pop deberán ser iguales a 03. Así, el mensaje  que envia el driver 0 deberá ser igual a D_pop[31:0] = 0x03XXXXXX.


Finalmente, ***el bus es capaz de leer en el mismo instante, mensajes de múltiples drivers, pero solo es capaz de entregar un único mensaje en el mismo instante de tiempo a un único driver***. Así las cosas, por ejemplo, si se tienen cuatro drivers, y los cuatro drivers colocan su bandera de pndng en alto para indicarle al bus que deben de transmitir un mensaje en el mismo instante de tiempo, el bus leerá a los 4 drivers en el mismo flanco de reloj, es decir, le enviará un uno en la bandera de pop a los cuatro drivers, pero a la hora de entregar los mensajes, el bus es incapaz de completar las 4 solicitudes en el mismo instante de tiempo, por lo tanto, el bus irá entregando un mensaje a un driver, luego en otro instante entregará el otro y así, hasta acabar con el último mensaje.Pero de nuevo, esto ocurrirá en instantes de tiempo diferentes, a diferencia de lo que sucede con la lectura que sí puede ser simultanea.

Cuando ***se realiza una transmisión en modo broadcast***, en este modo, el driver emisor colocará en los primeros 8 bits el identificador de broadcast, una vez que el mensaje es leído por el bus, el mensaje será entregado en el mismo instante de tiempo a todos los drivers restantes en la red a excepción del driver transmisor, esto significa que en el mismo instante de tiempo, todos los drivers diferentes al emisor conectados al bus, se les proporcionará el mensaje en su puerto D_push y se levantará la bandera push en el mismo instante de tiempo. 

Otro detalle adicional, es que ***aunque un driver tenga múltiples datos que ser enviados a través del bus, solo se atenderá uno a la vez y hasta que la entrega de este no sea concluída, no se realizará la lectura de un nuevo mensaje, esto sin importar de que la bandera de pndng este en alto***. Para ser más exactos, una vez que el dato es entregado al driver receptor, es decir, el bus pone en alto la bandera push en el driver receptor, la siguente solicitud pendiente en el driver emisor, será atendida exactamente tres ciclos de reloj después. En la Figura 2 se muestra un diagrama de tiempos que muestra este efecto.

![Tiempo que dura en atenderse un nuevo dato](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Buses_Serial_Paralelo/images/Lectura_Bandera_Pop_Serial_Sin_arbitro.png)

Figura 6: Diagrama de tiempo donde se muestra al dirver 1 realizando una transmisión al driver 2. En este diagrama se observa que cuando el driver 2 recibe el mensaje, es decir, el bus levanta la bandera push en el driver 2, exactamente 3 ciclos de relojs después, el driver 1 atenderá la nueva solicitud de envió que tiene pendiente. 


### Evaluación del desempeño del bus

Para evaluar el rendimiento del bus paralelo se varío el número de drivers y se determinaron tres métricas, el mejor caso, el caso promedio y el peor caso, todos estos casos medidos en números de ciclos de reloj. 

***El mejor caso***, es aquel que se presenta cuando un driver intenta acceder al bus, y el bus está completamente desocupado, es decir, ninguno de los otros drivers está utilizando el bus, es decir, es una escritura en el bus cuando este se encuentra completamente libre. 

***El caso promedio***, es aquel que se presenta cuando todos los drivers están usando el bus y además, cada driver tiene  datos pendientes por ser procesados, que están a la espera de ser leído por el bus.

***El peor caso***, se presenta cuando el bus estaba vacío, y de repente, todos los drivers en el mismo instante de tiempo quieren escribir en el bus, por lo tanto, los mensajes se iran entregando a través del tiempo hacia los diferentes destinos, y exactamente el último dato en ser entregado, representa el peor caso.

Tabla 4: Mejor caso, caso promedio y peor caso en función del número de bits que tiene el mensaje (defino por el parámetro pckg_sz). Estos datos se obtuvieron para el bus serial con árbitro en una configuración de dos drivers.

| Número de bits    | Mejor caso(# de ciclos) | Caso Promedio(# de ciclos) | Peor caso (# de ciclos) |
| :---              |     :---:               |         :---:              |          ---:           | 
| 32                | 35                      | 69                         | 71                      |
| 64                | 67                      | 133                        | 135                     |
| 128               | 131                     | 261                        | 263                     |
| 256               | 259                     | 517                        | 519                     |
| 512               | 515                     | 1029                       | 1031                    |
| 1024              | 1027                    | 2053                       | 2055                    |


Tabla 5: Mejor caso, caso promedio y peor caso en función del número de drivers. Estos datos se obtuvieron para el bus serial con árbitro en una configuración con tamaño de paquete igual a 32 bits (pckg_sz =32).

| Número de drivers | Mejor caso(# de ciclos) | Caso Promedio(# de ciclos) | Peor caso (# de ciclos) |
| :---              |     :---:               |         :---:              |          ---:           | 
| 2                 | 35                      | 69                         | 71                      |
| 3                 | 35                      | 105                        | 107                     |
| 4                 | 35                      | 141                        | 143                     |
| 5                 | 35                      | 177                        | 179                     |
| 6                 | 35                      | 213                        | 215                     |
| 7                 | 35                      | 249                        | 251                     |
| 8                 | 35                      | 285                        | 287                     |

Observe que en las tablas 4 y 5, no se varíó el número de buses (definido por el parámetro bits). En los casos de la tabla 4 y 5 se utilizó únicamente un bus. Sin embargo, el incrementar el número de buses tiene un efecto de duplicar el ancho de banda disponible, así por ejemplo, si se utilizan dos buses en lugar de uno, y un número de bits igual a 32 con dos drivers.  El mejor caso sería transportar en 35 ciclos de reloj, dos mensajes de 32 bits en lugar de uno. Así, como se observa, la cantidad de bits transferidos en la misma cantidad de ciclos de reloj se duplica, si se triplica el número de buses, esto se triplicaría y así sucesivamente. Por lo tanto existe una mejora sustancial al utilizar más buses.


## Descripción de las carpetas


Dentro de esta carpeta se encuentran 3 subcarpetas nombradas como: TestBench, src_Verilog e images. La primera contiene tres testbench elaborados en SystemVerilog, los cuales sirven para verificar funcionalmente las tres variantes estudiadas aquí de los buses. La segunda contiene dos bibliotecas de componentes, donde se encuentra el RTL descrito en SystemVerilog para cada uno de los buses descritos aquí y finalmente la carpeta images contiene las imágenes necesarias  utilizadas en este README para explicar cada uno de los buses. 



## Autores

Los principales autores de este trabajo son:

* **Ronny García-Ramírez** - *Diseño e implementación de los buses* - 
* **Carlos Salazar-García** - *Documentación y modificación de los testbench de cada bus* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

