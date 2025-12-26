`timescale 1ns/1ns
`include "tff.v"

module tff_tb;

    reg clk;
    reg reset;
    reg t;
    output q;
    output qn;

    tff uut (
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q),
        .qn(qn)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("tff_tb.vcd");
        $dumpvars(0, tff_tb);

        // Test case 1: reset enable => q = 0
        t <= 0; reset <= 1; 
        #15 $display("Time=%0t | reset=%b | t=%b | q=%b", $time, reset, t, q);
        t <= 1; reset <= 1; // note: non-blocking t, blocking reset
        #10 $display("Time=%0t | reset=%b | t=%b | q=%b", $time, reset, t, q);

        // Test case 2: t = 0 => q = q = 0
        t <= 0; reset <= 0;
        #10 $display("Time=%0t | reset=%b | t=%b | q=%b", $time, reset, t, q);   
        // Test case 3: t = 1 => q = ~q (0 to 1)
        t <= 1; reset <= 0;
        #10 $display("Time=%0t | reset=%b | t=%b | q=%b", $time, reset, t, q);

        // Test case 4: t = 0 => q = q = 1
        t <= 0; reset <= 0;
        #10 $display("Time=%0t | reset=%b | t=%b | q=%b", $time, reset, t, q);
        // Test case 5: t = 1 => q = ~q (1 to 0)
        t <= 1; reset <= 0;
        #10 $display("Time=%0t | reset=%b | t=%b | q=%b", $time, reset, t, q);
        #10 $display("Time=%0t | reset=%b | t=%b | q=%b", $time, reset, t, q);


        $finish;
    end

endmodule