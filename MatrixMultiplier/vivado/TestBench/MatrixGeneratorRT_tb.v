`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2021 12:49:20 AM
// Design Name: 
// Module Name: Generator_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MatrixGeneratorRT_tb;
    
    parameter Stop_Counter_Value = 20'd20000;
    
    reg reset;
    reg clk;
    reg  input_r_TREADY_0;
    
    wire input_r_TLAST_0;
    wire input_r_TVALID_0;
    wire [31:0] input_r_TDATA_0;
    
    MatrixGeneratorRT #(.Stop_Counter_Value(Stop_Counter_Value)) uut(
    .clk(clk), 
    .reset(reset), 
    .input_r_TVALID_0(input_r_TVALID_0), 
    .input_r_TLAST_0(input_r_TLAST_0),
    .input_r_TDATA_0(input_r_TDATA_0), 
    .input_r_TREADY_0(input_r_TREADY_0)
    );
    
    initial begin
        reset = 1;
        clk = 0;
        input_r_TREADY_0 = 0;
        
        #250 reset = 0;
        #250 input_r_TREADY_0 = 1;
        
        //#100780 input_r_TREADY_0 = 0;
        
        //#1000 input_r_TREADY_0 = 1;
        
    end
    
    
    initial forever #2.5 clk = ~clk;
    
endmodule
