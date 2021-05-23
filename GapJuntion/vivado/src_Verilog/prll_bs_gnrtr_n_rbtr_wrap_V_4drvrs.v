`timescale 1ns / 1ps

module prll_bs_gnrtr_n_rbtr_wrap_V_4drvrs #(parameter buses = 1,parameter bits = 256,parameter drvrs = 4, parameter broadcast = {8{1'b1}}) (

    input clk,
    input reset,
    input pndng_drvr_0_bus_0,
    input pndng_drvr_1_bus_0,
    input pndng_drvr_2_bus_0,
    input pndng_drvr_3_bus_0,
    output push_drvr_0_bus_0,
    output push_drvr_1_bus_0,
    output push_drvr_2_bus_0,
    output push_drvr_3_bus_0,
    output pop_drvr_0_bus_0,
    output pop_drvr_1_bus_0,
    output pop_drvr_2_bus_0,
    output pop_drvr_3_bus_0,
    input  [bits-1:0] D_pop_drvr_0_bus_0,
    input  [bits-1:0] D_pop_drvr_1_bus_0,
    input  [bits-1:0] D_pop_drvr_2_bus_0,
    input  [bits-1:0] D_pop_drvr_3_bus_0,
    output [bits-1:0] D_push_drvr_0_bus_0,
    output [bits-1:0] D_push_drvr_1_bus_0,
    output [bits-1:0] D_push_drvr_2_bus_0,
    output [bits-1:0] D_push_drvr_3_bus_0
);

prll_bs_gnrtr_n_rbtr_wrap_SV_4drvrs #(.buses(buses),.bits(bits),.drvrs(drvrs),.broadcast(broadcast)) bus_interfase (
.clk(clk),
.reset(reset),
.pndng_drvr_0_bus_0(pndng_drvr_0_bus_0),
.pndng_drvr_1_bus_0(pndng_drvr_1_bus_0),
.pndng_drvr_2_bus_0(pndng_drvr_2_bus_0),
.pndng_drvr_3_bus_0(pndng_drvr_3_bus_0),
.push_drvr_0_bus_0(push_drvr_0_bus_0),
.push_drvr_1_bus_0(push_drvr_1_bus_0),
.push_drvr_2_bus_0(push_drvr_2_bus_0),
.push_drvr_3_bus_0(push_drvr_3_bus_0),
.pop_drvr_0_bus_0(pop_drvr_0_bus_0),
.pop_drvr_1_bus_0(pop_drvr_1_bus_0),
.pop_drvr_2_bus_0(pop_drvr_2_bus_0),
.pop_drvr_3_bus_0(pop_drvr_3_bus_0),
.D_pop_drvr_0_bus_0(D_pop_drvr_0_bus_0),
.D_pop_drvr_1_bus_0(D_pop_drvr_1_bus_0),
.D_pop_drvr_2_bus_0(D_pop_drvr_2_bus_0),
.D_pop_drvr_3_bus_0(D_pop_drvr_3_bus_0),
.D_push_drvr_0_bus_0(D_push_drvr_0_bus_0),
.D_push_drvr_1_bus_0(D_push_drvr_1_bus_0),
.D_push_drvr_2_bus_0(D_push_drvr_2_bus_0),
.D_push_drvr_3_bus_0(D_push_drvr_3_bus_0)
);

endmodule 
