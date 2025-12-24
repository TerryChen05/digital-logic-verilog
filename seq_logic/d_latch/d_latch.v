module d_latch (
    input d,
    input clk,
    output reg q
);

    always @(*) begin
        if (clk) begin // level sensitive
            q <= d; // non-blocking
        end
    end

endmodule