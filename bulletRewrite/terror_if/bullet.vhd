library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bullet is
  port(
  clk:      in  std_logic;                      -- clk
  bclk:     in  std_logic;                      -- bullet clock from vga
  reset:    in  std_logic;                      -- reset

  fire:     in  std_logic_vector(2 downto 0);   -- fire button pressed
  
  x_tank:   in  std_logic_vector(3 downto 0);   -- x of tank
  y_tank:   in  std_logic_vector(3 downto 0);   -- y of tank
  d_tank:   in  std_logic_vector(1 downto 0);   -- direction of tank
  e_bull:   in  std_logic;                      -- end of bullet

  x_vga:    in  std_logic_vector(3 downto 0);   -- x of current vga
  y_vga:    in  std_logic_vector(3 downto 0);   -- y of current vga
  
  draw:     out std_logic;                      -- draw bullet at these xy
  test_x:   out std_logic_vector(3 downto 0);
  test_y:   out std_logic_vector(3 downto 0));
end bullet;

architecture arch of bullet is
  signal old, b_clk, tofire, tokill: std_logic;

  signal x_bull, y_bull: std_logic_vector(3 downto 0);
  signal d_bull: std_logic_vector(1 downto 0);
  signal l_bull: std_logic;

begin
  bullet_clk: process(clk)
  begin
    if(rising_edge(clk)) then
      if(reset = '1') then
        old <= '0';
        b_clk <= '0';
      else
        if(old = '0' and bclk = '1') then
          b_clk <= '1';
        else
          b_clk <= '0';
        end if;
        
        old <= bclk;
      end if;
    end if;
  end process;

  whole: process(clk)
  begin
    if(rising_edge(clk)) then
      if(reset = '1') then
        tofire <= '0';
        tokill <= '0';
        x_bull <= "0000";
        y_bull <= "0000";
        d_bull <= "00";
        l_bull <= '0';
      else
        tofire <= (fire(2) and not(fire(1)) and fire(0)) or tofire;
        tokill <= e_bull;

        if(b_clk = '1') then
          tofire <= '0';
          tokill <= '0';

          if(tofire = '1' and l_bull = '0' and tokill = '0') then
            d_bull <= d_tank;

            if   (d_tank = "00" and x_tank /= "0001") then 
              x_bull <= std_logic_vector(to_unsigned(to_integer(unsigned(x_tank)) - 2, 4)); 
              y_bull <= y_tank;
              l_bull <= '1';
            elsif(d_tank = "01" and y_tank /= "0001") then 
              y_bull <= std_logic_vector(to_unsigned(to_integer(unsigned(y_tank)) - 2, 4));
              x_bull <= x_tank;
              l_bull <= '1';
            elsif(d_tank = "10" and x_tank /= "1110") then 
              x_bull <= std_logic_vector(to_unsigned(to_integer(unsigned(x_tank)) + 2, 4));
              y_bull <= y_tank;
              l_bull <= '1';
            elsif(d_tank = "11" and y_tank /= "1110") then
              y_bull <= std_logic_vector(to_unsigned(to_integer(unsigned(y_tank)) + 2, 4));
              x_bull <= x_tank;
              l_bull <= '1';
            else  
              x_bull <= x_tank;
              y_bull <= y_tank;
              l_bull <= '0';
            end if;
          elsif(l_bull = '1' and tokill = '0') then
            d_bull <= d_bull;

            if (x_bull = "0000" or y_bull = "0000" or x_bull = "1111" or y_bull = "1111") then
              x_bull <= x_tank;
              y_bull <= y_tank;
              l_bull <= '0';
            else
              case d_bull is
                when "00" =>
                  x_bull <= std_logic_vector(unsigned(x_bull) - 1);
                  y_bull <= y_bull;
                  l_bull <= l_bull;
                when "01" =>
                  y_bull <= std_logic_vector(unsigned(y_bull) - 1);
                  x_bull <= x_bull;
                  l_bull <= l_bull;
                when "10" =>
                  x_bull <= std_logic_vector(unsigned(x_bull) + 1);
                  y_bull <= y_bull;
                  l_bull <= l_bull;
                when "11" =>
                  y_bull <= std_logic_vector(unsigned(y_bull) + 1);
                  x_bull <= x_bull;
                  l_bull <= l_bull;
                when others =>
                  x_bull <= x_tank;
                  y_bull <= y_tank;
                  l_bull <= '0';
              end case;
            end if;
          else
            d_bull <= d_tank;
            x_bull <= x_tank;
            y_bull <= y_tank;
            l_bull <= '0';
          end if;
        else
          x_bull <= x_bull;
          y_bull <= y_bull;
          d_bull <= d_bull;
          l_bull <= l_bull;
        end if;
      end if;
    end if;
  end process;

  drawout: process(x_vga, y_vga, x_bull, y_bull)
  begin
    if(x_vga = x_bull and y_vga = y_bull) then
      draw <= '1';
    else
      draw <= '0';
    end if;
  end process;

  test_x <= x_bull; -- TEST
  test_y <= y_bull; -- TEST
end architecture;