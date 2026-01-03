`timescale 1ns/1ns
`include "async_tff_upcounter.v"

module async_tff_upcounter_tb;

    reg clk;
    reg reset;
    output q1, q2, q3;

    integer i;

    async_tff_upcounter uut (
        .clk(clk),
        .reset(reset),
        .q1(q1),
        .q2(q2),
        .q3(q3)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("async_tff_upcounter_tb.vcd");
        $dumpvars(0, async_tff_upcounter_tb);

        $display("Time | q1 | q2 | q3");
        $display("--------------------------");

        reset <= 1; $display("  %0t  | %b  | %b  | %b", $time, q1, q2, q3); #10
        reset <= 0; $display(" %0t  | %b  | %b  | %b", $time, q1, q2, q3); #10
        
        for (i = 0; i < 8; i = i+1) begin
            $display(" %0t  | %b  | %b  | %b", $time, q1, q2, q3);
            #10;
        end

        $finish;
    end

endmodule