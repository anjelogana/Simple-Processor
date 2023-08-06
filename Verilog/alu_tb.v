// Code your testbench here
// or browse Examples
//https://www.edaplayground.com/x/LKxp
//^Link to testbench
//Make sure to disable "Show output file after run"
module alu_tb;
  reg clk = 1'b0;
  always #1 clk <= ~clk;
  
  reg [7:0] a;
  reg [7:0] b;
  reg [15:0] selector;
  
  wire negative;
  wire [3:0] left;
  wire [3:0] right;
  
  alu inst1(
    .clk(clk),
    .a(a),
    .b(b),
    .selector(selector),
    .negative(negative),
    .left(left),
    .right(right)
  );
  
    initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
      		a = 8'b01011001;
      		b = 8'b01110010;
            selector = 16'b0000000000000001;
      		#2
            selector = 16'b0000000000000010;
      		#2
            selector = 16'b0000000000000100;
      		#2
            selector = 16'b0000000000001000;
      		#2
            selector = 16'b0000000000010000;
      		#2
            selector = 16'b0000000000100000;
      		#2
            selector = 16'b0000000001000000;
      		#2
            selector = 16'b0000000010000000;
      		#2
            selector = 16'b0000000100000000;
      		#2
     
      $finish();
    end
endmodule