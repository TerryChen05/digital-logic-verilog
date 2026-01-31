module counter_8bit (
    input clk,
    input en,
    input reset, // low active reset
    output reg [7:0] q // little endian
);
    /*
    always @(posedge clk) begin
        if (reset == 1'b0) begin
            q <= 8'b0;
        end
        else if (en == 1'b1) begin
            q <= q + 1'b1;
        end
    end
    */

    always @(posedge clk) begin
        if (reset == 1'b0) begin
            q <= 8'b0;
        end
        else if (en == 1'b1) begin
            q[0] <= ~q[0];
            q[1] <= q[1] ^ q[0]; 
            q[2] <= q[2] ^ (&(q[1:0]));
            q[3] <= q[3] ^ (&(q[2:0]));
            q[4] <= q[4] ^ (&(q[3:0]));
            q[5] <= q[5] ^ (&(q[4:0]));
            q[6] <= q[6] ^ (&(q[5:0]));
            q[7] <= q[7] ^ (&(q[6:0]));
        end
        else begin
            q <= q;
        end
    end

endmodule