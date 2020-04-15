`timescale 1ns / 1ns
`default_nettype none
`define BROADCAST {8{1'b1}}
`define DRVRS 2
`define BITS 32 
`define BUSES  1
`define MAX_MSGS 1024
//`include "../Library.sv"

module Sim_bs_systm;
 //inputs
  reg clk;
  reg reset;
  reg pndng_drvr_0_bus_0;
  reg pndng_drvr_1_bus_0;
  reg [`BITS-1:0] D_pop_drvr_0_bus_0;
  reg [`BITS-1:0] D_pop_drvr_1_bus_0;
  
 //outputs
  wire push_drvr_0_bus_0;
  wire push_drvr_1_bus_0;
  wire pop_drvr_0_bus_0;
  wire pop_drvr_1_bus_0;
  wire [`BITS-1:0] D_push_drvr_0_bus_0;
  wire [`BITS-1:0] D_push_drvr_1_bus_0;

  prll_bs_gnrtr_n_rbtr_wrap_V #(`BUSES,`BITS,`DRVRS,`BROADCAST) uut(
    .clk(clk),
    .reset(reset),
    .pndng_drvr_0_bus_0(pndng_drvr_0_bus_0),
    .pndng_drvr_1_bus_0(pndng_drvr_1_bus_0),
    .push_drvr_0_bus_0(push_drvr_0_bus_0),
    .push_drvr_1_bus_0(push_drvr_1_bus_0),
    .pop_drvr_0_bus_0(pop_drvr_0_bus_0),
    .pop_drvr_1_bus_0(pop_drvr_1_bus_0),
    .D_pop_drvr_0_bus_0(D_pop_drvr_0_bus_0),
    .D_pop_drvr_1_bus_0(D_pop_drvr_1_bus_0),
    .D_push_drvr_0_bus_0(D_push_drvr_0_bus_0),
    .D_push_drvr_1_bus_0(D_push_drvr_1_bus_0)
);


int mensages_enviados = 0;
int counter = 0;

reg [15:0] message_drvr_0 = 16'd0;
reg [15:0] message_drvr_1 = 16'd0;

initial begin
$dumpfile("vcd_file.vcd");
$dumpvars(0,Sim_bs_systm);
clk = 0;
reset = 1;
#20 reset = 0;
end

  always #1 clk=~clk;   
  
  always @(posedge clk)begin
    Monitor();
    counter = counter + 1;
    if (counter == 30) begin
        ScoreBoard();
    end
    if (counter == 31) begin
        counter = 0;
    end
  end
  
  task Monitor ();
    if( push_drvr_0_bus_0 == 1 )begin
           $display("At time %t: in terminal %g message saved. target: %g source: %g ID: %g",$time,0, D_push_drvr_0_bus_0[`BITS-1:`BITS-8], D_push_drvr_0_bus_0[`BITS-9:`BITS-16],D_push_drvr_0_bus_0[`BITS-17:`BITS-32]);
            mensages_enviados=mensages_enviados+1; 
    end
    
    if( push_drvr_1_bus_0 == 1 )begin
           $display("At time %t: in terminal %g message saved. target: %g source: %g ID: %g",$time,1, D_push_drvr_1_bus_0[`BITS-1:`BITS-8], D_push_drvr_1_bus_0[`BITS-9:`BITS-16],D_push_drvr_1_bus_0[`BITS-17:`BITS-32]);
            mensages_enviados=mensages_enviados+1; 
    end

    if( pop_drvr_0_bus_0 == 1 )begin
            $display("At time %t: in terminal %g message pop. target: %g source: %g ID: %g",$time,0, D_pop_drvr_0_bus_0[`BITS-1:`BITS-8], D_pop_drvr_0_bus_0[`BITS-9:`BITS-16],D_pop_drvr_0_bus_0[`BITS-17:`BITS-32]);
            if(pndng_drvr_1_bus_0 == 1) begin
                pndng_drvr_1_bus_0 = 0;
                message_drvr_1 = message_drvr_1 + 1;
            end
    end 
    
    if( pop_drvr_1_bus_0 == 1 )begin
            $display("At time %t: in terminal %g message pop. target: %g source: %g ID: %g",$time,1, D_pop_drvr_1_bus_0[`BITS-1:`BITS-8], D_pop_drvr_1_bus_0[`BITS-9:`BITS-16],D_pop_drvr_1_bus_0[`BITS-17:`BITS-32]);
            if(pndng_drvr_0_bus_0 == 1) begin
                pndng_drvr_0_bus_0 = 0;
                message_drvr_0 = message_drvr_0 + 1;
            end
    end 
     
    if(mensages_enviados >= `MAX_MSGS)begin
        $display("mensages_enviados= %g",mensages_enviados);
        $finish;
    end

  endtask
  
  task ScoreBoard();
    reset = 0;
    pndng_drvr_0_bus_0 = 1;
    pndng_drvr_1_bus_0 = 1;
    D_pop_drvr_0_bus_0 = {8'h01,8'h00, message_drvr_0}; // [31:24] Destino, [23:16] Source, [15:0] Message
    D_pop_drvr_1_bus_0 = {8'h00,8'h01, message_drvr_1}; // [31:24] Destino, [23:16] Source, [15:0] Message
  endtask

endmodule
