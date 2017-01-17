library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity test_counter is
   port(test_enable:in    std_logic;
        clk        :in    std_logic;
        reset      :in    std_logic;
        count      :out   std_logic_vector(15 downto 0));
end test_counter;


