module shift_reg ( // synchronous 4-bit shift reg (D flip-flop implementation)
    input d,
    input clk,
    input reset,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset == 1) begin
            q <= 4'b0;
        end
        else begin
            q[0] <= d;
            q[1] <= q[0];
            q[2] <= q[1];
            q[3] <= q[2];
        end
    end

endmodule