// Code your design here
module decoder(
    input [3:0] current_state,
    output reg [15:0] selector
);

always @(current_state)
    begin
        case(current_state)
            4'b0000 : selector = 16'b0000000000000001;
            4'b0001 : selector = 16'b0000000000000010;
            4'b0010 : selector = 16'b0000000000000100;
            4'b0011 : selector = 16'b0000000000001000;
            4'b0100 : selector = 16'b0000000000010000;
            4'b0101 : selector = 16'b0000000000100000;
            4'b0110 : selector = 16'b0000000001000000;
            4'b0111 : selector = 16'b0000000010000000;
            4'b1000 : selector = 16'b0000000100000000;
            default: selector  = 16'b0000000000000000;
        endcase
    end
endmodule