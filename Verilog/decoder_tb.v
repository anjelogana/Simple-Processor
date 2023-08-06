// Code your testbench here
// or browse Examples
//https://www.edaplayground.com/x/sZZR
//^Link to testbench
//Make sure to disable "Show output file after run"
module decoder_tb;
  reg [3:0] current_state;
  wire [15:0] selector;
  
  decoder inst1(
    .current_state(current_state),
    .selector(selector)
  );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
      
      current_state = 4'b0000;
      #2
      current_state = 4'b0001;
      #2
      current_state = 4'b0010;
      #2
      current_state = 4'b0011;
      #2
      current_state = 4'b0100;
      #2
      current_state = 4'b0101;
      #2
      current_state = 4'b0110;
      #2
      current_state = 4'b0111;
      #2
      current_state = 4'b1000;
      #2
      $finish();
    end
endmodule