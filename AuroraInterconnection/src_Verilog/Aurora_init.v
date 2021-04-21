`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 02:49:55 AM
// Design Name: 
// Module Name: Aurora_init
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


module Aurora_init (init_clk, user_clk, RST, channel_up, reset_Aurora, gt_reset, reset_TX_RX_Block);

	input init_clk, RST, channel_up, user_clk;
	output reg reset_Aurora = 1'b1; //Está señal debe conectarse al puerto llamado reset del Aurora
	output reg gt_reset = 1'b1; // Está señal debe conectarse al puerto llamado gt_reset del Aurora
	output reg reset_TX_RX_Block; // Está señal deberá conectarse al puerto de reset_TX_RX_Block de los bloques Aurora_to_FIFO y FIFO_to_Aurora
	
	reg [5:0] Q = 0; // Contador encargado de llevar la sincronización de la incialización
	reg Enable = 1'b1;
	
	reg gt_reset_reg = 1'b1;
	reg reset_Aurora_reg = 1'b1;
	
	reg channel_up_reg;
	
	localparam siso_shift = 3; // tamaño del registro de desplazamiento para el manejo del channel_up

    reg [siso_shift-1:0] Q_shift = {siso_shift{1'b0}}; // Variable para el registro de desplazamiento que maneja el channel_up
	
	
	// *********************** Counter
	
	always @(posedge init_clk) begin
		if (RST)
			Q <= 6'd0;
		else if (Enable) 
			Q <= Q + 1'b1;
	end
			
	// ***********************  Comparators
	always @(*) begin
		if (Q < 6'd62) begin
			gt_reset_reg <= 1'b1;
			reset_Aurora_reg <= 1'b1;
	   end
	   else  begin
			gt_reset_reg <= 1'b0;
			reset_Aurora_reg <= 1'b0;
	   end
	end

	
	always @(posedge init_clk) begin
		if (Q < 6'd62) 
			Enable <= 1'b1;
		else
			Enable <= 1'b0;
	end
	
	// ************************  Output register
	
	always @(posedge init_clk) begin
		if (RST) begin
			reset_Aurora <= 1'b1; 
			gt_reset <= 1'b1;
		end else begin 
			reset_Aurora <= reset_Aurora_reg; 
			gt_reset <= gt_reset_reg;

		end
	end
	
	// ***************************  Registro de desplazamiento para generar el reset_TX_RX_Block del módulo de trnamisión y recepción usando el channel_up
	
	// Siguiendo la recomendación de la hoja de datos del Aurora, únicamente se podrá transmitir y recibir datos del Aurora
	// hasta que la bandera que se genera en el puerto de CORE_STATUS, llamada channel_up se coloque en alto. Tan pronto
	// como la bandera de channel_up se coloque en alto,significa que el canal ya está listo para recibir  y transmitir datos.
	
	// Por lo tanto, la hoja de datos del Aurora, recomienda mantener reiniciado el bloque de transmisión y recepción de datos
	// hasta que el channel_up se coloque en alto. En las simulaciones, algunas veces el channel_up se levanta y luego se 
	// coloca en bajo, para finalmente permanecer de manera permanente en alto, por lo tanto, para evitar este problema, 
	// se implementó un registro de desplazamiento, serie paralelo, donde la entrada se coloca al puerto de channel_up
	// de esta forma, se monitorea el bit LSB y el bit MSB, y solo cuando ambos están en alto, en ese momento, se hace una
	// NAND de estos dos bits, para así quitar el reset_TX_RX_Block de los bloques de transmisión y recepción que se comunican con el Aurora.
	// En resumen, este bloque se encarga de verificar cuando la señal de channel_up está estable en 1, para así quitar el reset_TX_RX_Block
	// de los bloques de transmisión y recepción del Aurora.
	
	always @(posedge user_clk) begin
	       	channel_up_reg <= channel_up;
			reset_TX_RX_Block <= ~(Q_shift[siso_shift-1] &  Q_shift[0]);
	end

    always @(posedge user_clk) begin
           Q_shift  <= {channel_up_reg, Q_shift[siso_shift-1:1]};   
    end
    
endmodule
