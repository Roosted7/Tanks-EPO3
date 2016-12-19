library IEEE;
use IEEE.std_logic_1164.ALL;

entity wallcheck is
   port(oldcoor_1				   :in    std_logic_vector(7 downto 0);
        oldcoor_2      :in    std_logic_vector(7 downto 0);
        newcoor_1      :in    std_logic_vector(7 downto 0);
        newcoor_2     :in    std_logic_vector(7 downto 0);
        wc_newcoor_1   :out   std_logic_vector(7 downto 0);
        wc_newcoor_2  :out   std_logic_vector(7 downto 0);
  --      tankwall_c  :out   std_logic_vector(1 downto 0);
  --      tankwall_res:in    std_logic;
        count_in    :in    std_logic_vector(2 downto 0));
end wallcheck;







