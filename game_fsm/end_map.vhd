library IEEE;
use IEEE.std_logic_1164.ALL;

entity end_map is
   port(x  :in    std_logic_vector(3 downto 0);
        y  :in    std_logic_vector(3 downto 0);
        exist_t1 :in    std_logic;
	draw_end:out	 std_logic);
end end_map;


