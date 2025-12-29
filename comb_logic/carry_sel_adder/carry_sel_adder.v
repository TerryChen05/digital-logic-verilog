module carry_sel_adder (
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] sum,
    output reg cout
);

    wire cout_sel;
    wire [7:0] sum0, sum1, sum_sel;
    wire cout0, cout1;

    // lower 8 bits
    assign {cout_sel, sum_sel} = a[7:0] + b[7:0] + 1'b0; // cin = 0

    // upper 8 bits
    assign {cout0, sum0} = a[15:8] + b[15:8] + 1'b0; // cin = 0
    assign {cout1, sum1} = a[15:8] + b[15:8] + 1'b1; // cin = 1

    // mux: select correct adder based on lower bits output
    always @(*) begin
      sum[7:0]= sum_sel;
      case(cout_sel)
            1'b0 : begin cout = cout0; sum[15:8]= sum0; end
            1'b1 : begin cout = cout1; sum[15:8]= sum1; end
            default : begin cout = 1'b0; sum[15:8] = 8'b0; end
      endcase
    end

endmodule