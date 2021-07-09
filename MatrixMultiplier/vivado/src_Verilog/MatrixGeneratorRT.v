`timescale 1ns / 1ps

module MatrixGeneratorRT #(parameter Stop_Counter_Value = 20'd20000)
(clk, reset, input_r_TVALID_0, input_r_TLAST_0,
    input_r_TDATA_0, input_r_TREADY_0);
    
    input reset, clk;
    output reg input_r_TLAST_0 = 0;
    output reg input_r_TVALID_0 = 0;
    input input_r_TREADY_0;
    output reg [31:0] input_r_TDATA_0 = 0;
    reg Enable_counter, Enable_counter_start;
    
    reg [13:0] Q_counter = 13'd0;
    
    reg [19:0] Q_counter_start = 20'd0;
    reg input_r_TREADY_0_reg = 1'b0;
    reg [31:0] out_mux;
    wire valid, valid1;
    wire last;

    
    always @(posedge clk) begin
        if (reset) begin
            input_r_TREADY_0_reg <= 1'b0;
        end else begin
            input_r_TREADY_0_reg <= input_r_TREADY_0;
        end
    end

    always @(posedge clk) begin
        if (reset)
            Q_counter <= 13'd0;
        else if (valid)
            Q_counter <= Q_counter + 1'b1;
    end
    
    always @(posedge clk) begin
        if (reset)
            Q_counter_start <= 0;
        else if (input_r_TREADY_0_reg & Enable_counter_start)
            Q_counter_start <= Q_counter_start + 1'b1;
    end
    
    
    always @(posedge clk) begin
        if (Q_counter_start < Stop_Counter_Value)
            Enable_counter_start<= 1'b1;
         else
            Enable_counter_start <= 1'b0;   
    end  
    
    
    always @(posedge clk) begin
        if (Q_counter < 13'd8126)
            Enable_counter<= 1'b1;
         else
            Enable_counter <= 1'b0;   
    end    
   
   
   assign valid = ((~Enable_counter_start) & Enable_counter & input_r_TREADY_0); 
   assign valid1 = valid & ((Q_counter <= 13'd1764) | ((Q_counter >= 13'd8000) & (Q_counter <= 13'd8126))); 
   assign last = ((Q_counter == 13'd1764) | (Q_counter == 13'd8126))? 1'b1 : 1'b0;
   
   always @* begin
        if (Q_counter == 13'd0) 
            out_mux <= 32'hFF001B90;
        else if (Q_counter == 13'd8000) 
            out_mux <= 32'hFF0001F8; 
        else     
            out_mux <= 32'h00000001;
   end
   
   always @(posedge clk) begin
        if (reset) begin  
            input_r_TDATA_0 <= 32'd0;
            input_r_TLAST_0 <= 1'b0;
            input_r_TVALID_0 <= 1'b0;
        end else begin
            input_r_TDATA_0 <= out_mux;
            input_r_TLAST_0 <= last;
            input_r_TVALID_0 <= valid1;
      end  
   end

    
    
endmodule
