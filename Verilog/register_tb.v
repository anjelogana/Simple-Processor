// Code your testbench here
// or browse Examples
//https://www.edaplayground.com/x/AYsR
//^Link to testbench
//Make sure to disable "Show output file after run"
module register_tb;
	reg clk = 1'b0;
  	always #1 clk <= ~clk;
  
  reg [7:0] d;
  reg reset;
  wire [7:0] q;
  
  register inst1(
    .clk(clk),
    .d(d),
    .async_reset(reset),
    .q(q)
  );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
      
      reset = 1'b0;
      d = 8'b00000000;
      #2;
      
      reset = 1'b0;
      d = 8'b00000001;
      #2;
      
      reset = 1'b0;
      d = 8'b00000010;
      #2;
      
      reset = 1'b1;
      
      #2;
      
      reset = 1'b0;
      d = 8'b00000011;
      
      #2;
      
      $finish();
    end
endmodule