`timescale 1ns / 1ns
`default_nettype none
`define BROADCAST {8{1'b1}}
`define DRVRS 4
`define BITS 32 
`define BUSES  4
`define MAX_MSGS 1024
//`include "../Library.sv"

module Sim_bs_systm_prll_bs_gnrtr_n_rbtr;
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
    int j = 0;
    int mensages_enviados = 0;
    reg [15:0] counter[`DRVRS-1:0];

    initial begin
        $timeformat(-9,0,"ns",5);
        /* $timeformat [ ( n, p, suffix , min_field_width ) ] ;
        units = 1 second ** (-n), n = 0->15, e.g. for n = 9, units = ns
        p = digits after decimal point for %t e.g. p = 5 gives 0.00000
        suffix for %t (despite timescale directive)
        min_field_width is number of character positions for %t */
        $dumpfile("vcd_file.vcd");
        $dumpvars(0,Sim_bs_systm_prll_bs_gnrtr_n_rbtr);

        clk=0;
        reset =1;
  
        for(i=0;i<`DRVRS;i=i+1) begin
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
            for(j=0; j<`BUSES;j++) begin
                pndng[j][i] = {1'b1};
                if(i != `DRVRS-1)begin
                    D_pop[j][i]={target[i+1],source[i],counter[i],{`BITS-32{1'b0}}};
                end else begin
                    D_pop[j][i]={target[0],source[i],counter[i],{`BITS-32{1'b0}}};
                end
            end
        end

        for(i=0;i<`DRVRS;i=i+1)begin
            for(j=0; j<`BUSES;j++) begin
                if( push[j][i] == 1 )begin
                    $display("At time %t: in driver %g at bus %g message saved. target: %g source: %g  ID:  %g",$time,i,j, D_push[j][i][`BITS-1:`BITS-8], D_push[j][i][`BITS-9:`BITS-16],D_push[j][i][`BITS-17:`BITS-32]);
                    mensages_enviados=mensages_enviados+1; 
                end
            end
        end

        for(i=0;i<`DRVRS;i=i+1) begin
            for(j=0; j<`BUSES;j++) begin
                if( pop[j][i] == 1 )begin
                    $display("At time %t: in driver %g at bus %g message pop. target: %g  source:  %g  ID:  %g",$time,i,j, D_pop[j][i][`BITS-1:`BITS-8], D_pop[j][i][`BITS-9:`BITS-16],D_pop[j][i][`BITS-17:`BITS-32]);
                    counter[i] = counter[i]+1;
                end  
            end      
        end
 
        if(mensages_enviados >= `MAX_MSGS)begin
            $display("mensages_enviados= %g",mensages_enviados);
            $finish;
        end
    endtask

endmodule
