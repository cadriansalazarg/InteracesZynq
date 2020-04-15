`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 03:46:41 PM
// Design Name: 
// Module Name: prll_bs_gnrtr_n_rbtr_wrap_SV
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Dado que la codificación elaborada por Ronny está directamente pensada para ser utilizada en System Verilog, pero el block design de Vivado
// no admite importar RTL descritos en este lenguaje, la recomendación de Xilinx es embeber el módulo dentro de un RTL descrito en Verilog y así se elimina este problema
// Sin embargo, para hacer esto, es necesario reajustar la forma en que se codifica el top en SystemVerilog, por lo tanto, la función de este módulo es hacer un Wrap
// de manera que la instanciación en System Verilog sea factible.
//////////////////////////////////////////////////////////////////////////////////


module prll_bs_gnrtr_n_rbtr_wrap_SV #(parameter buses = 1,parameter bits = 32,parameter drvrs = 2, parameter broadcast = {8{1'b1}}) (    
    input clk,
    input reset,
    input  pndng_drvr_0_bus_0,
    input  pndng_drvr_1_bus_0,
    output push_drvr_0_bus_0,
    output push_drvr_1_bus_0,
    output pop_drvr_0_bus_0,
    output pop_drvr_1_bus_0,
    input  [bits-1:0] D_pop_drvr_0_bus_0,
    input  [bits-1:0] D_pop_drvr_1_bus_0,
    output [bits-1:0] D_push_drvr_0_bus_0,
    output [bits-1:0] D_push_drvr_1_bus_0
 );
    
    
    wire pndng [buses-1:0][drvrs-1:0];
    wire pop [buses-1:0][drvrs-1:0];
    wire push [buses-1:0][drvrs-1:0];
    wire [bits-1:0] D_pop [buses-1:0][drvrs-1:0];
    wire [bits-1:0] D_push [buses-1:0][drvrs-1:0];
    
    assign pndng[0][0] = pndng_drvr_0_bus_0;
    assign pndng[0][1] = pndng_drvr_1_bus_0;
    
    assign push_drvr_0_bus_0 = push[0][0];
    assign push_drvr_1_bus_0 = push[0][1];
    
    assign pop_drvr_0_bus_0 = pop[0][0];
    assign pop_drvr_1_bus_0 = pop[0][1];
    
    assign D_pop[0][0] = D_pop_drvr_0_bus_0;
    assign D_pop[0][1] = D_pop_drvr_1_bus_0;
    
    assign D_push_drvr_0_bus_0 = D_push[0][0];
    assign D_push_drvr_1_bus_0 = D_push[0][1];
    
    prll_bs_gnrtr_n_rbtr #(.buses(buses),.bits(bits),.drvrs(drvrs),.broadcast(broadcast)) bus_interfase (
    .clk(clk),
    .reset(reset),
    .pndng(pndng),
    .push(push),
    .pop(pop),
    .D_pop(D_pop),
    .D_push(D_push)
    );
endmodule
