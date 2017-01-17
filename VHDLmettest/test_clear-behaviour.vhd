library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of test_clear is

signal and_in, not_in, or_in : std_logic;
signal value : std_logic;
begin
output <= value;
not_in <= not test_enable;
and_in <= value and input;
or_in <= not_in or and_in;

process(clk, reset)
begin
if(rising_edge(clk)) then
	if(reset = '0') then
		value <= or_in;
	else
		value <= '1';
	end if;
end if;
end process;
end behaviour;





