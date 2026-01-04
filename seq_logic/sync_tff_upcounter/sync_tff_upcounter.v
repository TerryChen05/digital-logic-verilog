module sync_tff_upcounter ( // 4-bit synchronous T flip-flop upcounter with enable
    input clk,
    input reset,
    input en,
    output reg q1, q2, q3, q4
);

    always @(posedge clk) begin
        if (reset == 1'b1) begin
            q1 <= 0;
            q2 <= 0;
            q3 <= 0;
            q4 <= 0;
        end
        else if (en == 1'b1) begin
            q1 <= ~q1;
            q2 <= q2 ^ q1;
            q3 <= q3 ^ (q1 & q2);
            q4 <= q4 ^ (q1 & q2 & q3);
        end
        else begin // for clarity
            q1 <= q1;
            q2 <= q2;
            q3 <= q3;
            q4 <= q4;
        end
    end

endmodule