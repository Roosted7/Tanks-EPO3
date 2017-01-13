library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bullet is
  port(
    clk:      in  std_logic;                      -- clk
    bclk:     in  std_logic;                      -- bullet clock from vga
    reset:    in  std_logic;                      -- reset

    fire:     in  std_logic_vector(2 downto 0);   -- fire button pressed
    e_tank:   in  std_logic;                      -- end of tank
    
    x_tank:   in  std_logic_vector(3 downto 0);   -- x of tank
    y_tank:   in  std_logic_vector(3 downto 0);   -- y of tank
    d_tank:   in  std_logic_vector(1 downto 0);   -- direction of tank
    e_bull:   in  std_logic;                      -- end of bullet

    x_vga:    in  std_logic_vector(3 downto 0);   -- x of current vga
    y_vga:    in  std_logic_vector(3 downto 0);   -- y of current vga
    draw:     out std_logic);                     -- draw bullet at these xy
end bullet;

architecture arch of bullet is
signal exis_bull: std_logic; -- whether there is a bullet

begin
  

end arch;