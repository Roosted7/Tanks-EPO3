library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of adder_5bits is

signal direction_vector : std_logic_vector(4 downto 0);
signal pos_vector : std_logic_vector(4 downto 0);
signal added_vector : std_logic_vector(4 downto 0);

begin

vector1:
	direction_vector(4) <= not input_direction10(1);
	direction_vector(3) <= not input_direction10(1); 
	direction_vector(2) <= not input_direction10(1); 
	direction_vector(1) <= not input_direction10(1); 
	direction_vector(0) <= '1';

vector2:  
	pos_vector(4) <= '0';
	pos_vector(3 downto 0) <= old_pos(7 downto 4) when (input_direction10(0) = '0') else old_pos(3 downto 0);

adding:
	added_vector <= std_logic_vector(unsigned(pos_vector) + unsigned(direction_vector));

output:
	new_pos <= added_vector(3 downto 0);
end behaviour;













