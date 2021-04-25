`timescale 1ns / 1ps

module testbench1;

    wire Error_0;
    wire Error_1;
    wire channel_up_0;
    wire channel_up_1;
    wire clk_200MHz;
    wire [255:0]dout;
    wire full;
    wire gt_refclk;
    wire init_clk;
    wire not_empty; 
    wire [0:0]txn_0;
    wire [0:0]txp_0;
    wire [0:0]txn_1;
    wire [0:0]txp_1;
    wire user_clk;
    
    
    
    
    wire [0:0]rxn_0;
    wire [0:0]rxp_0;
    wire [0:0]rxn_1;
    wire [0:0]rxp_1;
    
    reg wr_en;
    reg clk_200MHz_n;
    reg clk_200MHz_p;
    reg [255:0]din;
    reg rd_en;
    reg peripheral_reset;
    
    int Q_counter = 0;
    const bit [7:0] BS_ID_XMULT_0 = 8'h00;
    const bit [7:0] BS_ID_AUROR_0 = 8'h03;
    const bit [7:0] BS_ID_AUROR_1 = 8'h02;
    const bit [7:0] BS_ID_BROAD_0 = 8'hFF;
    
    bit [15:0] Q_packet_id = 0;
    bit [7:0] FPGA_ID;
    bit [15:0] PCKG_ID;
    bit [7:0] TX_UID;
    bit [7:0] RX_UID;
    bit [15:0] VALID_PACKET_BYTES;
    wire channel_up;


    Drvrs4_PNs1_PS1_Lanes2_design_wrapper uut (
    .Error_0(Error_0),
    .Error_1(Error_1),
    .channel_up_0(channel_up_0),
    .channel_up_1(channel_up_1),
    .clk_200MHz(clk_200MHz),
    .clk_200MHz_n(clk_200MHz_n),
    .clk_200MHz_p(clk_200MHz_p),
    .din(din),
    .dout(dout),
    .full(full),
    .gt_refclk(gt_refclk),
    .init_clk(init_clk),
    .not_empty(not_empty),
    .peripheral_reset(peripheral_reset),
    .rd_en(rd_en),
    .rxn_0(rxn_0),
    .rxn_1(rxn_1),
    .rxp_0(rxp_0),
    .rxp_1(rxp_1),
    .txn_0(txn_0),
    .txn_1(txn_1),
    .txp_0(txp_0),
    .txp_1(txp_1),
    .user_clk(user_clk),
    .wr_en(wr_en));
    
    assign rxn_0 = txn_0;
    assign rxp_0 = txp_0;
    
    assign rxn_1 = txn_1;
    assign rxp_1 = txp_1;
    
    assign channel_up = channel_up_1 & channel_up_0;
    
    initial begin
        wr_en = 0;
        clk_200MHz_n = 0;
        clk_200MHz_p = 1;
        din = 256'd0;
        rd_en = 0;
        peripheral_reset = 1;
        Q_packet_id = 16'd0;
        
        #16 peripheral_reset = 0;
        
    end
    
    always #2.5 clk_200MHz_n = ~clk_200MHz_n;
    always #2.5 clk_200MHz_p = ~clk_200MHz_p;
    
    
    
    
    always @(posedge clk_200MHz) begin
        if ((channel_up == 1'b1) && (full == 1'b0)) begin
            if(Q_counter < 8'd40) begin
                din = 256'd0;
                wr_en = 0;
                Q_counter = Q_counter + 1'b1;
            end else if (Q_counter < 8'd76) begin // 40 + 36
                FPGA_ID = 8'h00;
                PCKG_ID = Q_packet_id;
                TX_UID = 8'h01;
                RX_UID = 8'h02;
                VALID_PACKET_BYTES = 16'd24;
                din = PacketGenerator(BS_ID_AUROR_1, FPGA_ID, PCKG_ID, TX_UID, RX_UID, VALID_PACKET_BYTES); 
                wr_en = 1;
                Q_packet_id = Q_packet_id + 1'b1;
                Q_counter = Q_counter + 1'b1;
            end else begin
                din = 256'd0;
                wr_en = 0;
            end
        end
    end
    
    always @(negedge clk_200MHz) begin
        if (not_empty) begin
            rd_en = 1'b1;
            Read_FIFO_monitor();
        end else begin
            rd_en = 1'b0;
        end    
    end
    
    function bit [255:0] PacketGenerator;
        input bit [7:0] BS_ID;
        input bit [7:0] FPGA_ID;
        input bit [15:0] PCKG_ID;
        input bit [7:0] TX_UID;
        input bit [7:0] RX_UID;
        input bit [15:0] VALID_PACKET_BYTES;
        
        if (PCKG_ID == 0) 
            return {BS_ID, FPGA_ID, PCKG_ID, TX_UID, RX_UID, VALID_PACKET_BYTES, 32'd1, 32'd1, 32'd1, 32'd1, 32'd1, 32'd1};
        else if (PCKG_ID == 1)   
            return {BS_ID, FPGA_ID, PCKG_ID, TX_UID, RX_UID, VALID_PACKET_BYTES, 32'd1, 32'd1, 32'd1, 32'd1, 32'd1, 32'd1};
        else
            return {BS_ID, FPGA_ID, PCKG_ID, TX_UID, RX_UID, VALID_PACKET_BYTES, 32'd1, 32'd1, 32'd1, 32'd1, 32'd1, 32'd1};
    endfunction
    
    
    task Read_FIFO_monitor();
        $display("*****************************************************************************");
        $display("En el tiempo %t us, se leyó un dato de la FIFO.", $time);
        $display("El encabezado del paquete es");
        $display("BS_ID: 0x%0h. FPGA_ID: 0x%0h. PCKG_ID: %d. TX_UID: 0x%0h. RX_UID: 0x%0h. VALID_PACKET_BYTES: 0x%0h.", dout[255:248], dout[247:240], dout[239:224], dout[223:216], dout[215:208], dout[207:192]);
        $display("El mensaje 0 del paquete es: %d.", dout[191:160]);
        $display("El mensaje 1 del paquete es: %d.", dout[159:128]);
        $display("El mensaje 2 del paquete es: %d.", dout[127:96]);
        $display("El mensaje 3 del paquete es: %d.", dout[95:64]);
        $display("El mensaje 4 del paquete es: %d.", dout[63:32]);
        $display("El mensaje 5 del paquete es: %d.", dout[31:0]);
    endtask
    


endmodule