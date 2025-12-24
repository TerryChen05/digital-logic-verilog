`timescale 1ns/1ns
`include "xor_gate.v"

module xor_gate_tb;

    reg A;
    reg B;
    output C;

    xor_gate uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin

        $dumpfile("xor_gate_tb.vcd");
        $dumpvars(0, xor_gate_tb);

        A = 0; B = 0;
        #10
        $display("A=%b, B=%b, C=%b", A, B, C);

        A = 0; B = 1;
        #10
        $display("A=%b, B=%b, C=%b", A, B, C);
        
        A = 1; B = 0;
        #10
        $display("A=%b, B=%b, C=%b", A, B, C);
        
        A = 1; B = 1;
        #10
        $display("A=%b, B=%b, C=%b", A, B, C);
        
        $finish;

    end

endmodule