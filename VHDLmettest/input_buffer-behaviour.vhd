library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buffer is
signal buf : std_logic_vector(4 downto 0);
begin
	
output <= buf;

process(clk, reset, input)
begin
	if(rising_edge(clk)) then
		if(reset = '1') then
			buf <= "00000";
		else
			buf <= input;
		end if;
	end if;
end process;
end behaviour;

