library IEEE;
use IEEE.std_logic_1164.ALL;

entity combiblok_coord is
   port(input_direction :in    std_logic_vector(2 downto 0);
        old_direction			:in    std_logic_vector(1 downto 0);
        control      			:out   std_logic);
end combiblok_coord;


