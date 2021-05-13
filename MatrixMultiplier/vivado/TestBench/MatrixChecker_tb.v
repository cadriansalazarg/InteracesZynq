`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2021 01:41:39 AM
// Design Name: 
// Module Name: Checker_tb
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


module MatrixChecker_tb;
    
    parameter Stop_Counter_Value = 20'd20000;
    
    reg clk;
    reg reset;
    
    reg  output_r_TVALID_0;
    reg output_r_TLAST_0;
    reg [31:0] output_r_TDATA_0;
    
    wire output_r_TREADY_0;
    wire [3:0] Error_Counter;
    reg [9:0] Q_counter = 10'd0;
    
    MatrixChecker #(.Stop_Counter_Value(Stop_Counter_Value)) uut (
    .clk(clk), 
    .reset(reset), 
    .output_r_TVALID_0(output_r_TVALID_0), 
    .output_r_TLAST_0(output_r_TLAST_0),
    .output_r_TDATA_0(output_r_TDATA_0), 
    .output_r_TREADY_0(output_r_TREADY_0), 
    .Error_Counter(Error_Counter)
    );
    
    initial begin
        clk = 0;
        reset = 1;
    
        output_r_TVALID_0 = 0;
        output_r_TLAST_0 = 0;
        output_r_TDATA_0 = 32'd12;
        Q_counter = 10'd0;
        
        #250 reset = 0;
         
    end
    
    initial forever #2.5 clk = ~clk;
    
    
    always @ (posedge output_r_TREADY_0) begin
        #97.5 output_r_TVALID_0 = 1;
    end 
    
      
   always @ (posedge clk) begin
        if (output_r_TVALID_0 == 1'b1 && Q_counter < 32'd216) begin
            Q_counter <= Q_counter + 1'b1;
        end else begin
            output_r_TVALID_0 = 1'b0;
        end
    end
   

endmodule
