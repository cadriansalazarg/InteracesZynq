`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// 
// Description: This module implements a one-bit full adder with inputs outputs registered
// 
// 
//////////////////////////////////////////////////////////////////////////////////


module top_Design(input CLK, input RST, input A, input B, input Cin, output S, output Cout);
    
    wire output_FFA, output_FFB, output_FFCin, Carry_out, Sum;
    
    FlipFlopD FF_A(
    .CLK(CLK),
    .RST(RST),
    .D(A),
    .Q(output_FFA)
    );
    
    FlipFlopD FF_B(
    .CLK(CLK),
    .RST(RST),
    .D(B),
    .Q(output_FFB)
    );
    
    FlipFlopD FF_C(
    .CLK(CLK),
    .RST(RST),
    .D(Cin),
    .Q(output_FFCin)
    );
    
    assign Sum = output_FFCin ^ output_FFA ^ output_FFB;
    assign Carry_out = (output_FFA & output_FFB) | (output_FFB & output_FFCin) | ( output_FFA & output_FFCin);
    
    FlipFlopD FF_S(
    .CLK(CLK),
    .RST(RST),
    .D(Sum),
    .Q(S)
    );
    
    FlipFlopD FF_Cout(
    .CLK(CLK),
    .RST(RST),
    .D(Carry_out),
    .Q(Cout)
    );
    
endmodule


module FlipFlopD(input CLK, input RST, input D, output reg Q);
    always @(posedge CLK)
      if (RST) begin
         Q <= 1'b0;
      end else begin
         Q <= D;
      end
endmodule



