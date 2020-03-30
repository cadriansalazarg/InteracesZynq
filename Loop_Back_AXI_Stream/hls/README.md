# Descripción de la carpeta hls

Aquí se describe la organización de la carpeta llamada hls. En esta carpeta es donde se genera el IP personalizado de un LoopBack utilizando Vivado HLS.

## Organización de los diferentes directorios.

En esta carpeta se encuentran tres directorios, los cuales se detallan a continuación.

* *LoopBack_Simple_Structure:* Este directorio contiene un LoopBack implementado de tamaño fijo, es decir, tanto el arreglo de entrada como de salida tienen tamaño fijo y no pueden ser editado dinámicamente, por lo tanto, una vez generado el IP este no puede cambiarse a no ser que se vuelva a generar el IP, para cambiar el tamaño de las transferencias se requiere modificar el macro SIZE dentro del archivo loopback.hpp, por defecto viene definido en SIZE = 8. Su estructura es bastante fácil de entender para el usuario.

* *LoopBack_Productor_Consumer_Structure:* Este directorio igualmente crea un loopback de tamaño fijo, similar al anterior, pero su estructura de codificación es más compleja, ya que se utiliza una estructura muy marcada de productor consumidor para su desarrollo. Para cambiar el tamaño del arreglo a recibir y retransmitir, se requiere editar el macro llamado SIZE contenido dentro del archivo loopback_PC.hpp, por defecto esta definido en 8. Además, se debe editar el parámetro depth al mismo valor de SIZE, editando la directiva ```set_directive_stream -depth 64 -dim 1 "loopback" bus_local``` localiza dentro del archivo directive_PC.tcl.

* *LoopBack_Productor_Consumer_Structure_Variable_Packet_Size:* Este directorio tienen como base la descripción del loopback de tamaño fijo utilizando una estructura de codificación prodcutor consumidor, pero adicionalmente, incorpora una variable de entrada adcional la cual se llama len_dma, encargada de definir el tamaño de las transferencias dma de forma variable en un rango de hasta 2048 enteros. Así, esta carpeta genera un LoopBack donde el tamaño de las transferencias por AXI Stream son de tamaño variable. El tamaño máximo lo define la directiva ```set_directive_stream -depth 64 -dim 1 "loopback" bus_local``` localizada dentro del archivo directive_PC_VS.tcl
