library IEEE;
use IEEE.std_logic_1164.ALL;

entity delay is
port(	inp	: in std_logic;
	outp	: out std_logic;
	clk	: in std_logic;
	reset	: in std_logic);
end delay;

