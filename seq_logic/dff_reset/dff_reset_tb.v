`timescale 1ns/1ns
`include "dff_reset.v"

module dff_reset_tb;

    reg clk;
    reg reset;
    reg [7:0] d;
    output [7:0] q;
    output [7:0] qn;

    dff_reset uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .qn(qn)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle every 5ns , Rising edge
    end

    initial begin
        $dumpfile("dff_reset_tb.vcd");
        $dumpvars(0, dff_reset_tb);

        // initial signals
        clk = 0;
        reset = 1; 
        d = 8'b00000000;

        #10 reset <= 1; d <= 8'b10101010; // reset = 1, d = 10101010
        #5 $display("reset=%b, d=%b => q=%b", reset, d, q);

        #5 d <= 8'b11110000; // reset = 1, d = 11110000
        #5 $display("reset=%b, d=%b => q=%b", reset, d, q);

        #5 reset <= 0; // reset = 0, d = 11110000
        #5 $display("reset=%b, d=%b => q=%b", reset, d, q);

        #5 reset <= 0; d <= 8'b00001111; // reset = 0, d = 00001111
        #5 $display("reset=%b, d=%b => q=%b", reset, d, q);
        #5 $display("reset=%b, d=%b => q=%b", reset, d, q); 

        $finish;
    end

endmodule