module decoder ( // 2-to-4 decoder
    input [1:0] w, // 2-bit input (n)
    input en,
    output reg [3:0] y // 4-bit output (2^n)
);

    always @(*) begin
        if (en == 1'b0)
            y = 4'b0000;
        else begin
            case (w)
                2'b00 : y = 4'b0001;
                2'b01 : y = 4'b0010;
                2'b10 : y = 4'b0100;
                2'b11 : y = 4'b1000;
                default : y = 4'b0000;
            endcase
        end
    end

endmodule 