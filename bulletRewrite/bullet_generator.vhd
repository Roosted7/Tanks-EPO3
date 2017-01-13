library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bullet_generator is
  port(
    clk:      in  std_logic;

    fire:     in  std_logic_vector(2 downto 0);   -- fire button pressed
    e_bull:   in  std_logic;                      -- there is already a bullet
    
    x_tank:   in  std_logic_vector(3 downto 0);   -- x of tank
    y_tank:   in  std_logic_vector(3 downto 0);   -- y of tank
    d_tank:   in  std_logic_vector(1 downto 0);   -- direction of tank

    x_bull:   out std_logic_vector(3 downto 0);   -- x of bullet
    y_bull:   out std_logic_vector(3 downto 0);   -- y of bullet
    d_bull:   out std_logic_vector(1 downto 0);   -- direction of bullet
    l_bull:   out std_logic);                     -- whether the bullet has died to a wall
end bullet_generator;

architecture arch of bullet_generator is
begin
  process(clk)
  begin
    if(rising_edge(clk)) then
      if(fire = "101" and e_bull = '0') then
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
      end if;
    end if;
  end process;
end arch;