library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of test_counter is

signal count_1 : std_logic_vector(15 downto 0);
begin
count <= count_1;

process(test_enable,clk,reset)
begin
	if(reset = '1') then
		count_1 <= "0000000000000000";
	else
		if(rising_edge(clk)) then
			if(test_enable = '1') then
				count_1 <= std_logic_vector(unsigned(count_1)+1);
			else
				count_1 <= "0000000000000000";
			end if;
		end if;
	end if;
end process;

end behaviour;



