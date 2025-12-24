module nor_gate (
    input A,
    input B,
    output C
);

    assign C = ~(A | B);

endmodule