library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timebase_tb is
end timebase_tb;

architecture arch of timebase_tb is
	component timebase is
		port(
			clk, reset:						in  std_logic;
			pixel, frame, vbullet:		out std_logic;
			hsync, vsync, x_c, y_c: 		out std_logic);
	end component timebase;

	signal clk, reset, pixel, frame, vbullet, hsync, vsync, x_c, y_c: std_logic;

begin
	reset <= 	'1' after 0 	ns,
				'0' after 1148 	ns,
				'1' after 30 	ms,
				'0' after 40 	ms;
	clk   <= 	'0' after 0 	ns,
				'1' after 82 	ns when clk /= '1' else '0' after 82 ns;

	l1: timebase port map(clk, reset, pixel, frame, vbullet, hsync, vsync, x_c, y_c);
end arch;