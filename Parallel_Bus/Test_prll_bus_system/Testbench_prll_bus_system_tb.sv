`timescale 1ns / 1ns
`default_nettype none
`define BROADCAST {8{1'b1}}
`define DRVRS 4
`define BITS 32 
`define BUSES  1
`define MAX_MSGS 1024
//`include "../Library.sv"

module Sim_bs_systm;
 //inputs
  reg clk;
  reg reset;
  reg pndng[`BUSES-1:0][`DRVRS-1:0];
  reg [`BITS-1:0] D_pop[`BUSES-1:0][`DRVRS-1:0];
    
 //outputs
  wire push[`BUSES-1:0][`DRVRS-1:0];
  wire pop[`BUSES-1:0][`DRVRS-1:0];
  wire [`BITS-1:0] D_push[`BUSES-1:0][`DRVRS-1:0];


  prll_bs_gnrtr_n_rbtr #(`BUSES,`BITS,`DRVRS,`BROADCAST) uut(
    .clk(clk),
    .reset(reset),
    .pndng(pndng),
    .push(push),
    .pop(pop),
    .D_pop(D_pop),
    .D_push(D_push)
);


 //varibles used for testing
  reg [7:0] target [`DRVRS-1:0];
  reg [7:0] source [`DRVRS-1:0];
  int i = 0;
  int k = 0;
  int mensages_enviados = 0;
  reg [15:0] counter[`DRVRS-1:0];

initial begin
$dumpfile("vcd_file.vcd");
$dumpvars(0,Sim_bs_systm);
//$vcdplusfile ("Ronny.vpd");
//$vcdpluson;
  clk=0;
  reset =1;
    
  for(i=0;i<`DRVRS;i=i+1)
  begin
    target[i] = i;
    source[i] = i;
  end
      for(i=0;i<`DRVRS;i=i+1)begin
        counter[i] = 0; 
      end
end

  always #1 clk=~clk;   
  always @(posedge clk)begin
    prueba();
  end
  
  task prueba ();
    reset = 0;
      for(i=0;i<`DRVRS;i=i+1)begin
        //pndng[i] = {1'b1}; // Se cambió está línea con respecto al código de Ronny
        pndng[i] = {1'b1,1'b1,1'b1,1'b1}; // Se pusieron 4 concatenaciones una por  cada driver
        if(i != `DRVRS-1)begin
          D_pop[0][i]={target[i+1],source[i],counter[i],{`BITS-32{1'b0}}};
        end else begin
          D_pop[0][i]={target[0],source[i],counter[i],{`BITS-32{1'b0}}};
        end
    end

        for(i=0;i<`DRVRS;i=i+1)
        begin
          if( push[i] == 1 )begin
            $display("At time %t: in terminal %g message saved. target: %g source: %g ID: %g",$time,i, D_push[0][i][`BITS-1:`BITS-8], D_push[0][i][`BITS-9:`BITS-16],D_push[i][0][`BITS-17:`BITS-32]);
            mensages_enviados=mensages_enviados+1; 
          end
        end

        for(i=0;i<`DRVRS;i=i+1)
        begin
          if( pop[i] == 1 )begin
            $display("At time %t: in terminal %g message pop. target: %g source: %g ID: %g",$time,i, D_pop[0][i][`BITS-1:`BITS-8], D_pop[0][i][`BITS-9:`BITS-16],D_pop[i][0][`BITS-17:`BITS-32]);
            counter[i] = counter[i]+1;
          end        
        end
 
  if(mensages_enviados >= `MAX_MSGS)begin
    $display("mensages_enviados= %g",mensages_enviados);
    $finish;
  end

  endtask

endmodule
