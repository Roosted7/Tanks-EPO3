library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of pulse is
begin
process(clk)
begin
	if (rising_edge(clk)) then
		if (bulletc='1' and bulletd='0') then
			pulse<='1';
		else
			pulse<='0';
		end if;
	end if;
end process;

end behaviour;


