library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of delayt is
begin
process (clk) is
begin
	if(rising_edge(clk)) then
		if(reset='1') then
			outp<='0';
		else
			outp<=inp;
		end if;
	end if;
end process;
end behaviour;


