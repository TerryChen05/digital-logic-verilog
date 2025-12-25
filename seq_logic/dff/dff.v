module dff (
    input clk,
    input d,
    output reg q,
    output reg qn
);

    always @(posedge clk) begin
        q <= d;
        qn <= ~d;
    end

endmodule