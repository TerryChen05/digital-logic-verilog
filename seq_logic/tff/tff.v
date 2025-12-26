module tff (
    input t,
    input clk,
    input reset,
    output reg q,
    output reg qn
);

    always @(posedge clk) begin
        if (reset == 1'b1) begin
            q <= 0;
            qn <= 1;
        end
        else if (t == 1'b1) begin
            q <= ~q;
            qn <= ~qn;
        end
        else begin
            q <= q;
            qn <= qn;
        end
    end

endmodule