`timescale 1ns/1ns
`include "bin_to_bcd.v"

module bin_to_bcd_tb;

    reg clk;
    reg en;
    reg [11:0] bin_in; // 4095 max
    output [15:0] bcd_out;
    output ready;

    bin_to_bcd uut (
        .clk(clk),
        .en(en),
        .bin_in(bin_in),
        .bcd_out(bcd_out),
        .ready(ready)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("bin_to_bcd_tb.vcd");
        $dumpvars(0, bin_to_bcd_tb);

        en = 1; bin_in = 12'd15;
        @(posedge ready);
        $display("ready=%b, bcd=%h, %0t", ready, bcd_out, $time);

        #10 $finish;
    end

endmodule