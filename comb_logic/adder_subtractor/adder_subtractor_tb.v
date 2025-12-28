`timescale 1ns/1ns
`include "adder_subtractor.v"

module adder_subtractor_tb;

    reg [15:0] a;
    reg [15:0] b;
    reg sub;
    output [15:0] sum;
    output cout;

    adder_subtractor uut (
        .a(a),
        .b(b),
        .sub(sub),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("adder_subtractor_tb.vcd");
        $dumpvars(0, adder_subtractor_tb);

        // Test case 1: zero addition => sum = 0
        a = 0; b = 0; sub = 0;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);

        // Test case 2: addition => sum = 1, FFFF, 1000, cout = 0
        a = 1; b = 0; sub = 0;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        a = 0; b = 16'hFFFF; sub = 0;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        a = 16'h0FFF; b = 1; sub = 0;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        
        // Test case 3: addition => sum = 0, 0, FFFE, cout = 1
        a = 1; b = 16'hFFFF; sub = 0;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        a = 16'hFFFF; b = 1; sub = 0;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        a = 16'hFFFF; b = 16'hFFFF; sub = 0;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        
        $display("------------------------------------------");

        // Test case 4: zero subtraction => sum = 0, cout = 1
        a = 0; b = 0; sub = 1;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);

        // Test case 5: subtraction => sum = 1, FFFE, 6767, cout = 1
        a = 1; b = 0; sub = 1;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        a = 16'hFFFF; b = 1; sub = 1;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        a = 16'hAAAA; b = 16'h4343; sub = 1;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);

        // Test case 6: subtraction => sum = FFFF, 2, FFFF, cout = 0 (borrow)
        a = 0; b = 1; sub = 1;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        a = 1; b = 16'hFFFF; sub = 1;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);
        a = 16'hFFFE; b = 16'hFFFF; sub = 1;
        #5 $display("sub=%b, a=%h, b=%h => sum=%h, cout=%b", sub, a, b, sum, cout);

        $finish;
    end

endmodule