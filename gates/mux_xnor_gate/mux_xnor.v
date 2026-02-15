module xnor_gate (
    input a, b,
    output out
);
    //  0 0 = 1
    //  0 1 = 0
    //  1 0 = 0
    //  1 1 = 1
    // ~(a ^ b)

    // b = 1 -> mux b1 : 1, mux b2 : 0
    // b = 0 -> mux b1 : 0, mux b2 : 1
    // a = 1 -> mux a : mux b1 : mux b2
    // a = 0 -> mux a : mux b2 : mux b1

    assign out = a ? ((b) ? 1 : 0) : ((b) ? 0 : 1);

endmodule