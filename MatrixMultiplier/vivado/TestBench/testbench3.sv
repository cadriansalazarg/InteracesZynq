`timescale 1ns / 1ps

module testbench3;

    
    wire channel_up_0;
    wire clk_200MHz;
    wire gt_refclk;
    wire init_clk;
    wire [0:0]txn_0;
    wire [0:0]txp_0;

    wire user_clk;
    
    
    reg [31:0]input_r_TDATA_0;
    reg [0:0]input_r_TLAST_0;
    wire input_r_TREADY_0;
    reg input_r_TVALID_0;
    wire [31:0]output_r_TDATA_0;
    wire [0:0]output_r_TLAST_0;
    reg output_r_TREADY_0;
    wire output_r_TVALID_0;
    
    
    
    
    wire [0:0]rxn_0;
    wire [0:0]rxp_0;
    
    reg clk_200MHz_n;
    reg clk_200MHz_p;
    reg peripheral_reset;
    
    int Q_counter = 0;
    int Q_counter_messages = 0;
    int Q_iteraciones = 0;
  

    Drvrs5_PNs3_PS1_Lanes1_design_wrapper uut (
    .channel_up_0(channel_up_0),
    .clk_200MHz(clk_200MHz),
    .clk_200MHz_n(clk_200MHz_n),
    .clk_200MHz_p(clk_200MHz_p),
    .gt_refclk(gt_refclk),
    .init_clk(init_clk),
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
    .rxp_0(rxp_0),
    .txn_0(txn_0),
    .txp_0(txp_0),
    .user_clk(user_clk)
    );
    
    assign rxn_0 = txn_0;
    assign rxp_0 = txp_0;
        
    //assign channel_up = channel_up_1 & channel_up_0;
    
    initial begin
        clk_200MHz_n = 0;
        clk_200MHz_p = 1;
        peripheral_reset = 1;
        input_r_TDATA_0 = 32'h00000000;
        input_r_TLAST_0 = 1'b0;
        input_r_TVALID_0 = 1'b0;
        output_r_TREADY_0 = 1'b0;
        
        //Q_packet_id = 16'd0;
        
        
        #16 peripheral_reset = 0;
        
    end
    
    always #2.5 clk_200MHz_n = ~clk_200MHz_n;
    always #2.5 clk_200MHz_p = ~clk_200MHz_p;
    
    
    
    
    always @(posedge clk_200MHz) begin
        if ((channel_up_0 == 1'b1) && (input_r_TREADY_0 == 1'b1)) begin
            if(Q_counter < 999) begin
                input_r_TDATA_0 = 32'h00000000;
                input_r_TLAST_0 = 1'b0;
                input_r_TVALID_0 = 1'b0;
                Q_counter = Q_counter + 1'b1;
            end else if (Q_counter < 1000) begin // Se transmite el encabezado del mensaje
                input_r_TDATA_0 = 32'h01000360; // Byte MSB: RX_UID Byte 2 TX_UID Ültimos dos Bytes tienen un valor de 0x360. Este valor corresponde al número 864 en hexadecimal, el cual corresponde al numero de bytes de payload del mensaje. En este caso, se transmiten 217 enteros, el primer entero es el encabezado y los otros 216 son el payload
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
        if (Q_iteraciones == 4) begin
            $finish;
        end
    end
    
    task Output_r_TREADY_GENERATOR();
        output_r_TREADY_0 = 1'b0;
        #12.5 output_r_TREADY_0 = 1'b1;
        // Se agregan estas dos líneas para que la ejecución se repita en el tiempo
        #2.5;
        #10000 Q_counter = 0;
    endtask
    
   
endmodule 
