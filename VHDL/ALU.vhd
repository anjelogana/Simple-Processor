library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; use IEEE.NUMERIC_STD.ALL;

entity ALU is
port(
		Clock: in std_logic; --input clock signal
		A,B: in unsigned(7 downto 0); --8-bit inputs from latches A and B 
		student_id : in unsigned(3 downto 0); --4 bit student id from FSM
		OP: in unsigned(15 downto 0); --16-bit selector for Operation from Decoder 
		Neg: out std_logic; --is the result negative ? Set-ve bit output
		R1 : out unsigned(3 downto 0); -- lower 4-bits of 8-bit Result Output
		R2: out unsigned(3 downto 0)); -- higher 4-bits of 8-bit Result Output 
end ALU;

architecture calculation of ALU is --temporary signal declarations.
	signal Reg1,Reg2,Result : unsigned(7 downto 0):= (others => '0');
	signal Reg4: unsigned (7 DOWNTO 0);
begin
	Reg1 <= A; --temporarily store A in Regl local variable
	Reg2 <= B; --temporarily store B in Reg2 local variable 
	process(Clock, OP)
	begin
		if(rising_edge(Clock)) THEN --Do the calculation @ positive edge of clock cycle.
			case OP is
			WHEN "0000000000000001" => 
				Result<=(Reg1+Reg2);
			 
			WHEN "0000000000000010" => 
				If(Reg1>Reg2) THEN
					Neg<='0';
					Result <= (Reg1-Reg2);
				ElSE
					Neg <='1';
					Result <= (Reg2-Reg1);
				end if;
			
			WHEN "0000000000000100" => 
				Neg <= '0';
				Result<=(NOT Reg1);
			
			WHEN "0000000000001000" => 
				Neg <= '0';
				Result<=(Reg1 NAND Reg2);
			
			WHEN "0000000000010000" => 
				Neg <= '0';
				Result<=(Reg1 NOR Reg2);
			
			WHEN "0000000000100000" => 
				Neg <= '0';
				Result<=(Reg1 AND Reg2);
			
			WHEN "0000000001000000" => 
				Neg <= '0';
				Result<=(Reg1 XOR Reg2);
			
			WHEN "0000000010000000" => 
				Neg <= '0';
				Result<=(Reg1 OR Reg2);
			
			WHEN "0000000100000000" => 
				Neg <= '0';
				Result<=(Reg1 XNOR Reg2);
			
			WHEN OTHERS =>
		end case;
	end if; 
end process;
R1 <= Result(3 downto 0); 
R2 <= Result(7 downto 4); 
end calculation;