`timescale 1ns/1ns
`include "full_adder.v"

module full_adder_tb;

    reg a;
    reg b;
    reg cin;
    output sum;
    output cout;

    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);

        a = 0; b = 0; cin = 0; // Test 1: expect sum = 0, cout = 0
        #10
        $display("A=%b, B=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
        
        a = 0; b = 0; cin = 1; // Test 2: expect sum = 1, cout = 0
        #10
        $display("A=%b, B=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
        
        a = 0; b = 1; cin = 0; // Test 3: expect sum = 1, cout = 0
        #10
        $display("A=%b, B=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
        
        a = 0; b = 1; cin = 1; // Test 4: expect sum = 0, cout = 1
        #10
        $display("A=%b, B=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
        
        a = 1; b = 0; cin = 0; // Test 5: expect sum = 1, cout = 0
        #10
        $display("A=%b, B=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
        
        a = 1; b = 0; cin = 1; // Test 6: expect sum = 0, cout = 1
        #10
        $display("A=%b, B=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
        
        a = 1; b = 1; cin = 0; // Test 7: expect sum = 0, cout = 1
        #10
        $display("A=%b, B=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
        
        a = 1; b = 1; cin = 1; // Test 8: expect sum = 1, cout = 1
        #10
        $display("A=%b, B=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        $finish;
    end

endmodule