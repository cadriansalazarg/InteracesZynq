# Simulación Post Place and Route de un Sistema Multi FPGA Homogenéneo

## Objetivo del proyecto

Este proyecto muestra como realizar la simulación de un sistema multi-FPGA homogéneo utilizando el simulador que incorpora Vivado. 

## Descripción del proyecto

Este proyecto describe como realizar la simulación Post Place and Route de un sistema multi-FPGA homogéneo. 

Un sistema multi-FPGA homogéneo se define como aquel sistema multi-FPGA donde todas las FPGA que componen el sistema, están ejecutando el mismo bitstream , es decir, cada FPGA contiene exactamente la misma estructura lógica de configuración y además, todas las FPGAs son las misma.

La simulación presentada aquí se realiza de dos formas, utilizando la GUI de Vivado o simplemente simulando todo en modo batch o como lo denomina Xilinx en Vivado (Non project mode). Se plantea implementar tanto el proyecto como la simulación en modo batch ya que,la simulación Post Place & Route es computacionalmente muy costosa, por lo tanto, combiene ejecutar esta en modo script para aprovechar al máximo los recursos computacionales durante la simulación.





## Plataforma de hardware

Para verificar el funcionamiento del sistema, todo el sistema fue testeado  utilizando una tarjeta de evaluación ZedBoard.

## Herramienta de software

Como herramienta de diseño del software embebido en el cual se creó todo el proyecto se utilizó Vivado HLS, Vivado y Vivado SDK en su versión 2018.3. Además se requiere instalar Minicom y configurar el puerto serial para recibir los datos provenientes de la ZedBoard mediante UART. Todas estas herramientas se ejecutaron sobre Ubuntu 16.04.6 LTS. 

## Descripción de las carpetas

Dentro de este repositorio se encuentran cuatro carpetas llamadas hls, vivado, arm_sdk e imágenes. La primera es la encargada de generar el Ip customizado del loopback, la segunda encargada de crear todo el proyecto de Vivado automáticamente mediante un script tcl. En la tercera se encuentran las diferentes versiones del software embebido que corre sobre el ARM y la última carpeta simplemente fue creada para agregar las imágenes como la utilizada en esta descripción por lo tanto, no aport valor para crear el proyecto.

## Descripción de pasos 

Los pasos para la ejecución de este proyecto se citan abajo o si lo desea puede acceder al video que se muestra disponible [aquí](https://youtu.be/lfyQgXghWSA) donde se presentan estos mismos pasos siendo ejecutados.

_Lo primero que se debe hacer es crear  el IP personalizado, en Vivado HLS por lo tanto, dirijase en la consola de Linux hacia el interior de la carpeta hls._
```
cd hls
```
_Posteriormente, dentro de la carpeta hls se encuentran tres diferentes versiones del IP, escoja la que desea ejecutar y proceda a entrar al interior de la carpeta. Supondremos aquí que la versión del IP a crear es la más básica, el cual corresponde a la carpeta llamada _Posteriormente, dentro de la carpeta LoopBack_Simple_Structure por lo tanto debemos ingrear a esta y ejecutar el archivo run_hls.tcl localizado en su interior para automáticamente crear el IP personalizado._
```
cd LoopBack_Simple_Structure
```
```
vivado_hls -f run_hls.tcl
```
_Una vez que finaliza la creación del IP, se procede a crear todo el proyecto en Vivado, por lo tanto debemos ingresar a la carpeta vivado y lanzar vivado desde la terminal estando dentro de la carpeta vivado._
```
cd ../../vivado
```
```
vivado &
```
_Luego cuando vivado abre, seleccione la pestaña Tools y elija la opción llamada Run Tcl Script, posteriormente se selecciona el script llamado script_dma_LoopBack_IP.tcl y se le da la opción aceptar. Así, todo el proyecto se va a generar de forma automática hasta que termine de crear el bitstream._

_Antes de lanzar el SDK, finalizada la generación del bitstream, se le debeŕa seleccionar la pestaña File y se escoge la opción Export y se le da click a Export Hardware. Así, deberá aparecer una ventana emergente en la cual se deberá seleccionar la opción Include bitstream y darle click a OK. Posteriormente se debe lanzar el Vivado SDK seleccionando nuevamente la pestaña File y escogiendo la opción Launch SDK. Finalmente el Vivado SDK se abrirá._

_Asegúrese de haber programado la FPGA ya sea desde Vivado SDK o desde Vivado. Un LED azul encendido en la ZedBoard le indicará que está ya fue programada. Además,asegurese de conectar otro cable hacia la PC para conectar el UART de la ZedBoard hacia el puerto USB de la PC. Y abra el puerto utilizando Minicom, configurelo adecuadamente y dejelo abierto para utilizar la consola y monitorear el UART de la ZedBoard._

_Dentro del Vivado SDK seleccione la pestaña File, New y escoja la opción Application Project. Una ventana emergente se abrirá, deberá colocarsele un nombre adecuado, en este caso le pondremos el nombre helloworld y le damso click a la opción Next. Luego, cambiará la ventana emergente y se deberá seleccionar el Template de Helloworld y se le da la opción de Finish. Esto creará un template de proyecto Helloworld y aparecerán dos carpetas una llamada Helloworld y otra llamada Helloworld_bsp. Así, si se le da click derecho a la carpeta Helloworld de color azúl y se escoge la opción Run as y se elige la opción Launch on Hardware (System Debugger), deberá aparecer en la pantalla el mensaje Helloworld._

_Finalmente, despliegue la carpeta Helloworld, luego despliegue la subcarpeta src y finalmente  abra el archivo helloworld.c, luego borre todo el contenido de todo el archivo y cualquiera de las dos carpetas llamadas LoopBack_IP_DMA_simple_intr o LoopBack_IP_DMA_simple_polling, ambas son para transferencias de DMA de tamaño fijo, una utilizando interrupciones y otra polling. Así, seleccione la opción que prefiera, abra la carpeta que eligió y abra en un editor de texto el archivo llamado main.c. Copie su contenido y peguelo en el archivo helloworld.c. Reconstruya el proyecto, dandole click derecho a la carpeta color azul y seleccionando la opción Clean Project. Una vez que esto finaliza, ejecute el proyecto nuevamente seleccioanndo con click derecho la carpeta azul y escogiendo la opción Run as y eligiendo  Launch on Hardware (System Debugger).

## Tareas pendientes

A continuación se enlistan las tareas pendientes que se deben realizar:

* Limitar el máximo de las transferencias por AXI Stream, directamente desde el Vivado HLS, ya que de momento estas parecen no tener límite y más bien es Vivado quien lo limita mediante el parámetro del DMA Width of Length Buffer Register.
* Realizar una medición de tiempo de todas las versiones descritas aquí con el AXI Timer, así como el número de recursos utilizados para conocer cuales versiones son más eficientes.
* De acuerdo con el foro web descrito  [aquí](https://forums.xilinx.com/t5/Processor-System-Design/Axi-DMA-correct-parameters/td-p/639576). Para mejorar el rendimiento de las transferencias DMA se recomienda usar Scatter/Gather y aumentar el tamaño del parámetro del DMA llamado Max Burst Size, por lo tanto queda pendiente, elaborar una versión que utilice el modo Scatter/Gather del DMA y se compare su rendimiento contra la versión que ya es funcional de este repositorio.
* Manejar estas transferencias DMA y el control de los diferentes IPs utilizando directamente Linux en lugar del SDK como se utiliza aquí.

## Autores

Los principales autores de este trabajo son:

* **Alfonso Chacón Rodríguez** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

