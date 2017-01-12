library IEEE;
use IEEE.std_logic_1164.ALL;

entity new_coord is
   port(old_tank_coord	:in    std_logic_vector(10 downto 0);
        new_direction			:out   std_logic_vector(1 downto 0);
        input_direction	:in    std_logic_vector(2 downto 0);
        new_tank_coord		:out   std_logic_vector(7 downto 0)
      );
end new_coord;








