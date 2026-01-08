module bin_to_bcd_conv ( // doubble dabble w/ only combinational logic
    input  [7:0] bin, // 255 max
    output reg [11:0] bcd   // 3 bcd digits
);

    integer i;

    always @(*) begin
        bcd = 12'd0; // clear

        for (i = 7; i >= 0; i = i - 1) begin
            // add 3 if digit > 4
            if (bcd[3:0] > 4)   
                bcd[3:0] = bcd[3:0] + 3;
            if (bcd[7:4] > 4)
                bcd[7:4] = bcd[7:4] + 3;
            if (bcd[11:8] > 4)  
                bcd[11:8] = bcd[11:8] + 3;

            // shift left
            bcd = {bcd[10:0], bin[i]};
        end
    end

endmodule