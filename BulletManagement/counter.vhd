library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter is
   port(f30khz     :in   std_logic;
        countreset:in    std_logic;
	reset	  :in	 std_logic;
        count     :out   std_logic_vector(6 downto 0));
end counter;








