library IEEE;
use IEEE.std_logic_1164.ALL;

entity adder_5bits is
   port(old_pos:in    std_logic_vector(7 downto 0);
        input_direction10  :in    std_logic_vector(1 downto 0);
        new_pos:out   std_logic_vector(3 downto 0));
end adder_5bits;


