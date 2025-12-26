module dff_reset ( // 8 bit D flip-flop
    input clk,
    input reset, // input areset, // Asynchronous reset
    input [7:0] d,
    output reg [7:0] q,
    output reg [7:0] qn
);

    always @(posedge clk) begin
        if (reset == 0) begin   // Synchronous reset
           q <= d;
           qn <= ~d;
        end
       	else begin  // reset == 1
           q <= 0; 
           qn <= 8'b11111111;
        end
    end

    /* Asynchronous reset version
    always @(posedge clk or posedge areset) begin
        if (areset == 1)
            q <= 0;
        else 
            q <= d;
    end
    */

endmodule
