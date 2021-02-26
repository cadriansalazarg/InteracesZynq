`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2021 02:38:17 PM
// Design Name: 
// Module Name: FSM_Initial_Sequence
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


module FSM_Initial_Sequence(
    input USR_rst,
    input clk,
    output reg out_rst
    );
    
    reg Estado = 1'b0;
    reg Estado_Siguiente;
    reg [3:0] Cont;
    reg rst_Cont;
    
    
    
    // Contador
    always @(posedge(clk)) begin
         if(rst_Cont || USR_rst)
            Cont <= 4'b0;
         else
            Cont <= Cont + 4'b1;
    end
    
    
    // Registro de estado
    always @(posedge(clk)) begin
        if(USR_rst)
            Estado <= 1'b0;
        else
            Estado <= Estado_Siguiente;
    end
    
    // Lógica de salida
    always @* begin
        case(Estado)
        1'b0: begin
            out_rst <= 1'b1;
            rst_Cont <= 1'b0;
        end
        1'b1: begin
            out_rst <= 1'b0;
            rst_Cont <= 1'b1;
        end
        endcase
    end
    
    // Lógica de estado siguiente
    always @* begin
        case(Estado)
        1'b0: begin
            if(Cont > 4'd13)
                Estado_Siguiente <= 1'b1;
            else
                Estado_Siguiente <= 1'b0;
        
        end
        1'b1: begin
            Estado_Siguiente <= 1'b1;
        end  
        endcase    
    end
    
endmodule
