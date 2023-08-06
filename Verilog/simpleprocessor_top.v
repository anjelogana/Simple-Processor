
module simpleprocessor_top(
    input i_Clk,      //clock
    input i_Switch_1, //data_in +1
    input i_Switch_2, //result
    input i_Switch_3, //student numb
    input i_Switch_4, //state
    
    output reg o_LED_1, //For Negative
    output reg o_LED_2,
    output reg o_LED_3,
    output reg o_LED_4,
    
    output o_Segment1_A,
    output o_Segment1_B,
    output o_Segment1_C,
    output o_Segment1_D,
    output o_Segment1_E,
    output o_Segment1_F,
    output o_Segment1_G,
    
    output o_Segment2_A,
    output o_Segment2_B,
    output o_Segment2_C,
    output o_Segment2_D,
    output o_Segment2_E,
    output o_Segment2_F,
    output o_Segment2_G
    
    );

    wire reset = 1'b0; //reset
    reg [7:0] a = 8'b01011001;
    reg [7:0] b = 8'b01110010;
    
    reg  r_Switch_1;
    reg  r_Switch_2;
    reg  r_Switch_3;
    reg  r_Switch_4;
  
    wire w_Switch_1;
    wire w_Switch_2;
    wire w_Switch_3;
    wire w_Switch_4;
    
    wire w_Segment1_A;
    wire w_Segment1_B;
    wire w_Segment1_C;
    wire w_Segment1_D;
    wire w_Segment1_E;
    wire w_Segment1_F;
    wire w_Segment1_G;
    
    wire w_Segment2_A;
    wire w_Segment2_B;
    wire w_Segment2_C;
    wire w_Segment2_D;
    wire w_Segment2_E;
    wire w_Segment2_F;
    wire w_Segment2_G;
    
    reg click1 = 1'b0; //press to change state
    
    wire [7:0] adffp; //a output of the register
    wire [7:0] bdffp; //b output of the register
    register reg1(
        .clk(i_Clk),
        .d(a),
        .async_reset(reset),
        .q(adffp)
    );
    
    register reg2(
        .clk(i_Clk),
        .d(b),
        .async_reset(reset),
        .q(bdffp)
    );
    DebounceSwitch Instance1
    (.i_Clk(i_Clk),
     .i_Switch(i_Switch_1),
     .o_Switch(w_Switch_1));
     
     DebounceSwitch Instance2
    (.i_Clk(i_Clk),
     .i_Switch(i_Switch_2),
     .o_Switch(w_Switch_2));
     
     DebounceSwitch Instance3
    (.i_Clk(i_Clk),
     .i_Switch(i_Switch_3),
     .o_Switch(w_Switch_3));
    
    DebounceSwitch Instance4
    (.i_Clk(i_Clk),
     .i_Switch(i_Switch_4),
     .o_Switch(w_Switch_4));
    wire [3:0] student_id; //for switch 3
    wire [3:0] current_state;
    
    fsm cu1(
        .clk(i_Clk),
        .data_in(click1), 
        .reset(reset),
        .student_id(student_id),
        .current_state(current_state)
    );
    
    wire [15:0] selector;
    decoder cu2(
        .current_state(current_state),
        .selector(selector)
    );
    wire negative;
    wire [3:0] left;
    wire [3:0] right;
    
    alu alogicunit(
        .clk(i_Clk),
        .a(adffp),
        .b(bdffp),
        .selector(selector),
        .negative(negative),
        .left(left),
        .right(right)
    );
    
    reg [3:0] sevsegl;
    reg [3:0] sevsegr;
    reg [3:0] r_Count = 4'b0000;
    always @ (posedge i_Clk)
    begin
        r_Switch_1 <= w_Switch_1;
        r_Switch_2 <= w_Switch_2;
        r_Switch_3 <= w_Switch_3;
        r_Switch_4 <= w_Switch_4;
        o_LED_1 <= negative;
        o_LED_2 <= negative;
        o_LED_3 <= negative;
        o_LED_4 <= negative;
        if (w_Switch_1 == 1'b0 && r_Switch_1 == 1'b1) // Falling Edge
          begin
            click1 <= 1'b1;
            if(r_Count ==10)
                r_Count <=0;
            else
                begin
                r_Count <= r_Count + 1;
                sevsegl <= r_Count + 1;
                sevsegr <= r_Count + 1;
                end
          end
        else if (w_Switch_2 == 1'b0 && r_Switch_2 == 1'b1)
          begin
            sevsegl <= left;
            sevsegr <= right;
          end
      	else if (w_Switch_3 == 1'b0 && r_Switch_3 == 1'b1)
          begin
            sevsegl <= student_id;
            sevsegr <= student_id;
          end
        else if (w_Switch_4 == 1'b0 && r_Switch_4 == 1'b1)
          begin
                sevsegl <= r_Count;
                sevsegr <= r_Count;
          end
        else
            click1 <= 1'b0;
    end
    BinaryTo7Seg SegInst1
    (.i_Clk(i_Clk),
     .i_Binary_Num(sevsegl),
     .o_Segment_A(w_Segment1_A),
     .o_Segment_B(w_Segment1_B),
     .o_Segment_C(w_Segment1_C),
     .o_Segment_D(w_Segment1_D),
     .o_Segment_E(w_Segment1_E),
     .o_Segment_F(w_Segment1_F),
     .o_Segment_G(w_Segment1_G));
     
    BinaryTo7Seg SegInst2
    (.i_Clk(i_Clk),
     .i_Binary_Num(sevsegr),
     .o_Segment_A(w_Segment2_A),
     .o_Segment_B(w_Segment2_B),
     .o_Segment_C(w_Segment2_C),
     .o_Segment_D(w_Segment2_D),
     .o_Segment_E(w_Segment2_E),
     .o_Segment_F(w_Segment2_F),
     .o_Segment_G(w_Segment2_G));
     
    assign o_Segment1_A = ~w_Segment1_A;
    assign o_Segment1_B = ~w_Segment1_B;
    assign o_Segment1_C = ~w_Segment1_C;
    assign o_Segment1_D = ~w_Segment1_D;
    assign o_Segment1_E = ~w_Segment1_E;
    assign o_Segment1_F = ~w_Segment1_F;
    assign o_Segment1_G = ~w_Segment1_G;
    
    assign o_Segment2_A = ~w_Segment2_A;
    assign o_Segment2_B = ~w_Segment2_B;
    assign o_Segment2_C = ~w_Segment2_C;
    assign o_Segment2_D = ~w_Segment2_D;
    assign o_Segment2_E = ~w_Segment2_E;
    assign o_Segment2_F = ~w_Segment2_F;
    assign o_Segment2_G = ~w_Segment2_G;
    
endmodule