library IEEE;
use IEEE.std_logic_1164.ALL;

entity fbi is
   port(infbi  :in    std_logic_vector(2 downto 0);
        bclk :in    std_logic;
        clk  :in    std_logic;
        reset:in    std_logic;
        outfbi :out   std_logic_vector(2 downto 0));
end fbi;




