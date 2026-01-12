module bin_to_bcd ( // bin to bcd converter using a state machine w/ double dabble
    input clk,
    input en,
    input [11:0] bin_in, // 3 nibble input (4095 max)
    output [15:0] bcd_out, // 4 digit bcd output
    output ready
);

    // state machine variables
    parameter IDLE  = 3'b000;
    parameter ADD   = 3'b001;
    parameter SHIFT = 3'b010;
    parameter DONE  = 3'b011;

    reg [27:0] bcd_data = 0;    // 4 bcd output nibbles, 3 bin input nibbles
    reg [2:0] state = 0;        // IDLE state default 
    reg busy = 0;
    reg [3:0] shift_count = 0;  
    reg out_ready = 0;

    always @(posedge clk) begin
        if (en) begin // why is this needed?
            if (~busy) begin
                bcd_data <= {16'b0, bin_in};
                shift_count <= 0;
                state <= ADD;
                busy <= 1;
            end
        end

        case (state)
            IDLE: begin 
                out_ready <= 0;
                busy <= 0;
            end
            ADD: begin 
                // check for bcd digit above 4
                if (bcd_data[15:12] > 4) // digit 1
                    bcd_data[15:12] <= bcd_data[15:12] + 3;
                if (bcd_data[19:16] > 4) // digit 2 
                    bcd_data[19:16] <= bcd_data[19:16] + 3;
                if (bcd_data[23:20] > 4) // digit 3
                    bcd_data[23:20] <= bcd_data[23:20] + 3;
                if (bcd_data[27:24] > 4) // digit 4
                    bcd_data[27:24] <= bcd_data[27:24] + 3;

                state <= SHIFT;
            end
            SHIFT: begin 
                shift_count <= shift_count + 1;
                bcd_data <= bcd_data << 1;

                if (shift_count == 11) begin 
                    shift_count <= 0;
                    state <= DONE;
                end
                else 
                    state <= ADD;
            end
            DONE: begin 
                out_ready <= 1;
                busy <= 0;
                state <= IDLE;
            end
            default : state <= IDLE;
        endcase
    end

    assign bcd_out = bcd_data[27:12];
    assign ready = out_ready;


endmodule 

/*
BCD	 Decimal
0000	0
0001	1
0010	2
0011	3
0100	4
0101	5
0110	6
0111	7
1000	8
1001	9
others	undefined
*/