`timescale 1ns/1ns
`include "comparator.v"

module comparator_tb;

    reg [2:0] a, b;
    output equal, gt, lt;

    integer i, j;

    comparator uut (
        .a(a),
        .b(b),
        .equal(equal),
        .gt(gt),
        .lt(lt)
    );

    initial begin
        $dumpfile("comparator_tb.vcd");
        $dumpvars(0, comparator_tb);

        $display(" a | b | Eq Gt Lt");

        for (i = 0; i <= 7; i = i+1) begin
            for (j = 0; j <= 7; j = j+1) begin
               a = i; b = j; #5;
               $display(" %h | %h | %b  %b  %b", a, b, equal, gt, lt);
            end
        end

        $finish;
    end

endmodule