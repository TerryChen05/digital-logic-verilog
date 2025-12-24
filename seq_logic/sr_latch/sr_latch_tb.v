`timescale 1ns/1ns
`include "sr_latch.v"

module sr_latch_tb;

    reg s;
    reg r;
    output q;
    output qn;

    sr_latch uut (
        .s(s),
        .r(r),
        .q(q),
        .qn(qn)
    );

    initial begin
        $dumpfile("sr_latch_tb.vcd");
        $dumpvars(0, sr_latch_tb);

        // T=0: Reset
        s = 0; r = 1; #10;
        $display("Time=%0t | S=%b | R=%b | Q=%b | Qn=%b", $time, s, r, q, qn);

        // T=10: NC after Reset
        s = 0; r = 0; #10;
        $display("Time=%0t | S=%b | R=%b | Q=%b | Qn=%b", $time, s, r, q, qn);

        // T=20: Set
        s = 1; r = 0; #10;
        $display("Time=%0t | S=%b | R=%b | Q=%b | Qn=%b", $time, s, r, q, qn);

        // T=30: NC after Set
        s = 0; r = 0; #10;
        $display("Time=%0t | S=%b | R=%b | Q=%b | Qn=%b", $time, s, r, q, qn);

        // T=40: Reset
        s = 0; r = 1; #10;
        $display("Time=%0t | S=%b | R=%b | Q=%b | Qn=%b", $time, s, r, q, qn);

        // T=50: Invalid State
        s = 1; r = 1; #10;
        $display("Time=%0t | S=%b | R=%b | Q=%b | Qn=%b", $time, s, r, q, qn);

        // T=60: Reset after Invalid State
        s = 0; r = 1; #10;
        $display("Time=%0t | S=%b | R=%b | Q=%b | Qn=%b", $time, s, r, q, qn);

        // T=70: Invalid State
        s = 1; r = 1; #10;
        $display("Time=%0t | S=%b | R=%b | Q=%b | Qn=%b", $time, s, r, q, qn);

        // T=80: NC after Invalid State
        s = 0; r = 0; #10;
        $display("Time=%0t | S=%b | R=%b | Q=%b | Qn=%b", $time, s, r, q, qn);

        $finish;
    end

endmodule