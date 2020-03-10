# Guía de uso

# Descripción de la carpeta

Dentro de esta carpeta se muestra los archivos de software en C que se ejecutan en el SDK. Todos estos ejemplos se encuentran localizados en la raíz  /opt/SDK/2018.3/data/embeddedsw/XilinxProcessorIPLib/drivers/axidma_v9_8/examples/xaxidma_example_sg_poll.c . Se encuentran dos carpetas uno para el caso del software cuando se considera el Scatter/Gather y otra sin considerar el Scatter/Gather. Los archivos xaxidma_example_multichan_sg_intr.c, xaxidma_example_poll_multi_pkts.c y xaxidma_example_sgcyclic_intr.c no fueron evaluados pero se dejan aquí como posibles futuros casos de estudio.

# Guía de uso

1. Luego de que se genera el archivo bitstream se debe exportar el hardware para ello se le da click a File, luego se selecciona la opción Export y  finalmente se elige Exporty Hardware, se incluye el bitstream y se le da Ok.

2. Luego se deberá abrir el SDK de Xilinx para ello se le da click a File y se selecicona Launch SDK.

3. Una vez que el SDK abre, se crea un nuevo proyecto de aplicación de Hola mundo en el SDK para ello se debe dar click en File -> New -> Application Project, se le agrega un nombre , se le da click a Next y se selecciona Helloworld y se le da Finalizar.

4. Abra dentro de la carpeta src, el archivo helloworld.c y sustituya su contenido por el archivo en C que desea verificar. 

5. Abra el puerto serial y configurelo adecuadamente usando Minicom.

6. Ejecute el proyecto, dandole clck derecho a la carpeta del proyecto y seleccionando la opción Run as y seleccione la opción Launch on Hardware. 
