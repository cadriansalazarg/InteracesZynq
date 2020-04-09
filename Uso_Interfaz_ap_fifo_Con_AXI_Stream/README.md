# Creación de un Sumador utilizando la interfaz AXI4-Lite

## Objetivo del proyecto

El objetivo de este proyecto es familiarizarse con el flujo de trabajo de las interfaces AXI Lite utilizando IPs personalizados creados en Vivado HLS.

## Descripción del proyecto

Este proyecto consiste en la creación de un IP personalizado en Vivado HLS de un sumador, donde como operandos de entrada se utilizan dos arreglos los cuales se suman y se almacenan en otro arreglo de la forma Q[i] = A[i] + B[i]. El tamaño de cada arreglo es de 10 elementos y los datos son de tipo flotante. Adicionalmente se envía un elemento de tipo entero el cual se devuelve directamente de la forma DataOutput = DataInput.

Un pseudocódigo de la función del HLS se muestra aquí:
```C
void adder(float A[SIZE],float B[SIZE],float Q[SIZE],int DataInput,int *DataOutput){
	for(int i = 0; i < SIZE; i++)
		Q[i] = A[i] + B[i];
	*DataOutput = DataInput;
}

```

Todos los puertos de entrada y salida se declaran con una interfaz AXI Lite, por lo que este proyecto muestra como usar dicha interfaz. Finalmente, utilizando Vivado, se isntancia el IP junto con el procesador Zynq y un módulo de AXI Timer el cual se comunica igualmente por  AXILite de forma que se mida el tiempo de las transacciones. 

Finalmente utilizando el Vivado SDK, se desarrolla un software el cual envía un vector de datos utilizando AXI Lite hacia el IP, luego inicializa el IP y finalmente inicia la operación del IP. CUando los datos están listos, estos pueden ser leídos ya sea por interrupción o por sondeo (polling) depende de como se setea el parámetro llamado InterruptEnable_IP, si este es verdadero funciona con interrupciones, en cambio, si este es falso el IP opera con sondeo (polling).

A continuación se muestra una figura que ilustra desde una perspectiva de alto nivel el funcionamiento del sistema.

![Sumador personalizado generado en HLS donde todas las interfaces son generadas con AXI4-Lite, de esta forma se realiza la comunicación con el Zynq](https://raw.githubusercontent.com/cadriansalazarg/InterfacesZynq/master/Sumador_AXI_Lite/imagen/Sumador_AXI_4Lite.png)



## Plataforma de hardware

Para verificar el funcionamiento del sistema, todo el sistema fue testeado  utilizando una tarjeta de evaluación ZedBoard.

## Herramienta de software

Como herramienta de diseño del software embebido en el cual se creó todo el proyecto se utilizó Vivado HLS, Vivado y Vivado SDK en su versión 2018.3. Además se requiere instalar Minicom y configurar el puerto serial para recibir los datos provenientes de la ZedBoard mediante UART. Todas estas herramientas se ejecutaron sobre Ubuntu 16.04.6 LTS. 

## Descripción de las carpetas

Dentro de este repositorio se encuentran cuatro carpetas llamadas hls, vivado, arm_sdk e imágenes. La primera es la encargada de generar el Ip customizado del loopback, la segunda encargada de crear todo el proyecto de Vivado automáticamente mediante un script tcl. En la tercera se encuentran las diferentes versiones del software embebido que corre sobre el ARM y la última carpeta simplemente fue creada para agregar las imágenes como la utilizada en esta descripción por lo tanto, no aport valor para crear el proyecto.

## Descripción de pasos 

Los pasos para la ejecución de este proyecto se muestran de forma detallada [aquí](https://youtu.be/otCnqQpB8kA).

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

