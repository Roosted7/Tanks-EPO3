library IEEE;
use IEEE.std_logic_1164.ALL;

entity new_pos_vec is
   port(new_pos 			 :in    std_logic_vector(3 downto 0);
        old_pos 			 :in    std_logic_vector(7 downto 0);
        input_direction0	:in    std_logic;
        new_pos_vector   :out   std_logic_vector(7 downto 0));
end new_pos_vec;





