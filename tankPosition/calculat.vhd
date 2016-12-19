library IEEE;
use IEEE.std_logic_1164.ALL;

entity calculated_new_pos is
   port(input_direction10	:in    std_logic_vector(1 downto 0);
        old_pos 			:in    std_logic_vector(7 downto 0);
        new_pos 			:out   std_logic_vector(7 downto 0));
end calculated_new_pos;





