library IEEE;
use IEEE.std_logic_1164.ALL;

entity mapcompare is
   port(x   :in    std_logic_vector(3 downto 0);
        y   :in    std_logic_vector(3 downto 0);
        wall:out   std_logic);
end mapcompare;


