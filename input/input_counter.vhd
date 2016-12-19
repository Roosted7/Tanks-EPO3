library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity input_counter is
   port(
	clk   :in	   std_logic;
	reset :in	   std_logic;
	enable:in    std_logic_vector(1 downto 0);
        count :out   std_logic_vector(2 downto 0));
end input_counter;





