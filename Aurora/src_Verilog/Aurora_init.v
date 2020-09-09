`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:16:23 08/20/2020 
// Design Name: 
// Module Name:    Aurora_init 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Aurora_init(init_clk, RST, start, tx_reset, gt_reset);

	input init_clk, RST;
	output reg tx_reset = 1'b1;
	output reg gt_reset = 1'b1;
	output reg start;
	
	reg [8:0] Q = 0;
	reg Enable = 1'b1;
	
	reg gt_reset_reg = 1'b1;
	reg tx_reset_reg = 1'b1;
	
	reg start1, start2, start3;
	wire start_reg;
	
	
	// *********************** Counter
	
	always @(posedge init_clk) begin
		if (RST)
			Q <= 9'd0;
		else if (Enable) 
			Q <= Q + 1'b1;
	end
			
	// ***********************  Comparators
	always @(posedge init_clk) begin
		if (Q < 9'd490) 
			gt_reset_reg <= 1'b1;
		else if (Q < 9'd500)
			gt_reset_reg <= 1'b0;
	   else if (Q < 9'd510) 
			gt_reset_reg <= 1'b1;
	   else 
			gt_reset_reg <= 1'b0;
	end
	
	always @(posedge init_clk) begin
		if (Q < 9'd100) 
			tx_reset_reg <= 1'b1;
		else
			tx_reset_reg <= 1'b0;
	end
	
	always @(posedge init_clk) begin
		if (Q < 9'd510) 
			Enable <= 1'b1;
		else
			Enable <= 1'b0;
	end
	
	// ************************  Output register
	
	always @(posedge init_clk) begin
		if (RST) begin
			tx_reset <= 1'b1; 
			gt_reset <= 1'b1;
			start <= 1'b0;
		end else begin 
			tx_reset <= tx_reset_reg; 
			gt_reset <= gt_reset_reg;
			start <= start_reg;
		end
	end
	
	// ***************************  Start generation
	
	
	
	always @(posedge init_clk) begin
		if (Q == 9'd510) 
			start1 <= 1'b1;
		else
			start1 <= 1'b0;
	end
	
	
	always @(posedge init_clk) begin
		if (RST) begin
			start2 <= 1'b0;
			start3 <= 1'b0;
		end else begin
			start2 <= start1;
			start3 <= start2;
		end
	end	
	
	assign start_reg = start1 | start2 | start3;
	
	

endmodule
