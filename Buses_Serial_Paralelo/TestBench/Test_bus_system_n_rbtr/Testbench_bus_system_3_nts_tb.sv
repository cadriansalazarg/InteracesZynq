`timescale 1ns / 1ns
`default_nettype none
`define PCKG_SZ 32 
`define BROADCAST {8{1'b1}}
`define DRVRS 4
`define BITS 4
`define MAX_MSGS 1024

module Sim_bs_systm_bs_gnrtr_n_rbtr;
    //inputs
    reg clk;
    reg reset;
    reg pndng[`BITS-1:0][`DRVRS-1:0];
    reg [`PCKG_SZ-1:0] D_pop[`BITS-1:0][`DRVRS-1:0];
    
    //outputs
    wire push[`BITS-1:0][`DRVRS-1:0];
    wire pop[`BITS-1:0][`DRVRS-1:0];
    wire [`PCKG_SZ-1:0] D_push[`BITS-1:0][`DRVRS-1:0];

    bs_gnrtr_n_rbtr #(`BITS,`DRVRS,`PCKG_SZ,`BROADCAST) uut(
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
    reg [15:0] counter[`BITS-1:0][`DRVRS-1:0];

    initial begin
        $dumpfile("vcd_file.vcd");
        $dumpvars(0,Sim_bs_systm_bs_gnrtr_n_rbtr);
        $timeformat(-9,0,"ns",5);
        /* $timeformat [ ( n, p, suffix , min_field_width ) ] ;
        units = 1 second ** (-n), n = 0->15, e.g. for n = 9, units = ns
        p = digits after decimal point for %t e.g. p = 5 gives 0.00000
        suffix for %t (despite timescale directive)
        min_field_width is number of character positions for %t */
        clk=0;
        reset =1;
  
        for(i=0;i<`DRVRS;i=i+1) begin
            target[i] = i;
            source[i] = i;
        end
    
        for(k=0;k <`BITS;k=k+1)begin
            for(i=0;i<`DRVRS;i=i+1)begin
                counter[k][i] = 0; 
            end
        end
    end

    always #1 clk=~clk;   
    
    always @(posedge clk)begin
        prueba();
    end
  
    task prueba ();
        reset = 0;
        for(k=0;k <`BITS;k=k+1)begin
            for(i=0;i<`DRVRS;i=i+1)begin
                pndng[k][i] = {1'b1};
                if(i != `DRVRS-1)begin
                    D_pop[k][i]={target[i+1],source[i],counter[k][i],{`PCKG_SZ-32{1'b0}}};
                end else begin
                    D_pop[k][i]={target[0],source[i],counter[k][i],{`PCKG_SZ-32{1'b0}}};
                end
            end
        end

        for(k=0;k<`BITS;k=k+1)begin
            for(i=0;i<`DRVRS;i=i+1) begin
                if( push[k][i] == 1 )begin
                    $display("At time %t: in driver %g at bus %g message saved. target: %g source: %g ID: %g",$time,i,k, D_push[k][i][`PCKG_SZ-1:`PCKG_SZ-8], D_push[k][i][`PCKG_SZ-9:`PCKG_SZ-16],D_push[k][i][`PCKG_SZ-17:`PCKG_SZ-32]);
                    mensages_enviados=mensages_enviados+1; 
                end
            end
        end

        for(k=0;k<`BITS;k=k+1)begin
            for(i=0;i<`DRVRS;i=i+1) begin
                if( pop[k][i] == 1 )begin
                    $display("At time %t: in driver %g at bus %g message pop. target: %g source: %g ID: %g",$time,i,k, D_pop[k][i][`PCKG_SZ-1:`PCKG_SZ-8], D_pop[k][i][`PCKG_SZ-9:`PCKG_SZ-16],D_pop[k][i][`PCKG_SZ-17:`PCKG_SZ-32]);
                    counter[k][i] = counter[k][i]+1;
                end        
            end
        end
 
        if(mensages_enviados >= `MAX_MSGS)begin
            $display("mensages_enviados= %g",mensages_enviados);
            $finish;
        end

    endtask

endmodule
