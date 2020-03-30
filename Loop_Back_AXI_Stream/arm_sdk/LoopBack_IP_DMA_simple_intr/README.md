# Descripción de esta carpeta

El software contenido dentro de esta carpeta está pensado para ser ejecutado en cualquiera de los dos casos donde se creo un hardware de un Loopback personalizado en Vivado HLS, donde el tamaño de los arreglos de entrada es fijo. Este código funciona utilizando interrupciones. El hardware se ejecutará repetidamente la cantidad de veces determinadas por la variable const unsigned int num_tests = 1000000; por lo tanto aquí, el hardware será testeado 1000000 veces.

## Consideraciones a tener en cuenta

* Lo único que debería cambiarse de este código es el macro SIZE que define el tamaño con que fue creado el hardware y la constante num_tests, la cual define el número de veces que se testeará el hardware. Todo lo demás nunca debería tocarse.

* Al ser este software utilizado para aquellas versiones donde el tamaño del arreglo es fijo, asegurese de setear el macro SIZE de exactamente el mismo tamaño en que fue seteado el SIZE durante la creación del Loopback en Vivado HLS. De lo contrario existirá una disparidad entre el hardware y el software y no funcionará.

## Autores

Los principales autores de este trabajo son:

* **Kaleb Alfaro-Badilla** - *Guía y supervisión* - 
* **Carlos Salazar-García** - *Documentación y Desarrollo* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InteracesZynq/contributors) quíenes han participado en este proyecto. 
