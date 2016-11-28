library IEEE;
use IEEE.std_logic_1164.all;

entity mux_11 is
   port(  in_1, in_2  : in std_logic_vector(10 downto 0);
          sel         : in std_logic;
          out_vector  : out std_logic_vector(10 downto 0));
end mux_11;

architecture mux_11_behavioral of mux_11 is
begin
  
  with sel select
    out_vector <= in_1 when '0';
                  in_2 when others;
                  
end mux_11_behavioral;
