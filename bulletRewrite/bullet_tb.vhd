library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bullet_tb is
end bullet_tb;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behaviour of bullet_tb is

component bullet is
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
    draw:     out std_logic;                     -- draw bullet at these xy
    test_x:   out std_logic_vector(3 downto 0);
    test_y:   out std_logic_vector(3 downto 0));                   -- draw bullet at these xy
end component;

  signal clk, bclk, reset, e_bull, draw_out : std_logic;
  signal d_tank : std_logic_vector(1 downto 0);
  signal fire : std_logic_vector(2 downto 0);
  signal x_tank, y_tank, x_vga, y_vga, bullet_x, bullet_y : std_logic_vector(3 downto 0);

  signal counter : std_logic_vector(3 downto 0);
  signal flag : std_logic;

begin

  lbl1: bullet port map(
  					clk => clk,
  					bclk => bclk,
  					reset => reset,
  					fire => fire,
  					x_tank => x_tank,
  					y_tank => y_tank,
  					d_tank => d_tank,
  					e_bull => e_bull,
  					x_vga => x_vga,
  					y_vga => y_vga,
  					draw => draw_out,
  					test_x => bullet_x,
  					test_y => bullet_y);
--vaste signalen
  x_tank <= "0001";
  y_tank <= "1110";
  d_tank <= "00";
  e_bull <= '0';
  x_vga <= "0001";
  y_vga <= "0110";
  clk   <=  '0' after 0  ns,
    '1' after 80  ns when clk /= '1' else '0' after 80 ns;
  bclk   <=  '0' after 0  ns,
    '1' after 800  ns when bclk /= '1' else '0' after 800 ns;
  reset <= '1' after 0 ns, '0' after 200 ns;

--variabele signalen
  fire <= "100" after 0 ns, "101" after 570 ns, "100" after 730 ns, "101" after 1530 ns, "100" after 1690 ns;
  

--  process(clk)
--  begin
--  	if(rising_edge(clk)) then
--  		counter <= std_logic_vector(unsigned(counter)+1);
--  		if(counter = "0000") then
--  			if(flag = '1') then
--  				bclk <= '1';
--  				flag <= '0';
--  			else
--  				bclk <= '0';
--  				flag <= '1';
--  			end if;
--  		else
--  			bclk <= bclk;
--  			flag <= flag;
--  		end if;
--  	end if;
--  end process;
end architecture;