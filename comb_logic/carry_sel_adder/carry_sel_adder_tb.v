`timescale 1ns/1ns
`include "carry_sel_adder.v"

module carry_sel_adder_tb;

    reg [15:0] a;
    reg [15:0] b;
    output [15:0] sum;
    output cout;

    carry_sel_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("carry_sel_adder_tb.vcd");
        $dumpvars(0, carry_sel_adder_tb);

        // Test case 1: zero addition => sum = 0
        a = 16'b0; b = 16'b0; 
        #10 $display("a=%h, b=%h => sum=%h, cout=%b", a, b, sum, cout);

        // Test case 2: lower bits addition => sum = 00FC
        a = 16'hF2; b = 16'h0A; 
        #10 $display("a=%h, b=%h => sum=%h, cout=%b", a, b, sum, cout);

        // Test case 3: upper bits addition (cout lower = 0) => sum = FC02
        a = 16'hF201; b = 16'h0A01; 
        #10 $display("a=%h, b=%h => sum=%h, cout=%b", a, b, sum, cout);
        // Test case 4: upper bits addition (cout lower = 1) => sum = 4700
        a = 16'h12FF; b = 16'h3401; 
        #10 $display("a=%h, b=%h => sum=%h, cout=%b", a, b, sum, cout);

        // Test case 5: cout test => sum = 0,FFFE, cout = 1,1
        a = 16'hFFFF; b = 16'h1; 
        #10 $display("a=%h, b=%h => sum=%h, cout=%b", a, b, sum, cout);
        a = 16'hFFFF; b = 16'hFFFF; 
        #10 $display("a=%h, b=%h => sum=%h, cout=%b", a, b, sum, cout);
        

        $finish;
    end

endmodule