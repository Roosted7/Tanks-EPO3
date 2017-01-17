library IEEE;
use IEEE.std_logic_1164.ALL;

entity tank_collision is
   port(oldcoor_1				   :in    std_logic_vector(7 downto 0);
        oldcoor_2      :in    std_logic_vector(7 downto 0);
        wc_newcoor_1   :in   std_logic_vector(7 downto 0);
        wc_newcoor_2  :in  std_logic_vector(7 downto 0);
        tc_newcoor_1   :out   std_logic_vector(7 downto 0);
        tc_newcoor_2  :out  std_logic_vector(7 downto 0)
);
end tank_collision;







