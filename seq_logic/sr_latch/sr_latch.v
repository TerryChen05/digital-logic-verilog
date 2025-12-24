module sr_latch ( // NOR gate implementation
    input s,
    input r,
    output reg q,
    output reg qn
);

    always @(*) begin
        case ({s, r})
            2'b00: begin // no change [S=0, R=0 | Q=Q, Qn=Qn]
                q <= q;
                qn <= qn;
            end
            2'b01: begin // reset [S=0, R=1 | Q=0, Qn=1]
                q <= 0;
                qn <= 1;
            end
            2'b10: begin // set [S=1, R=0 | Q=1, Qn=0]
                q <= 1;
                qn <= 0;
            end
            2'b11: begin // invalid state [S=1, R=1 | Q=X, Qn=X]
                q <= 1'bx;
                qn <= 1'bx;
            end
        endcase
    end

endmodule