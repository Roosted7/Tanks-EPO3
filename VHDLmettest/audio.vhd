library IEEE;
use IEEE.std_logic_1164.ALL;

entity audio is
	port(
		clk, reset:			in  std_logic;
		idle, start:		in  std_logic;
		fire_t1, fire_t2	in  std_logic;
		audio:				out std_logic);
end audio;

architecture arch of audio is
	

begin
	
end arch;