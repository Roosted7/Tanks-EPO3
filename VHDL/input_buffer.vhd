library IEEE;
use IEEE.std_logic_1164.ALL;

entity input_buffer is
   port(input :in    std_logic_vector(4 downto 0);
        clk   :in    std_logic;
        reset :in    std_logic;
        output:out   std_logic_vector(4 downto 0));
end input_buffer;


