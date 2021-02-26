`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2021 02:14:52 PM
// Design Name: 
// Module Name: FSM_AXI4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM_AXI4(
     
    input clk,
    input s_axi_tx_tready_0,
    input rst,
    input tx_channel_up,
    
    output reg [0:31] s_axi_tx_tdata_0,
    output reg s_axi_tx_tlast_0,
    output reg s_axi_tx_tvalid_0
    );
    
    
    reg [1:0] Estado = 1'b0;
    reg [1:0] Estado_Siguiente;
    reg [4:0] Cont = 0;
    reg En = 1'b0;
    reg rst_Cont = 1'b0;
    reg [3:0] Cont_Data_Packages = 0;
    reg En_Cont_Pack = 0;
    
    always @(posedge(clk)) begin
        if(rst)
            Cont_Data_Packages <=  4'd0;
        else if(En_Cont_Pack)
            Cont_Data_Packages <=  Cont_Data_Packages + 4'b1;
        else
            Cont_Data_Packages <=  Cont_Data_Packages;
    end
    
    
    // Contador
    always @(posedge(clk) or posedge(rst)) begin
        if(rst_Cont)
            Cont <= 5'b0;
        else if(En) begin
            Cont <= Cont + 5'd1;
        end
        
        if(rst)
            s_axi_tx_tdata_0 <= 16'b0;
        else if (En && s_axi_tx_tready_0 && tx_channel_up)
            s_axi_tx_tdata_0 <= s_axi_tx_tdata_0 + 16'd4;
        
            
    end
            
    //Secuencial
    always @(posedge(clk))
        if(rst)
            Estado <= 2'b0;
        else
            Estado <= Estado_Siguiente;
    
    //Logica de estado siguiente
    always @* begin
        case (Estado)
            2'd0: begin
                if(Cont_Data_Packages > 4'd2)
                    Estado_Siguiente <= 2'd0;
                else begin
                    if(s_axi_tx_tready_0 && Cont > 6'd5) 
                        Estado_Siguiente <= 2'd2;
                    else if (s_axi_tx_tready_0)
                        Estado_Siguiente <= 2'd1;
                    else
                        Estado_Siguiente <= 2'd0;
                end
            end
            
           2'd1:
           begin 
                if(Cont_Data_Packages > 4'd2)
                    Estado_Siguiente <= 2'd0;
                else
                    Estado_Siguiente <= 2'd2;
           end
           
           2'd2:
           begin
                if(Cont_Data_Packages > 4'd2)
                    Estado_Siguiente <= 2'd0;
                else begin
                    if(!s_axi_tx_tready_0)
                        Estado_Siguiente <= 2'd0;
                    else
                        Estado_Siguiente <= 2'd2;
                end
           end
           
           default:
                if(Cont_Data_Packages > 4'd2)
                    Estado_Siguiente <= 2'd0;
                else
                    Estado_Siguiente <= 2'd2;
        endcase
    end
    
    
    //Lógica de Salida    
    always @* begin
        case(Estado)
            2'd0:
            begin
                En <= 1'b0;
                s_axi_tx_tlast_0 <= 1'b0;
                s_axi_tx_tvalid_0 <= 1'b0;
                rst_Cont <= 1'b1;
                En_Cont_Pack <= 1'b0;
            end
            2'd1:
            begin
                En <= 1'b1;
                s_axi_tx_tlast_0 <= 1'b0;
                s_axi_tx_tvalid_0 <= 1'b1;
                rst_Cont <= 1'b0;
                En_Cont_Pack <= 1'b0;
            end
            3'd2:
            begin
                En <= 1'b1;
                
                s_axi_tx_tvalid_0 <= 1'b1;
                if(Cont >= 5'h12) begin
                    rst_Cont <= 1'b1;
                    s_axi_tx_tlast_0 <= 1'b1;
                    En_Cont_Pack <= 1'b1;
                end
                else begin
                    rst_Cont <= 1'b0;
                    s_axi_tx_tlast_0 <= 1'b0; 
                    En_Cont_Pack <= 1'b0;      
                end
                    
            end
            default:
            begin
                En <= 1'b0;
                En_Cont_Pack <= 1'b0;
                s_axi_tx_tlast_0 <= 1'b0;
                s_axi_tx_tvalid_0 <= 1'b0;
                rst_Cont <= 1'b1;
            end
        endcase
    end
endmodule
