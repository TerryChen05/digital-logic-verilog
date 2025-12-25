module encoder ( // 16-to-4 encoder
    input [15:0] w,
    input en,
    output reg [3:0] y
);

    integer i;
    always @(*) begin
        if (en == 1'b1) begin
            y = 4'd0;
            for (i = 0; i < 16; i = i + 1) begin // loop from w[0] to w[15] => y = (MSB that == 1)
                if (w[i] == 1'b1) begin
                    y = i[3:0];
                end
            end
        end
        else
            y = 4'd0;
    end

    /* Priority encoder using case statement
    always @(*) begin
        if (en == 1'b0)
            y = 4'd0;
        else begin
            casex (in)
                16'b1xxx_xxxx_xxxx_xxxx : y = 4'd15;
                16'b01xx_xxxx_xxxx_xxxx : y = 4'd14;
                16'b001x_xxxx_xxxx_xxxx : y = 4'd13;
                16'b0001_xxxx_xxxx_xxxx : y = 4'd12;
                16'b0000_1xxx_xxxx_xxxx : y = 4'd11;
                16'b0000_01xx_xxxx_xxxx : y = 4'd10;
                16'b0000_001x_xxxx_xxxx : y = 4'd9;
                16'b0000_0001_xxxx_xxxx : y = 4'd8;
                16'b0000_0000_1xxx_xxxx : y = 4'd7;
                16'b0000_0000_01xx_xxxx : y = 4'd6;
                16'b0000_0000_001x_xxxx : y = 4'd5;
                16'b0000_0000_0001_xxxx : y = 4'd4;
                16'b0000_0000_0000_1xxx : y = 4'd3;
                16'b0000_0000_0000_01xx : y = 4'd2;
                16'b0000_0000_0000_001x : y = 4'd1;
                16'b0000_0000_0000_0001 : y = 4'd0;
                default : y = 4'd0;
            endcase
        end
    end
    */

endmodule