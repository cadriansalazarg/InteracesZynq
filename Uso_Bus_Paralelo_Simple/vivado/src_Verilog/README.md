# Descripción del contenido de esta carpeta

En esta carpeta se encuentra contenido el código fuente del inversor, el Wrap del bus implementado en SystemVerilog y el Wrap del bus implementado en Verilog. El objetivo de cada uno de ellos se describe a continuación:

***1) inverter.v:*** Describe el RTL de un inversor que se utiliza para arreglar el problema de incompatibilidad que existe tanto del bus como del IP generado en HLS, con la FIFO del IP FIFO Generator, específicamente con las banderas full y empty. Ya que los primeros dos requieren de las bandera no_full y no_empty.

***2) prll_bs_gnrtr_n_rbtr_wrap_SV.sv:*** El Block Design no permite instanciar módulos descritos en SystemVerilog, por lo tanto, la sugerencia de Xilinx es embeber el módulo dentro de un Wrap elaborado en Verilog. El bus paralelo es imposible embeber en un Wrap de Verilog de forma directa, ya que utiliza datos empaquetados y no empaquetados de forma simultanea, y estos son incompatibles con Verilog, por lo tanto, la función de este RTL, es servir como Wrap en System Verilog, de manera que los puertos se describen de forma que sean completamente compatibles ante una instanciación de Verilog. Por lo tanto, este módulo es una interfaz de conexión entre el RTL del bus y el Wrap de Verilog.

***3) prll_bs_gnrtr_n_rbtr_wrap_V.v:*** Este módulo es un Wrap del bus, descrito en Verilog, de manera que este módulo es el que se agrega al block Design. Para hacer esto, este Wrap instancia al módulo  prll_bs_gnrtr_n_rbtr_wrap_SV.sv, donde este otro a su vez instancia el bus contenido en el archivo Library.sv.

## Tarea pendientes

Los dos archivos de Wrap contenidos en este repositorio, no son personalibles en función del número de drivers, ni en función del número de buses, solamente el número de bits es parametrizable. Por lo tanto, una futura mejora, es hacer completamente parametizables ambos Wraps, para que pueda variarse al igual que lo hace el bus, el número de drivers y el número de buses sin mayor problema. En este momento el número de drivers está fijado a dos y el número de buses a 1.


## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
