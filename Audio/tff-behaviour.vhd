library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tff is
	signal temp: std_logic;
begin
	process(reset,t)
	begin
		if(reset = '1') then
			temp <= '0';
		elsif(rising_edge(t)) then
			temp <= not temp;
		end if;	
	end process;
	q <= temp;
end behaviour;














