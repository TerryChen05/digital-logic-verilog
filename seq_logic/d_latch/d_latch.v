module d_latch (
    input d,
    input clk,
    output reg q,
    output reg qn
);

    always @(*) begin
        if (clk) begin // level sensitive
            q <= d; // non-blocking
            qn <= ~d;
        end
    end

endmodule