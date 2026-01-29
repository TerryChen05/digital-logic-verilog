module modulo6_counter ( // synchronous modulo-6 counter
    input en,
    input clk,
    input reset,
    output reg q0, q1, q2
);

    always @(posedge clk) begin
        if (en == 1'b0) begin 
            q0 <= q0;
            q1 <= q1;
            q2 <= q2;
        end
        else if ((q0 & ~q1 & q2) || (reset == 1'b1)) begin // reset on 101 (6)
            q0 <= 0;
            q1 <= 0;
            q2 <= 0;
        end
        else begin
            q0 <= ~q0;
            q1 <= q1 ^ q0;
            q2 <= q2 ^ (q1 & q0);
        end
    end

endmodule