module DebounceSwitch
    (input i_Clk,
     input i_Switch,
     output o_Switch);
     
     parameter c_DEBOUNCE_LIMIT = 250000; //10milliseconds at 25Mhz, 2500000 Clock Cycles
     
     reg r_State = 1'b0;
     reg [17:0] r_Count = 0; //2^18 = 262144 17 downto 0
     
     always @ (posedge i_Clk)
     begin
        if (i_Switch !== r_State && r_Count < c_DEBOUNCE_LIMIT)
            r_Count <= r_Count + 1; //Counter
        else if (r_Count == c_DEBOUNCE_LIMIT)
            begin
                r_State <= i_Switch;
                r_Count <= 0;
            end
        else
            r_Count <= 0;
     end
     
     assign o_Switch = r_State;
     
endmodule
     
     