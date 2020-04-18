## Descripción de la carpeta

Esta carpeta contiene los scripts necesarios para realizar la simulación Post Place & Route  directamente desde la terminal. Este script fue construido realizando ingeniería inversa sobre el proceso de simulación Post Place & Route utilizando la interfaz GUI de Vivado. 

La simulación Post Place & Route se compone de la ejecución de tres scripts: compile.sh, elaborate.sh y simulate.sh de acuerdo con la exploración de la carpeta que genera Vivado después de crear una simulación Post Place & Route. Dicha carpeta siempre estará en la ruta nombreProyecto.sim/sim_1/impl/timing/xsim en caso de que desee ser consultada.

A continuación se describe el contenido de esta carpeta:


***1. Carpeta nombrada TestBench:*** Esta carpeta contiene el testbench del sistema multi-FPGA. 

***2. Archivo nombrado como TestBench_Multi_FPGA.tcl:*** Script tcl el cual contiene los detalles de la simulación. En caso de que se desee modificar cuanto tiempo ejecuta la simulación, este script debe ser modificado. Por defecto este script ejecuta solo por un tiempo igual a #1000. Este script tcl, es invocado cuando se ejecuta el script simulate.sh. 

***3. Archivo nombrado como compile.sh:*** Este es el primer script que debe ejecutarse, se encarga de compilar el Netlist que se encuentra en la ruta ../FPGA/Netlist_Files/, por lo tanto, antes de ejecutar este script, se debe asegurar de que ya la netlist haya sido previamente creado. Todo los archivos compilados serán escritos en la biblioteca xsim.dir/xil_defaultlib. Para ejecutarlo se realiza de la siguiente forma ```./compile.sh```

***3. Archivo nombrado como elaborate.sh:*** Este es el segundo script que debe ejecutarse, se encarga de elaborar toda la simulación, para ello se crea un snapshot de la misma, en la ruta xsim.dir/TestBench_Multi_FPGA_time_impl Para ejecutarlo se realiza de la siguiente forma ```./elaborate.sh```

***4. Archivo nombrado como simulate.sh:*** Este es el tercer script el cual se encarga de realizar la simulación. Este archivo utiliza el archivo tcl llamado TestBench_Multi_FPGA.tcl. Aquí se invoca al simulador de vivado y la simulación da inicio, hasta terminar en el tiempo definido por el archivo TestBench_Multi_FPGA.tcl o antes en caso de que el TestBench tenga una sentencia de $finish. Para ejecutarlo se realiza de la siguiente forma ```./simulate.sh```

***5. Archivo nombrado como plot.sh:*** Este es el cuarto script. Este archivo solo se ejecuta en caso de que se desee observar las formas de onda, creadas durante la simulación. Por lo tanto, no s necesario su ejecución. Para ello se debe asegurar de que en el testbench se agregó una sentencia para crear un archivo vcd. Para ver las formas de onda, dicho script utiliza el visor de ondas gtkwave, por lo tanto, asegurese de tenerlo instalado antes de ejecutar este script. Para ejecutarlo se realiza de la siguiente forma ```./plot.sh```

***5. Archivo nombrado como clean.sh:*** Cada vez que se realiza una simulación, se genera muchos archivos los cuales desde luego pueden originar problemas en la ejecución. Incluso, cuando se realiza algunos cambios, algunas veces, algunos archivos no se eliminan y por lo tanto esto puede generar conflictos. Este archivo en realidad debería ser el archivo que se ejecuta de primero, para cada vez que hagamos un cambio y queramos lanzar una nueva simulación, antes de compilar, se recomienda ejecutar este archivo para limpiar todo el proyecto y así evitar posibles conflictos. Este script lo que hace es restablecer todo el proyecto a su estado original. Para ejecutarlo se realiza de la siguiente forma ```./clean.sh```

## Autores

Los principales autores de este trabajo son:

* **Alfonso Chacón Rodríguez** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto.
