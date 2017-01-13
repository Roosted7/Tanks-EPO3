library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bclk is
  port(
    clk:      in  std_logic;
    vbullet:  in  std_logic;
    reset:    in  std_logic;
    bclk:     out std_logic);
end bclk;

architecture arch of bclk is
signal old: std_logic; 

begin
  process(reset, clk, vbullet)
  begin
    if(rising_edge(clk)) then
      if(reset = '1') then
        old  <= '0';
        bclk <= '0';
      else
        if(old = '0' and vbullet = '1') then
          bclk <= '1';
        else
          bclk <= '0';
        end if;

        old <= vbullet;
      end if;
    end if;
  end process;
end arch;