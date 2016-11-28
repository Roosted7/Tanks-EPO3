library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_out_tb is
end vga_out_tb;

architecture arch of vga_out_tb is
	component vga_out is
    	port(
			clk, reset:		in  std_logic;
			rgb: 			in  std_logic_vector(2 downto 0);
			x, y: 			out std_logic_vector(3 downto 0);
			hsync, vsync: 	out std_logic;
			r, g, b:		out std_logic;
			frame, vbullet:	out std_logic);
   	end component vga_out;

signal clk, reset, frame, vbullet, hsync, vsync, r, g, b: std_logic;
signal x, y: std_logic_vector(3 downto 0);
signal rgb: std_logic_vector(2 downto 0);

begin
	reset <= 	'1' after 0 ns,
				'0' after 1148 ns;
	clk   <= 	'0' after   0 ns,
                '1' after   82 ns when clk /= '1' else '0' after 82 ns;

	l1: vga_out port map(clk, reset, rgb, x, y, hsync, vsync, r, g, b, frame, vbullet);
end architecture;