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
            // Right shift : q <= {d, q[3:1]};
            q[0] <= q[1];
            q[1] <= q[2];
            q[2] <= q[3];
            q[3] <= d;

            /* Left shift : q <= {q[2:0], d};
            q[0] <= d;
            q[1] <= q[0];
            q[2] <= q[1];
            q[3] <= q[2];
            */

        end
    end

endmodule