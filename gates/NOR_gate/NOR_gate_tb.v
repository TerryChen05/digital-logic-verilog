`timescale 1ns/1ns
`include "NOR_gate.v"

module NOR_gate_tb;
   
    reg A;
    reg B;
    output C;

    NOR_gate uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        $dumpfile("NOR_gate_tb.vcd");
        $dumpvars(0, NOR_gate_tb);

        A = 0; B = 0;
        #10
        $display("A=%b, B=%b => C=%b", A, B, C);

        A = 0; B = 1;
        #10
        $display("A=%b, B=%b => C=%b", A, B, C);

        A = 1; B = 0;
        #10
        $display("A=%b, B=%b => C=%b", A, B, C);

        A = 1; B = 1;
        #10
        $display("A=%b, B=%b => C=%b", A, B, C);

        $finish;

    end

endmodule