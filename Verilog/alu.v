// Code your design here
module alu(
    input clk,
    input [7:0] a,
    input [7:0] b,
    input [15:0] selector,
    output reg negative,
    output [3:0] left,
    output [3:0] right
);
    
    reg [7:0] result;
    always @(posedge clk) 
        begin
            case(selector)
                16'b0000000000000001: 
                    begin
                    result <= a + b;
                    negative <= 1'b0;
                    end
                16'b0000000000000010:
                    begin
                    if(a>b)
                        begin
                            negative <= 1'b0;
                            result <= a - b;
                        end
                    else
                        begin
                            negative <= 1'b1;
                            result <= b - a;
                        end
                    end
                16'b0000000000000100:
                    begin
                    result <= ~a;
                    negative <= 1'b0;
                    end
                16'b0000000000001000:
                    begin
                    result <= ~(a & b);
                    negative <= 1'b0;
                    end
                16'b0000000000010000:
                    begin
                    result <= ~(a | b);
                    negative <= 1'b0;
                    end
                16'b0000000000100000:
                    begin
                    result <= a & b;
                    negative <= 1'b0;
                    end
                16'b0000000001000000:
                    begin
                    result <= a ^ b;
                    negative <= 1'b0;
                    end
                16'b0000000010000000:
                    begin
                    result <= a | b;
                    negative <= 1'b0;
                    end
                16'b0000000100000000:
                    begin
                    result <= ~(a ^ b);
                    negative <= 1'b0;
                    end
            endcase
          
        end
        
        assign right = result[3:0];
        assign left  = result [7:4];
        
endmodule