`timescale 1ns/1ns
`include "mux_nor.v"

module mux_nor_tb;

    reg a, b;
    wire out;

    integer i;

    nor_gate uut (.a(a), .b(b), .out(out));

    initial begin
        $dumpfile("mux_nor_tb.vcd");
        $dumpvars(0, mux_nor_tb);


        for (i = 0; i < 4; i = i+1) begin
            {a, b} = i;
            #5;
            $display("%b %b | %b", a, b, out);
        end
        
        $finish;
    end

endmodule