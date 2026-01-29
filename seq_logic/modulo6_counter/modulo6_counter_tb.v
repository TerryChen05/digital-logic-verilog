`timescale 1ns/1ns
`include "modulo6_counter.v"

module modulo6_counter_tb;

    reg clk;
    reg en;
    reg reset;
    output q0, q1, q2;

    integer i;

    modulo6_counter uut (
        .clk(clk),
        .en(en),
        .reset(reset),
        .q0(q0),
        .q1(q1),
        .q2(q2)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("modulo6_counter_tb.vcd");
        $dumpvars(0, modulo6_counter_tb);

        en = 1;
        $display(" En | Time | Q0 | Q1 | Q2 ");
        $display("  %b |  %-4t| %b  | %b  | %b ", en, $time, q0, q1, q2);
        reset = 1; #10 reset = 0;
        $display("  %b |  %-4t| %b  | %b  | %b ", en, $time, q0, q1, q2);

        for (i = 0; i < 8; i = i+1) begin
            if (i == 3)
                en = 0; // disable for 1 cycle
            if (i == 4)
                en = 1; 
            #10;
            $display("  %b |  %-4t| %b  | %b  | %b ", en, $time, q0, q1, q2);
        end

        $finish;
    end

endmodule