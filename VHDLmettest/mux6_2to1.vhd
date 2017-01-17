library IEEE;
use IEEE.std_logic_1164.ALL;

entity mux6_2to1 is
   port(input      :in    std_logic_vector(5 downto 0);
        input_test :in    std_logic_vector(5 downto 0);
        test_enable:in    std_logic;
        output     :out   std_logic_vector(5 downto 0));
end mux6_2to1;


