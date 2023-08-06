library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; use IEEE.NUMERIC_STD.ALL;

entity ALU2 is
port(
		Clock: in std_logic;
		A,B: in unsigned(7 downto 0); 
		student_id : in unsigned(3 downto 0);
		OP: in unsigned(15 downto 0);
		Neg: out std_logic;
		R1 : out unsigned(3 downto 0);
		R2: out unsigned(3 downto 0));
end ALU2;

architecture calculation of ALU2 is --temporary signal
	signal Reg1,Reg2,Result : unsigned(7 downto 0):= (others => '0');
	signal Reg4: unsigned (7 DOWNTO 0);
begin
	Reg1 <= A;
	Reg2 <= B;
	process(Clock, OP)
	begin
		if(rising_edge(Clock)) THEN
			case OP is
			WHEN "0000000000000001" => --Swap the lower and upper 4 bits of A
				Neg<='0';
				Result <= (Reg1 (3 downto 0) & Reg1(7 downto 4));
			 
			WHEN "0000000000000010" => --Produce the result of ORing A and B
				Neg <= '0';
				Result<=(Reg1 OR Reg2);
			WHEN "0000000000000100" => --Decrement B by 5
				Neg <= '0';
				Result<=(Reg2-5);
			
			WHEN "0000000000001000" => --Invert all bits of A
				Neg <= '0';
				Result<=(not Reg1 (7 downto 0));
			
			WHEN "0000000000010000" => --Invert the bit-significance order of A??
				Neg <= '0';
				Result<=(Reg1 (0) & Reg1 (1) & Reg1 (2) & Reg1 (3) & Reg1 (4) & Reg1 (5) & Reg1 (6) & Reg1 (7));
			
			WHEN "0000000000100000" => --Find the greater value of A and B and produce the results ( Max(A,B) )
				If(Reg1>Reg2) THEN
					Neg<='0';
					Result <= (Reg1);
				ElSE
					Neg <='0';
					Result <= (Reg2);
				end if;
			
			WHEN "0000000001000000" => --Produce the difference between A and B
				If(Reg1>Reg2) THEN
					Neg<='0';
					Result <= (Reg1-Reg2);
				ElSE
					Neg <='1';
					Result <= (Reg2-Reg1);
				end if;
			
			WHEN "0000000010000000" => --Produce the result of XNORing A and B
				Neg <= '0';
				Result<=(Reg1 XNOR Reg2);
			
			WHEN "0000000100000000" => --Rotate B to left by three bits (ROL)
				Neg <= '0';
				Result<=(Reg2 rol 3);
			
			WHEN OTHERS =>
		end case;
	end if; 
end process;
R1 <= Result(3 downto 0); 
R2 <= Result(7 downto 4); 
end calculation;