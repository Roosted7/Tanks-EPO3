library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of combiblok_coord is

signal xor_direction: std_logic_vector(1 downto 0);
signal equal_direction: std_logic;
begin
xor_dir: 
	xor_direction <= old_direction xor input_direction(1 downto 0);
	equal_direction <= xor_direction(1) or xor_direction(0);

contr:
	control <= input_direction(2) or equal_direction;	


end behaviour;





