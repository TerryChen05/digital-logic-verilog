`timescale 1ns/1ns
`include "bcd_counter4.v"

module bcd_counter4_tb;

    reg clk;
    reg reset;
    output [3:1] en;
    output [15:0] q;

    integer i;

    bcd_counter4 uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        $dumpfile("bcd_counter4_tb.vcd");
        $dumpvars(0, bcd_counter4_tb);


        $display("Time |  En  | BCD ");
        reset = 1; #2 reset = 0; #14

        for (i = 0; i < 3; i = i+1) begin
            #2;
            $display("%4t |  %b | %h ", $time, en, q);
        end

        #174 // next rollover
        $display("-------------------");

        for (i = 0; i < 3; i = i+1) begin
            #2;
            $display("%4t |  %b | %h ", $time, en, q);
        end

        #1794 // next rollover
        $display("-------------------");

        for (i = 0; i < 3; i = i+1) begin
            #2;
            $display("%4t |  %b | %h ", $time, en, q);
        end

        $finish;
    end

endmodule