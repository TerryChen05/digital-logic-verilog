`timescale 1ns/1ns
`include "decoder.v"

module decoder_tb;

    reg [1:0] w;
    reg en;
    output [3:0] y;

    decoder uut (
        .w(w),
        .en(en),
        .y(y)
    );

    initial begin
        $dumpfile("decoder_tb.vcd");
        $dumpvars(0, decoder_tb);

        // Test case 1: enable off => y[3:0] = 0
        en = 0; w = 2'b01;
        #5 $display("en=%b, w=%b => y=%b", en, w, y);
        en = 0; w = 2'b10;
        #5 $display("en=%b, w=%b => y=%b", en, w, y);

        // Test case 2: enable on, w = 00 => y[0] = 1
        en = 1; w = 2'b00;
        #5 $display("en=%b, w=%b => y=%b", en, w, y);


        // Test case 3: enable on, w = 01 => y[1] = 1
        en = 1; w = 2'b01;
        #5 $display("en=%b, w=%b => y=%b", en, w, y);

        // Test case 4: Enable on, w = 10 => y[2] = 1
        en = 1; w = 2'b10;
        #5 $display("en=%b, w=%b => y=%b", en, w, y);

        // Test case 5: enable on, w = 11 => y[3] = 1
        en = 1; w = 2'b11;
        #5 $display("en=%b, w=%b => y=%b", en, w, y);

        $finish;
    end

endmodule