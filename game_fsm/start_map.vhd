library IEEE;
use IEEE.std_logic_1164.ALL;

entity start_map is
   port(x   :in    std_logic_vector(3 downto 0);
        y   :in    std_logic_vector(3 downto 0);
        draw_start	:out   std_logic);
end start_map;


