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
			x_p, y_p:		out std_logic;
			hsync, vsync: 	out std_logic;
			r, g, b:		out std_logic;
			frame, vbullet:	out std_logic;
			pixel, row:		out std_logic);
   	end component vga_out;

	signal clk, reset, frame, vbullet, hsync, vsync, r, g, b, pixel, row, x_p, y_p: std_logic;
	signal x, y: std_logic_vector(3 downto 0);
	signal rgb: std_logic_vector(2 downto 0);

begin
	reset <= 	'1' after 0 	ns,
				'0' after 1148 	ns,
				'1' after 30 ms,
				'0' after 40 ms;
	clk   <= 	'0' after 0 	ns,
                '1' after 82 	ns when clk /= '1' else '0' after 82 ns;

	l1: vga_out port map(clk, reset, rgb, x, y, x_p, y_p, hsync, vsync, r, g, b, frame, vbullet, pixel, row);
end architecture;