library IEEE;
use IEEE.std_logic_1164.ALL;

entity mem is
   port(d    :in    std_logic;
        q    :out   std_logic_vector(2 downto 0);
        reset:in    std_logic;
        bclk :in    std_logic;
        clk  :in    std_logic);
end mem;





