library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bullet_generator is
  port(
    clk:      in  std_logic;

    fire:     in  std_logic_vector(2 downto 0);   -- fire button pressed
    
    x_tank:   in  std_logic_vector(3 downto 0);   -- x of tank
    y_tank:   in  std_logic_vector(3 downto 0);   -- y of tank
    d_tank:   in  std_logic_vector(1 downto 0);   -- direction of tank

    x_bull:   out std_logic_vector(3 downto 0);   -- x of bullet
    y_bull:   out std_logic_vector(3 downto 0);   -- y of bullet
    d_bull:   out std_logic_vector(1 downto 0);   -- direction of bullet
    l_bull:   out std_logic);
end bullet_generator;

architecture arch of bullet_generator is
signal 

begin

end arch;