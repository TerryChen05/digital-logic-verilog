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

        a = 0; b = 0;
        #10
        $display("A=%b, B=%b, sum=%b, carry=%b", a, b, sum, carry);

        a = 0; b = 1;
        #10
        $display("A=%b, B=%b, sum=%b, carry=%b", a, b, sum, carry);

        a = 1; b = 0;
        #10
        $display("A=%b, B=%b, sum=%b, carry=%b", a, b, sum, carry);

        a = 1; b = 1;
        #10
        $display("A=%b, B=%b, sum=%b, carry=%b", a, b, sum, carry);

        $finish;
    end

endmodule