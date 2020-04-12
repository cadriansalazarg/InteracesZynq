`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 08:52:02 PM
// Design Name: 
// Module Name: prll_bs_gnrtr_n_rbtr_wrap_V
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Dado que el block design no acepta cargar archivos directamente en sistem Verilog, la recomendación de Xilinx para estos casos es
// embeber el módulo elaborado en SystemVerilog, dentro de un módulo en Verilog, por está razón se creo este archivo para realizar está función
//////////////////////////////////////////////////////////////////////////////////


module prll_bs_gnrtr_n_rbtr_wrap_V #(parameter buses = 1,parameter bits = 32,parameter drvrs = 2, parameter broadcast = {8{1'b1}}) (
    input clk,
    input reset,
    input  pndng_0_0,
    input  pndng_0_1,
    output push_0_0,
    output push_0_1,
    output pop_0_0,
    output pop_0_1,
    input  [bits-1:0] D_pop_0_0,
    input  [bits-1:0] D_pop_0_1,
    output [bits-1:0] D_push_0_0,
    output [bits-1:0] D_push_0_1
 );
    
    prll_bs_gnrtr_n_rbtr_wrap_SV #(.buses(buses),.bits(bits),.drvrs(drvrs),.broadcast(broadcast)) bus_interfase (
    .clk(clk),
    .reset(reset),
    .pndng_0_0(pndng_0_0),
    .pndng_0_1(pndng_0_1),
    .push_0_0(push_0_0),
    .push_0_1(push_0_1),
    .pop_0_0(pop_0_0),
    .pop_0_1(pop_0_1),
    .D_pop_0_0(D_pop_0_0),
    .D_pop_0_1(D_pop_0_1),
    .D_push_0_0(D_push_0_0),
    .D_push_0_1(D_push_0_1)
    );
    
endmodule
