`timescale 1ns/1ns
`include "full_adder.v"

module full_adder_tb;

    reg a;
    reg b;
    reg cin;
    output sum;
    output cout;

    integer i;

    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);

        $display(" a  |  b  | cin | sum | cout ");

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];
            #10;
            $display(" %b  |  %b  | %2b  | %2b  | %2b", a, b, cin, sum, cout);
        end

        // 0 + 0 + 0 => sum = 0, cout = 0
        // 0 + 0 + 1 => sum = 1, cout = 0
        // 0 + 1 + 0 => sum = 1, cout = 0
        // 0 + 1 + 1 => sum = 0, cout = 1
        // 1 + 0 + 0 => sum = 1, cout = 0
        // 1 + 0 + 1 => sum = 0, cout = 1
        // 1 + 1 + 0 => sum = 0, cout = 1
        // 1 + 1 + 1 => sum = 1, cout = 1

        $finish;
    end

endmodule