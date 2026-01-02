module async_tff_upcounter ( // 3-bit asynchronous T flip-flop upcounter
    input clk,
    input reset,
    output reg q1, q2, q3
);

    reg qn1, qn2, qn3;

    // TFF1
    always @(posedge clk) begin
        if (reset == 1'b1) begin
            q1 <= 0;
            qn1 <= 1;
        end
        else begin
            q1 <= ~q1;
            qn1 <= ~qn1;
        end
    end
    // TFF2
    always @(posedge qn1) begin
        if (reset == 1'b1) begin
            q2 <= 0;
            qn2 <= 1;
        end
        else begin
            q2 <= ~q2;
            qn2 <= ~qn2;
        end
    end
    // TFF3
    always @(posedge qn2) begin
        if (reset == 1'b1) begin
            q3 <= 0;
            qn3 <= 1;
        end
        else begin
            q3 <= ~q3;
            qn3 <= ~qn3;
        end
    end

endmodule

