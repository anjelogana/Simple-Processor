module fsm(
    input clk,
    input data_in,
    input reset,
    output reg [3:0] student_id,
    output reg [3:0] current_state
);

localparam [2:0] //We need 9 states
    s0 = 4'b0000,
    s1 = 4'b0001,
    s2 = 4'b0010,
    s3 = 4'b0011,
    s4 = 4'b0100,
    s5 = 4'b0101,
    s6 = 4'b0110,
    s7 = 4'b0111,
    s8 = 4'b1000;
    reg[3:0] track;
    
    always @(posedge clk, posedge reset) 
    begin
        if(reset == 1'b1)
            track <= s0;
        else
            begin
                case(track)
                    s0: track <= (data_in == 1'b1) ? s1 : s0; //if 1, go to next state, else stay at y
                    s1: track <= (data_in == 1'b1) ? s2 : s1;
                    s2: track <= (data_in == 1'b1) ? s3 : s2;
                    s3: track <= (data_in == 1'b1) ? s4 : s3;
                    s4: track <= (data_in == 1'b1) ? s5 : s4;
                    s5: track <= (data_in == 1'b1) ? s6 : s5;
                    s6: track <= (data_in == 1'b1) ? s7 : s6;
                    s7: track <= (data_in == 1'b1) ? s8 : s7;
                    s8: track <= (data_in == 1'b1) ? s0 : s8;
                    default: track <= s0;
                endcase
            end
    end
    
    always @(track)
    begin
        case (track)
            s0: begin
                student_id <= 4'b0101;
                current_state <= 4'b0000;
            end
            s1: begin
                student_id <= 4'b0000;
                current_state <= 4'b0001;
            end
            s2: begin
                student_id <= 4'b0001;
                current_state <= 4'b0010;
            end
            s3: begin
                student_id <= 4'b0000;
                current_state <= 4'b0011;
            end
            s4: begin
                student_id <= 4'b1000;
                current_state <= 4'b0100;
            end
            s5: begin
                student_id <= 4'b0101;
                current_state <= 4'b0101;
            end
            s6: begin
                student_id <= 4'b1001;
                current_state <= 4'b0110;
            end
            s7: begin
                student_id <= 4'b0111;
                current_state <= 4'b0111;
            end
            s8: begin
                student_id <= 4'b0010;
                current_state <= 4'b1000;
            end
            default: begin
                student_id <= 4'b1110;
                current_state <= 4'b1110;
            end
        endcase
    end
endmodule