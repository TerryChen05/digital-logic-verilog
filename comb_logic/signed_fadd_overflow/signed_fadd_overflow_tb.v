`timescale 1ns/1ns
`include "signed_fadd_overflow.v"

module signed_fadd_overflow_tb;

    reg [7:0] a, b;
    reg cin;
    output [7:0] sum;
    output cout;
    output overflow;

    signed_fadd_overflow uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout),
        .overflow(overflow)
    );

    task print_result;
        input [7:0] a, b;
        input cin;
        begin
            $display("A=%b, B=%b, cin=%b, sum=%b, cout=%b, overflow=%b", a, b, cin, sum, cout, overflow);
        end
    endtask

    initial begin
        $dumpfile("signed_fadd_overflow_tb.vcd");
        $dumpvars(0, signed_fadd_overflow_tb);

        // pos + pos -> no overflow, cout = 0
        a = 8'b00001111; b = 8'b01110000; cin = 0; // Test 1: 15 + 112 = 127 (01111111)
        #10 print_result(a,b,cin);

        // pos + pos -> overflow, cout = 0
        a = 8'b01111111; b = 8'b01000000; cin = 0; // Test 2: 127 + 64 = -65 (10111111)
        #10 print_result(a,b,cin);

        // neg + neg -> no overflow, cout = 1
        a = 8'b10000001; b = 8'b11111111; cin = 0; // Test 3: -127 + -1 = -128 (10000000)
        #10 print_result(a,b,cin);
        
        // neg + neg -> overflow , cout = 1
        a = 8'b10000000; b = 8'b10000001; cin = 0; // Test 4: -128 + -127 = 1 (00000001)
        #10 print_result(a,b,cin);

        // pos + neg -> no overflow (always), cout depends
        a = 8'b01111110; b = 8'b10000001; cin = 0; // Test 5: 126 + -127 = -1 (11111111), cout = 0
        #10 print_result(a,b,cin);

        // pos + neg -> no overflow (always), cout depends
        a = 8'b01111111; b = 8'b10000001; cin = 0; // Test 6: 127 + -127 = 0 (00000000), cout = 1
        #10 print_result(a,b,cin);

        // 0 + 0 -> no overflow, cout = 0
        a = 8'b00000000; b = 8'b00000000; cin = 0; // Test 7: 0 + 0 = 0 (00000000)
        #10 print_result(a,b,cin);

        // 0 + pos -> no overflow, cout = 0
        a = 8'b00000000; b = 8'b00001111; cin = 0; // Test 8: 0 + 15 = 15 (00001111)
        #10 print_result(a,b,cin);

        // 0 + neg -> no overflow, cout = 0
        a = 8'b00000000; b = 8'b11110000; cin = 0; // Test 9: 0 + -16 = -16 (11110000)
        #10 print_result(a,b,cin);

        // cin check -> no overflow
        a = 8'b11110000; b = 8'b00001111; cin = 1; // Test 10: -16 + 15 + 1 = 0 (00000000), cout = 1
        #10 print_result(a,b,cin);

        $finish;
    end

endmodule