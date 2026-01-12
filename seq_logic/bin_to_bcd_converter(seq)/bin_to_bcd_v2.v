module bin_to_bcd_v2 (
    input clk,
    input start,
    input  [7:0] bin, // 255 max
    output reg [11:0] bcd   // 3 bcd digits
);

    reg [7:0] bin_reg; 
    reg [11:0] bcd_next; 
    integer count;

    always @(posedge clk) begin
        if (start) begin
            bcd <= 0;
            count <= 0;
            bin_reg <= bin;
        end
        else if (count != 8) begin
            bcd_next = bcd;

            if (bcd_next[3:0]  > 4) bcd_next[3:0]  = bcd_next[3:0]  +3;
            if (bcd_next[7:4]  > 4) bcd_next[7:4]  = bcd_next[7:4]  +3;
            if (bcd_next[11:8] > 4) bcd_next[11:8] = bcd_next[11:8] +3;

            bcd <= {bcd_next[10:0], bin_reg[7]};
            bin_reg <= {bin_reg[6:0], 1'b0};
            count <= count + 1;
        end
    end

endmodule