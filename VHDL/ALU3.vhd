library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; use IEEE.NUMERIC_STD.ALL;

entity ALU3 is
port(
		Clock: in std_logic;
		A,B: in unsigned(7 downto 0); 
		student_id : in unsigned(3 downto 0);
		OP: in unsigned(15 downto 0);
		R1 : out unsigned(3 downto 0));
end ALU3;

architecture calculation of ALU3 is
	signal Reg1 : unsigned(7 downto 0):= (others => '0');

begin
	Reg1 <= A;

	process(Clock, OP)
	begin
		if(rising_edge(Clock)) THEN
			case OP is
			WHEN "0000000000000001" => 
				if ((Reg1 (7 downto 4) = student_id) or (Reg1 (3 downto 0) = student_id)) THEN 
					R1 <= "0001";
			 	else
					R1 <= "0000";
				end if;
			WHEN "0000000000000010" => 
				if ((Reg1 (7 downto 4) = student_id) or (Reg1 (3 downto 0) = student_id)) THEN 
					R1 <= "0001";
			 	else
					R1 <= "0000";
				end if;
			
			WHEN "0000000000000100" => 
				if ((Reg1 (7 downto 4) = student_id) or (Reg1 (3 downto 0) = student_id)) THEN 
					R1 <= "0001";
			 	else
					R1 <= "0000";
				end if;
			
			WHEN "0000000000001000" => 
				if ((Reg1 (7 downto 4) = student_id) or (Reg1 (3 downto 0) = student_id)) THEN 
					R1 <= "0001";
			 	else
					R1 <= "0000";
				end if;
			
			WHEN "0000000000010000" => 
				if ((Reg1 (7 downto 4) = student_id) or (Reg1 (3 downto 0) = student_id)) THEN 
					R1 <= "0001";
			 	else
					R1 <= "0000";
				end if;
			
			WHEN "0000000000100000" => 
				if ((Reg1 (7 downto 4) = student_id) or (Reg1 (3 downto 0) = student_id)) THEN 
					R1 <= "0001";
			 	else
					R1 <= "0000";
				end if;
			
			WHEN "0000000001000000" => 
				if ((Reg1 (7 downto 4) = student_id) or (Reg1 (3 downto 0) = student_id)) THEN 
					R1 <= "0001";
			 	else
					R1 <= "0000";
				end if;
			
			WHEN "0000000010000000" => 
				if ((Reg1 (7 downto 4) = student_id) or (Reg1 (3 downto 0) = student_id)) THEN 
					R1 <= "0001";
			 	else
					R1 <= "0000";
				end if;
			
			WHEN "0000000100000000" => 
				if ((Reg1 (7 downto 4) = student_id) or (Reg1 (3 downto 0) = student_id)) THEN 
					R1 <= "0001";
			 	else
					R1 <= "0000";
				end if;
			
			WHEN OTHERS =>
		end case;
		
	end if; 
end process;

end calculation;