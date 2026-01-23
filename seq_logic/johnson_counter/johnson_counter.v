module johnson_counter ( // 4-bit synchronous johnson counter, w/ asynchronous reset
    input clk,
    input reset,
    output reg q0, q1, q2, q3
);

    always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
            q0 <= 0;
            q1 <= 0;
            q2 <= 0;
            q3 <= 0;
        end
        else begin
            q0 <= ~q3;
            q1 <= q0;
            q2 <= q1;
            q3 <= q2;
        end
    end

endmodule