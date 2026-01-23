`timescale 1ns/1ns
`include "johnson_counter.v"

module johnson_counter_tb;

    reg clk;
    reg reset;
    output q0, q1, q2, q3;

    integer i;

    johnson_counter uut (
        .clk(clk),
        .reset(reset),
        .q0(q0),
        .q1(q1),
        .q2(q2),
        .q3(q3)
    );

    initial begin 
       clk = 0;
       forever #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("johnson_counter_tb.vcd");
        $dumpvars(0, johnson_counter_tb);

        $display("Time | q0 | q1 | q2 | q3");
        $display(" %-3t | %2b | %2b | %2b | %2b ", $time, q0, q1, q2, q3);
        reset = 1; #10 reset = 0;
        $display(" %-3t | %2b | %2b | %2b | %2b ", $time, q0, q1, q2, q3);


        for (i = 0; i < 8; i = i+1) begin
            #10;
            $display(" %-3t | %2b | %2b | %2b | %2b ", $time, q0, q1, q2, q3);
        end

        $finish;
    end

endmodule