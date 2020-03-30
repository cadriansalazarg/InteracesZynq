# Guía de uso

# Descripción de la carpeta

Dentro de esta carpeta se muestra los archivos de software en C que se ejecutan en el SDK. Todos estos ejemplos se encuentran localizados en la raíz  /opt/SDK/2018.3/data/embeddedsw/XilinxProcessorIPLib/drivers/axidma_v9_8/examples/xaxidma_example_sg_poll.c . Se encuentran dos carpetas uno para el caso del software cuando se considera el Scatter/Gather y otra sin considerar el Scatter/Gather. Los archivos xaxidma_example_multichan_sg_intr.c, xaxidma_example_poll_multi_pkts.c y xaxidma_example_sgcyclic_intr.c no fueron evaluados pero se dejan aquí como posibles futuros casos de estudio.

# Pasos a seguir para su uso

1. Luego de que se genera el archivo bitstream dentro de Vivado se debe exportar el hardware para ello se le da click a la pestaña File, luego se selecciona la opción Export y  finalmente se elige Export Hardware, se incluye el bitstream y se le da Ok.

2. Luego se deberá abrir el Vivado SDK de Xilinx para ello se le da click a la pestaña File y se selecicona Launch SDK.

3. Una vez que el SDK abre, se crea un nuevo proyecto de aplicación de Hola mundo en el SDK para ello se debe dar click en File -> New -> Application Project, se le agrega un nombre , se le da click a Next y se selecciona la plantilla Helloworld y se le da Finalizar.

4. Despliegue la carpeta color azul que tiene por nombre el que usted le asignó en el paso anterior y seguidamente despliegue igualmente la carpeta src. Luego abra el archivo helloworld.c y sustituya su contenido por el archivo en C que desea verificar. *Nota:* Los archivos que puede utilizar son los que se encuentran contenidos dentro de las Con_Scatter_Gather o Sin_Scatter_Gather. Dentro de estas carpetas existiran 3 tipos de archivos, uno es un test del DMA, otro es una aplicación sencilla utilizando sondeo (polling) y el último es uno que utiliza interrupciones. Todos estos archivos fueron completamente testeados. No utilice los archivos que se encuentran al mismo nivel de estas carpetas llamados xaxidma_example_multichan_sg_intr.c, xaxidma_example_poll_multi_pkts.c y xaxidma_example_sgcyclic_intr.c ya que no han sido verificados y probablemente el hardware no les da soporte.

5. Abra el puerto serial y configurelo adecuadamente usando Minicom. Para conocer como tiene que ir la configuración utilice de apoyo el manual que se muestra [aquí](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug871-vivado-high-level-synthesis-tutorial.pdf) en la página 237 del documento.

6. Ejecute el proyecto, dandole clck derecho a la carpeta del proyecto y seleccionando la opción Run as y seleccione la opción Launch on Hardware. 




## Autores

El principal autor de este trabajo es:

* **Carlos Salazar-García** 

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
