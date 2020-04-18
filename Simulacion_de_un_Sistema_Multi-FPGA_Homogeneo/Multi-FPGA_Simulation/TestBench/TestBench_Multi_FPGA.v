`timescale 1ns / 1ps


module TestBench_Multi_FPGA;
    
    
    reg A_1, B_1, Cin_1, RST_1, CLK_1;
    wire Cout_1, S_1;
    
    reg A_2, B_2, RST_2, CLK_2;
    wire Cout_2, S_2;
    
    top_Design FPGA1 (
    .CLK(CLK_1),
    .RST(RST_1),
    .A(A_1),
    .B(B_1),
    .Cin(Cin_1),
    .Cout(Cout_1),
    .S(S_1)
    );
    
    top_Design FPGA2 (
    .CLK(CLK_2),
    .RST(RST_2),
    .A(A_2),
    .B(B_2),
    .Cin(Cout_1),
    .Cout(Cout_2),
    .S(S_2)
    );
    
    initial begin
		$dumpfile("vcd_file.vcd"); // Para mostrarlo se usa el comando gtkwave vcd_file.vcd
        $dumpvars(0,TestBench_Multi_FPGA);
        A_1 = 0;
        B_1 = 0;
        Cin_1 = 0;
        RST_1 = 0;
        CLK_1 = 0;
        
        A_2 = 0;
        B_2 = 0;
        RST_2 = 0;
        CLK_2 = 0;
        
        #100 RST_1 = 1;
        RST_2 = 1;
        
        #500 RST_1 = 0;
        RST_2 = 0;
        
        #2000 $finish;
    end
    
    always #3 CLK_1 = ~CLK_1;
    always #3 CLK_2 = ~CLK_2; 
    
    always #11 A_1 = ~A_1; 
    always #17 B_1 = ~B_1; 
    always #23 Cin_1 = ~Cin_1;
    
    always #47 A_2 = ~A_2; 
    always #151 B_2 = ~B_2; 
    
    
    
endmodule
