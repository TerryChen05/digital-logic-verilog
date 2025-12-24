`timescale 1ns/1ns
`include "d_latch.v"

module d_latch_tb;

    reg d;
    reg clk;
    output q;
    output qn;

    d_latch uut (
        .d(d),
        .clk(clk),
        .q(q),
        .qn(qn)
    );

    initial begin
        $dumpfile("d_latch_tb.vcd");
        $dumpvars(0, d_latch_tb);

        clk = 0; d = 0;
        #10 $display("clk=%b, d=%b => q=%b", clk, d, q);

        clk = 1; d = 0;
        #10 $display("clk=%b, d=%b => q=%b", clk, d, q);

        clk = 0; d = 1;
        #10 $display("clk=%b, d=%b => q=%b", clk, d, q);

        clk = 1; d = 1;
        #10 $display("clk=%b, d=%b => q=%b", clk, d, q);

        $finish;
    end

endmodule