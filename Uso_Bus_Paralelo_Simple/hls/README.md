# Descripción de la carpeta

Esta carpeta contiene el código fuente que se encarga de generar el código fuente de la aplicación. Aquí se genera un loopback en el cual los datos se reciben desde el Zynq dentro del IP utilizando AXI_LITE y posteriormente, estos datos se sacan del IP usando la interfaz ap_fifo, luego mediante un FIFO externo, estos datos vuelven a ingresar al IP por otra interfaz ap_fifo y finalmente, los datos se devuelven al Zynq vía AXI Lite. Se muestra aquí un pseudo código del algoritmo del HLS.

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

## Lista de documentos

Se encuentra dentro de esta carpeta los diferentes archivos contenidos dentro de esta carpeta.

* *customized_IP.cpp:* Esta archivo contiene el código fuente que se encarga de generar el loopback personalizado usando las interfaces ap_fifo y la interfaz AXI Lite.
* *customized_IP.hpp:* Este archivo contiene el header file asociado al loopback.
* *customized_IP_tb.cpp:* Este archivo contiene el testbench encargado de estimular el loopback.
* *directives.tcl:* Este archivo contiene todas las directivas: los puertos de entrada/salida que se declaran dos de tipo AXI Lite y dos de tipo ap_fifo. Además el retorno de la función se declara como AXI Lite. De la misma forma, se aplica tanto al for como al while se le aplica la directiva pipeline para mejorar el rendimiento del IP. 
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

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
