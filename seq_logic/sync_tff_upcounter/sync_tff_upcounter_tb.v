`timescale 1ns/1ns
`include "sync_tff_upcounter.v"

module sync_tff_upcounter_tb;

    reg clk;
    reg reset;
    reg en;
    output q1, q2, q3, q4;

    integer i;

    sync_tff_upcounter uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .q1(q1),
        .q2(q2),
        .q3(q3),
        .q4(q4)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("sync_tff_upcounter_tb.vcd");
        $dumpvars(0, sync_tff_upcounter_tb);

        $display("Time | q1 | q2 | q3 | q4");
        $display("--------------------------");

        en <= 1;
        reset <= 1; $display("  %-3t| %b  | %b  | %b  | %b", $time, q1, q2, q3, q4); #10
        reset <= 0; $display(" %-3t | %b  | %b  | %b  | %b", $time, q1, q2, q3, q4); #10
        
        for (i = 0; i < 18; i = i+1) begin
            $display(" %-3t | %b  | %b  | %b  | %b", $time, q1, q2, q3, q4);
            #10;
        end

        $finish;
    end

endmodule