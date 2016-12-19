library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of new_pos_vec is


begin

x_coordinates: new_pos_vector(7 downto 4) <= new_pos when (input_direction0 = '0') else old_pos(7 downto 4);

y_coordinates: new_pos_vector(3 downto 0) <= new_pos when (input_direction0 = '1') else old_pos(3 downto 0);
end behaviour;








