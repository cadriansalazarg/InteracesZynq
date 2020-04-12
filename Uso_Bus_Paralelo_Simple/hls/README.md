# Descripción de la carpeta

Esta carpeta contiene el código fuente que se encarga de generar el IP personalizado utilizando Vivado HLS. Aquí se reciben dos arreglos de entrada vía AXI LITE, los cuales son reenviados vía una interfaz ap_fifo fuera del bus. Fuera del IP, mediante el bus, estos arreglos se invierten, en el sentido de que el arreglo que recibió el driver 1 le llegará al driver 0 y el arreglo que recibió el driver 1 lo recibirá ahora el driver 0. Una vez se reciben estos arreglos mediante una interfaz ap_fifo, los mismos son enviados vía AXI Lite. Adicionalmente el retorno de la función tambiéns e reaiza vía AXI Lite.

Se muestra aquí un pseudo código del algoritmo del HLS.

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
## Detalles importantes

Preste especial atención a la lectura de los FIFOs que se realiza tanto en el Loop 2 como en el 3. Dado que el IP personalizado desde luego va mucho más rápido, en comparación a la ruta que tienen que hacer los datos a través de ambos FIFOs y de el bus paralelo, la lectura entonces de los FIFOs debe realizarse de forma bloqueante, razón por la cual dentro de cada for, cuyo objetivos es llevar el conteo de los elementos leídos, se encuentra un while cuyo objetivo es, en caso de que se requiera leer el FIFO dado que aún se tienen elementos pendientes de leer, dicha lectura no se podrá ejecutar hasta que realmente el dato esté en la FIFO, de está forma se evita caer en el error de leer la FIFO cuando esta está vacía.

## Lista de documentos

Se encuentra dentro de esta carpeta los diferentes archivos contenidos dentro de esta carpeta.

* *customized_IP.cpp:* Esta archivo contiene el código fuente que se encarga de generar la aplicación personalizada usando las interfaces ap_fifo y la interfaz AXI Lite.
* *customized_IP.hpp:* Este archivo contiene el header file asociado al IP core personalizado.
* *customized_IP_tb.cpp:* Este archivo contiene el testbench encargado de estimular el IP core personalizado.
* *directives.tcl:* Este archivo contiene todas las directivas: los puertos de entrada/salida que se declaran cuatro de tipo AXI Lite y otros cuatro de tipo ap_fifo. Además el retorno de la función se declara como AXI Lite.  
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
