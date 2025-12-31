`timescale 1ns/1ns
`include "half_adder.v"

module half_adder_tb;

    reg a;
    reg b;
    output sum;
    output carry;

    integer i;

    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);

        $display(" a | b | sum | cout ");

        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i[1:0];
            #10;
            $display(" %b | %b | %2b  | %2b", a, b, sum, carry);
        end

        // Test case 1: 0 + 0 => sum = 0, carry = 0
        // Test case 2: 0 + 1 => sum = 1, carry = 0
        // Test case 3: 1 + 0 => sum = 1, carry = 0
        // Test case 4: 1 + 1 => sum = 0, carry = 1

        $finish;
    end

endmodule