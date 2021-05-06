`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////////////////////
// Observaciones: Testebench para verificar el funcionamiento del diseño Drvrs5_PS1_Lanes4_design_wrapper
// En términos generales, este testbench sirve para simular un bloque que tenga un PS y 4 Auroras
// En este momento, está configurado para operar en modo Broadcast, por lo tanto, el Zynq realiza una 
// transmisión de tipo Broadcast a los 4 Auroras que tiene esta red
// Los Auroras a su vez cada uno de ellos implementa un loop, por lo tanto, los datos regresan al Zynq
// Por lo tanto, por cada transmisión de 36 paquetes que haga el Zynq, se esperan 4*36 paquetes de regreso al 
// Zynq.
// La aplicación transmite 36 paquetes en configiuración de Broadcast, espera a que reciba 36 paquetes de cada Aurora
// y repite el ciclo la cantidad de veces definidas por la constante MAX_NUMBER_ITERATIONS.


///////////////////////////////////////////////////////////////////////////////////////////////


module testbench1;

    wire Error_0;
    wire Error_1;
    wire Error_2;
    wire Error_3;
    wire channel_up_0;
    wire channel_up_1;
    wire channel_up_2;
    wire channel_up_3;
    wire [0:0]txn_0;
    wire [0:0]txp_0;
    wire [0:0]txn_1;
    wire [0:0]txp_1;
    wire [0:0]txn_2;
    wire [0:0]txp_2;
    wire [0:0]txn_3;
    wire [0:0]txp_3;
    wire clk_200MHz;
    wire gt_refclk;
    wire init_clk;
    wire user_clk;
    
    
    reg [31:0]input_r_TDATA_0;
    reg [0:0]input_r_TLAST_0;
    wire input_r_TREADY_0;
    reg input_r_TVALID_0;
    wire [31:0]output_r_TDATA_0;
    wire [0:0]output_r_TLAST_0;
    reg output_r_TREADY_0;
    wire output_r_TVALID_0;
    reg peripheral_aresetn;
    
    
    
    
    wire [0:0]rxn_0;
    wire [0:0]rxp_0;
    wire [0:0]rxn_1;
    wire [0:0]rxp_1;
    wire [0:0]rxn_2;
    wire [0:0]rxp_2;
    wire [0:0]rxn_3;
    wire [0:0]rxp_3;
    
    reg clk_200MHz_n;
    reg clk_200MHz_p;
    reg peripheral_reset;
    
    int Q_counter = 0;
    int Q_counter_messages = 0;
    int Q_iteraciones = 0;
    int MAX_NUMBER_ITERATIONS = 3; // Define cuantas transmisiones de datos realizará el Zynq
  

    Drvrs5_PS1_Lanes4_design_wrapper uut (
    .Error_0(Error_0),
    .Error_1(Error_1),
    .Error_2(Error_2),
    .Error_3(Error_3),
    .channel_up_0(channel_up_0),
    .channel_up_1(channel_up_1),
    .channel_up_2(channel_up_2),
    .channel_up_3(channel_up_3),
    .clk_200MHz_n(clk_200MHz_n),
    .clk_200MHz_p(clk_200MHz_p),
    .clk_200MHz(clk_200MHz),
    .gt_refclk(gt_refclk),
    .init_clk(init_clk),
    .user_clk(user_clk),
    .input_r_TDATA_0(input_r_TDATA_0),
    .input_r_TLAST_0(input_r_TLAST_0),
    .input_r_TREADY_0(input_r_TREADY_0),
    .input_r_TVALID_0(input_r_TVALID_0),
    .output_r_TDATA_0(output_r_TDATA_0),
    .output_r_TLAST_0(output_r_TLAST_0),
    .output_r_TREADY_0(output_r_TREADY_0),
    .output_r_TVALID_0(output_r_TVALID_0),
    .peripheral_reset(peripheral_reset),
    .rxn_0(rxn_0),
    .rxn_1(rxn_1),
    .rxn_2(rxn_2),
    .rxn_3(rxn_3),
    .rxp_0(rxp_0),
    .rxp_1(rxp_1),
    .rxp_2(rxp_2),
    .rxp_3(rxp_3),
    .txn_0(txn_0),
    .txn_1(txn_1),
    .txn_2(txn_2),
    .txn_3(txn_3),
    .txp_0(txp_0),
    .txp_1(txp_1),
    .txp_2(txp_2),
    .txp_3(txp_3));
    
    assign rxn_0 = txn_0;
    assign rxp_0 = txp_0;
    
    assign rxn_1 = txn_1;
    assign rxp_1 = txp_1;
    
    assign rxn_2 = txn_2;
    assign rxp_2 = txp_2;
    
    assign rxn_3 = txn_3;
    assign rxp_3 = txp_3;
    
    //assign channel_up = channel_up_1 & channel_up_0;
    
    initial begin
        clk_200MHz_n = 0;
        clk_200MHz_p = 1;
        peripheral_reset = 1;
        peripheral_aresetn = 0;
        input_r_TDATA_0 = 32'h00000000;
        input_r_TLAST_0 = 1'b0;
        input_r_TVALID_0 = 1'b0;
        output_r_TREADY_0 = 1'b0;
        
        //Q_packet_id = 16'd0;
        
        
        #16 peripheral_reset = 0;
        peripheral_aresetn = 1;
        
    end
    
    always #2.5 clk_200MHz_n = ~clk_200MHz_n;
    always #2.5 clk_200MHz_p = ~clk_200MHz_p;
    
    
    
    
    always @(posedge clk_200MHz) begin
        if ((channel_up_3 == 1'b1) && (channel_up_2 == 1'b1) && (channel_up_1 == 1'b1) && (channel_up_0 == 1'b1) && (input_r_TREADY_0 == 1'b1)) begin
            if(Q_counter < 999) begin
                input_r_TDATA_0 = 32'h00000000;
                input_r_TLAST_0 = 1'b0;
                input_r_TVALID_0 = 1'b0;
                Q_counter = Q_counter + 1'b1;
            end else if (Q_counter < 1000) begin // Se transmite el encabezado del mensaje
                input_r_TDATA_0 = 32'hFF040360; // Byte MSB: RX_UID Byte 2 TX_UID Ültimos dos Bytes tienen un valor de 0x360. Este valor corresponde al número 864 en hexadecimal, el cual corresponde al numero de bytes de payload del mensaje. En este caso, se transmiten 217 enteros, el primer entero es el encabezado y los otros 216 son el payload
                input_r_TLAST_0 = 1'b0;
                input_r_TVALID_0 = 1'b1;
                Q_counter = Q_counter + 1'b1;
            end else if (Q_counter < 1215) begin // // Se transmite todo el mensaje excepto el último  dato 
                input_r_TDATA_0 = 32'h00000001;
                input_r_TLAST_0 = 1'b0;
                input_r_TVALID_0 = 1'b1;
                Q_counter = Q_counter + 1'b1;
            end else if (Q_counter < 1216) begin // Se transmite el último dato del mensaje
                input_r_TDATA_0 = 32'h00000001;
                input_r_TLAST_0 = 1'b1;
                input_r_TVALID_0 = 1'b1;
                Q_counter = Q_counter + 1'b1;
            end else begin
                input_r_TDATA_0 = 32'h00000000;
                input_r_TLAST_0 = 1'b0;
                input_r_TVALID_0 = 1'b0;
            end
        end
    end
    
    always @(posedge clk_200MHz) begin
        if (output_r_TVALID_0) begin
            Q_counter_messages <= Q_counter_messages + 1'b1;
        end else begin
            Q_counter_messages <= 0;
        end
    end
    
    
    always @(negedge clk_200MHz) begin
        if (output_r_TVALID_0) begin
            Read_FIFO_monitor();  
        end 
    end
    
    task Read_FIFO_monitor();
        $display("En el tiempo %t. Dato %d. Contenido %d.", $time, Q_counter_messages, output_r_TDATA_0);
    endtask
    
    
    always @(negedge output_r_TVALID_0) begin
        Output_r_TREADY_GENERATOR();
        Q_iteraciones = Q_iteraciones + 1;
        if (Q_iteraciones == MAX_NUMBER_ITERATIONS) begin
            $finish;
        end
    end
    
    task Output_r_TREADY_GENERATOR();
        output_r_TREADY_0 = 1'b0;
        #12.5 output_r_TREADY_0 = 1'b1;
        // Se agregan estas dos líneas para que la ejecución se repita en el tiempo
        #2.5;
        #20000 Q_counter = 0;
    endtask
    
   
endmodule 
