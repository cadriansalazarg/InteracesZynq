# Descripción de esta carpeta

El software contenido dentro de esta carpeta está pensado para ser ejecutado sobre el hardware de un Loopback personalizado en Vivado HLS, donde el tamaño de los arreglos de entrada es variable. Este código funciona utilizando sondeo (polling). El hardware se ejecutará repetidamente la cantidad de veces determinadas por la variable const unsigned int num_tests = 10000; por lo tanto aquí, el hardware será testeado 10000 veces.

## Consideraciones a tener en cuenta

* Lo único que debería cambiarse de este código es el macro SIZE el cual indica el tamaño de los arreglos a utilizar  y la constante num_tests, la cual define el número de veces que se testeará el hardware. Todo lo demás nunca debería tocarse.

* Al ser este software utilizado para aquellas versiones donde el tamaño del arreglo es variable, el máximo valor permitido de la variable SIZE será 2048 siempre y cuando no se haya cambiado de valor el parámetro del dma Width of buffer length register de su valor de 16. Así el parámetro SIZE podrá variar hasta un valor máximo de 2048. El mínimo valor testeado fue de 8.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 
