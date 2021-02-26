`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2021 06:27:09 PM
// Design Name: 
// Module Name: Debouncing
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


module Debouncing(
    input CLK,
    input rst_in,
    output rst_out
    );
    
    reg [3:0] shift_register;
    
    always @(posedge(CLK)) begin
        shift_register <= {shift_register[2:0], rst_in};
    end
    
    assign rst_out = &shift_register;
    
endmodule
