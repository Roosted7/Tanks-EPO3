library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of input_counter is

signal counter_enable : std_logic;
signal count_1 : std_logic_vector(2 downto 0);
begin
counter_enable <= enable(0) or enable(1);
count <= count_1;

process(counter_enable,clk,reset)
begin
	if(reset = '1') then
		count_1 <= "000";
	else
		if(rising_edge(clk)) then
			if(counter_enable = '1') then
				count_1 <= std_logic_vector(unsigned(count_1)+1);
			else
				count_1 <= "000";
			end if;
		end if;
	end if;
end process;

end behaviour;





