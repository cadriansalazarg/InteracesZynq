'''This Python code generates a Verilog file named prll_bs_gnrtr_n_rbtr_wrap_V.v and a SystemVerilog file named prll_bs_gnrtr_n_rbtr_wrap_V.sv.

The drivers used will be a variable, ranging from 2 to 32. This program will generate the script necessary for the construction of the module of a BUS

in the HDLs mentioned before.'''

drivers = input('Digite la cantidad de Drivers conectados al Bus deseados (en un rango de 2 a 32): ')

###VERILOG###

file = open("prll_bs_gnrtr_n_rbtr_wrap_V.v","w")

file.write("`timescale 1ns / 1ps\n\n")

file.write("module prll_bs_gnrtr_n_rbtr_wrap_V #(parameter buses = 1,parameter bits = 32,parameter drvrs = ")
file.write(str(drivers))
file.write(", parameter broadcast = {8{1'b1}}) (\n\n")

file.write("    input clk,\n    input reset,\n")

for i in range(drivers):
    file.write("    input pndng_drvr_")
    file.write(str(i))
    file.write("_bus_0,\n")
    
for i in range(drivers):
    file.write("    output push_drvr_")
    file.write(str(i))
    file.write("_bus_0,\n")

for i in range(drivers):
    file.write("    output pop_drvr_")
    file.write(str(i))
    file.write("_bus_0,\n")
    
for i in range(drivers):
    file.write("    input  [bits-1:0] D_pop_drvr_")
    file.write(str(i))
    file.write("_bus_0,\n")

for i in range(drivers):
    if(i==drivers-1):
        file.write("    output [bits-1:0] D_push_drvr_")
        file.write(str(i))
        file.write("_bus_0\n);\n\n")
    else:
        file.write("    output [bits-1:0] D_push_drvr_")
        file.write(str(i))
        file.write("_bus_0,\n")

file.write("prll_bs_gnrtr_n_rbtr_wrap_SV #(.buses(buses),.bits(bits),.drvrs(drvrs),.broadcast(broadcast)) bus_interfase (\n.clk(clk),\n.reset(reset),\n")

for i in range(drivers):
    file.write(".pndng_drvr_")
    file.write(str(i))
    file.write("_bus_0(pndng_drvr_")
    file.write(str(i))
    file.write("_bus_0),\n")

for i in range(drivers):
    file.write(".push_drvr_")
    file.write(str(i))
    file.write("_bus_0(push_drvr_")
    file.write(str(i))
    file.write("_bus_0),\n")

for i in range(drivers):
    file.write(".pop_drvr_")
    file.write(str(i))
    file.write("_bus_0(pop_drvr_")
    file.write(str(i))
    file.write("_bus_0),\n")

for i in range(drivers):
    file.write(".D_pop_drvr_")
    file.write(str(i))
    file.write("_bus_0(D_pop_drvr_")
    file.write(str(i))
    file.write("_bus_0),\n")

for i in range(drivers):
    if(i==drivers-1):
        file.write(".D_push_drvr_")
        file.write(str(i))
        file.write("_bus_0(D_push_drvr_")
        file.write(str(i))
        file.write("_bus_0)\n);\n\n")
    else:
        file.write(".D_push_drvr_")
        file.write(str(i))
        file.write("_bus_0(D_push_drvr_")
        file.write(str(i))
        file.write("_bus_0),\n")

file.write("endmodule \n") 

file.close() 

###SYSTEM VERILOG###

file = open("prll_bs_gnrtr_n_rbtr_wrap_SV.sv","w")

file.write("`timescale 1ns / 1ps\n\n")

file.write("module prll_bs_gnrtr_n_rbtr_wrap_SV #(parameter buses = 1,parameter bits = 32,parameter drvrs = ")
file.write(str(drivers))
file.write(", parameter broadcast = {8{1'b1}}) (\n\n")

file.write("    input clk,\n    input reset,\n")

for i in range(drivers):
    file.write("    input pndng_drvr_")
    file.write(str(i))
    file.write("_bus_0,\n")
    
for i in range(drivers):
    file.write("    output push_drvr_")
    file.write(str(i))
    file.write("_bus_0,\n")

for i in range(drivers):
    file.write("    output pop_drvr_")
    file.write(str(i))
    file.write("_bus_0,\n")
    
for i in range(drivers):
    file.write("    input  [bits-1:0] D_pop_drvr_")
    file.write(str(i))
    file.write("_bus_0,\n")

for i in range(drivers):
    if(i==drivers-1):
        file.write("    output [bits-1:0] D_push_drvr_")
        file.write(str(i))
        file.write("_bus_0\n);\n\n")
    else:
        file.write("    output [bits-1:0] D_push_drvr_")
        file.write(str(i))
        file.write("_bus_0,\n")

file.write("    wire pndng [buses-1:0][drvrs-1:0];\n")
file.write("    wire pop [buses-1:0][drvrs-1:0];\n")
file.write("    wire push [buses-1:0][drvrs-1:0];\n")
file.write("    wire [bits-1:0] D_pop [buses-1:0][drvrs-1:0];\n")
file.write("    wire [bits-1:0] D_push [buses-1:0][drvrs-1:0];\n\n")

for i in range(drivers):
    file.write("    assign pndng[0][")
    file.write(str(i))
    file.write("] = pndng_drvr_")
    file.write(str(i))
    file.write("_bus_0;\n")

file.write("\n")

for i in range(drivers):
    file.write("    assign push_drvr_")
    file.write(str(i))
    file.write("_bus_0 = push[0][")
    file.write(str(i))
    file.write("];\n")

file.write("\n")

for i in range(drivers):
    file.write("    assign pop_drvr_")
    file.write(str(i))
    file.write("_bus_0 = pop[0][")
    file.write(str(i))
    file.write("];\n")

file.write("\n")

for i in range(drivers):
    file.write("    assign D_pop[0][")
    file.write(str(i))
    file.write("] = D_pop_drvr_")
    file.write(str(i))
    file.write("_bus_0;\n")

file.write("\n")

for i in range(drivers):
    file.write("    assign D_push_drvr_")
    file.write(str(i))
    file.write("_bus_0 = D_push[0][")
    file.write(str(i))
    file.write("];\n")

file.write("\n    prll_bs_gnrtr_n_rbtr #(.buses(buses),.bits(bits),.drvrs(drvrs),.broadcast(broadcast)) bus_interfase (")
file.write("\n    .clk(clk),\n    .reset(reset),\n    .pndng(pndng),\n    .push(push),\n    .pop(pop),\n    .D_pop(D_pop),\n    .D_push(D_push)\n    );\n\n")
file.write("endmodule \n") 

file.close()


