library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter2bit is
   port(clk  :in    std_logic;
        reset:in    std_logic;
        count:out   std_logic_vector(1 downto 0));
end counter2bit;


