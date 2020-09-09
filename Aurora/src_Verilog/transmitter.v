`timescale 1ns / 1ps


// ******************************************** Parameters description *************************************************

// PACKET_SIZE = Number of bits of the packet minus number of bits of Bus ID identifier (commonly BUS ID has 8 bits)
// TX_TDATA_SIZE specifies the number of bits of the s_axi_tx_tdata Aurora port (Commonly set to 32).
// COUNTER_BITS is defined by rounded up (y),        where y is equal to log2 (PACKET_SIZE/TX_TDATA_SIZE)


module transmitter #(parameter PACKET_SIZE = 128, TX_TDATA_SIZE = 32,  COUNTER_BITS = 2) 
(user_clk, RST, start, s_axi_tx_tlast, s_axi_tx_tready, s_axi_tx_tdata, s_axi_tx_tvalid, d_out, rd_en, empty);

	
	localparam NUMBER_OF_DATA = ((PACKET_SIZE/TX_TDATA_SIZE)-2);
	localparam INPUT_SIZE = PACKET_SIZE - 8; // Size of PACKET_SIZE plus 8 bits of sequency counter
	
	
	localparam S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4, S5 = 3'd5, S6 = 3'd6, S7 = 3'd7;
	reg [2:0] State, NextState;
	
	input user_clk, RST, start;
	
	input [INPUT_SIZE-1: 0] d_out;
	input empty;
	output reg rd_en;
	
	input s_axi_tx_tready;
	output reg  s_axi_tx_tlast, s_axi_tx_tvalid;	
	output reg [0:TX_TDATA_SIZE-1] s_axi_tx_tdata;
	wire [0:TX_TDATA_SIZE-1] Data_Output;
	
	reg empty_reg, s_axi_tx_tready_reg;
	
	reg [INPUT_SIZE-1: 0] d_out_reg;
	
	reg [PACKET_SIZE-1: 0] shift_reg; 
	
	reg Enable_Load, Enable_Shift;
	reg s_axi_tx_tvalid_reg, s_axi_tx_tlast_reg;
	
	reg [COUNTER_BITS-1:0] Q_count;
	reg Enable_counter;
	
	reg [7:0] Q_seq_counter;
	reg start_reg;
	
	
	
	// **************** Parallel Register ********************************************************************
	
	always @(posedge user_clk)
		if (RST) begin 
			empty_reg <= 1'b0;
			s_axi_tx_tready_reg <= 1'b0;
			d_out_reg <= 1'b0;
			rd_en <= 1'b0;
			s_axi_tx_tvalid <= 1'b0; 
			s_axi_tx_tlast <= 1'b0;
			s_axi_tx_tdata <= 0;
			start_reg <= 0;
		end else begin
			empty_reg <= empty;
			s_axi_tx_tready_reg <= s_axi_tx_tready;
			d_out_reg <= d_out;
			rd_en <= Enable_Load;
			s_axi_tx_tvalid <= s_axi_tx_tvalid_reg; 
			s_axi_tx_tlast <= s_axi_tx_tlast_reg;
			s_axi_tx_tdata <= Data_Output;
			start_reg <= start;
		end
		
	// **************** Shift Register ********************************************************************
	
	always @(posedge user_clk)
      if (RST)
         shift_reg <= 0;
		else if (Enable_Load)
         shift_reg <= {Q_seq_counter[7:0], d_out_reg[INPUT_SIZE-1: 0]};
		else if (Enable_Shift)
			shift_reg <= {shift_reg[(PACKET_SIZE-TX_TDATA_SIZE-1):0], 32'd0};  // 32{1'b0}

   assign Data_Output = shift_reg[(PACKET_SIZE-1):((PACKET_SIZE)-TX_TDATA_SIZE)];
	
	
	// **************** Packet Counter ******************************************************************** 
   
   always @(posedge user_clk)
      if (!Enable_counter)
         Q_count <= 0;
      else 
         Q_count <= Q_count + 1'b1;
			
	// **************** Sequency Counter ******************************************************************** 
   
   always @(posedge user_clk)
      if (RST)
         Q_seq_counter <= 0;
      else if (s_axi_tx_tlast_reg) // This counter is increase in the state 4 of FSM
         Q_seq_counter <= Q_seq_counter + 1'b1;
	
	
	// **************** FSM ********************************************************************
	
	// Registro de estado
	always @(posedge user_clk) begin
	    if(RST)
	        State<=S0;
	    else
	        State<=NextState;
	end
	
	// Lógica combinacional de estado siguiente
	always @* begin
	    case(State)
	         S0: begin  // Espera por start
                if (start_reg) NextState <= S1;
            	 else NextState <= S0;
				end
			   S1: begin  // Espera por pending
                if (empty_reg) NextState <= S1;
            	 else NextState <= S2;
				end
				S2: begin // Espera por t_ready
                if (s_axi_tx_tready_reg) NextState <= S3;
            	 else NextState <= S2;
				end
				S3: begin // Enable parrallel Load in Shift register  
                NextState <= S4;
				end
				S4: begin // Enable t_valid flag	
					 if (Q_count < NUMBER_OF_DATA) NextState <= S4;
            	 else NextState <= S5;
            end	
				S5: begin // Active tlast bit
					 NextState <= S1;
            end	
				default: begin 
					 NextState <= S0;
            end				
		endcase
	end
	
	
	// Lógica combinacional de salida ************************************
	always @* begin
	    case(State)
	         S0: begin    // Espera por start
                Enable_Load <= 1'b0;
					 Enable_Shift <= 1'b0;
					 s_axi_tx_tvalid_reg <= 1'b0;
					 Enable_counter <= 1'b0;
					 s_axi_tx_tlast_reg <= 1'b0; 
			   end
			   S1: begin    // Espera por pending
                Enable_Load <= 1'b0;
					 Enable_Shift <= 1'b0;
					 s_axi_tx_tvalid_reg <= 1'b0;
					 Enable_counter <= 1'b0;
					 s_axi_tx_tlast_reg <= 1'b0; 
				end
				S2: begin  // Espera por t_ready
                Enable_Load <= 1'b0;
					 Enable_Shift <= 1'b0; 
					 s_axi_tx_tvalid_reg <= 1'b0;
					 Enable_counter <= 1'b0;
					 s_axi_tx_tlast_reg <= 1'b0;
				end
				S3: begin   // Enable parrallel Load in Shift register
                Enable_Load <= 1'b1;
					 Enable_Shift <= 1'b0; 
					 s_axi_tx_tvalid_reg <= 1'b0;
					 Enable_counter <= 1'b0;
					 s_axi_tx_tlast_reg <= 1'b0;
				end
				S4: begin  // Enable t_valid flag	
					 Enable_Load <= 1'b0;
					 Enable_Shift <= 1'b1;
					 s_axi_tx_tvalid_reg <= 1'b1;
					 Enable_counter <= 1'b1;
					 s_axi_tx_tlast_reg <= 1'b0;
            end	
				S5: begin  // Active tlast bit
					 Enable_Load <= 1'b0;
					 Enable_Shift <= 1'b1;
					 s_axi_tx_tvalid_reg <= 1'b1;
					 Enable_counter <= 1'b0;
					 s_axi_tx_tlast_reg <= 1'b1;
            end
				default: begin 
					 Enable_Load <= 1'b0;
					 Enable_Shift <= 1'b0;
					 s_axi_tx_tvalid_reg <= 1'b0;
					 Enable_counter <= 1'b0;
					 s_axi_tx_tlast_reg <= 1'b0; 
            end
		endcase
	end

		
	
		

endmodule
