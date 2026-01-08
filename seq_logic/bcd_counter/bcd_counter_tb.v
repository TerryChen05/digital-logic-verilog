`timescale 1ns/1ns
`include "bcd_counter.v"

module bcd_counter_tb;

    reg clk;
    reg reset;
    reg en;
    output [3:0] count;

    integer i;

    bcd_counter uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .q(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("bcd_counter_tb.vcd");
        $dumpvars(0, bcd_counter_tb); 

        $display("Time | En | Q ", $time, en, count);
        $display(" %3t |  %b | %h ", $time, en, count);
        reset = 1; #10 reset = 0;
        $display(" %3t |  %b | %h ", $time, en, count);

        en = 1;
        for (i = 0; i < 11; i = i+1) begin
            #10;
            if (i == 9) // test enable (disable)
                en = 0;
            $display(" %3t |  %b | %h ", $time, en, count);
        end

        $finish;
    end

endmodule