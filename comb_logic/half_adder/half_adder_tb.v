`timescale 1ns/1ns
`include "half_adder.v"

module half_adder_tb;

    reg a;
    reg b;
    output sum;
    output carry;

    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);

        // Test case 1: 0 + 0 => sum = 0, carry = 0
        a = 0; b = 0;
        #10 $display("A=%b, B=%b, sum=%b, carry=%b", a, b, sum, carry);

        // Test case 2: 0 + 1 => sum = 1, carry = 0
        a = 0; b = 1;
        #10 $display("A=%b, B=%b, sum=%b, carry=%b", a, b, sum, carry);

        // Test case 3: 1 + 0 => sum = 1, carry = 0
        a = 1; b = 0;
        #10 $display("A=%b, B=%b, sum=%b, carry=%b", a, b, sum, carry);

        // Test case 4: 1 + 1 => sum = 0, carry = 1
        a = 1; b = 1;
        #10 $display("A=%b, B=%b, sum=%b, carry=%b", a, b, sum, carry);

        $finish;
    end

endmodule