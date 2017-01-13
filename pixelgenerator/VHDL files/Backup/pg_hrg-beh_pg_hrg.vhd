library ieee;
use ieee.std_logic_1164.all;

architecture beh_pg_hrg of pg_hrg is
	signal hit_reg : std_logic;
begin
-- process describing a flipflop with synchornous reset
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
end beh_pg_hrg;



