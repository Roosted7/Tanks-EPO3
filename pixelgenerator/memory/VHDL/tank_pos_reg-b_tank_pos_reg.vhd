library IEEE;
use IEEE.std_logic_1164.ALL;

architecture b_tank_pos_reg of tank_pos_reg is
	signal x_in_reg, y_in_reg : std_logic_vector(3 downto 0);
	signal or_in_reg : std_logic_vector(1 downto 0);
begin
	process(update_pos, reset)
	begin
		if(rising_edge(update_pos)) then
			if(reset = '1') then
				x_in_reg <= (others => '0');
				y_in_reg <= (others => '0');
				or_in_reg <= (others => '0');
			else 
				x_in_reg <= tank_x_in;
				y_in_reg <= tank_y_in;
				or_in_reg <= tank_or_in;
			end if;
		end if;
	end process;
	tank_x_out <= x_in_reg; 
	tank_y_out <= y_in_reg;
	tank_or_out <= or_in_reg; 
end b_tank_pos_reg;














