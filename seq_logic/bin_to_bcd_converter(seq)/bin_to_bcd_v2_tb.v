`timescale 1ns/1ns
`include "bin_to_bcd_v2.v"

module bin_to_bcd_v2_tb;

    reg clk;
    reg start;
    reg [7:0] bin;
    output [11:0] bcd;

    integer i;

    bin_to_bcd_v2 uut (
        .clk(clk),
        .start(start),
        .bin(bin),
        .bcd(bcd)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("bin_to_bcd_v2_tb.vcd");
        $dumpvars(0, bin_to_bcd_v2_tb);


        bin = 255;
        $display("times=%3t | bin=%d | bcd=%h ", $time, bin, bcd); 
        start = 1; #10 start = 0;
        $display("times=%3t | bin=%d | bcd=%h ", $time, bin, bcd); 

        for (i = 0; i < 8; i = i+1) begin
            #10;
            $display("times=%3t | bin=%d | bcd=%h ", $time, bin, bcd); 
        end
        #10

        $finish;
    end

endmodule