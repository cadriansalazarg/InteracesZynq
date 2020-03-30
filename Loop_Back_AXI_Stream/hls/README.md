# Descripción de la carpeta hls

Aquí se describe la organización de la carpeta llamada hls. En esta carpeta es donde se genera el IP personalizado de un LoopBack utilizando Vivado HLS.

## Organización de los diferentes directorios.

En esta carpeta se encuentran tres directorios, los cuales se detallan a continuación.

* *LoopBack_Simple_Structure:* Este directorio contiene un LoopBack implementado de tamaño fijo, es decir, tanto el arreglo de entrada como de salida tienen tamaño fijo y no pueden ser editado dinámicamente, por lo tanto, una vez generado el IP este no puede cambiarse a no ser que se vuelva a generar el IP, para cambiar el tamaño de las transferencias se requiere modificar el macro SIZE dentro del archivo loopback.hpp, por defecto viene definido en SIZE = 8.
