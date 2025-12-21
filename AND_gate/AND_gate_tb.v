`timescale 1ns/1ns
`include "AND_gate.v"

module AND_gate_tb;
    reg A;
    reg B;
    wire C;

    AND_gate uut ( // unit under test
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        $dumpfile("AND_gate_tb.vcd");
        $dumpvars(0, AND_gate_tb);

        // Test case 1: A=0, B=0 => C=0
        A = 0; B = 0;
        #10;
        $display("A=%b, B=%b => C=%b", A, B, C);

        // Test case 2: A=0, B=1 => C=0
        A = 0; B = 1;
        #10;
        $display("A=%b, B=%b => C=%b", A, B, C);

        // Test case 3: A=1, B=0 => C=0
        A = 1; B = 0;
        #10;
        $display("A=%b, B=%b => C=%b", A, B, C);

        // Test case 4: A=1, B=1 => C=1
        A = 1; B = 1;
        #10;
        $display("A=%b, B=%b => C=%b", A, B, C);

        $finish;
    end

endmodule