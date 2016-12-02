library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timebase_tb is
end timebase_tb;

architecture arch of timebase_tb is
	component timebase is
		port(
		clk, reset:							in  std_logic;
		rgb: 								in  std_logic_vector(2 downto 0);
		r, g, b:							out std_logic;
		--pixel, row:							out std_logic;
		frame, vbullet:						out std_logic;
		hsync, vsync: 						out std_logic;
		x, y:								out std_logic_vector(3 downto 0));
	end component timebase;

	signal clk, reset, frame, vbullet, hsync, vsync, r, g, b: std_logic;
	signal x, y: std_logic_vector(3 downto 0);
	signal rgb: std_logic_vector(2 downto 0);

begin
	reset <= 	'1' after 0 	ns,
				'0' after 1148 	ns,
				'1' after 30 	ms,
				'0' after 40 	ms;
	clk   <= 	'0' after 0 	ns,
				'1' after 82 	ns when clk /= '1' else '0' after 82 ns;
	rgb   <=	"111" 	after 0 	ns;

	l1: timebase port map(clk, reset, rgb, r, g, b, frame, vbullet, hsync, vsync, x, y);
end arch;