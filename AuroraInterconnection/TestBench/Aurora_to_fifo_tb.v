`timescale 1ns / 1ps

module Aurora_to_fifo_tb;

    //parameter PACKET_SIZE_BITS = 256; 
    //parameter PACKET_SIZE_BITS = 512; 
    parameter PACKET_SIZE_BITS = 1024; 
    
    parameter NUMBER_OF_LANES = 1;
    //parameter NUMBER_OF_LANES = 2;
    
    parameter DATAFILE = 1;
    
    parameter n = 32*NUMBER_OF_LANES;

    reg user_clk, reset_TX_RX_Block;
    reg m_axi_rx_tlast, m_axi_rx_tvalid;
    reg [n-1:0] m_axi_rx_tdata;
    reg full;
    
    wire [PACKET_SIZE_BITS-1: 0] din;
    wire wr_en;
    wire Error;
    
    
    Aurora_to_fifo #(.PACKET_SIZE_BITS(PACKET_SIZE_BITS), .NUMBER_OF_LANES(NUMBER_OF_LANES), .DATAFILE(DATAFILE)) uut (
        .user_clk(user_clk), 
        .reset_TX_RX_Block(reset_TX_RX_Block), 
        .din(din), 
        .wr_en(wr_en), 
        .m_axi_rx_tdata(m_axi_rx_tdata), 
        .m_axi_rx_tlast(m_axi_rx_tlast), 
        .m_axi_rx_tvalid(m_axi_rx_tvalid), 
        .full(full), 
        .Error(Error)
    );
    
    initial begin
        user_clk = 0;
        reset_TX_RX_Block = 0; 
        full = 0;
        
        m_axi_rx_tlast = 0;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tdata = 32'd0;
        
        /* Descomentar esta línea para verificar el funcionamiento de la versión con tamaño de paquete de 256 bits utilizando dos lanes
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Detecting  an error in the sequence
        #40 m_axi_rx_tdata = 64'h01903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        // Sending the first element
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
         // Sending and element whe fifo es full
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        full = 1;
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 full = 0;
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and first element of the sequence
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and second element of the sequence
        
        #40 m_axi_rx_tdata = 64'h01903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and third element of the sequence
        
        #40 m_axi_rx_tdata = 64'h02903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and forth element of the sequence
        
        #40 m_axi_rx_tdata = 64'h03903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and fifth element of the sequence
        
        #40 m_axi_rx_tdata = 64'h04903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and sixth element of the sequence
        
        #40 m_axi_rx_tdata = 64'h05903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and the first element of the sequence
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // */
        
        
        
        /* Descomentar esta línea para verificar el funcionamiento de la versión con tamaño de paquete de 512 bits utilizando dos lanes
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Detecting  an error in the sequence
        #40 m_axi_rx_tdata = 64'h01903247_01013247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        // Sending the first element
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        #40 m_axi_rx_tdata = 64'h01903247_01013247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
         // Sending and element whe fifo es full
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        full = 1;
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 full = 0;
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and first element of the sequence
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and second element of the sequence
        
        #40 m_axi_rx_tdata = 64'h01903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and third element of the sequence
        
        #40 m_axi_rx_tdata = 64'h02903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and forth element of the sequence
        
        #40 m_axi_rx_tdata = 64'h03903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and fifth element of the sequence
        
        #40 m_axi_rx_tdata = 64'h04903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and sixth element of the sequence
        
        #40 m_axi_rx_tdata = 64'h05903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and the first element of the sequence
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // */
        
        
        /* Descomentar esta línea para verificar el funcionamiento de la versión con tamaño de paquete de 1024 bits utilizando dos lanes
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Detecting  an error in the sequence
        #40 m_axi_rx_tdata = 64'h01903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        #8 m_axi_rx_tdata = 64'h00000000_00000008;
        #8 m_axi_rx_tdata = 64'h00000000_00000009;
        #8 m_axi_rx_tdata = 64'h00000000_0000000A;
        #8 m_axi_rx_tdata = 64'h00000000_0000000B;
        #8 m_axi_rx_tdata = 64'h00000000_0000000C;
        #8 m_axi_rx_tdata = 64'h00000000_0000000D;
        #8 m_axi_rx_tdata = 64'h00000000_0000000E;
        #8 m_axi_rx_tdata = 64'h00000000_0000000F;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        // Sending the first element
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        #8 m_axi_rx_tdata = 64'h00000000_00000008;
        #8 m_axi_rx_tdata = 64'h00000000_00000009;
        #8 m_axi_rx_tdata = 64'h00000000_0000000A;
        #8 m_axi_rx_tdata = 64'h00000000_0000000B;
        #8 m_axi_rx_tdata = 64'h00000000_0000000C;
        #8 m_axi_rx_tdata = 64'h00000000_0000000D;
        #8 m_axi_rx_tdata = 64'h00000000_0000000E;
        #8 m_axi_rx_tdata = 64'h00000000_0000000F;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
         // Sending and element whe fifo es full
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        full = 1;
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        #8 m_axi_rx_tdata = 64'h00000000_00000008;
        #8 m_axi_rx_tdata = 64'h00000000_00000009;
        #8 m_axi_rx_tdata = 64'h00000000_0000000A;
        #8 m_axi_rx_tdata = 64'h00000000_0000000B;
        #8 m_axi_rx_tdata = 64'h00000000_0000000C;
        #8 m_axi_rx_tdata = 64'h00000000_0000000D;
        #8 m_axi_rx_tdata = 64'h00000000_0000000E;
        #8 m_axi_rx_tdata = 64'h00000000_0000000F;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 full = 0;
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and first element of the sequence
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        #8 m_axi_rx_tdata = 64'h00000000_00000008;
        #8 m_axi_rx_tdata = 64'h00000000_00000009;
        #8 m_axi_rx_tdata = 64'h00000000_0000000A;
        #8 m_axi_rx_tdata = 64'h00000000_0000000B;
        #8 m_axi_rx_tdata = 64'h00000000_0000000C;
        #8 m_axi_rx_tdata = 64'h00000000_0000000D;
        #8 m_axi_rx_tdata = 64'h00000000_0000000E;
        #8 m_axi_rx_tdata = 64'h00000000_0000000F;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and second element of the sequence
        
        #40 m_axi_rx_tdata = 64'h01903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        #8 m_axi_rx_tdata = 64'h00000000_00000008;
        #8 m_axi_rx_tdata = 64'h00000000_00000009;
        #8 m_axi_rx_tdata = 64'h00000000_0000000A;
        #8 m_axi_rx_tdata = 64'h00000000_0000000B;
        #8 m_axi_rx_tdata = 64'h00000000_0000000C;
        #8 m_axi_rx_tdata = 64'h00000000_0000000D;
        #8 m_axi_rx_tdata = 64'h00000000_0000000E;
        #8 m_axi_rx_tdata = 64'h00000000_0000000F;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and third element of the sequence
        
        #40 m_axi_rx_tdata = 64'h02903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        #8 m_axi_rx_tdata = 64'h00000000_00000008;
        #8 m_axi_rx_tdata = 64'h00000000_00000009;
        #8 m_axi_rx_tdata = 64'h00000000_0000000A;
        #8 m_axi_rx_tdata = 64'h00000000_0000000B;
        #8 m_axi_rx_tdata = 64'h00000000_0000000C;
        #8 m_axi_rx_tdata = 64'h00000000_0000000D;
        #8 m_axi_rx_tdata = 64'h00000000_0000000E;
        #8 m_axi_rx_tdata = 64'h00000000_0000000F;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and forth element of the sequence
        
        #40 m_axi_rx_tdata = 64'h03903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        #8 m_axi_rx_tdata = 64'h00000000_00000008;
        #8 m_axi_rx_tdata = 64'h00000000_00000009;
        #8 m_axi_rx_tdata = 64'h00000000_0000000A;
        #8 m_axi_rx_tdata = 64'h00000000_0000000B;
        #8 m_axi_rx_tdata = 64'h00000000_0000000C;
        #8 m_axi_rx_tdata = 64'h00000000_0000000D;
        #8 m_axi_rx_tdata = 64'h00000000_0000000E;
        #8 m_axi_rx_tdata = 64'h00000000_0000000F;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and fifth element of the sequence
        
        #40 m_axi_rx_tdata = 64'h04903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        #8 m_axi_rx_tdata = 64'h00000000_00000008;
        #8 m_axi_rx_tdata = 64'h00000000_00000009;
        #8 m_axi_rx_tdata = 64'h00000000_0000000A;
        #8 m_axi_rx_tdata = 64'h00000000_0000000B;
        #8 m_axi_rx_tdata = 64'h00000000_0000000C;
        #8 m_axi_rx_tdata = 64'h00000000_0000000D;
        #8 m_axi_rx_tdata = 64'h00000000_0000000E;
        #8 m_axi_rx_tdata = 64'h00000000_0000000F;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and sixth element of the sequence
        
        #40 m_axi_rx_tdata = 64'h05903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and the first element of the sequence
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        
        
        #40 m_axi_rx_tdata = 64'h00903247_01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000001;
        #8 m_axi_rx_tdata = 64'h00000000_00000002;
        #8 m_axi_rx_tdata = 64'h00000000_00000003;
        #8 m_axi_rx_tdata = 64'h00000000_00000004;
        #8 m_axi_rx_tdata = 64'h00000000_00000005;
        #8 m_axi_rx_tdata = 64'h00000000_00000006;
        #8 m_axi_rx_tdata = 64'h00000000_00000007;
        #8 m_axi_rx_tdata = 64'h00000000_00000008;
        #8 m_axi_rx_tdata = 64'h00000000_00000009;
        #8 m_axi_rx_tdata = 64'h00000000_0000000A;
        #8 m_axi_rx_tdata = 64'h00000000_0000000B;
        #8 m_axi_rx_tdata = 64'h00000000_0000000C;
        #8 m_axi_rx_tdata = 64'h00000000_0000000D;
        #8 m_axi_rx_tdata = 64'h00000000_0000000E;
        #8 m_axi_rx_tdata = 64'h00000000_0000000F;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 64'h00000000_00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // */
        
        
        
        
        
        
        /* Descomentar esta línea para verificar el funcionamiento de la versión con tamaño de paquete de 256 bits utilizando un lane
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Detecting  an error in the sequence
        #40 m_axi_rx_tdata = 32'h01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        // Sending the first element
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
         // Sending and element when fifo es full
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        full = 1;
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 full = 0;
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and first element of the sequence
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and second element of the sequence
        
        #40 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and third element of the sequence
        
        #40 m_axi_rx_tdata = 32'h02903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and forth element of the sequence
        
        #40 m_axi_rx_tdata = 32'h03903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and first element of the sequence
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        
        #40 m_axi_rx_tdata = 32'h01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // */
        
        
        /* Descomentar esta línea para verificar el funcionamiento de la versión con tamaño de paquete de 512 bits utilizando un lane
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Detecting  an error in the sequence
        #40 m_axi_rx_tdata = 32'h01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        // Sending the first element
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
         // Sending an element when fifo es full
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        full = 1;
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 full = 0;
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and first element of the sequence
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and second element of the sequence
        
        #40 m_axi_rx_tdata = 32'h01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and second element of the sequence
        
        #40 m_axi_rx_tdata = 32'h02903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and forth element of the sequence
        
        #40 m_axi_rx_tdata = 32'h03903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and forth element of the sequence
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // */
        
        
        // Descomentar esta línea para verificar el funcionamiento de la versión con tamaño de paquete de 1024 bits utilizando un lane
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Detecting  an error in the sequence
        #40 m_axi_rx_tdata = 32'h01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        #8 m_axi_rx_tdata = 32'h0000000F;
        #8 m_axi_rx_tdata = 32'h00000010;
        #8 m_axi_rx_tdata = 32'h00000011;
        #8 m_axi_rx_tdata = 32'h00000012;
        #8 m_axi_rx_tdata = 32'h00000013;
        #8 m_axi_rx_tdata = 32'h00000014;
        #8 m_axi_rx_tdata = 32'h00000015;
        #8 m_axi_rx_tdata = 32'h00000016;
        #8 m_axi_rx_tdata = 32'h00000017;
        #8 m_axi_rx_tdata = 32'h00000018;
        #8 m_axi_rx_tdata = 32'h00000019;
        #8 m_axi_rx_tdata = 32'h0000001A;
        #8 m_axi_rx_tdata = 32'h0000001B;
        #8 m_axi_rx_tdata = 32'h0000001C;
        #8 m_axi_rx_tdata = 32'h0000001D;
        #8 m_axi_rx_tdata = 32'h0000001E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
        // Sending the first element
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h10903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        #8 m_axi_rx_tdata = 32'h0000000F;
        #8 m_axi_rx_tdata = 32'h00000010;
        #8 m_axi_rx_tdata = 32'h00000011;
        #8 m_axi_rx_tdata = 32'h00000012;
        #8 m_axi_rx_tdata = 32'h00000013;
        #8 m_axi_rx_tdata = 32'h00000014;
        #8 m_axi_rx_tdata = 32'h00000015;
        #8 m_axi_rx_tdata = 32'h00000016;
        #8 m_axi_rx_tdata = 32'h00000017;
        #8 m_axi_rx_tdata = 32'h00000018;
        #8 m_axi_rx_tdata = 32'h00000019;
        #8 m_axi_rx_tdata = 32'h0000001A;
        #8 m_axi_rx_tdata = 32'h0000001B;
        #8 m_axi_rx_tdata = 32'h0000001C;
        #8 m_axi_rx_tdata = 32'h0000001D;
        #8 m_axi_rx_tdata = 32'h0000001E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        
         // Sending and element when fifo es full
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        full = 1;
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        #8 m_axi_rx_tdata = 32'h0000000F;
        #8 m_axi_rx_tdata = 32'h00000010;
        #8 m_axi_rx_tdata = 32'h00000011;
        #8 m_axi_rx_tdata = 32'h00000012;
        #8 m_axi_rx_tdata = 32'h00000013;
        #8 m_axi_rx_tdata = 32'h00000014;
        #8 m_axi_rx_tdata = 32'h00000015;
        #8 m_axi_rx_tdata = 32'h00000016;
        #8 m_axi_rx_tdata = 32'h00000017;
        #8 m_axi_rx_tdata = 32'h00000018;
        #8 m_axi_rx_tdata = 32'h00000019;
        #8 m_axi_rx_tdata = 32'h0000001A;
        #8 m_axi_rx_tdata = 32'h0000001B;
        #8 m_axi_rx_tdata = 32'h0000001C;
        #8 m_axi_rx_tdata = 32'h0000001D;
        #8 m_axi_rx_tdata = 32'h0000001E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 full = 0;
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and first element of the sequence
        
        #80 m_axi_rx_tdata = 32'h00FFFFFF;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        #8 m_axi_rx_tdata = 32'h0000000F;
        #8 m_axi_rx_tdata = 32'h00000010;
        #8 m_axi_rx_tdata = 32'h00000011;
        #8 m_axi_rx_tdata = 32'h00000012;
        #8 m_axi_rx_tdata = 32'h00000013;
        #8 m_axi_rx_tdata = 32'h00000014;
        #8 m_axi_rx_tdata = 32'h00000015;
        #8 m_axi_rx_tdata = 32'h00000016;
        #8 m_axi_rx_tdata = 32'h00000017;
        #8 m_axi_rx_tdata = 32'h00000018;
        #8 m_axi_rx_tdata = 32'h00000019;
        #8 m_axi_rx_tdata = 32'h0000001A;
        #8 m_axi_rx_tdata = 32'h0000001B;
        #8 m_axi_rx_tdata = 32'h0000001C;
        #8 m_axi_rx_tdata = 32'h0000001D;
        #8 m_axi_rx_tdata = 32'h0000001E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and second element of the sequence
        
        #40 m_axi_rx_tdata = 32'h01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        #8 m_axi_rx_tdata = 32'h0000000F;
        #8 m_axi_rx_tdata = 32'h00000010;
        #8 m_axi_rx_tdata = 32'h00000011;
        #8 m_axi_rx_tdata = 32'h00000012;
        #8 m_axi_rx_tdata = 32'h00000013;
        #8 m_axi_rx_tdata = 32'h00000014;
        #8 m_axi_rx_tdata = 32'h00000015;
        #8 m_axi_rx_tdata = 32'h00000016;
        #8 m_axi_rx_tdata = 32'h00000017;
        #8 m_axi_rx_tdata = 32'h00000018;
        #8 m_axi_rx_tdata = 32'h00000019;
        #8 m_axi_rx_tdata = 32'h0000001A;
        #8 m_axi_rx_tdata = 32'h0000001B;
        #8 m_axi_rx_tdata = 32'h0000001C;
        #8 m_axi_rx_tdata = 32'h0000001D;
        #8 m_axi_rx_tdata = 32'h0000001E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and third element of the sequence
        
        #40 m_axi_rx_tdata = 32'h02903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        #8 m_axi_rx_tdata = 32'h00000001;
        #8 m_axi_rx_tdata = 32'h00000002;
        #8 m_axi_rx_tdata = 32'h00000003;
        #8 m_axi_rx_tdata = 32'h00000004;
        #8 m_axi_rx_tdata = 32'h00000005;
        #8 m_axi_rx_tdata = 32'h00000006;
        #8 m_axi_rx_tdata = 32'h00000007;
        #8 m_axi_rx_tdata = 32'h00000008;
        #8 m_axi_rx_tdata = 32'h00000009;
        #8 m_axi_rx_tdata = 32'h0000000A;
        #8 m_axi_rx_tdata = 32'h0000000B;
        #8 m_axi_rx_tdata = 32'h0000000C;
        #8 m_axi_rx_tdata = 32'h0000000D;
        #8 m_axi_rx_tdata = 32'h0000000E;
        #8 m_axi_rx_tdata = 32'h0000000F;
        #8 m_axi_rx_tdata = 32'h00000010;
        #8 m_axi_rx_tdata = 32'h00000011;
        #8 m_axi_rx_tdata = 32'h00000012;
        #8 m_axi_rx_tdata = 32'h00000013;
        #8 m_axi_rx_tdata = 32'h00000014;
        #8 m_axi_rx_tdata = 32'h00000015;
        #8 m_axi_rx_tdata = 32'h00000016;
        #8 m_axi_rx_tdata = 32'h00000017;
        #8 m_axi_rx_tdata = 32'h00000018;
        #8 m_axi_rx_tdata = 32'h00000019;
        #8 m_axi_rx_tdata = 32'h0000001A;
        #8 m_axi_rx_tdata = 32'h0000001B;
        #8 m_axi_rx_tdata = 32'h0000001C;
        #8 m_axi_rx_tdata = 32'h0000001D;
        #8 m_axi_rx_tdata = 32'h0000001E;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // Sending and forth element of the sequence
        
        #40 m_axi_rx_tdata = 32'h03903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h00000001;
        m_axi_rx_tvalid = 1;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        #40 reset_TX_RX_Block = 1;
        #40 reset_TX_RX_Block = 0;
        
        // Sending and forth element of the sequence
        
        #40 m_axi_rx_tdata = 32'h00903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h01903247;
        m_axi_rx_tvalid = 1;
        #8 m_axi_rx_tdata = 32'h00000001;
        m_axi_rx_tvalid = 1;
        m_axi_rx_tlast = 1;
        #8 m_axi_rx_tdata = 32'h00000000;
        m_axi_rx_tvalid = 0;
        m_axi_rx_tlast = 0;
        
        // */
        
    end
    
    initial forever #4 user_clk = ~user_clk;


endmodule
