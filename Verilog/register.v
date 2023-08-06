// Code your design here
module register(
    input clk,
  	input [7:0] d,
    input async_reset,
 	 output reg [7:0] q
);

always @(posedge clk, posedge async_reset)
    begin
        if(async_reset == 1'b1)
            q <= 8'b00000000;
        else
            q <=d;
    end
endmodule
