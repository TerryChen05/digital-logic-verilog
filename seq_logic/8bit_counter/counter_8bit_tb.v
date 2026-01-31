`timescale 1ns/1ns
`include "counter_8bit.v"

module counter_8bit_tb;

    reg clk;
    reg reset;
    reg en;
    wire [7:0] q;

    localparam CLK_PERIOD = 10.0;
    integer i;

    counter_8bit uut (.clk(clk), .reset(reset), .en(en), .q(q));

    initial clk = 1'b0;
    always #(CLK_PERIOD/2.0) clk = ~clk;

    initial begin
        $dumpfile("counter_8bit_tb.vcd");
        $dumpvars(0, counter_8bit_tb);

        en = 1'b1; reset = 1'b0;
        #10;
        reset = 1'b1;
        for (i = 0; i < 255; i = i + 1) begin
            #10;
            $display("%h", q);
        end
        reset = 1'b0; #10; 
        $display("%h", q);

        reset = 1'b1; #10;
        en = 1'b0; $display("%h", q); #20;
        $display("%h", q);
        
        $finish;
    end

endmodule