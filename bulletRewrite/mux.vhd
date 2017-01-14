library IEEE;
use IEEE.std_logic_1164.all;

entity mux_10 is
   port(  in_1, in_2  : in std_logic_vector(9 downto 0);
          sel         : in std_logic;
          out_vector  : out std_logic_vector(9 downto 0));
end mux_10;

architecture mux_10_arch of mux_10 is
begin
  
out_vector <= in_1 when (sel='0') else in_2;
                  
end mux_10_arch;
