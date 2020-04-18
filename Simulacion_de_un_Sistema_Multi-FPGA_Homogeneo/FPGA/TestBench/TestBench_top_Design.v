`timescale 1ns / 1ps


module TestBench_top_Design;
    
    // inputs
    reg A, B, Cin, CLK, RST;
    
    // outputs 
    wire Cout, S;
    
    top_Design uut (
    .CLK(CLK),
    .RST(RST),
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .S(S)
    );
    
    initial begin
		$dumpfile("vcd_file.vcd"); // Para mostrarlo se usa el comando gtkwave vcd_file.vcd
        $dumpvars(0,TestBench_top_Design);
        
        A = 0;
        B = 0;
        Cin = 0;
        CLK = 0;
        RST = 0;
        
        #10 RST = 1;
        #100 RST = 0;
        
        #1000 $finish;
    end
    
    
    always #3 CLK = ~CLK;
    always #7 A = ~A;
    always #11 B = ~B;
    always #23 Cin = ~Cin;
    
    
endmodule
