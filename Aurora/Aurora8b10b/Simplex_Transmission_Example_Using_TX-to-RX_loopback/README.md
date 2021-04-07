# Uso del IP Core Aurora 8b10b

En esta carpeta se muestra el uso del IP Aurora 8b10b para transmisión de datos utilizando la tarjeta de desarrollo Z706.

## Descripción desde una perspectiva de alto nivel

Para comprobar el funcionamiento del IP Aurora 8b10b mediante el uso de una única FPGA, en la tarjeta Z706, se realizó la implementación de una única Aurora Full-Duplex en comunicación consigo misma. Los módulos principales utilizados se muestran en la Fig. 1.

![Diagrama de bloques](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example_Using_TX-to-RX_loopback/vivado/images/High_Level_Block_Diagram.PNG)

Figura 1. Diagrama de alto nivel de los principales bloques utilizados.

El funcionamiento de los principales bloques utilizados se detalla a continuación:

***1) Generación de datos:*** Su principal función es generar una serie de datos que van a ser transmitidos para utilizando el módulo Aurora 8b10b. Estos datos son transmitidos al Aurora utilizando el protocolo AXI4-Stream, mediante una interfaz de framing. Se generan tres grupos de 20 datos enviados de forma consecutiva en el que cada nuevo dato es el dato anterior pero sumado cuatro.

***2) Secuencia de inicialización:*** Se encarga de monitorear la señal de reset y generar un pulso compatible con la unidad de Aurora.

***3) Aurora 8b10b:*** Modulo comunicación de alta velocidad. Se encuentra en una configuración Full-Duplex donde se comunica continuamente consigo mismo.

***4) Visualización de datos:*** Modulo utilizado para la visualización y comprobación de la integridad de los datos recibidos.

Adicional a estos, fue necesario la utilización de módulos extras el funcionamiento correcto de la implementación. El funcionamiento y la configuración de estos van a ser detallados más adelante.

## Detalles particulares del diseño

El diseño de bloques utilizado se muestra en la Fig. 2. En este se puede observar los diferentes bloques mencionados durante la descripción de alto nivel previa y algunos bloques adicionales. La generación de datos se realiza en modulo llamado FSM_AXI4_0, la secuencia de inicialización es generada en el módulo llamado FSM_Initial_Sequence_0 y por último la visualización de los datos es realizada en el bloque llamado ila_0.

![Diagrama Bloques Vidado](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example_Using_TX-to-RX_loopback/vivado/images/Block_Design_Vivado.PNG)

Figura 2. Diagrama de bloques del diseño generado en Vivado.

## Configuración de la unidad Aurora 8b10b
En este caso la unidad Aurora es utilizado una configuración Full-Duplex, con un ancho de línea de cuatro bytes. Se utiliza una interfaz de framing con la Share Logic en el core. Adicionalmente, por conveniencia de la implementación se seleccionan las fuentes de reloj de referencia e inicialización como de un único punto. La configuración aplicada se muestra en las Figs. 3, 4 y 5. Sin embargo, la configuración realizada en la Fig. 4 se observó no tener efecto alguno en el funcionamiento final del sistema. Se colocó por defecto el valor mínimo de velocidad permitida, 0.5Gbs con un reloj de referencia de 100MHz.

![Core Options Aurora](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example_Using_TX-to-RX_loopback/vivado/images/CoreOptions_Aurora.PNG)

Figura 3. Pestaña Core Options de la configuración de la Aurora 8b10b.

![GT Selection Aurora](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example_Using_TX-to-RX_loopback/vivado/images/GTSelections_Aurora.PNG)

Figura 4. Pestaña GT Selections de la configuración de la Aurora 8b10b.

![Shared Logic Aurora](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example_Using_TX-to-RX_loopback/vivado/images/SharedLogic_Aurora.PNG)

Figura 5. Pestaña Shared Logic de la configuración de la Aurora 8b10b.

Adicionalmente existen dos señales de control las cuales se deben tener presente: 
* Powerdown: permite apagar la unidad en caso de que se requiera, en caso de no necesitarse se debe mantener en cero en todo momento. 
* Loopback: nos permite realizar pruebas internas en las transceivers, se debe mantener en 0b000 si no se desea utilizar.

## Generación de los relojes utilizados
Para el correcto funcionamiento de la aurora es necesario la generación de tres relojes. El init_clk_in, el drpclk_in y el gt_refclk1. Por conveniencia se escogió el mismo valor para el init_clk_in y drpclk_in y fueron conectados a la misma salida. El gt_refclk ya que existe una alta dependencia las posibles frecuencias que puede tomar este y la velocidad de transmisión de datos. Los tres relojes fueron generados utilizando un clocking wizard, cuya configuración se muestra en la Fig. 6 y 7. Es importante asegurarse que las frecuencias coincidan con sus respectivas entradas, clk_out1 se encuentra conectado a init_clk_in y drpclk_in y clk_out2 a gt_refclk. A la entrada se fue conectado un reloj diferencial de 200MHz disponible en la placa.

![Clocking Options](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example_Using_TX-to-RX_loopback/vivado/images/ClockingOptions_ClockingWizard.PNG)

Figura 6. Pestaña de configuración del Clocking Wizard llamada Clocking Options.

![Output Clocks](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example_Using_TX-to-RX_loopback/vivado/images/OutputClocks_ClockingWizard.PNG)

Figura 7. Pestaña de configuración del Clocking Wizard llamada Output Clocks.

Los transceivers utilizados poseen posibilidades limitadas posibilidades sobre los relojes de referencia que son capaces de utilizar (para más detalles al respecto referirse al documento ug495 ZC706 User Guide, pag 41), los cuales en su gran mayoría son relojes externos, si embargo, este caso decidió utilizar un reloj generado internamente. Los transceiver utilizados posee un buffer interno que es capaz de conectarse a relojes generados internamente, sin embargo, según lo dicho por Xilinx este se debería utilizar exclusivamente para pruebas. Por esta razón es que fue necesario la adición de las dos líneas que muestran en la Fig. 8 en el xdc las cuales permiten bajar la severidad de este mensaje y convertirlo en advertencia en lugar de un error. El uso de este buffer fue ha sido probado para velocidades de hasta 6.6 Gps donde funcionó correctamente. 

![Severity Down](https://github.com/cadriansalazarg/InterfacesZynq/blob/master/Aurora/Aurora8b10b/Simplex_Transmission_Example_Using_TX-to-RX_loopback/vivado/images/SeverityDown.PNG)

Figura 8. Líneas necesarias para suprimir un error al usar el GTGREFCLK.

## Preocupaciones antirebote
Al realizarse el reset del sistema mediante un botón se consideró necesario la adición de algunas precauciones con el fin de evitar problemas generados a partir de esto. La primera es la adición de un módulo llamado Debouncing donde se colocaron FF en serie con el fin de evitar cambios rápidos en la señal de reset. Adicionalmente se colocó una And para evitar la activación del reset si el reloj generado por el Clocking Wizard no se encuentra activo.

## Secuencia inicial
Como secuencia inicial el único requisito es que el puso de reset debe ser mayor a 7 ciclos de reloj de init_clk_in. En este caso la única función que tiene la unidad de inicialización es asegurarse que como mínimo este reset tenga una duración de 13 ciclos de reloj. Una vez realizada la inicialización la unidad se queda en espera hasta que se reciba otro reset.

## Envío de datos
Como se mencionó anteriormente el envío de datos se realiza mediante el protocolo AXI4-Stream. Con el cual se debe estar pendiente por la señal s_axi_tx_tready para pode empezar la transmisión de datos. También es importante monitorear la señal channel_up del Aurora con el fin de filtrar falsas activaciones del ready. Una vez lista la transmisión de datos se hace usa de la entrada s_axi_tx_valid para el envío de datos. 

## Implementación:
Al realizar la implementación existen diversas maneras de realizar la asignación de transceivers a su respectiva IP de aurora. La primera y la cual es documentada en las guías de usuario de Xilinx se ve de esta forma:

**set_property LOC GTXE2_CHANNEL_X0Y11 [get_cells main_i/aurora_8b10b_0/inst/main_aurora_8b10b_0_0_core_i/gt_wrapper_i/main_aurora_8b10b_0_0_multi_gt_i/gt0_main_aurora_8b10b_0_0_i/gtxe2_i]**

Donde se modifica el valor consecutivo a Y que es 11 en este caso para modificar el transceiver a utilizar y es necesario instanciar el bloque gtxe2_i dentro de módulo de Aurora.

Sin embargo, no fue encontrada documentación sobre el valor Y de los transceivers en la ZC706. Se ha observado la tendencia de seguir el orden en el que son mencionados en la guía de usuario empezando por 0, sin embargo, no se tiene completamente seguridad.

Por esto es que se recomienda la segunda opción la cual consiste en asignar los puertos de transmisión y recepción a su respectivo identificador como se muestra en el siguiente ejemplo:
**set_property PACKAGE_PIN Y2 [get_ports txp]**
**set_property PACKAGE_PIN AB6 [get_ports rxp]**
**set_property PACKAGE_PIN Y1 [get_ports txn]**
**set_property PACKAGE_PIN AB5 [get_ports rxn]**

El el archivo Connections.xdc fueron dejadas ambas opciones donde una permite configurar el loopback interno presente en la tarjeta y la otra configura los puertos SMA. Si se desea utilizar una u otra se debe comentar y descomentar la opción respectiva.


# Detalles adicionales sobre la verificación del funcionamiento
## Simulación
Inicialmente es posible correr la simulación configurada. Es importante tomar en que el inicio de la unidad de la unidad puede llegar a tomar mucho tiempo, aún más a velocidades de transmisión bajas. La simulación se encuentra configurada para que se detenga de forma automática un tiempo después de que la inicialización del módulo de Aurora. Para verificar si funcionó correctamente se puede observar los datos recibidos los cuales deben iniciar en cero e irse sumándole cuatro en cada dato. Además, deben aparecer tres tlast en primero en 72, el segundo en 148 y el último en 224.

## Comprobación física
Primero es importante asegurarse el archivo xdc que se haya seleccionado el transceiver correcto a utilizar. Una vez generado el bitstream y programada la FPGA deberían pasar varias cosas. La primera es que el LED derecho se debe encender, este nos da una indicación que el Clocking Wizard está generando el reloj correctamente, en caso de no encenderse se puede utilizar el botón derecho para reiniciar el Clocking Wizard. Lo segundo es que si la unidad Aurora logró levantar el canal se va a encender el LED izquierdo. Este está conectado directamente a la bandera channel_up y a menudo es suficiente para saber si logró una comunicación exitosa. Si se quiere verificar los datos llegados se debe estar conectado a través de un cable JTAG a la FPGA a través de cual Vivado dentro del Hardware Manajer va a ser capaz de detectarla automáticamente. Se debe ingresar a la configuración de Triggers donde se debe configurar el disparo utilizando la señal valid y el flanco positivo. Con esto configurado simplemente se debe resetear la unidad aurora utilizando el botón izquierdo y se deberían almacenar todos los datos leídos. Al igual que la simulación se esperan tres grupos de datos donde va a haber cuatro de diferencia entre cada dato. Se debe levantar la bandera tlast en tres ocasiones en los datos 72, 148 y 224.

# Descripción de las carpetas
Se cuenta con cuatro carpetas para la creación de este proyecto las cuales se detallan a continuación:
* **scrip:** Contiene el script para la creación del proyecto.
* **Test_Aurora:** Contiene los archivos de simulación.
* **Constraints:** Contiene las contrains necesarias para la implementación del proyecto.
* **src_Verilog:** Contiene todos los .v propios creados para la implementación del proyecto.


## Autores

El principal autor de este trabajo es:

* **David Solórzano Pacheco** 

Revisado por:

También puedes observar la lista de todos los [contribuyentes](https://github.com/cadriansalazarg/InterfacesZynq/contributors) quíenes han participado en este proyecto. 

