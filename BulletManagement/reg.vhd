library IEEE;
use IEEE.std_logic_1164.all;

entity reg_11 is
  port( clk     : in std_logic;
        reset   : in std_logic;
        D       : in std_logic_vector(10 downto 0)
        Q       : out std_logic_vector(10 downto 0));
end reg_11;


