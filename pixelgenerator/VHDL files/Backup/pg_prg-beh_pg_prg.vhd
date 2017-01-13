library ieee;
use ieee.std_logic_1164.all;

architecture beh_pg_prg of pg_prg is
	signal x_in_reg, y_in_reg : std_logic_vector(3 downto 0);
	signal or_in_reg : std_logic_vector(1 downto 0);
begin
	process(clk, reset)
	begin
		if(clk'event and clk = '1') then
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
end beh_pg_prg;





