`timescale 1ns / 1ps

module testbench;

    wire Error;
    wire channel_up;
    wire clk_200MHz;
    wire [255:0]dout;
    wire full;
    wire gt_refclk;
    wire init_clk;
    wire not_empty; 
    wire [0:0]txn;
    wire [0:0]txp;
    wire user_clk;
    
    reg wr_en;
    reg clk_200MHz_n;
    reg clk_200MHz_p;
    reg [255:0]din;
    reg rd_en;
    wire [0:0]rxn;
    wire [0:0]rxp;
    reg peripheral_reset;


    design_1_wrapper uut (
    .Error(Error),
    .channel_up(channel_up),
    .clk_200MHz(clk_200MHz),
    .clk_200MHz_n(clk_200MHz_n),
    .clk_200MHz_p(clk_200MHz_p),
    .din(din),
    .dout(dout),
    .full(full),
    .gt_refclk(gt_refclk),
    .init_clk(init_clk),
    .not_empty(not_empty),
    .peripheral_reset(peripheral_reset),
    .rd_en(rd_en),
    .rxn(rxn),
    .rxp(rxp),
    .txn(txn),
    .txp(txp),
    .user_clk(user_clk),
    .wr_en(wr_en));
    
    assign rxn = txn;
    assign rxp = txp;
    
    initial begin
        wr_en = 0;
        clk_200MHz_n = 0;
        clk_200MHz_p = 1;
        din = 0;
        rd_en = 0;
        peripheral_reset = 1;
        
        #16 peripheral_reset = 0;
        
    end
    
    always #2.5 clk_200MHz_n = ~clk_200MHz_n;
    always #2.5 clk_200MHz_p = ~clk_200MHz_p;
    


endmodule