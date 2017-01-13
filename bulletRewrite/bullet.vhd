library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bullet is
  port(
    clk:      in  std_logic;
    reset:    in  std_logic;

    fire:     in  std_logic_vector(2 downto 0);
    e_tank:   in  std_logic;
    
    x_tank:   in  std_logic_vector(3 downto 0);
    y_tank:   in  std_logic_vector(3 downto 0);
    d_tank:   in  std_logic_vector(1 downto 0);
    e_bull:   in  std_logic;

    x_vga:    in  std_logic_vector(3 downto 0);
    y_vga:    in  std_logic_vector(3 downto 0);
    draw:     out std_logic;
end bullet;

architecture arch of bullet is
  
begin


end arch;