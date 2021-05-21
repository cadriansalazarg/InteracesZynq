`timescale 1ns / 1ps


module SimpleChecker #(parameter Stop_Counter_Value = 20'd20000)
(clk, reset, output_r_TVALID_0, output_r_TLAST_0,
    output_r_TDATA_0, output_r_TREADY_0, Error_Counter);

    input clk, reset;
    
    input output_r_TVALID_0, output_r_TLAST_0;
    input [31:0] output_r_TDATA_0;
    
    output reg output_r_TREADY_0 = 0;
    output reg [3:0] Error_Counter = 4'd0;
    
    reg Enable_counter_start;
    reg [19:0] Q_counter_start = 20'd0;
    
    reg output_r_TVALID_0_reg = 1'b0;
    reg output_r_TLAST_0_reg = 1'b0; 
    reg output_r_TVALID_0_reg1 = 1'b0;
    reg [31:0] output_r_TDATA_0_reg = 32'd0;
    
    reg [7:0] Q_counter = 8'd1;
    reg comparison; 
    
    wire enable;
    
    always @(posedge clk) begin
        if (reset) begin
            output_r_TVALID_0_reg <= 1'b0;
            output_r_TLAST_0_reg <= 1'b0;
            output_r_TDATA_0_reg <= 32'd0;
            output_r_TVALID_0_reg1 <= 1'b0;
        end else begin
            output_r_TVALID_0_reg <= output_r_TVALID_0;
            output_r_TLAST_0_reg <= output_r_TLAST_0;
            output_r_TDATA_0_reg <= output_r_TDATA_0;
            output_r_TVALID_0_reg1 <= output_r_TVALID_0_reg;
        end
    end
    
    
    always @(posedge clk) begin
        if (reset)
            Q_counter_start <= 0;
        else if (Enable_counter_start)
            Q_counter_start <= Q_counter_start + 1'b1;
    end
    
    always @(posedge clk) begin
        if (Q_counter_start < Stop_Counter_Value) begin
            Enable_counter_start<= 1'b1;
            output_r_TREADY_0 <= 1'b0;
         end else begin
            Enable_counter_start <= 1'b0;  
            output_r_TREADY_0 <= 1'b1; 
         end
    end 
    
    always @(posedge clk) begin
        if (reset) begin
            Q_counter <= 8'd1;
        end else if (output_r_TVALID_0_reg) begin
            Q_counter <=  Q_counter + 1; 
        end
    end
    
   
   
     
    
    always @(posedge clk) begin
        if (Q_counter[7:0] == output_r_TDATA_0_reg[7:0])
            comparison <= 1'b0;
        else
            comparison <= 1'b1;
    end
    
    assign enable = output_r_TVALID_0_reg1 & comparison;
            
    always @(posedge clk) begin
        if (reset) begin
            Error_Counter <= 4'd0;
        end else if (enable) begin
            Error_Counter <= Error_Counter + 1;
        end
    end
    
    
        
    
    
    
endmodule
