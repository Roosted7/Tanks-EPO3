library ieee;
use ieee.std_logic_1164.all;

entity reg is
	port(
			input : in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			output : out std_logic);
end reg;

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of reg is

signal value : std_logic;
begin
output <= value;

process(clk, reset)
begin
if(reset = '0') then
	if(rising_edge(clk)) then
		value <= input;
	end if;
else
	value <= '0';
end if;
end process;
end behaviour;
