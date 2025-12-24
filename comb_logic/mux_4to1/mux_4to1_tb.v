`timescale 1ns/1ns
`include "mux_4to1.v"

module mux_4to1_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    reg [15:0] e;
    reg [1:0] sel;
    output [3:0] out1;
    output [3:0] out2;
    output [3:0] out3;
    output [3:0] out4;

    mux_4to1 uut (
        .a(a), .b(b), .c(c), .d(d),
        .e(e),
        .sel(sel),
        .out1(out1), .out2(out2), .out3(out3), .out4(out4)
    );

    initial  begin
        $dumpfile("mux_4to1_tb.vcd");
        $dumpvars(0, mux_4to1_tb);

        // Test case 1: out = a, out4 = e[3:0] 
        a = 4'b0001; b = 4'b0010; c = 4'b0100; d = 4'b1000; e = 16'hA;
        sel = 2'b00;
        #10 $display("sel=%b => out1=%b, out2=%b, out3=%b, out4=%h", sel, out1, out2, out3, out4);

        // Test case 2: out = b, out4 = e[7:4] 
        a = 4'b0001; b = 4'b0010; c = 4'b0100; d = 4'b1000; e = 16'hB0;
        sel = 2'b01;
        #10 $display("sel=%b => out1=%b, out2=%b, out3=%b, out4=%h", sel, out1, out2, out3, out4);

        // Test case 3: out = c, out4 = e[11:8] 
        a = 4'b0001; b = 4'b0010; c = 4'b0100; d = 4'b1000; e = 16'hC00;
        sel = 2'b10;
        #10 $display("sel=%b => out1=%b, out2=%b, out3=%b, out4=%h", sel, out1, out2, out3, out4);

        // Test case 4: out = d, out4 = e[15:12] 
        a = 4'b0001; b = 4'b0010; c = 4'b0100; d = 4'b1000; e = 16'hD000;
        sel = 2'b11;
        #10 $display("sel=%b => out1=%b, out2=%b, out3=%b, out4=%h", sel, out1, out2, out3, out4);

        $finish;
    end 

endmodule