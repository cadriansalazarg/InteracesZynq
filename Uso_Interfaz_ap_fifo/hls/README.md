# Descripción de la carpeta

Esta carpeta contiene el código fuente que se encarga de generar el sumador personalizado donde tanto las entradas y salidas como el retorno de la función son de tipo AXI4-Lite. Asímismo para mejorar el rendimiento del algoritmo se utiliza la directiva unroll aplicada al for. Se muestra aquí un pseudo código del algoritmo del HLS.

```C
void adder(float A[SIZE],float B[SIZE],float Q[SIZE],int DataInput,int *DataOutput){
	for(int i = 0; i < SIZE; i++)
		Q[i] = A[i] + B[i];
	*DataOutput = DataInput;
}
```

## Lista de documentos

Se encuentra dentro de esta carpeta los diferentes archivos contenidos dentro de esta carpeta.

* *adder.cpp:* Esta archivo contiene el código fuente que se encarga de generar el sumador.
* *adder.hpp:* Este archivo contiene el header file asociado al sumador.
* *adder_tb.cpp:* Este archivo contiene el testbench encargado de estimular el sumador.
* *directives.tcl:* Este archivo contiene todas las directivas tanto de los puertos de entrada/salida que se declaran como AXI4-Lite así como el retorno de la función. De la misma forma, se aplica al for la directiva unroll para mejorar el rendimiento de la suma. 
* *run_hls.tcl:* Este archivo se encarga de ejecutar de forma automatizada el IP core del sumador.


## Creación del IP personalizado del Loopback

Se realiza mediante la ejecución del script  run_hls.tcl mediante la ejecución del comando.

```
vivado_hls -f run_hls.tcl
```

Esto se encargará de generar de forma automatizada el IP. Finalmente, en caso de que se desee explorar las caracteristicas del IP generado se deberá ejecutar el comando

```
vivado_hls -p FirstTest/
```

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
