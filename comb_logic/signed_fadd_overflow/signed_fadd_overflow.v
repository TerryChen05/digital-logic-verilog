module signed_fadd_overflow (
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout,
    output overflow
); 

    wire [8:0] sum_extend;   
    assign sum_extend = a + b + cin; // verilog addition automatically produces the carry-out bit
    
    // assign {cout, sum} = a + b + cin; // alternative method

    assign sum = sum_extend[7:0];
    assign cout = sum_extend[8];
    assign overflow = (a[7] & b[7] & ~sum[7]) | (~a[7] & ~b[7] & sum[7]);
    // 1 & 1 & 0 = overflow, 0 & 0 & 1 = overflow (wrap around via 2's comp)

endmodule