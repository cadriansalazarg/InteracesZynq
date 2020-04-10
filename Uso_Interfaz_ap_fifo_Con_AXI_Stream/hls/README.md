# Descripción de la carpeta

Esta carpeta contiene el código fuente que se encarga de generar el código fuente de la aplicación. Aquí se genera un loopback en el cual los datos se reciben desde el Zynq dentro del IP utilizando una interfaz axis y posteriormente, estos datos se sacan del IP usando la interfaz ap_fifo, luego mediante un FIFO externo, estos datos vuelven a ingresar al IP por otra interfaz ap_fifo y finalmente, los datos se devuelven al Zynq vía AXI Lite. Se muestra aquí un pseudo código del algoritmo del HLS.

```C
void customized_IP_block(hls::stream<AXISTREAM32> &input, hls::stream<AXISTREAM32> &output, hls::stream<data_t>& in_fifo, hls::stream<data_t>& out_fifo){
	productor(out_fifo, input);
	consumidor(in_fifo, output);
}

void productor(hls::stream<data_t>& out_fifo, hls::stream<AXISTREAM32> &input) {
	Loop_Productor: for (int i = 0; i < SIZE; i++) {
		auto a = input.read();
		//while(out_fifo.full());
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

## Lista de documentos

Se encuentra dentro de esta carpeta los diferentes archivos contenidos dentro de esta carpeta.

* *customized_IP.cpp:* Esta archivo contiene el código fuente que se encarga de generar el loopback personalizado usando las interfaces ap_fifo y la interfaz axis.
* *customized_IP.hpp:* Este archivo contiene el header file asociado al loopback.
* *customized_IP_tb.cpp:* Este archivo contiene el testbench encargado de estimular el loopback.
* *directives.tcl:* Este archivo contiene todas las directivas: los puertos de entrada/salida que se declaran dos de tipo axis y dos de tipo ap_fifo. Además el retorno de la función se declara como ap_ctrl_chain. De la misma forma, se aplica tanto al for como al while se le aplica la directiva pipeline para mejorar el rendimiento del IP, así como la directiva dataflow, para romper el flujo normal del algoritmo.
* *run_hls.tcl:* Este archivo se encarga de ejecutar de forma automatizada el IP core en HLS generado en este proyecto.


## Creación del IP personalizado del Loopback

Se realiza mediante la ejecución del script  run_hls.tcl mediante la ejecución del comando.

```
vivado_hls -f run_hls.tcl
```

Esto se encargará de generar de forma automatizada el IP. Finalmente, en caso de que se desee explorar las caracteristicas del IP generado se deberá ejecutar el comando

```
vivado_hls -p hls_customized_hw_prj/
```

## Consideraciones a tener en cuenta

Cuando se realiza la cosimulación, es posible identificar el siguiente Warning: ***This design has internal non-blocking FIFO/Stream accesses, which may result in mismatches or simulation hanging***. Esta advertencia lo que indica es que los datos al ser recibidos por una interfaz axis, llegan totalmente sin ningún tipo de control, pero por otro lado, cuando se lee o se escribe en la FIFO, solo se escribirá o leera en caso de que la FIFO no este vacía o la FIFO no este llena, de lo contrario ocurriría un error. Ahora, esto significa que existen dos tipos de interfaz, la axis la cual no tiene control de flujo y la ap_fifo la cual requiere que el estado de la FIFO sea adecuado para operar, por ésta razón, es claro que si por alguna razón la fifo se llena por ejemplo, el envío de datos se detendrá, y si de casualidad, en ese momento la interfaz axis continua enviando datos hacia el IP, dentremos entonces un problema de congestion de datos. Por lo tanto, esto es lo que significa dicho Warning. 

Desde luego en este caso, todo está muy bien balanceado y esta condición nunca va a ocurrir, pero es una advertencia que tenemos que considerar, ya que  podría haber aplicaciones donde esto sí sea relevante.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
