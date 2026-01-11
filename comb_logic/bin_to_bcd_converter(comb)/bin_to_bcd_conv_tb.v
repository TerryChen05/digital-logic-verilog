`timescale 1ns/1ns
`include "bin_to_bcd_conv.v"

module bin_to_bcd_conv_tb;

    reg [7:0] bin;
    output [11:0] bcd;

    integer i;

    bin_to_bcd_conv uut (
        .bin(bin),
        .bcd(bcd)
    );

    initial begin
        $dumpfile("bin_to_bcd_conv_tb.vcd");
        $dumpvars(0, bin_to_bcd_conv_tb);

        for (i = 0; i <= 255; i = i+1) begin
            bin = i;
            #5;
            $display("t=%3t | in=%d | bcd=%h ", $time, bin, bcd);
        end
        
        $finish;
    end


endmodule