`timescale 1ns / 1ps

// Descripción de los parámetros
// PACKET_SIZE_BITS representa el tamaño del paquete en bits, se testearon los casos de 256, 512 y 1024
// NUMBER_OF_LANES representa el número de lanes con que se configura el Aurora, únicamente se verficó utilizando los valores de 1 y 2
// ID_TARGET_FPGA representa el identificador de la FPGA con la cual se conectará el Aurora, sirve para en transmisiones de tipo Broadcast, evitar que los paquetes se vuelvan cíclicos

module fifo_to_Aurora #(parameter PACKET_SIZE_BITS = 256, parameter NUMBER_OF_LANES = 1, parameter ID_TARGET_FPGA = 8'h01)  
    (user_clk, reset_TX_RX_Block, empty, rd_en, dout, s_axi_tx_tdata, s_axi_tx_tlast,
    s_axi_tx_tready, s_axi_tx_tvalid);
    
    localparam n = 32*NUMBER_OF_LANES; 
    
    localparam SIZE_OF_COUNTER = $clog2((PACKET_SIZE_BITS-64)/n);
    
    localparam S0 = 9'b000000001;
    localparam S1 = 9'b000000010;
    localparam S2 = 9'b000000100;
    localparam S3 = 9'b000001000;
    localparam S4 = 9'b000010000;
    localparam S5 = 9'b000100000;
    localparam S6 = 9'b001000000;
    localparam S7 = 9'b010000000;
    localparam S8 = 9'b100000000;
    
    input  user_clk;
    input reset_TX_RX_Block;
    input empty, s_axi_tx_tready;
    output reg rd_en, s_axi_tx_tlast, s_axi_tx_tvalid; 
    
    input [PACKET_SIZE_BITS-1: 0] dout;
    output reg  [(32*NUMBER_OF_LANES)-1: 0] s_axi_tx_tdata;
    
    reg [8:0] State;
    reg [8:0] NextState;
    
    reg  [(32*NUMBER_OF_LANES)-1: 0] s_axi_tx_tdata_reg1;
    reg  [(32*NUMBER_OF_LANES)-1: 0] s_axi_tx_tdata_reg2;
    
    reg empty_reg;
    reg [PACKET_SIZE_BITS-1: 0] dout_reg;
    
    reg rd_en_reg, s_axi_tx_tlast_reg, s_axi_tx_tvalid_reg;
    reg s_axi_tx_tlast_reg1, s_axi_tx_tvalid_reg1;
    reg s_axi_tx_tlast_reg2, s_axi_tx_tvalid_reg2; 
    
    reg load, enable_shift;
    
    reg store_valid_bytes;
    reg enable_counter;
    reg reset_internal_registers;
    
    reg [SIZE_OF_COUNTER-1:0] counter;
    
    reg [(14-NUMBER_OF_LANES):0] packet_valid_bytes; // Solo 14 bits, ya que los dos menos significativos se descartan por ser 0 siempre  // Si son 2 lanes, el bit MSB será siempre cero, por lo tanto, esta línea puede escribirse como reg [12:0] packet_valid_bytes; 
    
    reg [7:0] sequence_counter;
    reg enable_sequence_counter;
    wire [7:0] out_mux;
    reg selector, selector_reg;
    
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    // Registro para almacenar las entradas y salidas de este bloque
    // Tiene la función de almacenar las entradas y salidas de este bloque, esto para prevenir problemas de timing
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    always @(posedge user_clk) begin
        if (reset_TX_RX_Block) begin
            empty_reg <= 1'b0;
            rd_en <= 1'b0;
            store_valid_bytes <= 1'b0; 
            selector_reg <= 1'b0; 
        end else begin
            empty_reg <= empty;
            rd_en <= rd_en_reg;
            store_valid_bytes <= load;
            selector_reg <= selector;
        end
    end
    
    // Para el caso particular de estos tres registros que se muestran abajo, estos controlan el flujo de datos que va 
    // hacia el Aurora, específicamente el flujo de datos de las señales s_axi_tx_tdata, s_axi_tx_tlast, s_axi_tx_tvalid
    // La señal s_axi_tx_tready que genera el reset, puede ser dessartada en cualquier momento. Incluso lo puede hacer de
    // manera no síncrona con el user_clk, lo cual es un problema. Por lo tanto, para evitar esto, se realiza un 
    // encadenamiento de 3 flip flops, donde el enable es la señal de s_axi_tx_tready. De esta forma, si en algún momento
    // la señal de tx_ready se cae, estos registros nos e actualzarán, pero tampoco se perderá el dato. Permitiendo así 
    // que cuando esta señal sea assertada nuevamente, no exista problema alguno con los datos.
    always @(posedge user_clk) begin
        if (reset_TX_RX_Block) begin
            s_axi_tx_tdata_reg1 <= 0;
            s_axi_tx_tlast_reg1 <= 1'b0;
            s_axi_tx_tvalid_reg1 <= 1'b0; 
        end else if (s_axi_tx_tready) begin
            s_axi_tx_tdata_reg1 <= {out_mux, dout_reg[PACKET_SIZE_BITS-1-8:PACKET_SIZE_BITS-n]};
            s_axi_tx_tlast_reg1 <= s_axi_tx_tlast_reg;
            s_axi_tx_tvalid_reg1 <= s_axi_tx_tvalid_reg;
        end
    end
    
    always @(posedge user_clk) begin
        if (reset_TX_RX_Block) begin
            s_axi_tx_tdata_reg2 <= 0;
            s_axi_tx_tlast_reg2 <= 1'b0;
            s_axi_tx_tvalid_reg2 <= 1'b0; 
        end else if (s_axi_tx_tready) begin
            s_axi_tx_tdata_reg2 <= s_axi_tx_tdata_reg1;
            s_axi_tx_tlast_reg2 <= s_axi_tx_tlast_reg1;
            s_axi_tx_tvalid_reg2 <= s_axi_tx_tvalid_reg1;
        end 
    end
    
    always @(posedge user_clk) begin
        if (reset_TX_RX_Block) begin
            s_axi_tx_tdata <= 0;
            s_axi_tx_tlast <= 1'b0;
            s_axi_tx_tvalid <= 1'b0; 
        end else if (s_axi_tx_tready) begin
            s_axi_tx_tdata <= s_axi_tx_tdata_reg2;
            s_axi_tx_tlast <= s_axi_tx_tlast_reg2;
            s_axi_tx_tvalid <= s_axi_tx_tvalid_reg2;
        end 
    end
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    // Registro de desplazamiento 
    // Tiene la función de almacenar el paquete completo leído directamente desde la FIFO y luego ir 
    // sacando los datos ya sea de 32 bits en 32 bits, o de 64 bits en 64 bits, esto en función del
    // número de lanes en los que se configuró el Aurora.
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    
    always @(posedge user_clk) begin
        if (reset_TX_RX_Block | reset_internal_registers) begin
            dout_reg <= 0;
        end
        else if (load) begin
            dout_reg <= dout;
        end
        else if (enable_shift && s_axi_tx_tready) begin
            dout_reg <= {dout_reg[(PACKET_SIZE_BITS-1-n):0],{n{1'b0}}};
      end
    end
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    // Registro de entrada paralela, salida paralela
    // Tiene la función de extraer del paquete el número de datos válidos. Se utiliza un generate
    // ya que la codificación es diferente en función del número de lanes. En el caso de un único lane
    // no se utilizan los dos primeros bits, esto porque el tamaño de paquete establece el número de bytes válidos, por 
    // lo que considerando que los datos son de 32 bits, o de 64 bits, el número de datos de 32 bits, siempre tendrá los primeros 
    // 2 bits en cero. En conclusión, se está implicitamente dividiendo los datos por 4, para cambiar el númeto de bytes válidos
    // por el número de datos de 32 bits válidos, embebidos en el paquete.
    // Lo mismo sucede con el caso de 2 lanes, cada transmisión será de 64 bits siempre, por lo tanto, el número de bytes válidos del paquete
    // se desplaza a la derecha tres posiciones, para así obtener el número de datos de 64 bits válidos.
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    
    generate
        if (NUMBER_OF_LANES == 1) begin       
            always @(posedge user_clk) begin
                if (reset_TX_RX_Block | reset_internal_registers) begin
                    packet_valid_bytes[13:0] <= 14'd0;
                end
                else if (store_valid_bytes) begin
                    packet_valid_bytes[13:0] <= dout_reg[(PACKET_SIZE_BITS-1-32-16):(PACKET_SIZE_BITS-64+2)];// Más 2, porque se pretente solo leer 14 bits del valid_bytes, para tener el número de elementos y no el número de bytes, esto se hace ya que los primeros 2 bits siempre son cero, por lo tanto se divide entre 4 para obtener el número de elementos de 32 bits
                end
            end
        end else if (NUMBER_OF_LANES == 2) begin    
            always @(posedge user_clk) begin
                if (reset_TX_RX_Block | reset_internal_registers) begin
                    packet_valid_bytes[12:0] <= 13'd0;
                end
                else if (store_valid_bytes) begin
                    packet_valid_bytes[12:0] <= dout_reg[(PACKET_SIZE_BITS-1-32-16):(PACKET_SIZE_BITS-64+3)];// Más 3, porque se pretente solo leer 13 bits del valid_bytes, para tener el número de elementos y no el número de bytes, esto se hace porque los primeros 3 bits son siempre cero, por lo tanto se aplica un shift right para obtener el número de elementos de 64 bits 
                end
            end
        end
    endgenerate
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    //                         Contador binario para el control de datos válidos
    // Tiene la función de llevar el conteo de datos válidos, sirve para secuenciar los datos de cada paquete transmitidos ya sea 
    // en 32 bits o en 64 bits, en función del número de lanes. Este contador lleva la secuencia de datos de 32 bits, o de 64 bits
    // que se están transmitiendo,
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    
    always @(posedge user_clk) begin
        if (reset_TX_RX_Block | reset_internal_registers) begin
            counter <= 0;
        end
        else if (enable_counter) begin
            counter <= counter + 1'b1;
        end
    
    end
    
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    //                         Contador binario de 8 bits, para la detección de errores
    // En cada FRAME, se realiza el envío de un paquete ya sea usando 32 bits o 64 bits en función del número de lanes (1 o 2)
    // Cada paquete en su encabezado (primeros 8 bits) contiene el identificador de bus, necesario para la comunicación intra-FPGA usando el bus
    // Desde luego esto no es necesario cuando se pretenden enviar datos entre FPGAs, por lo tanto, el BS_ID es eliminado, 
    // y en su lugar, se coloca una secuencia númerica, la cual inicia en 0, y avanza hasta 255, al llegar a 255, el contador
    // se desborda y vuelve a cero. Este contador de secuencia, representa una herramienta de detección de errores, datos
    // que el receptor conoce que el primer elemento que reciba, siempre tendrá como encabezado el número 0 en 8 bits,
    // el segundo paquete tendrá como encabezado el número 1 en 8 bits y así sucesivamente. De esta forma, si un paquete falla, 
    // porque la comunicación se rompió, o simplemente falló, la secuencia en el receptor se romperá y por lo tanto, sabremos que
    // ocurrió un erro.
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    

    always @(posedge user_clk) begin
        if (reset_TX_RX_Block) begin
            sequence_counter <= 8'd0;
        end
        else if (enable_sequence_counter) begin
            sequence_counter <= sequence_counter + 1'b1;
        end
    end
     
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    //                        Multiplexor de 2 a 1
    // Tiene la función de remover el identificador del bus del paquete, y en su lugar agregar el valor del contador de 
    // secuencia, necesario para la detección de errores en el receptor.
    ///////////////////////////////////////////////////////////////////////////////////////////////////
     
    assign out_mux = (selector_reg)? sequence_counter : dout_reg[PACKET_SIZE_BITS-1:PACKET_SIZE_BITS-8];

    
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    //                        Maáquina de estados finita para secuenciar
    // Se presentan aquí dos variantes, por lo tanto, se utiliza el generate, una para el caso donde solo hay un lane
    // y otro para el caso donde hay dos lanes.
    // Resumen de estados:
    // El primer estado es el de reset
    // En el segundo estado, se está a la espera tanto de que el FIFO no este vacío, es decir, que exista un paquete por
    // ser leído.
    // En el estado dos, se lee la FIFO, por lo tanto, la bandera rd_en se coloca en alto, y se almacena el paquete de
    // contenido en la FIFO en un registro paralelo paralelo.
    // En el estado 3, se compara si el FPGA_ID, embebido en el encabezado del paquete, y el cual representa la FPGA 
    // emisora del paquete, es igual al identificador de la FPGA con la que se está comunicando el Aurora. Esto es útil 
    // para el caso de transmisiones de tipo Broadcast, por lo tanto, si en algún momento, el identificador de FPGA emisor,
    // es igual al identificador de la FPGA con que se está comunicando este Aurora, significa que el paquete debe descartarse, 
    // ya que ya estuvo ese paquete en esa FPGA.
    // El estado S4, es un ciclo de espera, necesario, para que se complete la lectura del FIFO debido a que los datos están 
    // con registros tanto a la entrada como a la salida, Es un estado donde solo se estará, en caso de que se descarte el paquete 
    // en el estado S3.
    // En el estado S5, se realiza el envío del header, Apartir de este estado, observe que todos los saltos dependen
    // del s_axi_tx_tready. Esto porque esta señal, puede ser dessasertada en cualquier momento, sin que exista incluso 
    // sincronismo con el reloj user_clk. Por lo tanto, si el s_axi_tx_tready se pone en cero, la máquina de estados permanecerá
    // en ese estado hasta que el Aurora vuelva a colocar en 1 esta señal.
    // En el estado S6, se envía la segunda parte del encabezado, y se habilita el desplazamiento del registro de desplazamiento, para que los datos se comiencen 
    // a transmitir.La bandera de valid también se actia en este estado. Además se consulta si el paquete por transmitir, únicamente
    // tiene un dato válido, en cuyo caso, se pasará al último estado, donde se levantará la bandera del t_last
    // En el estado S7, se espera hasta que se realice el envio de la cantidad de datos válidos embebidos en el paquete, este control
    // se hace con el contador binario. De esta forma se optimiza esta unidad, ya que en caso de que el paquete tenga pocos datos
    // válidos, la transacción acaba rápido, En este estado no se pregunta por s_axi_tx_tready, ya que, en este estado se
    // está a la espera de que se alcance un valor en un contador,pero ese contador está amarrado por s_axi_tx_tready, por lo tanto,
    // no es necesario redundar la lógica.
    // En el estado S8, se realiza el envío del último dato de 32 bits y se levanta la bandera de tlast.
    // Para el caso de 2 lanes, es decir, cuando se realizan transmisiones de 64 bits en 64 bits, el cambio radica
    // en que se elimina un estado, ya que el header, se realiza en una sola transacción (el header es de 64 bits, por esto, con 
    // dos lanes se puede realizar en una única transacción.
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    
    always @(posedge user_clk) begin    
        if (reset_TX_RX_Block) 
            State <= S0;
        else
            State <= NextState; 
    end
    
    generate 
        if (NUMBER_OF_LANES == 1) begin
            always @* begin
                case (State)
                    S0: begin 
                        NextState <= S1; 
                    end
                    S1: begin // Check not empty reg flags 
                        if (empty_reg) NextState <= S1;
                        else NextState <= S2;
                    end
                    S2: begin //Load d_out data and asserts rd_en flag
                        NextState <= S3;
                    end
                    S3: begin // Check if ID_TARGET_FPGA is equal to ID_SOURCE_FPGA for broadcast transmitions
                        if (( dout_reg[(PACKET_SIZE_BITS-8-1):(PACKET_SIZE_BITS-16)] == ID_TARGET_FPGA) || (dout_reg[(PACKET_SIZE_BITS-48-1):(PACKET_SIZE_BITS-64+2)] == 14'd0)) NextState <= S4;
                        else NextState <= S5;
                    end
                    S4: begin // Wait cycle for next jumping to S1
                        NextState <= S1;
                    end
                    S5: begin // Send header // se pregunta por tx_ready, ya que esta señal puede bajar en cualquier momento, el Aurora es quien tiene control de esto, por lo tanto, si el Aurora baja esta bandera, hay que quedarse esperando sin actuar
                        if (s_axi_tx_tready) NextState <= S6;
                        else NextState <= S5;
                    end
                    S6: begin // se verifica si el payload del paquete es igual a únicamente un dato de 32 bits, si esto se cumple, se debe saltar al último estado (S8) donde se debe assertar el tlast. Enbale shift  
                        if (s_axi_tx_tready) begin // si la bandera de tx_ready es cero, se debe quedar en este estado a la espera de que el Aurora asserte esta bandera
                            if (packet_valid_bytes == 14'd1) NextState <= S8;
                            else NextState <= S7;
                        end else begin
                            NextState <= S6;
                        end
                    end
                    S7: begin // Enable Shift and wait for valid bytes, asserts tvalid, enable counter, Aquí no se pregunta por el tx_ready, porque se está a la espera de un contador, el cual su enable se bloquea si el tx_ready está en cero. Por lo tanto, no es necesario replicar la lógica en este caso
                        if (counter == packet_valid_bytes) NextState <= S8;
                        else NextState <= S7;
                    end
                    S8: begin // Asserts tlast. Sí el tx_ready se encuentra en cero, se espera en este estado hasta que el tx_ready se vuelva a poner en 1.
                        if (s_axi_tx_tready) NextState <= S1;
                        else NextState <= S8;
                    end
                    default: begin
                        NextState <= S0;
                    end
                endcase
            end
            
            always @* begin
                case (State)
                    S0: begin // Initial state
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b1;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S1: begin // Check tx_ready and not empty reg flags 
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b1;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S2: begin //Load d_out data and asserts rd_en flag
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b1;
                        rd_en_reg <= 1'b1;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b0;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b1;
                    end
                    S3: begin // Check if ID_TARGET_FPGA is equal to ID_SOURCE_FPGA for broadcast transmitions // Enable shift
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b0;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b1;
                    end
                    S4: begin // Wait cycle for next jumping to S1
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b1;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S5: begin // Send header // se pregunta por tx_ready, ya que esta señal puede bajar en cualquier momento, el Aurora es quien tiene control de esto, por lo tanto, si el Aurora baja esta bandera, hay que quedarse esperando sin actuar
                        if (s_axi_tx_tready) enable_counter <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else enable_counter <= 1'b0;
                        if (s_axi_tx_tready) enable_shift <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        if (s_axi_tx_tready) s_axi_tx_tvalid_reg <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b0;
                        enable_sequence_counter <= 1'b0;
                        if (s_axi_tx_tready) selector <= 1'b0; // se desactiva siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else selector <= 1'b1;
                    end
                    S6: begin // se verifica si el payload del paquete es igual a únicamente un dato de 32 bits, si esto se cumple, se debe saltar al último estado (S8) donde se debe assertar el tlast. Enbale shift 
                        if (s_axi_tx_tready) enable_counter <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else enable_counter <= 1'b0;
                        if (s_axi_tx_tready) enable_shift <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        if (s_axi_tx_tready) s_axi_tx_tvalid_reg <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b0;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S7: begin // Enable Shift and wait for valid bytes, asserts tvalid, enable counter, Aquí no se pregunta por el tx_ready, porque se está a la espera de un contador, el cual su enable se bloquea si el tx_ready está en cero. Por lo tanto, no es necesario replicar la lógica en este caso
                        if (s_axi_tx_tready) enable_counter <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else enable_counter <= 1'b0;
                        if (s_axi_tx_tready) enable_shift <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        if (s_axi_tx_tready) s_axi_tx_tvalid_reg <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b0;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S8: begin // Asserts tlast. Sí el tx_ready se encuentra en cero, se espera en este estado hasta que el tx_ready se vuelva a poner en 1.
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        if (s_axi_tx_tready) s_axi_tx_tlast_reg <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else s_axi_tx_tlast_reg <= 1'b0;
                        if (s_axi_tx_tready) s_axi_tx_tvalid_reg <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else s_axi_tx_tvalid_reg <= 1'b0;
                        if (s_axi_tx_tready) reset_internal_registers <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else reset_internal_registers <= 1'b0; 
                        if (s_axi_tx_tready) enable_sequence_counter <= 1'b1; // se activa siempre y cuando el tx_ready que porporciona el Aurora esté activo
                        else enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    default: begin
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b1;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                endcase
            end
        end else if (NUMBER_OF_LANES == 2) begin
            always @* begin
                case (State)
                    S0: begin 
                        NextState <= S1;  
                    end
                    S1: begin // Check tx_ready and not empty reg flags 
                        if (s_axi_tx_tready & ~empty_reg) NextState <= S2;
                        else NextState <= S1;
                    end
                    S2: begin //Load d_out data and asserts rd_en flag
                        NextState <= S3;
                    end
                    S3: begin // Check if ID_TARGET_FPGA is equal to ID_SOURCE_FPGA for broadcast transmitions // Enable shift
                        if ( (dout_reg[(PACKET_SIZE_BITS-8-1):(PACKET_SIZE_BITS-16)] == ID_TARGET_FPGA)  || (dout_reg[(PACKET_SIZE_BITS-48-1):(PACKET_SIZE_BITS-64+3)] == 13'd0)) NextState <= S4;
                        else NextState <= S5;
                    end
                    S4: begin // Wait cycle for next jumping to S1
                        NextState <= S1;
                    end
                    S5: begin  // Send header
                        if (packet_valid_bytes == 13'd1) NextState <= S7;
                        else NextState <= S6;
                    end
                    S6: begin // Enable Shift and wait for valid bytes, asserts tvalid, enable counter
                        if (counter == packet_valid_bytes) NextState <= S7;
                        else NextState <= S6;
                    end
                    S7: begin // Asserts tlast
                        NextState <= S1;
                    end
                    default: begin
                        NextState <= S0;
                    end
                endcase
            end
        
        
            always @* begin
                case (State)
                    S0: begin // Initial state
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b1;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S1: begin // Check tx_ready and not empty reg flags 
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b1;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S2: begin //Load d_out data and asserts rd_en flag
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b1;
                        rd_en_reg <= 1'b1;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b0;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b1;
                    end
                    S3: begin // Check if ID_TARGET_FPGA is equal to ID_SOURCE_FPGA for broadcast transmitions // Enable shift
                        enable_counter <= 1'b1;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b0;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b1;
                    end
                    S4: begin // Wait cycle for next jumping to S1
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b1;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S5: begin  // Send header
                        enable_counter <= 1'b1;
                        enable_shift <= 1'b1; // Cambiar a 0
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b1;
                        reset_internal_registers <= 1'b0;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S6: begin // Enable Shift and wait for valid bytes, asserts tvalid, enable counter
                        enable_counter <= 1'b1;
                        enable_shift <= 1'b1;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b1;
                        reset_internal_registers <= 1'b0;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                    S7: begin // Asserts tlast
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b1;
                        s_axi_tx_tvalid_reg <= 1'b1;
                        reset_internal_registers <= 1'b1;
                        enable_sequence_counter <= 1'b1;
                        selector <= 1'b0;
                    end
                    default: begin
                        enable_counter <= 1'b0;
                        enable_shift <= 1'b0;
                        load <= 1'b0;
                        rd_en_reg <= 1'b0;
                        s_axi_tx_tlast_reg <= 1'b0;
                        s_axi_tx_tvalid_reg <= 1'b0;
                        reset_internal_registers <= 1'b1;
                        enable_sequence_counter <= 1'b0;
                        selector <= 1'b0;
                    end
                endcase
            end
        end
    endgenerate
           
endmodule