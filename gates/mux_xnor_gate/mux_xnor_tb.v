`timescale 1ns/1ns
`include "mux_xnor.v"

module mux_xnor_tb;

    reg a, b;
    wire out;

    integer i;

    xnor_gate uut (.a(a), .b(b), .out(out));

    initial begin
        $dumpfile("mux_xnor_tb.vcd");
        $dumpvars(0, mux_xnor_tb);

        for (i = 0; i < 4; i = i+1) begin
            {a, b} = i;
            #5; 
            $display("%b %b | %b", a, b, out);
        end

        $finish;
    end

endmodule