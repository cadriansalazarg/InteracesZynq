`timescale 1ns / 1ps

module SimpleGenerator #(parameter Stop_Counter_Value = 20'd20000)
(clk, reset, input_r_TVALID_0, input_r_TLAST_0,
    input_r_TDATA_0, input_r_TREADY_0);
    
    input reset, clk;
    output reg input_r_TLAST_0 = 0;
    output reg input_r_TVALID_0 = 0;
    input input_r_TREADY_0;
    output reg [31:0] input_r_TDATA_0 = 0;
    reg Enable_counter, Enable_counter_start;
    
    reg [7:0] Q_counter = 8'd0;
    
    reg [19:0] Q_counter_start = 20'd0;
    reg input_r_TREADY_0_reg = 1'b0;
    wire [31:0] out_mux;
    wire valid;
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
            Q_counter <= 8'd0;
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
        if (Q_counter < 8'd216)
            Enable_counter<= 1'b1;
         else
            Enable_counter <= 1'b0;   
    end    
   
   
   assign valid = ((~Enable_counter_start)& Enable_counter);  
   assign out_mux = (Q_counter == 8'd0)? 32'h01000360 : {24'd0, Q_counter};
   assign last = (Q_counter == 8'd216)? 1'b1 : 1'b0;
   
   
   always @(posedge clk) begin
        if (reset) begin  
            input_r_TDATA_0 <= 32'd0;
            input_r_TLAST_0 <= 1'b0;
            input_r_TVALID_0 <= 1'b0;
        end else begin
            input_r_TDATA_0 <= out_mux;
            input_r_TLAST_0 <= last;
            input_r_TVALID_0 <= valid;
      end  
   end

    
    
endmodule
