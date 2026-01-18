`include "../bcd_counter/bcd_counter.v"

module bcd_counter4 ( // 4 digit BCD counter w/ sync reset
    input clk,
    input reset,
    output [3:1] en,
    output [15:0] q
);

    assign en[1] = (q[3:0]==4'd9) ? 1 : 0; 	// en when dig 1 is at 9
    assign en[2] = (q[3:0]==4'd9) & (q[7:4]==4'd9); 	// en when dig 1&2 is at 9 (99)
    assign en[3] = (q[3:0]==4'd9) & (q[7:4]==4'd9) & (q[11:8]==4'd9); 	// en when dig 1&2&3 is at 9 (999)
    
    bcd_counter inst1(clk, reset, 1'b1, q[3:0]);
    bcd_counter inst2(clk, reset, en[1], q[7:4]);
    bcd_counter inst3(clk, reset, en[2], q[11:8]);
    bcd_counter inst4(clk, reset, en[3], q[15:12]);

endmodule
