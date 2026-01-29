module comparator ( // 3-bit comparator
    input [2:0] a, b,
    output equal, gt, lt // greater than, less than
);

    assign equal = (a == b) ? 1 : 0;
    assign gt = (a > b) ? 1 : 0;
    assign lt = (a < b) ? 1 : 0;

endmodule