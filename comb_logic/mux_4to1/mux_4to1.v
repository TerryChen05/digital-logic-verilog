module mux_4to1 (
    input [3:0] a, b, c, d,
    input [15:0] e,
    input [1:0] sel,
    output [3:0] out1,
    output [3:0] out2,
    output reg [3:0] out3,
    output [3:0] out4
);

    // method 1
    assign out1 = ({4{sel[1] & sel[0]}} & d) | 
                  ({4{sel[1] & ~sel[0]}} & c) | 
                  ({4{~sel[1] & sel[0]}} & b) | 
                  ({4{~sel[1] & ~sel[0]}} & a);
    
    // method 2
    assign out2 = sel == 2'b00 ? a :
                  sel == 2'b01 ? b :
                  sel == 2'b10 ? c :
                  sel == 2'b11 ? d : 4'b0; 

    // method 3
    always @(*) begin
        case (sel) 
            2'b00 : out3 = a;
            2'b01 : out3 = b;
            2'b10 : out3 = c;
            2'b11 : out3 = d;
            default : out3 = 4'b0;
        endcase
    end

    // method 4 (all inputs packed into 1 vector)
    assign out4 = {e[sel*4 +3], e[sel*4 +2], e[sel*4 +1], e[sel*4]};

endmodule 


