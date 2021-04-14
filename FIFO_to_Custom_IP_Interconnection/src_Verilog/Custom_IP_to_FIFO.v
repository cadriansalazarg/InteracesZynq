`timescale 1ns / 1ps

`define PACKET_SIZE_256  //Debe ajustarse al tamaño de paquete que mejor se ajusta, de manera que concuerde con PACKET_SIZE_BITS, o al menos PACKET_SIZE_BITS sea menor o igual que este parámetro
//`define PACKET_SIZE_512
//`define PACKET_SIZE_1024

`ifdef PACKET_SIZE_256

    module Custom_IP_to_FIFO #(parameter PACKET_SIZE_BITS = 256)
        (
        wr_en, din, 
        out_fifo_V_BS_ID_din, out_fifo_V_BS_ID_write,
        out_fifo_V_FPGA_ID_din,
        out_fifo_V_PCKG_ID_din, 
        out_fifo_V_TX_UID_din,
        out_fifo_V_RX_UID_din, 
        out_fifo_V_VALID_PACKET_BYTES_din,
        out_fifo_V_MESSAGE_0_din,
        out_fifo_V_MESSAGE_1_din, 
        out_fifo_V_MESSAGE_2_din, 
        out_fifo_V_MESSAGE_3_din, 
        out_fifo_V_MESSAGE_4_din, 
        out_fifo_V_MESSAGE_5_din 
        );
        
        
        output wr_en;
        output [PACKET_SIZE_BITS-1:0] din;    
        
        input [7:0] out_fifo_V_BS_ID_din;
        input out_fifo_V_BS_ID_write;
        
        input [7:0] out_fifo_V_FPGA_ID_din;
        input [15:0] out_fifo_V_PCKG_ID_din;
        input [7:0] out_fifo_V_TX_UID_din;
        input [7:0] out_fifo_V_RX_UID_din;
        input [15:0] out_fifo_V_VALID_PACKET_BYTES_din;
        
        input [31:0] out_fifo_V_MESSAGE_0_din;
        input [31:0] out_fifo_V_MESSAGE_1_din;
        input [31:0] out_fifo_V_MESSAGE_2_din;
        input [31:0] out_fifo_V_MESSAGE_3_din;
        input [31:0] out_fifo_V_MESSAGE_4_din;
        input [31:0] out_fifo_V_MESSAGE_5_din; 
        
        
        assign din = {out_fifo_V_BS_ID_din, out_fifo_V_FPGA_ID_din, out_fifo_V_PCKG_ID_din, out_fifo_V_TX_UID_din, out_fifo_V_RX_UID_din, out_fifo_V_VALID_PACKET_BYTES_din, out_fifo_V_MESSAGE_0_din, out_fifo_V_MESSAGE_1_din, out_fifo_V_MESSAGE_2_din, out_fifo_V_MESSAGE_3_din, out_fifo_V_MESSAGE_4_din, out_fifo_V_MESSAGE_5_din};
        assign wr_en = out_fifo_V_BS_ID_write;
        
            
    endmodule

`elsif PACKET_SIZE_512

    module Custom_IP_to_FIFO #(parameter PACKET_SIZE_BITS = 512)
        (
        wr_en, din, 
        out_fifo_V_BS_ID_din, out_fifo_V_BS_ID_write,
        out_fifo_V_FPGA_ID_din,
        out_fifo_V_PCKG_ID_din, 
        out_fifo_V_TX_UID_din,
        out_fifo_V_RX_UID_din, 
        out_fifo_V_VALID_PACKET_BYTES_din,
        out_fifo_V_MESSAGE_0_din,
        out_fifo_V_MESSAGE_1_din, 
        out_fifo_V_MESSAGE_2_din, 
        out_fifo_V_MESSAGE_3_din, 
        out_fifo_V_MESSAGE_4_din, 
        out_fifo_V_MESSAGE_5_din, 
        out_fifo_V_MESSAGE_6_din,
        out_fifo_V_MESSAGE_7_din,
        out_fifo_V_MESSAGE_8_din,
        out_fifo_V_MESSAGE_9_din,
        out_fifo_V_MESSAGE_10_din,
        out_fifo_V_MESSAGE_11_din,
        out_fifo_V_MESSAGE_12_din,
        out_fifo_V_MESSAGE_13_din
        );
        
        
        output wr_en;
        output [PACKET_SIZE_BITS-1:0] din;
        
        
        input [7:0] out_fifo_V_BS_ID_din;
        input out_fifo_V_BS_ID_write;
        
        input [7:0] out_fifo_V_FPGA_ID_din;
        input [15:0] out_fifo_V_PCKG_ID_din;
        input [7:0] out_fifo_V_TX_UID_din;
        input [7:0] out_fifo_V_RX_UID_din;
        input [15:0] out_fifo_V_VALID_PACKET_BYTES_din;
        
        input [31:0] out_fifo_V_MESSAGE_0_din;
        input [31:0] out_fifo_V_MESSAGE_1_din;
        input [31:0] out_fifo_V_MESSAGE_2_din;
        input [31:0] out_fifo_V_MESSAGE_3_din;
        input [31:0] out_fifo_V_MESSAGE_4_din;
        input [31:0] out_fifo_V_MESSAGE_5_din; 
        input [31:0] out_fifo_V_MESSAGE_6_din; 
        input [31:0] out_fifo_V_MESSAGE_7_din; 
        input [31:0] out_fifo_V_MESSAGE_8_din; 
        input [31:0] out_fifo_V_MESSAGE_9_din; 
        input [31:0] out_fifo_V_MESSAGE_10_din; 
        input [31:0] out_fifo_V_MESSAGE_11_din; 
        input [31:0] out_fifo_V_MESSAGE_12_din; 
        input [31:0] out_fifo_V_MESSAGE_13_din; 
        
        assign wr_en = out_fifo_V_BS_ID_write;
        assign din = {out_fifo_V_BS_ID_din, out_fifo_V_FPGA_ID_din, out_fifo_V_PCKG_ID_din, out_fifo_V_TX_UID_din, out_fifo_V_RX_UID_din, out_fifo_V_VALID_PACKET_BYTES_din, out_fifo_V_MESSAGE_0_din, out_fifo_V_MESSAGE_1_din, out_fifo_V_MESSAGE_2_din, out_fifo_V_MESSAGE_3_din, out_fifo_V_MESSAGE_4_din, out_fifo_V_MESSAGE_5_din, out_fifo_V_MESSAGE_6_din, out_fifo_V_MESSAGE_7_din, out_fifo_V_MESSAGE_8_din, out_fifo_V_MESSAGE_9_din, out_fifo_V_MESSAGE_10_din, out_fifo_V_MESSAGE_11_din, out_fifo_V_MESSAGE_12_din, out_fifo_V_MESSAGE_13_din};    
            
    endmodule

`elsif PACKET_SIZE_1024  

    module Custom_IP_to_FIFO #(parameter PACKET_SIZE_BITS = 1024)
        (
        wr_en, din, 
        out_fifo_V_BS_ID_din, out_fifo_V_BS_ID_write,
        out_fifo_V_FPGA_ID_din,
        out_fifo_V_PCKG_ID_din, 
        out_fifo_V_TX_UID_din,
        out_fifo_V_RX_UID_din, 
        out_fifo_V_VALID_PACKET_BYTES_din,
        out_fifo_V_MESSAGE_0_din,
        out_fifo_V_MESSAGE_1_din, 
        out_fifo_V_MESSAGE_2_din, 
        out_fifo_V_MESSAGE_3_din, 
        out_fifo_V_MESSAGE_4_din, 
        out_fifo_V_MESSAGE_5_din, 
        out_fifo_V_MESSAGE_6_din,
        out_fifo_V_MESSAGE_7_din,
        out_fifo_V_MESSAGE_8_din,
        out_fifo_V_MESSAGE_9_din,
        out_fifo_V_MESSAGE_10_din,
        out_fifo_V_MESSAGE_11_din,
        out_fifo_V_MESSAGE_12_din,
        out_fifo_V_MESSAGE_13_din,
        out_fifo_V_MESSAGE_14_din,
        out_fifo_V_MESSAGE_15_din,
        out_fifo_V_MESSAGE_16_din,
        out_fifo_V_MESSAGE_17_din,
        out_fifo_V_MESSAGE_18_din,
        out_fifo_V_MESSAGE_19_din,
        out_fifo_V_MESSAGE_20_din,
        out_fifo_V_MESSAGE_21_din,
        out_fifo_V_MESSAGE_22_din,
        out_fifo_V_MESSAGE_23_din,
        out_fifo_V_MESSAGE_24_din,
        out_fifo_V_MESSAGE_25_din,
        out_fifo_V_MESSAGE_26_din,
        out_fifo_V_MESSAGE_27_din,
        out_fifo_V_MESSAGE_28_din,
        out_fifo_V_MESSAGE_29_din
        );
        
        
        output wr_en;
        output [PACKET_SIZE_BITS-1:0] din;
        
        
        input [7:0] out_fifo_V_BS_ID_din;
        input out_fifo_V_BS_ID_write;
        
        input [7:0] out_fifo_V_FPGA_ID_din;
        input [15:0] out_fifo_V_PCKG_ID_din;
        input [7:0] out_fifo_V_TX_UID_din;
        input [7:0] out_fifo_V_RX_UID_din;
        input [15:0] out_fifo_V_VALID_PACKET_BYTES_din;
        
        input [31:0] out_fifo_V_MESSAGE_0_din;
        input [31:0] out_fifo_V_MESSAGE_1_din;
        input [31:0] out_fifo_V_MESSAGE_2_din;
        input [31:0] out_fifo_V_MESSAGE_3_din;
        input [31:0] out_fifo_V_MESSAGE_4_din;
        input [31:0] out_fifo_V_MESSAGE_5_din; 
        input [31:0] out_fifo_V_MESSAGE_6_din; 
        input [31:0] out_fifo_V_MESSAGE_7_din; 
        input [31:0] out_fifo_V_MESSAGE_8_din; 
        input [31:0] out_fifo_V_MESSAGE_9_din; 
        input [31:0] out_fifo_V_MESSAGE_10_din; 
        input [31:0] out_fifo_V_MESSAGE_11_din; 
        input [31:0] out_fifo_V_MESSAGE_12_din; 
        input [31:0] out_fifo_V_MESSAGE_13_din; 
        input [31:0] out_fifo_V_MESSAGE_14_din;
        input [31:0] out_fifo_V_MESSAGE_15_din;
        input [31:0] out_fifo_V_MESSAGE_16_din;
        input [31:0] out_fifo_V_MESSAGE_17_din;
        input [31:0] out_fifo_V_MESSAGE_18_din;
        input [31:0] out_fifo_V_MESSAGE_19_din;
        input [31:0] out_fifo_V_MESSAGE_20_din;
        input [31:0] out_fifo_V_MESSAGE_21_din;
        input [31:0] out_fifo_V_MESSAGE_22_din;
        input [31:0] out_fifo_V_MESSAGE_23_din;
        input [31:0] out_fifo_V_MESSAGE_24_din;
        input [31:0] out_fifo_V_MESSAGE_25_din;
        input [31:0] out_fifo_V_MESSAGE_26_din;
        input [31:0] out_fifo_V_MESSAGE_27_din;
        input [31:0] out_fifo_V_MESSAGE_28_din;
        input [31:0] out_fifo_V_MESSAGE_29_din;
        
        
        assign wr_en = out_fifo_V_BS_ID_write;
        assign din = {out_fifo_V_BS_ID_din, out_fifo_V_FPGA_ID_din, out_fifo_V_PCKG_ID_din, out_fifo_V_TX_UID_din, out_fifo_V_RX_UID_din, out_fifo_V_VALID_PACKET_BYTES_din, out_fifo_V_MESSAGE_0_din, out_fifo_V_MESSAGE_1_din, out_fifo_V_MESSAGE_2_din, out_fifo_V_MESSAGE_3_din, out_fifo_V_MESSAGE_4_din, out_fifo_V_MESSAGE_5_din, out_fifo_V_MESSAGE_6_din, out_fifo_V_MESSAGE_7_din, out_fifo_V_MESSAGE_8_din, out_fifo_V_MESSAGE_9_din, out_fifo_V_MESSAGE_10_din, out_fifo_V_MESSAGE_11_din, out_fifo_V_MESSAGE_12_din, out_fifo_V_MESSAGE_13_din, out_fifo_V_MESSAGE_14_din, out_fifo_V_MESSAGE_15_din, out_fifo_V_MESSAGE_16_din, out_fifo_V_MESSAGE_17_din, out_fifo_V_MESSAGE_18_din, out_fifo_V_MESSAGE_19_din, out_fifo_V_MESSAGE_20_din, out_fifo_V_MESSAGE_21_din, out_fifo_V_MESSAGE_22_din, out_fifo_V_MESSAGE_23_din, out_fifo_V_MESSAGE_24_din, out_fifo_V_MESSAGE_25_din, out_fifo_V_MESSAGE_26_din, out_fifo_V_MESSAGE_27_din, out_fifo_V_MESSAGE_28_din, out_fifo_V_MESSAGE_29_din};
                
    endmodule

`else
	// Statements
`endif 
