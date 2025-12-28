module adder_subtractor (
    input [15:0] a,
    input [15:0] b,
    input sub,
    output [15:0] sum,
    output cout
);

    reg [15:0] bsub;

    assign {cout, sum} = a + bsub + sub;

    always @(*) begin
        case(sub)
            1'b0: bsub = b; // add
            1'b1: bsub = ~b; // sub (flip bits for 2's comp)
        endcase
    end


endmodule