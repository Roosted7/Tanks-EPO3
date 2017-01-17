library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_register is

signal value : std_logic_vector(2 downto 0);
begin
output <= value;

process(clk, reset)
begin
if(reset = '0') then
	if(rising_edge(clk)) then
		value <= input;
	end if;
else
	value <= "000";
end if;
end process;
end behaviour;


