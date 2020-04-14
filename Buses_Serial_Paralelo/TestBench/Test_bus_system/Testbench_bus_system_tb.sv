`timescale 1ns / 1ns
`default_nettype none
`define PCKG_SZ 128 
`define BROADCAST {8{1'b1}}
`define DRVRS 2
//`include "../Library.sv"

module Sim_bs_systm_bs_gnrtr;
    //inputs
    reg clk;
    reg reset;
    reg [`DRVRS-1:0] pndng;
    reg [`DRVRS-1:0][`PCKG_SZ-1:0] D_pop;
    //outputs
    wire [`DRVRS-1:0] push;
    wire [`DRVRS-1:0] pop;
    wire [`DRVRS-1:0][`PCKG_SZ-1:0] D_push;

    //Other varibles
    reg [7:0]target [`DRVRS-1:0];
    reg [7:0]source [`DRVRS-1:0];
    reg [15:0] counter[`DRVRS-1:0];
    int i = 0;

    bs_gnrtr #(`DRVRS,`PCKG_SZ,`BROADCAST) uut(
    .clk(clk),
    .reset(reset),
    .pndng(pndng),
    .push(push),
    .pop(pop),
    .D_pop(D_pop),
    .D_push(D_push)
    );


    initial begin
        $timeformat(-9,0,"ns",5);
        /* $timeformat [ ( n, p, suffix , min_field_width ) ] ;
        units = 1 second ** (-n), n = 0->15, e.g. for n = 9, units = ns
        p = digits after decimal point for %t e.g. p = 5 gives 0.00000
        suffix for %t (despite timescale directive)
        min_field_width is number of character positions for %t */
        clk=0;
        for(i=0;i<`DRVRS;i=i+1) begin
            target[i] = i;
            source[i] = i;
        end
      
        for(i=0;i<`DRVRS;i=i+1)begin
            counter[i] = 0; 
        end

        #1;    
        reset = 1;
        pndng = {`DRVRS{1'b1}};
        for(i=0; i< `DRVRS; i=i+1) begin
            if(i != `DRVRS-1)begin
                D_pop[i]={target[i+1],source[i],counter[i],{`PCKG_SZ-32{1'b0}}};
            end else begin
                 D_pop[i]={target[0],source[i],counter[i],{`PCKG_SZ-32{1'b0}}};
            end
        end
        
        #1
        reset = 0;
        pndng = {`DRVRS{1'b1}};
        for(i=0; i< `DRVRS; i=i+1) begin
            if(i != `DRVRS-1)begin
                D_pop[i]={target[i+1],source[i],counter[i],{`PCKG_SZ-32{1'b0}}};
            end else begin
                 D_pop[i]={target[0],source[i],counter[i],{`PCKG_SZ-32{1'b0}}};
            end
        end

        #990
        reset = 1;
        pndng = {`DRVRS{1'b1}};
        for(i=0; i< `DRVRS; i=i+1) begin
            if(i != `DRVRS-1)begin
                D_pop[i]={target[i+1],source[i],counter[i],{`PCKG_SZ-32{1'b0}}};
            end else begin
                 D_pop[i]={target[0],source[i],counter[i],{`PCKG_SZ-32{1'b0}}};
            end
        end
    end
    
    always #1 clk=~clk;   
    
    always @(posedge clk)begin
        prueba();
    end
    
    task prueba ();
        for(i=0;i<`DRVRS;i=i+1)begin
            if( push[i] == 1 )begin
                $display("At time %t: in driver %g  message saved. target: %g source: %g  ID:  %g",$time,i, D_push[i][`PCKG_SZ-1:`PCKG_SZ-8], D_push[i][`PCKG_SZ-9:`PCKG_SZ-16],D_push[i][`PCKG_SZ-17:`PCKG_SZ-32]);
            end
        end
        

        for(i=0;i<`DRVRS;i=i+1) begin
            if( pop[i] == 1 )begin
                $display("At time %t: in driver %g message pop. target: %g  source:  %g  ID:  %g",$time,i, D_pop[i][`PCKG_SZ-1:`PCKG_SZ-8], D_pop[i][`PCKG_SZ-9:`PCKG_SZ-16],D_pop[i][`PCKG_SZ-17:`PCKG_SZ-32]);
                counter[i] = counter[i]+1;
            end       
        end
    endtask
    
endmodule


  
    
//        for(i=0;i<`DRVRS;i=i+1)begin
//            if(i != `DRVRS-1)begin
//                D_pop[i]={target[i+1],source[i],counter[i],{`PCKG_SZ-32{1'b0}}};
//            end else begin
//                D_pop[i]={target[0],source[i],counter[i],{`PCKG_SZ-32{1'b0}}};
//            end
//        end
        
//        for(i=0;i<`DRVRS;i=i+1)begin
//            if( push[i] == 1 )begin
//                $display("At time %t: in driver %g  message saved. target: %g source: %g  ID:  %g",$time,i, D_push[i][`PCKG_SZ-1:`PCKG_SZ-8], D_push[i][`PCKG_SZ-9:`PCKG_SZ-16],D_push[i][`PCKG_SZ-17:`PCKG_SZ-32]);
//                pndng[i] = {1'b1};
//            end
//        end
        

//        for(i=0;i<`DRVRS;i=i+1) begin
//            if( pop[i] == 1 )begin
//                $display("At time %t: in driver %g message pop. target: %g  source:  %g  ID:  %g",$time,i, D_pop[i][`PCKG_SZ-1:`PCKG_SZ-8], D_pop[i][`PCKG_SZ-9:`PCKG_SZ-16],D_pop[i][`PCKG_SZ-17:`PCKG_SZ-32]);
//                counter[i] = counter[i]+1;
//                pndng[i] = {1'b0};
//            end       
//        end
//    endtask
    
//endmodule
