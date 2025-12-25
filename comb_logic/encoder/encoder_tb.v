`timescale 1ns/1ns
`include "encoder.v"

module encoder_tb;

    reg [15:0] w;
    reg en;
    output [3:0] y;

    encoder uut (
        .w(w),
        .en(en),
        .y(y)
    );

    initial begin 
        $dumpfile("encoder_tb.vcd");
        $dumpvars(0, encoder_tb);

        // Test case 1: enable off => y = 0
        en = 0; w = 16'h0F0F;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 0; w = 16'hF0F0;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        
        // Test case 2: enable on => y = 0
        en = 1; w = 16'h0;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);

        // Test case 3: enable on => y = 0,1,2,3
        en = 1; w = 16'h1;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 1; w = 16'h2;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 1; w = 16'h4;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 1; w = 16'h8;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        
        // Test case 4: enable on => y = 12,13,14,15
        en = 1; w = 16'h1000;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 1; w = 16'h2000;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 1; w = 16'h4000;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 1; w = 16'h8000;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);

        // Test case 5 (priority test): enable on => y = 15,11,7,3
        en = 1; w = 16'hFFFF;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 1; w = 16'h0FFF;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 1; w = 16'h00FF;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);
        en = 1; w = 16'h000F;
        #5 $display("en=%b, w=%h => y=%d", en, w, y);

        $finish;
    end

endmodule 