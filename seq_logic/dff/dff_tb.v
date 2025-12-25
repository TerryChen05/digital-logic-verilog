`timescale 1ns/1ns
`include "dff.v"

module dff_tb;

    reg clk;
    reg d;
    output q;
    output qn;

    dff uut (
        .clk(clk),
        .d(d),
        .q(q),
        .qn(qn)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle every 5ns , Rising edge
    end

    initial begin
        $dumpfile("dff_tb.vcd");
        $dumpvars(0, dff_tb);

        // Test case 1 
        d <= 0; #15
        $display("Time=%0t | d=%b | q=%b", $time, d, q);

        // Test case 2
        d <= 1; #10
        $display("Time=%0t | d=%b | q=%b", $time, d, q);

        // Test case 3
        d <= 0; #10
        $display("Time=%0t | d=%b | q=%b", $time, d, q);

        // Test case 4
        d <= 1; #10
        $display("Time=%0t | d=%b | q=%b", $time, d, q);

        // Test case 5
        d <= 0; #10
        $display("Time=%0t | d=%b | q=%b", $time, d, q);

        $finish;
    end

endmodule