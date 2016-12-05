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
		r, g, b:		out std_logic;
		frame, vbullet:	out std_logic;
		hsync, vsync: 	out std_logic;
		x, y:			out std_logic_vector(3 downto 0));
	end component vga_out;

	component vga_test is
		port(
			x, y:	in  std_logic_vector(3 downto 0);
			rgb:	out std_logic_vector(2 downto 0));
	end component vga_test;

	signal clk, reset, frame, vbullet, hsync, vsync, r, g, b: std_logic;
	signal x, y: std_logic_vector(3 downto 0);
	signal rgb:  std_logic_vector(2 downto 0);

begin
	reset <= 	'1' after 0 	ns,
				'0' after 1148 	ns,
				'1' after 30 	ms,
				'0' after 40 	ms;
	clk   <= 	'0' after 0 	ns,
				'1' after 82 	ns when clk /= '1' else '0' after 82 ns;

	l1: vga_out  port map(clk, reset, rgb, r, g, b, frame, vbullet, hsync, vsync, x, y);

	l2: vga_test port map(x, y, rgb);
end arch;