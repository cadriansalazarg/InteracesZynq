# Aurora 8b10b en modo simplex

## Objetivo de la carpeta

Comprender la forma en la que trabaja el IP Core de Xilinx Aurora 8b10b utilizado para en transmisiones de datos en modo simplex. 

## Descripción del diseño desde una perspectiva de alto nivel

Para comprobar el funcionamiento del módulo Aurora 8b10b en modo simplex, se desarrollo un sistema con dos FPGA, donde en una FPGA se colocará un  IP Core Aurora 8b10b trabajando en modo simplex como transmisor, y por otro lado, la otra FPGA contiene otro IP Core Auora 8b10b operando igualmente en modo simplex pero como receptor. A continuación se muestra el diagrama de bloques del sistema propuesto.

![Diagrama de bloques](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/BlockDiagram.png)

Figura 1: Diagrama de bloques del sistema multi-FPGA simulado para evaluar la comunicación simplex del IP Core Aurora 8b10b

El diagrama de bloques se compone de 4 módulos los cuales se detallan a continuación:

***1) Generador de tráfico:*** Este bloque se encuentra contenido en la FPGA encargada de la transmisión de datos. El generador de tráfico se encarga de generar los datos que serán transmitidos utilizando el IP Core Aurora 8b10b siguiendo una secuencia pseudo aleatoria generada a partir de un LFSR. Además la duración de los datos válidos es variable, por lo tanto, no solo se aleatoriza los datos, sino también la duración del frame de datos ser transferido. Finalmente, los datos se transforman al protocolo AXI Stream, para que sean compatibles con el Aurora 8b10b.


***2) Aurora 8b10b en modo simplex como transmisor:*** Este bloque contiene el IP Core Aurora 8b10b operando en modo simplex configurado como transmisor. Se ubica en la FPGA transmisora. Este IP Core recibe como entrada los datos que provienen del generador de tráfico y se encarga de transmitir esto, a través de los enlaces seriales de alta velocidad. Además, este IP Core recibve tres señales que proviene del IP Core Aurora 8b10b receptor, utilizadas para la sincronización de los canales de comunicación.


***3) Aurora 8b10b en modo simplex como receptor:*** Este bloque contiene el IP Core Aurora 8b10b operando en modo simplex configurado como receptor. Se encuentra localizado en la FPGA receptora. Este IP Core recibe como entrada los datos que provienen del IP Core Aurora 8b10b a través de los enlaces seriales de alta velocidad. Además, este IP Core genera 3 banderas, las cuales se envían a la FPGA transmisora y su función es sincronizar el canal de comunicación entre el receptor y el transmisor. La salida de este IP Core se encuentra codificado en protocolo AXI Stream.

***4) Verificador del tráfico de datos recibido:*** Este bloque se encuentra en la FPGA receptora. Su función es tomar los datos de salida del módulo Aurora 8b10b y asegurarse que estos datos fueron recibidos correctamente.Para ello utiliza en su implementación el mismo generador de datos pseudo aleatorio localizado en el transmisor, configurado con la misma semilla, de esta forma, se valida si los datos recibidos son los mismos que fueron transmitidos. Finalmente, este bloque contiene un contrador de la cantidad total de errores ocurrido en la comunicación para evaluar la transmisión de datos a través del canal.


## Detalles particulares del diseño


### Inicialización del canal


Cuando se utiliza el IP Core Aurora 8b10b en configuración Simplex, es necesario asegurarse que el canal fue correctamente inicializado antes de realizar el envio de datos. Para una transmisión y recepción de datos en modo Simplex, se proponen dos métodos para sincronizar el transmisor y el receptor: 1) Usando un Backchannel o 2) Usando temporizadores. De acuerdo con la información contenida en la web, a pesar de que el uso de un backchannel requiere del uso de 3 o 4 pines extra, en función del número de lanes utilizados, este método es el más simple, ya que únicamente se deben interconectar las señales aligned, bonded, verify, y reset. Así, el receptor le indicará al transmisor asertando estas banderas, cuando el canal receptor se encuentra listo para recibir datos y de esta forma el transmisor, podrá iniciar el envió de estos. Debido a que sólo se está utilizando un lane, solo se debe interconectar tres banderas (aligned, verify, y reset). El IP Core automáticamente sólo generará estas tres banderas debido a que sólo se utiliza un lane.


### Configuración del Aurora como transmisor


En esta sección se muestran diferentes capturas de pantalla que muestran como fue configurado el IP Core Aurora 8b10b en modo simplex, operando como transmisor:

![Core Option parte 1](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_tx_core_options.png)

Figura 2: Captura de pantalla de las opciones de configuración "Core Options" del IP Core Aurora 8b10b configurado como transmisor en modo simplex parte 1.


![Core Option parte 2](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_tx_core_options_1.png)

Figura 3: Captura de pantalla de las opciones de configuración "Core Options" del IP Core Aurora 8b10b configurado como transmisor en modo simplex parte 2.


![GT Selection](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_tx_GT_Selection.png)

Figura 4: Captura de pantalla de las opciones de configuración "GT Selection" del IP Core Aurora 8b10b configurado como transmisor en modo simplex.


![Shared Logic](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_tx_core_Shared_Logic.png)

Figura 5: Captura de pantalla de las opciones de configuración "Shared Logic" del IP Core Aurora 8b10b configurado como transmisor en modo simplex.

Finalmente, siguiendo está configuración se obtendrá un IP Core como el que se muestra en la Figura 6. Debe observarse que no todos los pines de salida son necesarios, para la prueba que se realizó, algunos pines no fueron utlizados, (sync_clk_out, gt_reset_out, gt_qpllclk_quad1_out, gt_qpllrefclk_quad1_out) y por lo tanto no fueron conectados como pines externos.


![Shared Logic](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_tx_bd.png)

Figura 6: Captura de pantalla del diagrama de entradas y salidas generado luego de aplicar las configuraciones establecidas aquí. Observe que hay cuatro pines de salida que no se hacen externos debido a que para esta configuración, no son necesarios.


### Configuración del Aurora como receptor


En esta sección se muestran diferentes capturas de pantalla que muestran como fue configurado el IP Core Aurora 8b10b en modo simplex, operando como receptor:

![Core Option parte 1](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_rx_core_options.png)

Figura 7: Captura de pantalla de las opciones de configuración "Core Options" del IP Core Aurora 8b10b configurado como receptor en modo simplex parte 1.


![Core Option parte 2](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_rx_core_options_1.png)

Figura 8: Captura de pantalla de las opciones de configuración "Core Options" del IP Core Aurora 8b10b configurado como receptor en modo simplex parte 2.


![GT Selection](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_tx_GT_Selection.png)

Figura 9: Captura de pantalla de las opciones de configuración "GT Selection" del IP Core Aurora 8b10b configurado como receptor en modo simplex.


![Shared Logic](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_tx_core_Shared_Logic.png)

Figura 10: Captura de pantalla de las opciones de configuración "Shared Logic" del IP Core Aurora 8b10b configurado como receptor en modo simplex.

Finalmente, siguiendo está configuración se obtendrá un IP Core como el que se muestra en la Figura 11. Debe observarse que no todos los pines de salida son necesarios, para la prueba que se realizó, algunos pines no fueron utlizados, (sync_clk_out, gt_reset_out, gt_qpllclk_quad1_out, gt_qpllrefclk_quad1_out) y por lo tanto no fueron configurados como pines externos.


![Shared Logic](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/images/Simple_tx_bd.png)

Figura 11: Captura de pantalla del diagrama de entradas y salidas generado luego de aplicar las configuraciones establecidas aquí. Observe que hay cuatro pines de salida que no se hacen externos debido a que para esta configuración, no son necesarios.


## Detalles adicionales del test bench sobre la operación del Aurora 8b10b

***1) Instanciación de módulos:*** Observe que el test bench instancia 6 diferentes módulos: a) el módulo tx_aurora_8b10b_0_FRAME_GEN.v es el encargado de generar los frames que serán transmitidos utilizando un filtro LFSR. Este módulo es el encargado de generar la secuencia pseudo aleatoria. b) el módulo tx_aurora_8b10b_0_LL_TO_AXI_EXDES.v es el encargado de convertir los datos generados por el módulo anterior, en datos compatibles con el protocolo AXI Stream. c) el módulo transmitter.v es un wrapper del IP Core Aurora 8b10b en modo simplex, operando como transmisor (ver sección arriba). Además, preste especial atención a la incorporación de registros adicionales para algunas de las banderas, las cuales son recomendadas por el fabricante. Debe tenerse en cuenta que el block design del IP Aurora 8b10b configurado como transmisor, debe nombrarse como simplex_tx, para que pueda ser instanciado de forma automática por este módulo, o al menos, debe asegurarse de cambiar el nombre. d)el módulo receiver.v es un wrapper del IP Core Aurora 8b10b en modo simplex, operando como receptor (ver sección arriba). Además, preste especial atención a la incorporación de registros adicionales para algunas de las banderas, las cuales son recomendadas por el fabricante. Debe tenerse en cuenta que el block design del IP Aurora 8b10b configurado como receptor, debe nombrarse como simplex_rx, para que pueda ser instanciado de forma automática por este módulo, o al menos, debe asegurarse de cambiar el nombre. e) el módulo aurora_8b10b_0_AXI_TO_LL_EXDES.v se encarga de tomar los datos en AXI Stream recibidos del lado del receptor y transformarlos a un protocolo paralelo. f) el módulo aurora_8b10b_0_FRAME_CHECK.v se encarga de tomar los datos generados por el bloque anterior, y adicionalmente, utilizando el mismo generador de datos pseudo aleatorio utilizado en el bloque generador de frames, se compara que los datos recibidos por el receptor, fueron correctos. Todos los módulos descritos aquí se encuentran [aquí](https://github.com/cadriansalazarg/InterfacesZynq/tree/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/src_Verilog).

***2) Block Design utilizados para los bloques transmisor y receptor del Aurora 8b10b:*** Debe asegurarse que en el block design del transmisor, el IP Core del Aurora se configura de acuerdo a la configuración que se muestra arriba, y que el IP Core final, luce como el IP que se muestra en la Figura 6. Además asegurese de nombrar el block design como simplex_tx, de lo contrario cuando el módulo transmitter.v instancie este, no podrá encontrar este bloque. De la misma forma, asegurarse que en el block design del receptor, el IP Core del Aurora se configura de acuerdo a la configuración que se muestra arriba, y que el IP Core final, luce como el IP que se muestra en la Figura 11. Además asegurese de nombrar el block design como simplex_rx, de lo contrario cuando el módulo receiver.v instancie este, no podrá encontrar este bloque. Una copia tanto del block design nombrado como simplex_tx y el simplex_rx se encuentra [aquí](https://github.com/cadriansalazarg/InterfacesZynq/tree/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/bd)

***3) Periodos de reloj utilizados:*** Preste especial atención en el test bench utilizado que se encuentra [aquí](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/TestBench/tb_main.sv) y observe a qué frecuencia se colocaron tanto los relojes del trasmisor como los tres relojes del receptor. Los tres relojes son nombrados como drpclk_in, init_clk_in y gt_refclk1.

***4) Secuencia de reset utilizada:*** Preste especial atención en el test bench utilizado que se encuentra [aquí](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/TestBench/tb_main.sv) y observe como debe realizarse la secuencia de reset del IP Core Aurora 8b10b. Observe que se utiliza la misma configuración tanto para el transmisor como el receptor. Las dos señales de reset de interés son nombradas como: rx_system_reset_0, gt_reset_rx para el receptor y tx_system_reset_0, gt_reset_tx para el transmisor.

***5) Control del IP:*** Preste especial atención en el test bench utilizado que se encuentra [aquí](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/TestBench/tb_main.sv) y observe que tanto para el transmisor como para el receptor, la señal de control loopback de 3 bits, debe conectarse a 0, y la señal power_down debe igualmente poner a tierra, para asegurar una operación normal.

***5) Displays en consola:*** Preste especial atención en el test bench utilizado que se encuentra [aquí](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example/TestBench/tb_main.sv) y observe que tan pronto como se reciba correctamente el primer dato, el test bench finalizará de forma automática pasados 5us. Además, observe que en la consola se imprimirá siempre el mensaje transmitido como el mensaje recibido del lado del receptor. Además en caso de que se presente un error, la simulación filalizará por sí sola en un periodo de tiempo igual a 1us. Es importante que revise la simulación para observar este efecto.


***4) Tiempo de simulación:*** Tenga en cuenta que para que ambos canales se inicialicen correctamente, debe transcurrir mucho tiempo, esto puede tomar incluso 100us, por lo que asegurese de correr la simulación por bastante tiempo para poder observar la simulación correcta del diseño. En todo caso, el parámetro SIM_MAX_TIME controla el máximo tiempo que durará la simulación, en caso de que los canales no se inicialicen correctamente. Este parámetro está ajustado al valor de 200us, en caso de que se quiera simular por más tiempo, asegurese de cambiar este parámetro.


## Descripción de las carpetas


Dentro de esta carpeta se encuentran 4 subcarpetas nombradas como: TestBench, bd, src_Verilog e images. La primera contiene el test bench utilizado implementado en SystemVerilog. La segunda contiene el Block Design de ambos bloques Aurora8b10b uitilizados. La tercera contiene seis módulos en Verilog que son utilizados por el test bench para constuir la simulación y finalmente la carpeta images contiene las imágenes necesarias  utilizadas en este README para explicar el diseño.

## Actividades pendientes

Crear dos main sintetizables, uno para el transmisor y otro para el receptor instanciando los módulos construidos aquí y generar sus respectivos constrains, para generar pruebas utilizando las FPGAs mediante conexiones por SMA.

## Autores

Los principales autores de este trabajo son:

* **Carlos Salazar-García** 

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

