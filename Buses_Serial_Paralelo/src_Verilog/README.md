# Descripción de esta carpeta

Dentro de esta carpeta se encuentran dos bibliotecas de componentes, la primera llamada Library.sv y la segunda llamada fifo.sv, dentro de estas bibliotecas, se encuentra la descripción RTL de los tres diferentes buses estudiados aquí: el bus paralelo sin árbitro, el bus serial con árbitro y el bus serial sin árbitro. El top de estos componentes se encuentra contenido dentro del archivo llamado Library.sv, nombrados de la siguiente forma:

***1) Bus paralelo sin árbitro:*** Módulo ubicado dentro del archivo Library.sv nombrado como ***prll_bs_gnrtr_n_rbtr***.

***2) Bus serial con árbitro:*** Módulo ubicado dentro del archivo Library.sv nombrado como ***bs_gnrtr***.

***3) Bus serial sin árbitro:*** Módulo ubicado dentro del archivo Library.sv nombrado como ***bs_gnrtr_n_rbtr***.

La biblioteca fifo.sv contiene componentes que son utilizados por la biblioteca Library.sv para crear los diferentes buses que se describen en esta carpeta. Por lo tanto, en caso de que se desee ya sea simular, sintetizar o integrar el bus en el Block Design de Vivado, para todos estos casos, ambos archivos deberán integrarse al proyecto ya que ambos contienen en conjunto, los componentes necesarios para crear cada uno de los buses que se estudiaron aquí.


## Autores

Los principales autores de este trabajo son:

* **Ronny García-Ramírez** - *Diseño e implementación de los buses* - 
* **Carlos Salazar-García** - *Documentación y modificación de los testbench de cada bus* -

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto.  

