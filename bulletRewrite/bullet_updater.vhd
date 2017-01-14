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
signal x, y: std_logic_vector(3 downto 0);
signal d: std_logic_vector(1 downto 0);
signal l: std_logic;

begin
  o_bull(10)         <= l;
  o_bull(9 downto 6) <= x;
  o_bull(5 downto 2) <= y;
  o_bull(1 downto 0) <= d;

  process(clk)
  begin
    if(rising_edge(clk)) then
      if(bclk = '1') then
        if(i_bull(10) = '1') then
          if (i_bull(9 downto 6) = "0000" or i_bull(5 downto 2) = "0000" or i_bull(9 downto 6) = "1111" or i_bull(5 downto 2) = "1111") then
            x <= i_bull(9 downto 6);
            y <= i_bull(5 downto 2);
            l <= '0';
          else
            case i_bull(1 downto 0) is
              when "00" =>
                x <= std_logic_vector(unsigned(i_bull(9 downto 6)) - 1);
                y <= i_bull(5 downto 2);
                l <= i_bull(10);
              when "01" =>
                y <= std_logic_vector(unsigned(i_bull(5 downto 2)) - 1);
                x <= i_bull(9 downto 6);
                l <= i_bull(10);
              when "10" =>
                x <= std_logic_vector(unsigned(i_bull(9 downto 6)) + 1);
                y <= i_bull(5 downto 2);
                l <= i_bull(10);
              when "11" =>
                y <= std_logic_vector(unsigned(i_bull(5 downto 2)) + 1);
                x <= i_bull(9 downto 6);
                l <= i_bull(10);
              when others =>
                x <= i_bull(9 downto 6);
                y <= i_bull(5 downto 2);
                l <= '0';
            end case;
          end if;
        else
          x <= i_bull(9 downto 6);
          y <= i_bull(5 downto 2);
          l <= '0'; 
        end if;
      end if;
    end if;
  end process;
end arch;