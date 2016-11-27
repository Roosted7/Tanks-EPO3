library IEEE;
use IEEE.std_logic_1164.ALL;

architecture b_tank_hit_reg of tank_hit_reg is
	signal hit_reg : std_logic;
begin

process(clk, reset)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				hit_reg <= '0';
			else 
				hit_reg <= hit_in;
			end if;
		end if;
	end process;
	hit_out <= hit_reg;
end b_tank_hit_reg;



