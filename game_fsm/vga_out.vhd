library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_out is
	port(
		clk, reset:			in  std_logic;
		rgb: 				in  std_logic_vector(2 downto 0);
		r, g, b:			out std_logic;
		frame, bullet:		out std_logic;
		hsync, vsync: 		out std_logic;
		x, y:				out std_logic_vector(3 downto 0);
		collision:			out std_logic);
end vga_out;

