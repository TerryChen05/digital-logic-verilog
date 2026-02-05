module nor_gate (
    input a, b,
    output out
);
    //  0 0 = 1
    //  0 1 = 0
    //  1 0 = 0
    //  1 1 = 0
    // ~(a | b)

    // b = 1 -> mux b : 0
    // b = 0 -> mux b : 1
    // a = 1 -> mux a : 0
    // a = 0 -> mux a : mux b

    assign out = a ? 0 : ((b) ? 0 : 1);

endmodule