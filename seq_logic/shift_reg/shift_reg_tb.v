`timescale 1ns/1ns
`include "shift_reg.v"

module shift_reg_tb;

    reg d;
    reg clk;
    reg reset;
    output [3:0] q;

    shift_reg uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 1st posedge at 5ns
    end

    initial begin
        $dumpfile("shift_reg_tb.vcd");
        $dumpvars(0, shift_reg_tb);

        $display("Time | in | q[0] | q[1] | q[2] | q[3]");
        $display("-------------------------------------");

        // Test case 1: input = 0 (for 2 clk cycles)
        d <= 0; reset <= 0;
        #5 $display("T=%0t  | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]); // 1st pre clk
        #5 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]);  // 1st post clk
        #10 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]); // 2nd clk cycle

        // Test case 2: input = 1 (for 2 clk cycles)
        d <= 1; reset <= 0;
        #5 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]);
        #5 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]);
        #10 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]);

        // Test case 3: shift 2'b10 in
        d <= 0;
        #5 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]);
        #5 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]);
        d <= 1;
        #5 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]);
        #5 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]);

        // Test case 4: unchanged input (d=1 for 3 clk cycles) => (q=4'b1111)
        #30 $display("unchanged for 3 clk cycles . . . <= 1111");
        $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]); 

        // Test case 5: reset = 1
        reset <= 1;
        #5 $display("T=%0t | %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]); // pre clk  (synch reset)
        #5 $display("T=%0t| %b  |  %b   |  %b   |  %b   |  %b", $time, d, q[0], q[1], q[2], q[3]); // post clk (synch reset)

        $finish;
    end

endmodule