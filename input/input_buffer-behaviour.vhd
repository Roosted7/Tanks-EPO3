library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buffer is
signal value : std_logic_vector(4 downto 0);
begin
output <= value;

process(clk, reset)
begin
if(reset = '0') then
	if(rising_edge(clk)) then
		value <= input;
	end if;
else
	value <= "00000";
end if;
end process;
end behaviour;

