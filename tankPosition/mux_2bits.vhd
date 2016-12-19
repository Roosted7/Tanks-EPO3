library IEEE;
use IEEE.std_logic_1164.ALL;

entity mux_2bits is
   port(new_1  :out   std_logic_vector(1 downto 0);
        old_1  :in    std_logic_vector(1 downto 0);
        old_2  :in    std_logic_vector(1 downto 0);
        control:in    std_logic);
end mux_2bits;


