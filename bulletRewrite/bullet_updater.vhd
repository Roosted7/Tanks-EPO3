library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bullet_updater is
  port(
    clk:    in  std_logic;
    bclk:   in  std_logic;
    i_bull: in  std_logic_vector(10 downto 0);  -- bullet before the update
    o_bull: out std_logic_vector(10 downto 0)); -- bullet after the update
end bullet_updater;

architecture arch of bullet_updater is
begin
  if(rising_edge(clk)) then
    if(bclk = '1') then
      
end arch;