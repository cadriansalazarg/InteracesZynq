`timescale 1ns / 1ps

module prll_bs_gnrtr_n_rbtr_wrap_SV_8drvrs #(parameter buses = 1,parameter bits = 32,parameter drvrs = 8, parameter broadcast = {8{1'b1}}) (

    input clk,
    input reset,
    input pndng_drvr_0_bus_0,
    input pndng_drvr_1_bus_0,
    input pndng_drvr_2_bus_0,
    input pndng_drvr_3_bus_0,
    input pndng_drvr_4_bus_0,
    input pndng_drvr_5_bus_0,
    input pndng_drvr_6_bus_0,
    input pndng_drvr_7_bus_0,
    output push_drvr_0_bus_0,
    output push_drvr_1_bus_0,
    output push_drvr_2_bus_0,
    output push_drvr_3_bus_0,
    output push_drvr_4_bus_0,
    output push_drvr_5_bus_0,
    output push_drvr_6_bus_0,
    output push_drvr_7_bus_0,
    output pop_drvr_0_bus_0,
    output pop_drvr_1_bus_0,
    output pop_drvr_2_bus_0,
    output pop_drvr_3_bus_0,
    output pop_drvr_4_bus_0,
    output pop_drvr_5_bus_0,
    output pop_drvr_6_bus_0,
    output pop_drvr_7_bus_0,
    input  [bits-1:0] D_pop_drvr_0_bus_0,
    input  [bits-1:0] D_pop_drvr_1_bus_0,
    input  [bits-1:0] D_pop_drvr_2_bus_0,
    input  [bits-1:0] D_pop_drvr_3_bus_0,
    input  [bits-1:0] D_pop_drvr_4_bus_0,
    input  [bits-1:0] D_pop_drvr_5_bus_0,
    input  [bits-1:0] D_pop_drvr_6_bus_0,
    input  [bits-1:0] D_pop_drvr_7_bus_0,
    output [bits-1:0] D_push_drvr_0_bus_0,
    output [bits-1:0] D_push_drvr_1_bus_0,
    output [bits-1:0] D_push_drvr_2_bus_0,
    output [bits-1:0] D_push_drvr_3_bus_0,
    output [bits-1:0] D_push_drvr_4_bus_0,
    output [bits-1:0] D_push_drvr_5_bus_0,
    output [bits-1:0] D_push_drvr_6_bus_0,
    output [bits-1:0] D_push_drvr_7_bus_0
);

    wire pndng [buses-1:0][drvrs-1:0];
    wire pop [buses-1:0][drvrs-1:0];
    wire push [buses-1:0][drvrs-1:0];
    wire [bits-1:0] D_pop [buses-1:0][drvrs-1:0];
    wire [bits-1:0] D_push [buses-1:0][drvrs-1:0];

    assign pndng[0][0] = pndng_drvr_0_bus_0;
    assign pndng[0][1] = pndng_drvr_1_bus_0;
    assign pndng[0][2] = pndng_drvr_2_bus_0;
    assign pndng[0][3] = pndng_drvr_3_bus_0;
    assign pndng[0][4] = pndng_drvr_4_bus_0;
    assign pndng[0][5] = pndng_drvr_5_bus_0;
    assign pndng[0][6] = pndng_drvr_6_bus_0;
    assign pndng[0][7] = pndng_drvr_7_bus_0;

    assign push_drvr_0_bus_0 = push[0][0];
    assign push_drvr_1_bus_0 = push[0][1];
    assign push_drvr_2_bus_0 = push[0][2];
    assign push_drvr_3_bus_0 = push[0][3];
    assign push_drvr_4_bus_0 = push[0][4];
    assign push_drvr_5_bus_0 = push[0][5];
    assign push_drvr_6_bus_0 = push[0][6];
    assign push_drvr_7_bus_0 = push[0][7];

    assign pop_drvr_0_bus_0 = pop[0][0];
    assign pop_drvr_1_bus_0 = pop[0][1];
    assign pop_drvr_2_bus_0 = pop[0][2];
    assign pop_drvr_3_bus_0 = pop[0][3];
    assign pop_drvr_4_bus_0 = pop[0][4];
    assign pop_drvr_5_bus_0 = pop[0][5];
    assign pop_drvr_6_bus_0 = pop[0][6];
    assign pop_drvr_7_bus_0 = pop[0][7];

    assign D_pop[0][0] = D_pop_drvr_0_bus_0;
    assign D_pop[0][1] = D_pop_drvr_1_bus_0;
    assign D_pop[0][2] = D_pop_drvr_2_bus_0;
    assign D_pop[0][3] = D_pop_drvr_3_bus_0;
    assign D_pop[0][4] = D_pop_drvr_4_bus_0;
    assign D_pop[0][5] = D_pop_drvr_5_bus_0;
    assign D_pop[0][6] = D_pop_drvr_6_bus_0;
    assign D_pop[0][7] = D_pop_drvr_7_bus_0;

    assign D_push_drvr_0_bus_0 = D_push[0][0];
    assign D_push_drvr_1_bus_0 = D_push[0][1];
    assign D_push_drvr_2_bus_0 = D_push[0][2];
    assign D_push_drvr_3_bus_0 = D_push[0][3];
    assign D_push_drvr_4_bus_0 = D_push[0][4];
    assign D_push_drvr_5_bus_0 = D_push[0][5];
    assign D_push_drvr_6_bus_0 = D_push[0][6];
    assign D_push_drvr_7_bus_0 = D_push[0][7];

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
