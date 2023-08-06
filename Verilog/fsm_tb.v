// Code your testbench here
// or browse Examples
//https://www.edaplayground.com/x/edMV
//^Link to testbench
//Make sure to disable "Show output file after run"
module fsm_tb;
  reg clk = 1'b0;
  always #1 clk <= ~clk;
  
  reg data_in;
  reg reset;
  wire [3:0] student_id;
  wire [3:0] current_state;
  
  fsm inst1(
    .clk(clk),
    .data_in(data_in),
    .reset(reset),
    .student_id(student_id),
    .current_state(current_state)
  );
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
      
      data_in = 1'b1;
      #2;
      
      data_in = 1'b1;
      #2;
      
      data_in = 1'b1;
      #2;
      
      data_in = 1'b1;
      #2;
      
      reset = 1'b1;
      data_in = 1'b1;
      #2;
       
      reset = 1'b0;
      data_in = 1'b1;
      #2;
      
      data_in = 1'b1;
      #2;
      $finish();
    end
endmodule